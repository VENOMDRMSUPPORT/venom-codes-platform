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
}
</style>
