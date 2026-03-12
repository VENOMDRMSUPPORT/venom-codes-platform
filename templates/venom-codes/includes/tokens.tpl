{* Global ready-to-use tokens mapped to canonical theme variables *}
<style id="venom-global-tokens">
:root {
    --venom-primary: var(--primary);
    --venom-secondary: var(--secondary);
    --venom-accent-ui: var(--venom-accent, var(--primary));

    --venom-success: var(--success);
    --venom-warning: var(--warning);
    --venom-error: var(--danger);
    --venom-info: var(--info);

    --venom-shadow-sm: 0 1px 2px color-mix(in srgb, var(--dark) 12%, transparent);
    --venom-shadow-md: 0 6px 14px color-mix(in srgb, var(--dark) 16%, transparent);
    --venom-shadow-lg: 0 12px 28px color-mix(in srgb, var(--dark) 20%, transparent);

    --venom-radius-sm: var(--rounding-sm, 0.25rem);
    --venom-radius-md: var(--rounding-md, 0.5rem);
    --venom-radius-lg: var(--rounding-lg, 0.75rem);

    --venom-spacing-xs: 0.25rem;
    --venom-spacing-sm: 0.5rem;
    --venom-spacing-md: 1rem;
    --venom-spacing-lg: 1.5rem;
    --venom-spacing-xl: 2rem;

    --venom-shell-backdrop: linear-gradient(
        160deg,
        color-mix(in srgb, var(--bg) 95%, var(--venom-accent-ui) 5%) 0%,
        color-mix(in srgb, var(--bg-muted) 90%, var(--venom-accent-ui) 10%) 48%,
        color-mix(in srgb, var(--bg-lifted) 92%, var(--venom-accent-ui) 8%) 100%
    );
    --venom-shell-glow: radial-gradient(
        circle at 20% 0%,
        color-mix(in srgb, var(--venom-accent-ui) 18%, transparent) 0%,
        transparent 58%
    );

    --venom-surface-glass: color-mix(in srgb, var(--bg) 84%, var(--venom-accent-ui) 16%);
    --venom-surface-glass-strong: color-mix(in srgb, var(--bg-lifted) 72%, var(--venom-accent-ui) 28%);
    --venom-surface-glass-soft: color-mix(in srgb, var(--bg-muted) 92%, var(--venom-accent-ui) 8%);

    --venom-border-soft: color-mix(in srgb, var(--border) 86%, var(--venom-accent-ui) 14%);
    --venom-border-strong: color-mix(in srgb, var(--border) 66%, var(--venom-accent-ui) 34%);

    --venom-shadow-shell: 0 28px 64px color-mix(in srgb, var(--text) 16%, transparent);
    --venom-shadow-surface: 0 18px 40px color-mix(in srgb, var(--text) 12%, transparent);
    --venom-shadow-raised: 0 12px 28px color-mix(in srgb, var(--venom-accent-ui) 22%, transparent);

    --venom-radius-xl: calc(var(--venom-radius-lg) + 0.5rem);
    --venom-radius-2xl: calc(var(--venom-radius-lg) + 0.9rem);
    --venom-ring-strong: 0 0 0 3px color-mix(in srgb, var(--venom-accent-ui) 22%, transparent);
}

html[data-venom-theme="dark"] {
    --venom-shell-backdrop: linear-gradient(
        160deg,
        color-mix(in srgb, var(--bg-inverted) 96%, var(--venom-accent-ui) 4%) 0%,
        color-mix(in srgb, var(--bg-inverted) 88%, var(--venom-accent-ui) 12%) 48%,
        color-mix(in srgb, var(--bg-inverted) 92%, var(--venom-accent-ui) 8%) 100%
    );
    --venom-shell-glow: radial-gradient(
        circle at 18% 0%,
        color-mix(in srgb, var(--venom-accent-ui) 32%, transparent) 0%,
        transparent 62%
    );

    --venom-surface-glass: color-mix(in srgb, var(--bg-inverted) 86%, var(--venom-accent-ui) 14%);
    --venom-surface-glass-strong: color-mix(in srgb, var(--bg-inverted) 68%, var(--venom-accent-ui) 32%);
    --venom-surface-glass-soft: color-mix(in srgb, var(--bg-inverted) 90%, var(--venom-accent-ui) 10%);

    --venom-border-soft: color-mix(in srgb, var(--venom-accent-ui) 28%, transparent);
    --venom-border-strong: color-mix(in srgb, var(--venom-accent-ui) 46%, transparent);

    --venom-shadow-shell: 0 32px 74px color-mix(in srgb, black 74%, var(--venom-accent-ui) 26%);
    --venom-shadow-surface: 0 20px 44px color-mix(in srgb, black 72%, var(--venom-accent-ui) 28%);
    --venom-shadow-raised: 0 14px 32px color-mix(in srgb, var(--venom-accent-ui) 34%, transparent);
}
</style>
