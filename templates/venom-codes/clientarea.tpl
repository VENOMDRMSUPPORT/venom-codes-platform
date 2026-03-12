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
    <section id="main-body" class="venom-client-shell-main">
        <div class="{if !$skipMainBodyContainer}container{/if} venom-client-shell-container">
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}row{/if} venom-client-shell-grid">

            {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                <div class="col-lg-4 col-xl-3 venom-client-shell-sidebar">
                    {include file="$template/includes/client/sidebar.tpl" sidebar=$primarySidebar}
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-none d-lg-block">
                            {include file="$template/includes/client/sidebar.tpl" sidebar=$secondarySidebar className="sidebar-secondary"}
                        </div>
                    {/if}
                </div>
            {/if}
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{/if} primary-content venom-client-shell-content">
{/if}
