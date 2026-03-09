{* VENOM CODES — Knowledge Base Home *}

<div style="max-width: 48rem; margin: 0 auto;">

  <div style="margin-bottom: 2rem; text-align: center;">
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Knowledge Base</h1>
    <p class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Find answers, guides, and documentation.</p>
  </div>

  {* Search *}
  <form role="form" method="post" action="{routePath('knowledgebase-search')}" style="margin-bottom: 2rem;">
    <div style="position: relative; max-width: 32rem; margin: 0 auto; display: flex; gap: 0.5rem;">
      <div style="position: relative; flex: 1;">
        <svg style="position: absolute; left: 0.75rem; top: 50%; transform: translateY(-50%); color: hsl(var(--muted-foreground));" class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" id="inputKnowledgebaseSearch" name="search" value="{$searchterm}" class="venom-input" placeholder="{lang key='clientHomeSearchKb'}" style="padding-left: 2.25rem; padding-right: 1rem; width: 100%;" />
      </div>
      <button type="submit" id="btnKnowledgebaseSearch" class="venom-btn-primary" style="padding: 0.5rem 1rem; white-space: nowrap;">{lang key='search'}</button>
    </div>
  </form>

  {* Categories — uses $kbcats (same as Twenty-One default) *}
  {if $kbcats}
    <div style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
      <style>@media (min-width: 640px) { .kb-grid { grid-template-columns: repeat(2, 1fr) !important; } }</style>
      <div class="kb-grid" style="display: grid; gap: 1rem; grid-template-columns: repeat(1, 1fr);">
        {foreach $kbcats as $category}
          <a href="{routePath('knowledgebase-category-view', {$category.id}, {$category.urlfriendlyname})}" style="text-decoration: none; color: inherit; display: block; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; transition: border-color 0.15s;">
            <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 0.5rem;">
              <div style="display: flex; height: 2.25rem; width: 2.25rem; align-items: center; justify-content: center; border-radius: 0.5rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
                <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>
              </div>
              <h3 class="font-display" style="font-size: 1rem; font-weight: 600;">{$category.name}</h3>
            </div>
            {if $category.description}
              <p class="text-sm text-muted-foreground" style="line-height: 1.5; margin-bottom: 0.5rem;">{$category.description|strip_tags|truncate:120}</p>
            {/if}
            <span class="text-xs text-muted-foreground">{lang key="knowledgebase.numArticle{if $category.numarticles != 1}s{/if}" num=$category.numarticles}</span>
          </a>
        {/foreach}
      </div>
    </div>
  {else}
    <div style="border-radius: 0.75rem; border: 1px dashed hsl(var(--border)); background: hsl(var(--card)); padding: 3rem; text-align: center;">
      <p class="text-muted-foreground" style="font-size: 0.875rem;">{lang key='knowledgebasenoarticles'}</p>
    </div>
  {/if}

</div>
