{* VENOM CODES — Submit Ticket Step One *}

{assign var="page_title" value="Open a Ticket"}
{assign var="page_subtitle" value="Select a department to get started"}
{assign var="breadcrumbs" value=[["label" => "Support", "href" => "{$WEB_ROOT}/supporttickets.php"], ["label" => "New Ticket"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $departments}
  <div style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
    <style>@media (min-width: 640px) { .dept-grid { grid-template-columns: repeat(2, 1fr) !important; } } @media (min-width: 1024px) { .dept-grid { grid-template-columns: repeat(3, 1fr) !important; } }</style>
    <div class="dept-grid" style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
      {foreach $departments as $department}
        <a href="{$WEB_ROOT}/submitticket.php?step=2&deptid={$department.id}" style="text-decoration: none; color: inherit; display: block; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; transition: border-color 0.15s;">
          <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 0.5rem;">
            <div style="display: flex; height: 2.25rem; width: 2.25rem; align-items: center; justify-content: center; border-radius: 0.5rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
              <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
            </div>
            <h3 class="font-display" style="font-size: 1rem; font-weight: 600;">{$department.name}</h3>
          </div>
          {if $department.description}
            <p class="text-sm text-muted-foreground" style="line-height: 1.5;">{$department.description}</p>
          {/if}
        </a>
      {/foreach}
    </div>
  </div>
{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Departments" empty_description="No support departments are available at this time."}
{/if}
