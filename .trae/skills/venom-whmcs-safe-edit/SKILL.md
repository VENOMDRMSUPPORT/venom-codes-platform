---
name: venom-whmcs-safe-edit
description: "edit Venom whmcs and smarty templates safely when a task touches `.tpl` files, includes, asset paths, framework-level visual overrides, or shared whmcs pages. use to preserve template logic, avoid inline styles, and route changes to the correct file zone."
---

Read `../_shared/venom-context.md` first.

    Apply these rules for `.tpl` and shared asset work:
    1. Preserve existing Smarty variables and conditional logic.
    2. Use `{include}` for repeated blocks instead of copy-paste.
    3. Route framework-level visual overrides to canonical template assets (`css/theme.css`, `includes/variables.tpl`, `includes/tokens.tpl`) instead of creating parallel CSS files.
    4. Keep page-specific CSS page-specific when shared patterns are not enough.
    5. Keep shared components in shared includes/components, and place new VENOM page partials under `includes/venom/`.
    6. Never add inline `style=""`.
    7. Respect the repo's asset versioning convention.

    Change strategy:
    - prefer focused edits in the current structure,
    - avoid broad template rewrites,
    - only extract a partial when it removes real duplication.