{* VENOM CODES — Summary Panel Partial *}

<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  {if isset($panel_title)}
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <h3 class="font-display text-sm" style="font-weight: 600;">{$panel_title}</h3>
    </div>
  {/if}
  <div>
    {foreach $panel_rows as $row}
      <div style="display: flex; align-items: center; justify-content: space-between; padding: 0.75rem 1.25rem; font-size: 0.875rem; {if !$row@last}border-bottom: 1px solid hsl(var(--border));{/if}">
        <span class="text-muted-foreground">{$row.label}</span>
        <span style="font-weight: 500; text-align: right;">{$row.value}</span>
      </div>
    {/foreach}
  </div>
  {if isset($panel_footer)}
    <div style="border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">{$panel_footer}</div>
  {/if}
</div>
