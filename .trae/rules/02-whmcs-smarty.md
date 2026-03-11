# WHMCS / Smarty Rules

- Preserve Smarty variables and template logic.
- Use includes for repeated blocks.
- Put new VENOM page partials under `includes/venom/*.tpl`.
- Route framework-level visual overrides to canonical template assets (`css/theme.css`, `includes/variables.tpl`, `includes/tokens.tpl`) instead of creating parallel CSS systems.
- Keep page-specific CSS page-specific only when shared `theme.css` patterns are not enough.
- Keep shared patterns in shared includes/components.
- Never edit vendor or minified assets unless explicitly requested.
