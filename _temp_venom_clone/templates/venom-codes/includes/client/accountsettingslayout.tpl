{* VENOM CODES — Account Settings Layout *}

<div style="display: flex; flex-direction: column; gap: 1.5rem;">
  <style>@media (min-width: 1024px) { .settings-layout { flex-direction: row !important; } .settings-nav { width: 14rem !important; flex-shrink: 0; } }</style>
  <div class="settings-layout" style="display: flex; flex-direction: column; gap: 1.5rem;">

    {* Settings nav *}
    <nav class="settings-nav" style="width: 100%;">
      <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 0.5rem;">
        <a href="{$WEB_ROOT}/clientarea.php?action=details" style="display: flex; align-items: center; gap: 0.625rem; border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; text-decoration: none; transition: all 0.15s; {if $settings_active == 'profile'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{else}color: hsl(var(--muted-foreground));{/if}">
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
          Profile
        </a>
        <a href="{$WEB_ROOT}/clientarea.php?action=security" style="display: flex; align-items: center; gap: 0.625rem; border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; text-decoration: none; transition: all 0.15s; {if $settings_active == 'security'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{else}color: hsl(var(--muted-foreground));{/if}">
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
          Security
        </a>
        <a href="{$WEB_ROOT}/clientarea.php?action=changesettings" style="display: flex; align-items: center; gap: 0.625rem; border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; text-decoration: none; transition: all 0.15s; {if $settings_active == 'settings'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{else}color: hsl(var(--muted-foreground));{/if}">
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
          Settings
        </a>
      </div>
    </nav>

    {* Content *}
    <div style="flex: 1; min-width: 0; display: flex; flex-direction: column; gap: 1.25rem;">
      {$settings_content}
    </div>

  </div>
</div>