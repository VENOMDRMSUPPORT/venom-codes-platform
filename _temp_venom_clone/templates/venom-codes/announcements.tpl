{* VENOM CODES — Announcements List *}

<div style="max-width: 48rem; margin: 0 auto;">

  <div style="margin-bottom: 2rem;">
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Announcements</h1>
    <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Latest news and updates from VENOM CODES.</p>
  </div>

  {if $announcements}
    <div style="display: flex; flex-direction: column; gap: 1rem;">
      {foreach $announcements as $announcement}
        <a href="{$WEB_ROOT}/announcements/{$announcement.id}/{$announcement.urlfriendlytitle}" style="text-decoration: none; color: inherit; display: block; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; transition: border-color 0.15s;">
          <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.5rem;">
            <time class="text-xs text-muted-foreground">{$announcement.date}</time>
          </div>
          <h2 class="font-display" style="font-size: 1.125rem; font-weight: 600; margin-bottom: 0.5rem;">{$announcement.title}</h2>
          <p class="text-sm text-muted-foreground" style="line-height: 1.625; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
            {$announcement.text|strip_tags|truncate:200}
          </p>
        </a>
      {/foreach}
    </div>

    {include file="$template/includes/client/pagination.tpl"}
  {else}
    <div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
      <p class="text-muted-foreground" style="font-size: 0.875rem;">No announcements at this time.</p>
    </div>
  {/if}

</div>
