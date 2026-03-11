#!/usr/bin/env python3
import argparse
import json
import os
import re
import subprocess
import sys
from pathlib import Path

COLOR_RE = re.compile(r'(?<!url\()(?P<color>#(?:[0-9a-fA-F]{3,8})\b|rgba?\([^\)]*\)|hsla?\([^\)]*\))')
INLINE_STYLE_RE = re.compile(r'\bstyle\s*=\s*["\']')
IMPORTANT_RE = re.compile(r'!important')
RAW_BORDER_RE = re.compile(r'\bborder(?:-color)?\s*:\s*[^;]*(#|rgba?\(|hsla?\()')
RAW_RADIUS_RE = re.compile(r'\bborder-radius\s*:\s*(?!var\()([^;]+)')
PARALLEL_VISUAL_RE = re.compile(
    r'(^|\s)(\.?(?:bg-color-|panel-|card-)|--(?:vs-home|home-btn|home-card|menu-home)-)',
    re.IGNORECASE,
)
HUNK_HEADER_RE = re.compile(r'^@@ -\d+(?:,\d+)? \+(\d+)(?:,\d+)? @@')
ALLOWED_RADIUS_VALUES = {'999px', '9999px', '50%'}
UI_EXTS = {'.css', '.scss', '.sass', '.less', '.tpl', '.html', '.php', '.mdx'}


def run(cmd, cwd=None):
    return subprocess.run(cmd, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)


def repo_root(start: Path) -> Path:
    cur = start.resolve()
    for candidate in [cur, *cur.parents]:
        if (candidate / '.git').exists():
            return candidate
    return start.resolve()


def changed_lines_from_git(repo: Path, rel_path: str):
    proc = run(['git', 'diff', '--unified=0', '--', rel_path], cwd=repo)
    if proc.returncode != 0:
        return None
    added = []
    new_line_no = None
    for line in proc.stdout.splitlines():
        if line.startswith('+++') or line.startswith('diff --git') or line.startswith('index '):
            continue
        hunk_match = HUNK_HEADER_RE.match(line)
        if hunk_match:
            new_line_no = int(hunk_match.group(1))
            continue
        if new_line_no is None:
            continue
        if line.startswith('+') and not line.startswith('+++'):
            added.append((new_line_no, line[1:]))
            new_line_no += 1
            continue
        if line.startswith('-') and not line.startswith('---'):
            continue
        new_line_no += 1
    return added if added else None


def changed_files_from_git(repo: Path):
    proc = run(['git', 'status', '--porcelain'], cwd=repo)
    if proc.returncode != 0:
        return []
    files = []
    for raw in proc.stdout.splitlines():
        if len(raw) < 4:
            continue
        path = raw[3:]
        if ' -> ' in path:
            path = path.split(' -> ', 1)[1]
        files.append(path)
    return files


def is_tracked_file(repo: Path, rel_path: str) -> bool:
    proc = run(['git', 'ls-files', '--error-unmatch', '--', rel_path], cwd=repo)
    return proc.returncode == 0


def collect_paths(args, hook_payload, repo: Path):
    targets = []
    if args.paths:
        targets.extend(args.paths)
    elif hook_payload:
        tool_input = hook_payload.get('tool_input') or {}
        fp = tool_input.get('file_path') or tool_input.get('path')
        if fp:
            targets.append(fp)
    else:
        targets.extend(changed_files_from_git(repo))
    seen = []
    for item in targets:
        p = (repo / item).resolve() if not os.path.isabs(str(item)) else Path(item).resolve()
        if p.exists() and p.suffix.lower() in UI_EXTS and p not in seen:
            seen.append(p)
    return seen


def uses_tokenized_color(line: str) -> bool:
    return 'var(--' in line


def lint_line(path: Path, line: str, mode: str):
    issues = []
    stripped = line.strip()
    if not stripped or stripped.startswith('/*') or stripped.startswith('*') or stripped.startswith('//'):
        return issues

    if INLINE_STYLE_RE.search(line):
        issues.append(('block', 'inline-style', 'Inline style attribute found. Move styling into CSS/classes.'))

    if COLOR_RE.search(line):
        if not uses_tokenized_color(line) and 'color-mix(' not in line and 'url(#' not in line:
            issues.append(('block', 'hardcoded-color', 'Hardcoded color found. Use existing project token(s) or add a token first.'))

    if RAW_BORDER_RE.search(line) and not uses_tokenized_color(line):
        issues.append(('block', 'raw-border-color', 'Raw border color found. Reuse canonical border token(s).'))

    if mode == 'strict-new':
        m = RAW_RADIUS_RE.search(line)
        if m:
            value = m.group(1).strip().rstrip(';')
            if value not in ALLOWED_RADIUS_VALUES:
                issues.append(('warn', 'raw-radius', 'Raw border-radius added. Prefer existing radius token or canonical radius value.'))

        if IMPORTANT_RE.search(line):
            issues.append(('warn', 'important', 'New `!important` found. Use only when a proven override requires it.'))

        if PARALLEL_VISUAL_RE.search(line):
            issues.append(('warn', 'parallel-visual-system', 'Possible parallel visual system added. Reuse existing tokens/classes before inventing a new one.'))

    return issues


def inspect_file(repo: Path, path: Path, mode: str, full_file: bool):
    rel = str(path.relative_to(repo)) if path.is_relative_to(repo) else str(path)
    scan_mode = 'full-file'
    lines = None

    if not full_file:
        changed_lines = changed_lines_from_git(repo, rel)
        if changed_lines:
            lines = changed_lines
            scan_mode = 'added-lines'
        else:
            tracked = is_tracked_file(repo, rel) if path.is_relative_to(repo) else False
            if tracked:
                return []

    if lines is None:
        try:
            lines = list(enumerate(path.read_text(encoding='utf-8', errors='ignore').splitlines(), start=1))
        except Exception:
            return []
    else:
        lines = [(line_no, text) for line_no, text in lines]
    findings = []
    for line_no, line in lines:
        for level, code, message in lint_line(path, line, mode):
            findings.append({
                'level': level,
                'code': code,
                'path': rel,
                'line': line_no,
                'message': message,
                'snippet': line.strip(),
                'mode': scan_mode,
            })
    return findings


def format_summary(findings):
    blocks = [f for f in findings if f['level'] == 'block']
    warns = [f for f in findings if f['level'] != 'block']
    lines = []
    if blocks:
        lines.append('Theme guard blockers:')
        for item in blocks[:8]:
            lines.append(f"- {item['path']}:{item['line']} [{item['code']}] {item['message']}")
    if warns:
        if lines:
            lines.append('')
        lines.append('Theme guard warnings:')
        for item in warns[:8]:
            lines.append(f"- {item['path']}:{item['line']} [{item['code']}] {item['message']}")
    return '\n'.join(lines).strip()


def emit_hook(findings):
    blocks = [f for f in findings if f['level'] == 'block']
    summary = format_summary(findings)
    payload = {
        'hookSpecificOutput': {
            'hookEventName': 'PostToolUse',
            'additionalContext': summary or 'Theme guard: no issues found.'
        }
    }
    if blocks:
        payload['decision'] = 'block'
        payload['reason'] = 'Theme guard failed. Reuse existing tokens/classes and remove hardcoded styles before continuing.'
    print(json.dumps(payload, ensure_ascii=False))


def emit_cli(findings):
    if not findings:
        print('Theme guard: no issues found.')
        return 0
    print(format_summary(findings))
    return 1 if any(f['level'] == 'block' for f in findings) else 0


def main():
    parser = argparse.ArgumentParser(description='Guard against Venom UI drift.')
    parser.add_argument('--hook', action='store_true', help='Emit Claude hook JSON output.')
    parser.add_argument('--mode', choices=['strict-new', 'legacy-safe'], default='strict-new', help='Validation policy mode.')
    parser.add_argument('--full-file', action='store_true', help='Scan full file content for target paths (legacy audit mode).')
    parser.add_argument('paths', nargs='*', help='Optional file paths to inspect.')
    args = parser.parse_args()

    hook_payload = None
    if args.hook:
        raw = sys.stdin.read().strip()
        if raw:
            try:
                hook_payload = json.loads(raw)
            except json.JSONDecodeError:
                hook_payload = None

    start = Path.cwd()
    repo = repo_root(start)
    targets = collect_paths(args, hook_payload, repo)

    findings = []
    for path in targets:
        findings.extend(inspect_file(repo, path, args.mode, args.full_file))

    if args.hook:
        emit_hook(findings)
        return 0
    return emit_cli(findings)


if __name__ == '__main__':
    raise SystemExit(main())
