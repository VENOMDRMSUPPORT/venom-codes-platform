{* VENOM CODES — Knowledge Base Category *}

<div style="max-width: 48rem; margin: 0 auto;">

  {* Breadcrumb *}
  <nav style="margin-bottom: 1.5rem; display: flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
    <a href="{$WEB_ROOT}/knowledgebase.php" style="text-decoration: none; color: inherit;">Knowledge Base</a>
    <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
    <span style="color: hsl(var(--foreground)); font-weight: 500;">{$kbcatname}</span>
  </nav>

  <div style="margin-bottom: 2rem;">
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">{$kbcatname}</h1>
    {if $kbcatdesc}
      <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">{$kbcatdesc|strip_tags}</p>
    {/if}
  </div>

  {* Subcategories *}
  {if $kbcategories}
    <div style="margin-bottom: 1.5rem;">
      <h2 class="font-display text-sm" style="font-weight: 600; margin-bottom: 0.75rem; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Subcategories</h2>
      <div style="display: flex; flex-wrap: wrap; gap: 0.5rem;">
        {foreach $kbcategories as $cat}
          <a href="{$WEB_ROOT}/knowledgebase/{$cat.id}/{$cat.urlfriendlyname}" class="venom-btn-secondary text-sm" style="padding: 0.375rem 0.75rem;">
            {$cat.name} <span class="text-muted-foreground">({$cat.numarticles})</span>
          </a>
        {/foreach}
      </div>
    </div>
  {/if}

  {* Articles *}
  {if $kbarticles}
    <div style="display: flex; flex-direction: column; gap: 0.5rem;">
      {foreach $kbarticles as $article}
        <a href="{$WEB_ROOT}/knowledgebase/{$article.id}/{$article.urlfriendlytitle}" style="text-decoration: none; color: inherit; display: flex; align-items: center; justify-content: space-between; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1rem 1.25rem; transition: border-color 0.15s;">
          <div>
            <h3 style="font-size: 0.9375rem; font-weight: 600;">{$article.title}</h3>
            {if $article.text}
              <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">{$article.text|strip_tags|truncate:120}</p>
            {/if}
          </div>
          <svg class="h-4 w-4 text-muted-foreground" style="flex-shrink: 0; margin-left: 1rem;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
        </a>
      {/foreach}
    </div>

    {include file="$template/includes/client/pagination.tpl"}
  {else}
    <div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
      <p class="text-muted-foreground" style="font-size: 0.875rem;">No articles in this category yet.</p>
    </div>
  {/if}

</div>
