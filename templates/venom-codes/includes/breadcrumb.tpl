{* VENOM CODES — Breadcrumb Navigation Component *}

<ol class="breadcrumb" style="background: transparent; padding: 0.75rem 0; margin-bottom: 1.5rem; border-radius: 0.5rem; display: flex; flex-wrap: wrap; list-style: none;">
    {foreach $breadcrumb as $item}
        <li class="breadcrumb-item{if $item@last} active{/if}" 
            {if $item@last} aria-current="page"{/if}
            style="font-size: 0.875rem; {if !$item@last}color: var(--primary-600, #2563eb);{else}color: var(--gray-600, #4b5563);{/if}">
            {if !$item@last}
                <a href="{$item.link}" style="color: var(--primary-600, #2563eb); text-decoration: none; transition: color 0.2s; display: inline-flex; align-items: center; gap: 0.5rem;">
                    {$item.label}
                    <svg style="width: 1rem; height: 1rem; opacity: 0.5;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"/></svg>
                </a>
            {else}
                <span style="font-weight: 500; color: var(--gray-700, #374151);">{$item.label}</span>
            {/if}
        </li>
    {/foreach}
</ol>
