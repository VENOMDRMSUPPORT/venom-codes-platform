{* VENOM CODES — Client Area Header *}

<header style="position: sticky; top: 0; z-index: 40; height: 3.5rem; border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--card) / 0.8); backdrop-filter: blur(16px); -webkit-backdrop-filter: blur(16px);">
  <div style="display: flex; height: 100%; align-items: center; justify-content: space-between; gap: 1rem; padding: 0 1rem;">

    {* Left: sidebar trigger *}
    <div style="display: flex; align-items: center; gap: 0.75rem;">
      <button id="sidebar-trigger" class="text-muted-foreground" style="background: none; border: none; cursor: pointer; padding: 0.25rem;">
        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
      </button>
    </div>

    {* Center: search *}
    <div style="display: none; flex: 1; max-width: 28rem; margin: 0 auto;">
      <style>@media (min-width: 768px) { .client-search-wrap { display: block !important; } }</style>
      <div class="client-search-wrap" style="display: none; position: relative;">
        <svg class="h-4 w-4 text-muted-foreground" style="position: absolute; left: 0.75rem; top: 50%; transform: translateY(-50%);" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" placeholder="Search services, invoices, tickets…"
               style="width: 100%; border-radius: 0.5rem; border: 1px solid hsl(var(--border)); background: hsl(var(--background)); padding: 0.5rem 1rem 0.5rem 2.25rem; font-size: 0.875rem; color: hsl(var(--foreground)); outline: none;" />
      </div>
    </div>

    {* Right: actions *}
    <div style="display: flex; align-items: center; gap: 0.5rem;">
      {include file="$template/includes/themeswitcher.tpl"}

      {* Notifications *}
      <button style="position: relative; border-radius: 0.5rem; padding: 0.5rem; color: hsl(var(--muted-foreground)); background: none; border: none; cursor: pointer; transition: all 0.15s;" aria-label="Notifications">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
        {if isset($notifications_count) && $notifications_count > 0}
          <span class="venom-gradient-bg" style="position: absolute; right: -2px; top: -2px; display: flex; height: 1rem; width: 1rem; align-items: center; justify-content: center; border-radius: 9999px; font-size: 0.625rem; font-weight: 700; color: hsl(var(--accent-primary-foreground));">
            {if $notifications_count > 9}9+{else}{$notifications_count}{/if}
          </span>
        {/if}
      </button>

      {* User avatar + name *}
      <a href="{$WEB_ROOT}/clientarea.php?action=details" style="display: flex; align-items: center; gap: 0.5rem; border-radius: 0.5rem; padding: 0.375rem 0.5rem; font-size: 0.875rem; text-decoration: none; color: inherit; transition: all 0.15s;">
        <div class="venom-gradient-bg" style="display: flex; height: 1.75rem; width: 1.75rem; align-items: center; justify-content: center; border-radius: 9999px; font-size: 0.75rem; font-weight: 700; color: hsl(var(--accent-primary-foreground));">
          {$clientsdetails.firstname|substr:0:1|upper}
        </div>
        <span class="font-medium" style="display: none;">
          <style>@media (min-width: 640px) { .client-username { display: inline !important; } }</style>
          <span class="client-username" style="display: none;">{$clientsdetails.firstname}</span>
        </span>
      </a>

      {* Logout *}
      <a href="{$WEB_ROOT}/logout.php" style="display: flex; align-items: center; gap: 0.5rem; border-radius: 0.5rem; padding: 0.375rem 0.5rem; font-size: 0.875rem; text-decoration: none; color: hsl(var(--destructive)); transition: all 0.15s;" title="Sign Out">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
      </a>
    </div>

  </div>
</header>
