{* VENOM CODES — Unknown Route Path Error *}

{include file="$template/error/page-not-found.tpl"}

<div style="max-width: 32rem; margin: 2rem auto; padding: 1.25rem; border-radius: 0.75rem; background: hsl(var(--accent-muted)); border: 1px solid hsl(var(--border)); text-align: center;">
  <div style="display: flex; align-items: center; gap: 0.75rem; justify-content: center; text-align: left;">
    <svg xmlns="http://www.w3.org/2000/svg" style="width: 1.25rem; height: 1.25rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <circle cx="12" cy="12" r="10"/>
      <line x1="12" y1="16" x2="12" y2="12"/>
      <line x1="12" y1="8" x2="12.01" y2="8"/>
    </svg>
    <div style="font-size: 0.875rem; line-height: 1.5; color: hsl(var(--muted-foreground));">
      <strong style="color: hsl(var(--foreground));">Additional Information:</strong> The previous page (<a href="{$referrer|escape}" style="color: hsl(var(--primary)); text-decoration: underline;">{$referrer|escape}</a>) provided an invalid page link.
    </div>
  </div>
</div>
