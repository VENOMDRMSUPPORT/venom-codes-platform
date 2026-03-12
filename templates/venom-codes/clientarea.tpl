{if isset($content) && $content}
    {$content}
{elseif isset($mode) && $mode == 'end'}
                    </div>

                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-lg-none sidebar-secondary">
                            {include file="$template/includes/client/sidebar.tpl" sidebar=$secondarySidebar className="sidebar-secondary"}
                        </div>
                    {/if}
                <div class="clearfix"></div>
            </div>
        </div>
    </section>
{else}
    <section id="main-body">
        <div class="{if !$skipMainBodyContainer}container{/if}">
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}row{/if}">

            {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                <div class="col-lg-4 col-xl-3">
                    {include file="$template/includes/client/sidebar.tpl" sidebar=$primarySidebar}
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-none d-lg-block">
                            {include file="$template/includes/client/sidebar.tpl" sidebar=$secondarySidebar className="sidebar-secondary"}
                        </div>
                    {/if}
                </div>
            {/if}
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{/if} primary-content">
{/if}
