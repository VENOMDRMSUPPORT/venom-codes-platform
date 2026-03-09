{* VENOM CODES — Empty State Partial *}

<div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
  <div style="margin: 0 auto 1rem; display: flex; height: 3rem; width: 3rem; align-items: center; justify-content: center; border-radius: 9999px; background: hsl(var(--muted)); color: hsl(var(--muted-foreground));">
    {if isset($empty_icon)}{$empty_icon}{else}
      <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="22 12 16 12 14 15 10 15 8 12 2 12"/><path d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"/></svg>
    {/if}
  </div>
  <h3 class="font-display" style="font-size: 1rem; font-weight: 600;">{$empty_title}</h3>
  {if isset($empty_description)}
    <p class="text-muted-foreground" style="margin-top: 0.25rem; font-size: 0.875rem;">{$empty_description}</p>
  {/if}
  {if isset($empty_action)}
    <div style="margin-top: 1rem;">{$empty_action}</div>
  {/if}
</div>