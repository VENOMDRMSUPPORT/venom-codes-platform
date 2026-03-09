---
name: venom-theme-guardian
description: guard Venom design-system work whenever css, templates, borders, cards, shadows, buttons, colors, theme files, or visual consistency are involved. use to stop hardcoded colors, duplicate classes, and conflicting border or token systems.
---


    Read `../_shared/venom-context.md` first.
    Use this skill before and after any UI-affecting edit.

    Enforce these rules:
    1. Search for an existing token, class, include, or component shell before adding anything new.
    2. Reuse existing project tokens (`--accent-*`, semantic `--*` tokens, and established variables).
    3. If no token exists, add it in the canonical token file before use.
    4. Do not add inline styles.
    5. Do not introduce a parallel border/card/button utility system.
    6. Do not privilege dark mode over light mode.
    7. Validate cyan and one contrasting accent after a theme-affecting change.

    When a new class is truly unavoidable:
    - follow existing project naming patterns,
    - make it narrow and reusable,
    - explain in one sentence why reuse was not possible.

    Final check:
    - both themes,
    - two accents,
    - 375 / 768 / 1024,
    - focus-visible,
    - honest CTA labels.
