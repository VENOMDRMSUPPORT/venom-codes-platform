---
name: venom-token-audit
description: audit Venom ui files after css or template edits. use when you need a deterministic check for hardcoded colors, inline styles, raw border colors, `!important`, or parallel visual systems in changed files.
---


    Read `../_shared/venom-context.md` first.
    Use the bundled script when a deterministic audit is useful.

    Run:
    ```bash
    python .kilocode/scripts/theme_guard.py
    ```

    Default behavior (`strict-new`) audits changed/new lines only.
    Use `--mode legacy-safe` to keep blockers focused on hard visual debt only.
    Use `--full-file <file>` only when you explicitly want legacy deep audit.

    Interpret output this way:
    - `block` means the edit should be corrected before proceeding.
    - `warn` means the edit may be acceptable, but only with a clear reason.

    Preferred follow-up:
    1. replace raw colors with existing project tokens (`--accent-*`, semantic `--*` variables, and established tokens),
    2. move inline styles into CSS/classes,
    3. collapse parallel border/card/button inventions back into the existing system,
    4. rerun the audit.
