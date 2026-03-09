{* VENOM CODES — Page Header Partial *}

<div style="margin-bottom: 1.5rem; display: flex; flex-direction: column; gap: 0.75rem;">

  {* Breadcrumbs *}
  {if isset($breadcrumbs) && $breadcrumbs|@count > 0}
    <nav aria-label="Breadcrumb" style="display: flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
      <a href="{$WEB_ROOT}/clientarea.php" style="text-decoration: none; color: inherit; transition: color 0.15s;">
        <svg class="h-3.5 w-3.5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
      </a>
      {foreach $breadcrumbs as $crumb}
        <span style="display: flex; align-items: center; gap: 0.25rem;">
          <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
          {if isset($crumb.href)}
            <a href="{$crumb.href}" style="text-decoration: none; color: inherit; transition: color 0.15s;">{$crumb.label}</a>
          {else}
            <span style="color: hsl(var(--foreground)); font-weight: 500;">{$crumb.label}</span>
          {/if}
        </span>
      {/foreach}
    </nav>
  {/if}

  {* Title + actions *}
  <div style="display: flex; flex-direction: column; gap: 0.5rem;">
    <style>@media (min-width: 640px) { .page-header-row { flex-direction: row !important; align-items: center !important; justify-content: space-between !important; } }</style>
    <div class="page-header-row" style="display: flex; flex-direction: column; gap: 0.5rem;">
      <div>
        <h1 class="font-display" style="font-size: 1.25rem; font-weight: 700; letter-spacing: -0.025em;">{$page_title}</h1>
        {if isset($page_subtitle)}
          <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">{$page_subtitle}</p>
        {/if}
      </div>
      {if isset($page_actions)}
        <div style="display: flex; align-items: center; gap: 0.5rem;">{$page_actions}</div>
      {/if}
    </div>
  </div>

</div>
