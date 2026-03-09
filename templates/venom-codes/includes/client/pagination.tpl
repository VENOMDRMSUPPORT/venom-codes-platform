{* VENOM CODES — Pagination Partial *}

{if $numpages > 1}
<nav style="margin-top: 1rem; display: flex; align-items: center; justify-content: center; gap: 0.25rem;" aria-label="Pagination">

  {* Previous *}
  {if $pageno > 1}
    <a href="{$prevpagelink}" style="border-radius: 0.5rem; padding: 0.5rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
    </a>
  {else}
    <span style="border-radius: 0.5rem; padding: 0.5rem; opacity: 0.4; color: hsl(var(--muted-foreground));">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"/></svg>
    </span>
  {/if}

  {* Page numbers *}
  {foreach $pagelinks as $pagelink}
    {if $pagelink.page == $pageno}
      <span style="min-width: 2rem; border-radius: 0.5rem; padding: 0.375rem 0.625rem; font-size: 0.875rem; font-weight: 500; text-align: center; background: hsl(var(--primary)); color: hsl(var(--primary-foreground));">
        {$pagelink.page}
      </span>
    {else}
      <a href="{$pagelink.link}" style="min-width: 2rem; border-radius: 0.5rem; padding: 0.375rem 0.625rem; font-size: 0.875rem; font-weight: 500; text-align: center; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s;">
        {$pagelink.page}
      </a>
    {/if}
  {/foreach}

  {* Next *}
  {if $pageno < $numpages}
    <a href="{$nextpagelink}" style="border-radius: 0.5rem; padding: 0.5rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
    </a>
  {else}
    <span style="border-radius: 0.5rem; padding: 0.5rem; opacity: 0.4; color: hsl(var(--muted-foreground));">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
    </span>
  {/if}

</nav>
{/if}
