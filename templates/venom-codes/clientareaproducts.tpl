{include file="$template/includes/flashmessage.tpl"}
{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="4" noSortColumns="0"}

{assign var="totalServices" value=$services|@count}
{assign var="activeServices" value=0}
{assign var="pendingServices" value=0}
{assign var="suspendedServices" value=0}

{foreach $services as $service}
    {assign var="serviceStatusKey" value=$service.status|strtolower}
    {if $serviceStatusKey == 'active'}
        {assign var="activeServices" value=$activeServices+1}
    {elseif $serviceStatusKey == 'pending'}
        {assign var="pendingServices" value=$pendingServices+1}
    {elseif $serviceStatusKey == 'suspended'}
        {assign var="suspendedServices" value=$suspendedServices+1}
    {/if}
{/foreach}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableServicesList').show().DataTable();

        {if $orderby == 'product'}
            table.order([1, '{$sort}'], [4, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();

        jQuery('[data-services-filter]').on('click', function(e) {
            e.preventDefault();
            var $button = jQuery(this);
            var filter = $button.data('services-filter');

            jQuery('[data-services-filter]').removeClass('active');
            $button.addClass('active');

            if (filter === 'all') {
                table.column(4).search('').draw();
            } else {
                table.column(4).search('\\[status-key:' + filter + '\\]', true, false).draw();
            }
        });
    });
</script>

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Member Area</span>
            <h1 class="h3 font-weight-bold mb-2">My Services &amp; Licenses</h1>
            <p class="text-muted mb-0">Manage active software subscriptions, infrastructure roles, renewals, and service lifecycle states from one fleet view.</p>
        </div>
        <div class="col-12 col-lg-4 text-lg-right">
            <a href="{$WEB_ROOT}/cart.php" class="btn venom-btn venom-btn--solid">
                <i class="fas fa-plus-circle fa-fw"></i>
                {lang key='navservicesorder'}
            </a>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-md-4 mb-3 mb-md-0">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Active Fleet</h3>
                <span class="label status status-active">Live</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$activeServices}</p>
            <p class="small text-muted mb-0">Services currently operational.</p>
        </div>
    </div>
    <div class="col-12 col-md-4 mb-3 mb-md-0">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Pending Queue</h3>
                <span class="label status status-pending">Pending</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$pendingServices}</p>
            <p class="small text-muted mb-0">Services awaiting activation workflow.</p>
        </div>
    </div>
    <div class="col-12 col-md-4">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Suspended Nodes</h3>
                <span class="label status status-suspended">Review</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$suspendedServices}</p>
            <p class="small text-muted mb-0">Services requiring account attention.</p>
        </div>
    </div>
</div>

<div class="card card-accent-midnight-blue">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-3 mb-lg-0">
            <i class="fas fa-server"></i>
            Service Fleet Matrix
        </h3>
        <div class="btn-group btn-group-sm" role="group" aria-label="Service status filters">
            <button type="button" class="btn btn-default active" data-services-filter="all">All ({$totalServices})</button>
            <button type="button" class="btn btn-default" data-services-filter="active">Active ({$activeServices})</button>
            <button type="button" class="btn btn-default" data-services-filter="pending">Pending ({$pendingServices})</button>
            <button type="button" class="btn btn-default" data-services-filter="suspended">Suspended ({$suspendedServices})</button>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-container clearfix mb-0">
            <table id="tableServicesList" class="table table-list w-hidden">
                <thead>
                    <tr>
                        <th></th>
                        <th>{lang key='orderproduct'}</th>
                        <th>{lang key='clientareaaddonpricing'}</th>
                        <th>{lang key='clientareahostingnextduedate'}</th>
                        <th>{lang key='clientareastatus'}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $services as $service}
                        <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                            <td class="py-0 text-center{if $service.sslStatus} ssl-info{/if}" data-element-id="{$service.id}" data-type="service"{if $service.domain} data-domain="{$service.domain}"{/if}>
                                {if $service.sslStatus}
                                    <img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="{$service.sslStatus->getClass()}" width="25">
                                {elseif !$service.isActive}
                                    <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}" width="25">
                                {/if}
                            </td>
                            <td>
                                <div class="d-flex flex-column">
                                    <strong>{$service.product}</strong>
                                    {if $service.domain}
                                        <a href="http://{$service.domain}" target="_blank" class="small text-muted">{$service.domain}</a>
                                    {else}
                                        <span class="small text-muted">-</span>
                                    {/if}
                                </div>
                            </td>
                            <td class="text-center" data-order="{$service.amountnum}">
                                {$service.amount} <small class="text-muted">{$service.billingcycle}</small>
                            </td>
                            <td class="text-center">
                                <span class="w-hidden">{$service.normalisedNextDueDate}</span>
                                {$service.nextduedate}
                            </td>
                            <td class="text-center">
                                <span class="w-hidden">[status-key:{$service.status|strtolower}]</span>
                                <span class="label status status-{$service.status|strtolower}">{$service.statustext}</span>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            <div class="text-center" id="tableLoading">
                <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
            </div>
        </div>
    </div>
</div>
