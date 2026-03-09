{* VENOM CODES — Downloads Category *}

<div style="max-width: 48rem; margin: 0 auto;">

  <nav style="margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
    <a href="{$WEB_ROOT}/downloads.php" style="text-decoration: none; color: inherit;">Downloads</a>
    <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
    <span style="color: hsl(var(--foreground)); font-weight: 500;">{$catname}</span>
  </nav>

  <div style="margin-bottom: 2rem;">
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">{$catname}</h1>
  </div>

  {if $downloads}
    <div style="display: flex; flex-direction: column; gap: 0.5rem;">
      {foreach $downloads as $download}
        <div style="display: flex; align-items: center; justify-content: space-between; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1rem 1.25rem;">
          <div>
            <h3 style="font-size: 0.9375rem; font-weight: 600;">{$download.title}</h3>
            {if $download.description}<p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">{$download.description|strip_tags|truncate:120}</p>{/if}
            <div class="text-xs text-muted-foreground" style="margin-top: 0.375rem; display: flex; gap: 1rem;">
              <span>{$download.downloads} downloads</span>
            </div>
          </div>
          <a href="{$WEB_ROOT}/dl.php?type=d&id={$download.id}" class="venom-btn-primary text-sm" style="padding: 0.5rem 1rem; flex-shrink: 0;">
            <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
            Download
          </a>
        </div>
      {/foreach}
    </div>
  {else}
    <div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
      <p class="text-muted-foreground" style="font-size: 0.875rem;">No files in this category.</p>
    </div>
  {/if}

</div>
