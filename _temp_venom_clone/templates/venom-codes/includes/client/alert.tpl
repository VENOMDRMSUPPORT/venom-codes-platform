{* VENOM CODES — Alert Notice Partial *}

<div class="alert-{$alert_type}" style="position: relative; border-radius: 0.75rem; border: 1px solid; padding: 1rem;">
  <div style="display: flex; gap: 0.75rem;">
    <div style="flex-shrink: 0; margin-top: 0.125rem;">
      {if $alert_type == 'info'}
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="16" x2="12" y2="12"/><line x1="12" y1="8" x2="12.01" y2="8"/></svg>
      {elseif $alert_type == 'success'}
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      {elseif $alert_type == 'warning'}
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
      {else}
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>
      {/if}
    </div>
    <div style="flex: 1; font-size: 0.875rem;">
      {if isset($alert_title)}
        <p style="font-weight: 600; margin-bottom: 0.125rem;">{$alert_title}</p>
      {/if}
      <div style="opacity: 0.9;">{$alert_content}</div>
    </div>
    {if isset($alert_dismissible) && $alert_dismissible}
      <button onclick="this.closest('.alert-{$alert_type}').remove()" style="flex-shrink: 0; opacity: 0.6; background: none; border: none; cursor: pointer; color: inherit;" aria-label="Dismiss">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    {/if}
  </div>
</div>
