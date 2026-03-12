{if isset($sidebar) && $sidebar}
    <div class="sidebar venom-client-sidebar{if isset($className) && $className} {$className}{/if}">
        {include file="$template/includes/sidebar.tpl" sidebar=$sidebar}
    </div>
{/if}
