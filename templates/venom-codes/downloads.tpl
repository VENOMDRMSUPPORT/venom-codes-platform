{* VENOM CODES — Downloads *}

<div style="max-width: 48rem; margin: 0 auto;">

  <div style="margin-bottom: 2rem;">
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Downloads</h1>
    <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Files and resources available for download.</p>
  </div>

  {* Search *}
  <form method="post" action="{$smarty.server.PHP_SELF}" style="margin-bottom: 1.5rem;">
    <div style="position: relative; max-width: 24rem;">
      <svg style="position: absolute; left: 0.75rem; top: 50%; transform: translateY(-50%); color: hsl(var(--muted-foreground));" class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      <input type="text" name="search" value="{$search}" class="venom-input" placeholder="Search downloads…" style="padding-left: 2.25rem;" />
    </div>
  </form>

  {* Categories *}
  {if $dlcats}
    <div style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
      <style>@media (min-width: 640px) { .dl-grid { grid-template-columns: repeat(2, 1fr) !important; } }</style>
      <div class="dl-grid" style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
        {foreach $dlcats as $dlcat}
          <a href="{$WEB_ROOT}/downloads.php?action=displaycat&catid={$dlcat.id}" style="text-decoration: none; color: inherit; display: block; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; transition: border-color 0.15s;">
            <div style="display: flex; align-items: center; gap: 0.75rem;">
              <div style="display: flex; height: 2.25rem; width: 2.25rem; align-items: center; justify-content: center; border-radius: 0.5rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
                <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg>
              </div>
              <div>
                <h3 style="font-size: 0.9375rem; font-weight: 600;">{$dlcat.name}</h3>
                <span class="text-xs text-muted-foreground">{$dlcat.numarticles} files</span>
              </div>
            </div>
            {if $dlcat.description}
              <p class="text-sm text-muted-foreground" style="margin-top: 0.5rem; line-height: 1.5;">{$dlcat.description|strip_tags|truncate:100}</p>
            {/if}
          </a>
        {/foreach}
      </div>
    </div>
  {else}
    <div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
      <p class="text-muted-foreground" style="font-size: 0.875rem;">No downloads available.</p>
    </div>
  {/if}

</div>
