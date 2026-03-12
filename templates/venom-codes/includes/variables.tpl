{* Shared helper aliases for semantic CSS variables across pages *}
<style id="venom-variable-helpers">
:root {
    --venom-surface: var(--bg);
    --venom-surface-muted: var(--bg-muted);
    --venom-surface-elevated: var(--bg-lifted);
    --venom-surface-shell: var(--venom-surface-glass, var(--bg-lifted));
    --venom-surface-shell-strong: var(--venom-surface-glass-strong, var(--bg-accented));
    --venom-surface-shell-soft: var(--venom-surface-glass-soft, var(--bg-muted));
    --venom-text-strong: var(--text);
    --venom-text-soft: var(--text-muted);
    --venom-border-ui: var(--border);
    --venom-border-ui-soft: var(--venom-border-soft, var(--border));
    --venom-border-ui-strong: var(--venom-border-strong, var(--border-lifted));
}
</style>
