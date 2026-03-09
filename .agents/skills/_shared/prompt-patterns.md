# Prompt Patterns Distilled from awesome-ai-system-prompts

These patterns were distilled from the public `awesome-ai-system-prompts` collection and the referenced prompts from tools like v0, Loveable, Replit, and Claude Code.
Use them as operating style, not as cargo-cult text.

## Speed patterns
- Search and inspect before editing.
- Read the smallest useful set of files.
- Prefer minimal writes over rewrites.
- If the user only asked a question, answer instead of editing.
- If the feature already exists, say so instead of making noisy changes.
- Only switch to multi-step planning when the task truly spans multiple systems.

## Quality patterns
- Follow existing project conventions instead of inventing a new local standard.
- Reuse existing dependencies, classes, patterns, and component shells first.
- Keep new code focused and complete, not half-finished.
- Validate after editing: lint, typecheck, local build, or targeted checks.
- Ask before broad refactors or dependency shifts.

## UI/design-system patterns
- Preserve the canonical token system.
- Avoid parallel style systems.
- Make responsive behavior the default.
- Keep accessibility visible: focus, targets, honest labels, clear states.
- Prefer one canonical component over many near-duplicates.

## Suggested short loop
1. classify task,
2. search,
3. read,
4. patch,
5. validate,
6. stop.

## What not to do
- Do not recursively read large directories for a trivial request.
- Do not add comments everywhere.
- Do not invent helper files "just in case".
- Do not chase speculative cleanup after the requested fix is done.
