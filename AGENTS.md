# Venom project instructions


# Venom Agent Baseline

Use this pack only for the Venom WHMCS + Smarty theme at `client/templates/venom-codes/*`.

## Source of truth
- `client/.kilocode/skills/*`
- `client/.kilocode/scripts/theme_guard.py`
- `client/.kilocode/TEMPLATE_CONTEXT.md`
- `client/.kilocode/WRAPPER_OWNERSHIP.md`
- `client/templates/venom-codes/theme.yaml`
- `client/.kilocode/BASELINE_FREEZE.md`

Prefer actual files on disk over stale audits or older assumptions.

## Maintenance policy
- No broad cleanup campaigns.
- No full strict blocking across untouched legacy template.
- Touch-and-clean only: clean locally when a file is already being changed for real work.
- Keep `strict-new` scoped to changed/new scope only.
- Stability first: if enforcement conflicts with runtime stability, prioritize stable behavior.

## Project identity
- Custom WHMCS + Smarty template for Venom Solutions.
- Product context: IPTV server management and load-balancing software licensing only.
- Tone: technical, trustworthy, premium, calm, not flashy.
- Primary UX promise: dark-first enterprise SaaS quality with full dark/light parity and 5 accent colors.

## Mode routing
- `venom-ui` / **Venom UI Builder**: implementation tasks involving `.tpl`, `.css`, shared includes, small UI JS, or theme-safe bug fixes.
- `venom-review` / **Venom Review**: read-only audits, parity checks, token usage review, premium UI QA, and blockers/warnings triage.
- `venom-architect` / **Venom Architect**: migrations, docs, rules/skills, rollout strategy, cleanup phases, and implementation-ready planning.

## The main failure to avoid
Do not invent a parallel visual system. Reuse the existing one.

## Non-negotiables
1. Reuse existing classes, tokens, includes, and patterns before creating anything new.
2. Never hardcode colors. Prefer existing `--venom-*` and semantic `--*` variables first.
3. Never add inline `style=""`.
4. Never introduce a parallel border/card/button system.
5. Never edit vendor or minified files unless explicitly asked.
6. Keep both dark and light themes working.
7. Validate `ocean` plus one contrasting accent (`emerald`, `crimson`, `amber`, or `violet`) after UI-affecting changes.
8. Keep diffs focused. Do not broaden scope without approval.
9. Preserve existing Smarty variables, includes, and conditional logic.
10. Keep page-specific CSS page-specific, and shared UI shared.

## Canonical file zones
- `client/templates/venom-codes/*.tpl`
- `client/templates/venom-codes/includes/venom/*.tpl`
- `client/templates/venom-codes/includes/*.tpl`
- `client/templates/venom-codes/css/theme.css`
- `client/templates/venom-codes/css/custom.css`
- `client/templates/venom-codes/css/venom-*.css`
- `client/templates/venom-codes/js/venom-*.js`
- `client/templates/venom-codes/js/*.js`

## Fast path
1. Classify the task: `info-only`, `already-exists`, `simple-fix`, or `multi-system`.
2. Search first.
3. Read the smallest useful set of files.
4. Patch the minimum number of lines/files.
5. Validate and stop.

## Validation
After UI edits, run when terminal access is available:
- `python .kilocode/scripts/theme_guard.py`
- `python .kilocode/scripts/theme_guard.py <changed-file>`
- `python .kilocode/scripts/theme_guard.py --full-file <file>` only for explicit legacy deep audit

Also validate:
- dark/light
- `ocean` + one contrasting accent (`emerald`, `crimson`, `amber`, or `violet`)
- 375 / 768 / 1024
- focus-visible
- CTA honesty

## Red flags
- raw `#hex`, `rgb()`, or `hsl()` in UI edits when tokens should be used
- inline `style=""`
- new `bg-color-*`, `panel-*`, `card-*`, or duplicate utility classes
- new token families that duplicate existing semantic/accent intent
- dark-only edits that neglect light mode
- dishonest CTA labels
- unnecessary comments
- broad refactors not requested


## Preferred response style
- Be concise and implementation-oriented.
- For implementation tasks: say the mode, do a short plan only when needed, edit, validate, stop.
- For review tasks: blockers first, then warnings, then verdict.
- For architect tasks: scope, decisions, included, excluded, next actions.
- If the requested behavior already exists, say so without noise.
- If the user asked a question only, answer it without editing.
