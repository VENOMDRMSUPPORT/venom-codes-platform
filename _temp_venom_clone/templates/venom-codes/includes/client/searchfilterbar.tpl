{* VENOM CODES — Search & Filter Bar Partial *}

<div style="margin-bottom: 1rem; display: flex; flex-direction: column; gap: 0.75rem;">
  <style>@media (min-width: 640px) { .search-filter-row { flex-direction: row !important; align-items: center !important; justify-content: space-between !important; } }</style>
  <div class="search-filter-row" style="display: flex; flex-direction: column; gap: 0.75rem;">
    <div style="display: flex; flex: 1; align-items: center; gap: 0.75rem;">
      <div style="position: relative; flex: 1; max-width: 24rem;">
        <svg style="position: absolute; left: 0.75rem; top: 50%; transform: translateY(-50%); color: hsl(var(--muted-foreground));" class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input
          type="text"
          name="{if isset($search_name)}{$search_name}{else}search{/if}"
          value="{if isset($search_value)}{$search_value}{/if}"
          placeholder="{if isset($search_placeholder)}{$search_placeholder}{else}Search…{/if}"
          class="venom-input"
          style="padding-left: 2.25rem; padding-right: 1rem;"
        />
      </div>
      {if isset($filter_html)}
        <div style="display: flex; align-items: center; gap: 0.5rem;">{$filter_html}</div>
      {/if}
    </div>
    {if isset($action_html)}
      <div style="display: flex; align-items: center; gap: 0.5rem;">{$action_html}</div>
    {/if}
  </div>
</div>