# Design System Rules

- Mode policy:
  - `legacy-safe` (default): preserve the current token system and block new regressions.
  - `strict-new` (opt-in): enforce stricter naming/token rules on changed/new lines only.
- Reuse existing project tokens (`--venom-*`, semantic `--*` variables, and other established tokens) before creating new ones.
- Reuse existing classes and includes before creating new ones.
- Do not hardcode colors.
- Do not add inline styles.
- Do not invent a new border/card/button utility system.
- Prefer existing project naming patterns for any truly necessary new class.
- Validate dark/light and at least two accents after UI-affecting edits.
