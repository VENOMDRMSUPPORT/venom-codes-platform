{include file="$template/includes/flashmessage.tpl"}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Client Control Center</span>
            <h1 class="h3 font-weight-bold mb-2">System Dashboard</h1>
            <p class="text-muted mb-0">Monitor your active software licenses, billing signals, and support operations from one enterprise workspace.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="clientarea.php?action=services" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-cube fa-fw"></i>
                    Manage Services
                </a>
                <a href="clientarea.php?action=invoices" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-file-invoice-dollar fa-fw"></i>
                    View Invoices
                </a>
                <a href="submitticket.php" class="btn venom-btn venom-btn--solid btn-sm mb-2">
                    <i class="fas fa-life-ring fa-fw"></i>
                    Open Ticket
                </a>
            </div>
        </div>
    </div>
</div>

<div class="mb-4">
    <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between mb-2">
        <h2 class="h5 font-weight-bold mb-1 mb-sm-0">Infrastructure Summary</h2>
        <small class="text-muted">License management and account telemetry</small>
    </div>

    <div class="tiles">
        <div class="row no-gutters">
            <div class="col-6 col-xl-3">
                <a href="clientarea.php?action=services" class="tile">
                    <i class="fas fa-cube"></i>
                    <div class="stat">{$clientsstats.productsnumactive}</div>
                    <div class="title">{lang key='navservices'}</div>
                    <div class="highlight bg-color-blue"></div>
                </a>
            </div>
            {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
                <div class="col-6 col-xl-3">
                    <a href="clientarea.php?action=domains" class="tile">
                        <i class="fas fa-globe"></i>
                        <div class="stat">{$clientsstats.numactivedomains}</div>
                        <div class="title">{lang key='navdomains'}</div>
                        <div class="highlight bg-color-green"></div>
                    </a>
                </div>
            {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
                <div class="col-6 col-xl-3">
                    <a href="affiliates.php" class="tile">
                        <i class="fas fa-shopping-cart"></i>
                        <div class="stat">{$clientsstats.numaffiliatesignups}</div>
                        <div class="title">{lang key='affiliatessignups'}</div>
                        <div class="highlight bg-color-green"></div>
                    </a>
                </div>
            {else}
                <div class="col-6 col-xl-3">
                    <a href="clientarea.php?action=quotes" class="tile">
                        <i class="far fa-file-alt"></i>
                        <div class="stat">{$clientsstats.numquotes}</div>
                        <div class="title">{lang key='quotes'}</div>
                        <div class="highlight bg-color-green"></div>
                    </a>
                </div>
            {/if}
            <div class="col-6 col-xl-3">
                <a href="supporttickets.php" class="tile">
                    <i class="fas fa-comments"></i>
                    <div class="stat">{$clientsstats.numactivetickets}</div>
                    <div class="title">{lang key='navtickets'}</div>
                    <div class="highlight bg-color-red"></div>
                </a>
            </div>
            <div class="col-6 col-xl-3">
                <a href="clientarea.php?action=invoices" class="tile">
                    <i class="fas fa-credit-card"></i>
                    <div class="stat">{$clientsstats.numunpaidinvoices}</div>
                    <div class="title">{lang key='navinvoices'}</div>
                    <div class="highlight bg-color-gold"></div>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-lg-8 mb-4 mb-lg-0">
        <div class="row">
            <div class="col-12 col-md-4 mb-3">
                <div class="venom-plan-card h-100">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h3 class="h6 font-weight-bold mb-0">Service Health</h3>
                        <span class="label status status-{if $clientsstats.productsnumactive > 0}active{else}suspended{/if}">
                            {if $clientsstats.productsnumactive > 0}Operational{else}Attention{/if}
                        </span>
                    </div>
                    <p class="h4 font-weight-bold mb-1">{$clientsstats.productsnumactive}</p>
                    <p class="small text-muted mb-0">Active software licenses under management.</p>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-3">
                <div class="venom-plan-card h-100">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h3 class="h6 font-weight-bold mb-0">Billing Signal</h3>
                        <span class="label status status-{if $clientsstats.numunpaidinvoices > 0}unpaid{else}paid{/if}">
                            {if $clientsstats.numunpaidinvoices > 0}Action Required{else}Clear{/if}
                        </span>
                    </div>
                    <p class="h4 font-weight-bold mb-1">{$clientsstats.numunpaidinvoices}</p>
                    <p class="small text-muted mb-0">Unpaid invoices requiring review.</p>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-3">
                <div class="venom-plan-card h-100">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h3 class="h6 font-weight-bold mb-0">Support Queue</h3>
                        <span class="label status status-{if $clientsstats.numactivetickets > 0}open{else}closed{/if}">
                            {if $clientsstats.numactivetickets > 0}Active{else}Quiet{/if}
                        </span>
                    </div>
                    <p class="h4 font-weight-bold mb-1">{$clientsstats.numactivetickets}</p>
                    <p class="small text-muted mb-0">Tickets currently open in support channels.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 col-lg-4">
        <div class="card card-accent-midnight-blue h-100">
            <div class="card-header">
                <h3 class="card-title m-0">
                    <i class="fas fa-bolt"></i>
                    Quick Actions
                </h3>
            </div>
            <div class="list-group list-group-flush">
                <a href="clientarea.php?action=services" class="list-group-item list-group-item-action">
                    <i class="fas fa-cube fa-fw mr-2"></i>{lang key='homepage.manageServices'}
                </a>
                <a href="clientarea.php?action=invoices" class="list-group-item list-group-item-action">
                    <i class="fas fa-file-invoice-dollar fa-fw mr-2"></i>{lang key='navinvoices'}
                </a>
                <a href="supporttickets.php" class="list-group-item list-group-item-action">
                    <i class="fas fa-life-ring fa-fw mr-2"></i>{lang key='navtickets'}
                </a>
                <a href="submitticket.php" class="list-group-item list-group-item-action">
                    <i class="fas fa-plus-circle fa-fw mr-2"></i>{lang key='homepage.submitTicket'}
                </a>
                <a href="clientarea.php?action=details" class="list-group-item list-group-item-action">
                    <i class="fas fa-user-cog fa-fw mr-2"></i>{lang key='clientareanavdetails'}
                </a>
            </div>
            <div class="card-footer">
                <small class="text-muted">Infrastructure software operations only. No streaming content services are provided.</small>
            </div>
        </div>
    </div>
</div>

{foreach $addons_html as $addon_html}
    <div class="mb-4">
        {$addon_html}
    </div>
{/foreach}

{if $captchaError}
    <div class="alert alert-danger">
        {$captchaError}
    </div>
{/if}

<div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between mb-3">
    <h2 class="h5 font-weight-bold mb-1 mb-sm-0">Monitoring &amp; Account Modules</h2>
    <small class="text-muted">Live panels, notices, and automation outputs</small>
</div>

<div class="client-home-cards">
    <div class="row">
        <div class="col-12">
            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="card card-accent-{$item->getExtra('color')}{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                    <div class="card-header">
                        <h3 class="card-title m-0">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="float-right">
                                    <a href="{$item->getExtra('btn-link')}" class="btn btn-default bg-color-{$item->getExtra('color')} btn-xs">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                        {$item->getExtra('btn-text')}
                                    </a>
                                </div>
                            {/if}
                            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="card-body">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                    <div class="card-footer">
                        {if $item->hasFooterHtml()}
                            {$item->getFooterHtml()}
                        {/if}
                    </div>
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item->getExtra('colspan')}
                    {outputHomePanels}
                    {assign "panels" $panels->removeChild($item->getName())}
                {/if}
            {/foreach}

        </div>
        <div class="col-md-6 col-lg-12 col-xl-6">

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-md-6 col-lg-12 col-xl-6">

            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>
