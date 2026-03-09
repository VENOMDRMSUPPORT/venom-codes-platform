{* VENOM CODES — Knowledge Base Article *}

<div style="max-width: 48rem; margin: 0 auto;">

  {* Breadcrumb *}
  <nav style="margin-bottom: 1.5rem; display: flex; flex-wrap: wrap; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
    <a href="{$WEB_ROOT}/knowledgebase.php" style="text-decoration: none; color: inherit;">Knowledge Base</a>
    {if $kbcatname}
      <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
      <a href="{$WEB_ROOT}/knowledgebase/{$kbcatid}/{$kbcaturlfriendlyname}" style="text-decoration: none; color: inherit;">{$kbcatname}</a>
    {/if}
    <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
    <span style="color: hsl(var(--foreground)); font-weight: 500;">{$kbarticle.title|truncate:40}</span>
  </nav>

  <article style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 2rem;">
    <header style="margin-bottom: 1.5rem; padding-bottom: 1.5rem; border-bottom: 1px solid hsl(var(--border));">
      <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">{$kbarticle.title}</h1>
      <div class="text-sm text-muted-foreground" style="margin-top: 0.5rem; display: flex; align-items: center; gap: 1rem;">
        <span>{$kbarticle.views} views</span>
        {if $kbarticle.rating}
          <span>Rating: {$kbarticle.rating}%</span>
        {/if}
      </div>
    </header>

    <div style="font-size: 0.9375rem; line-height: 1.75; color: hsl(var(--foreground) / 0.9);">
      {$kbarticle.text}
    </div>
  </article>

  {* Vote *}
  {if $kbarticle.voteable}
    <div style="margin-top: 1.5rem; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; text-align: center;">
      <p class="text-sm" style="font-weight: 500; margin-bottom: 0.75rem;">Was this article helpful?</p>
      <div style="display: flex; justify-content: center; gap: 0.5rem;">
        <a href="{$WEB_ROOT}/knowledgebase.php?action=vote&articleid={$kbarticle.id}&vote=yes" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1rem;">
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"/></svg>
          Yes
        </a>
        <a href="{$WEB_ROOT}/knowledgebase.php?action=vote&articleid={$kbarticle.id}&vote=no" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1rem;">
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 15v4a3 3 0 0 0 3 3l4-9V2H5.72a2 2 0 0 0-2 1.7l-1.38 9a2 2 0 0 0 2 2.3zm7-13h2.67A2.31 2.31 0 0 1 22 4v7a2.31 2.31 0 0 1-2.33 2H17"/></svg>
          No
        </a>
      </div>
    </div>
  {/if}

  <div style="margin-top: 1.5rem; text-align: center;">
    <a href="{$WEB_ROOT}/knowledgebase.php" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1.25rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
      Back to Knowledge Base
    </a>
  </div>

</div>
