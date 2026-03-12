{include file="$template/includes/flashmessage.tpl"}
{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}

{assign var="totalInvoices" value=$invoices|@count}
{assign var="paidInvoices" value=0}
{assign var="unpaidInvoices" value=0}
{assign var="overdueInvoices" value=0}

{foreach $invoices as $invoice}
    {assign var="invoiceStatusClass" value=$invoice.statusClass|strtolower}
    {if $invoiceStatusClass == 'paid'}
        {assign var="paidInvoices" value=$paidInvoices+1}
    {elseif $invoiceStatusClass == 'unpaid'}
        {assign var="unpaidInvoices" value=$unpaidInvoices+1}
    {elseif $invoiceStatusClass == 'overdue'}
        {assign var="overdueInvoices" value=$overdueInvoices+1}
    {/if}
{/foreach}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableInvoicesList').show().DataTable();

        {if $orderby == 'default'}
            table.order([4, 'desc'], [2, 'asc']);
        {elseif $orderby == 'invoicenum'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'duedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();

        jQuery('[data-invoice-filter]').on('click', function(e) {
            e.preventDefault();
            var $button = jQuery(this);
            var filter = $button.data('invoice-filter');

            jQuery('[data-invoice-filter]').removeClass('active');
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
            <span class="venom-chip">Billing Control</span>
            <h1 class="h3 font-weight-bold mb-2">Invoices &amp; Ledger</h1>
            <p class="text-muted mb-0">Track software-license billing cycles, payment statuses, and due-date exposure from one infrastructure-focused ledger.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="{routePath('account-paymentmethods')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-credit-card fa-fw"></i>
                    Payment Methods
                </a>
                <a href="clientarea.php?action=services" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-server fa-fw"></i>
                    {lang key='clientareanavservices'}
                </a>
                <a href="clientarea.php?action=addfunds" class="btn venom-btn venom-btn--solid btn-sm mb-2">
                    <i class="fas fa-wallet fa-fw"></i>
                    {lang key='addfunds'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Total Invoices</h3>
                <i class="fas fa-file-invoice text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$totalInvoices}</p>
            <p class="small text-muted mb-0">Historical billing documents in your account.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Paid</h3>
                <span class="label status status-paid">Settled</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$paidInvoices}</p>
            <p class="small text-muted mb-0">Invoices completed successfully.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Unpaid</h3>
                <span class="label status status-unpaid">Action</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$unpaidInvoices}</p>
            <p class="small text-muted mb-0">Pending invoices awaiting payment.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Overdue</h3>
                <span class="label status status-overdue">Urgent</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$overdueInvoices}</p>
            <p class="small text-muted mb-0">Invoices outside normal payment window.</p>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-3 mb-lg-0">
            <i class="fas fa-receipt"></i>
            Billing Ledger Table
        </h3>
        <div class="btn-group btn-group-sm" role="group" aria-label="Invoice status filters">
            <button type="button" class="btn btn-default active" data-invoice-filter="all">All ({$totalInvoices})</button>
            <button type="button" class="btn btn-default" data-invoice-filter="paid">Paid ({$paidInvoices})</button>
            <button type="button" class="btn btn-default" data-invoice-filter="unpaid">Unpaid ({$unpaidInvoices})</button>
            <button type="button" class="btn btn-default" data-invoice-filter="overdue">Overdue ({$overdueInvoices})</button>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-container clearfix mb-0">
            <table id="tableInvoicesList" class="table table-list w-hidden">
                <thead>
                    <tr>
                        <th>{lang key='invoicestitle'}</th>
                        <th>{lang key='invoicesdatecreated'}</th>
                        <th>{lang key='invoicesdatedue'}</th>
                        <th>{lang key='invoicestotal'}</th>
                        <th>{lang key='invoicesstatus'}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $invoices as $invoice}
                        {assign var="invoiceStatusClass" value=$invoice.statusClass|strtolower}
                        <tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
                            <td>
                                <div class="d-flex flex-column">
                                    <strong>{$invoice.invoicenum}</strong>
                                    <span class="small text-muted">Invoice #{$invoice.id}</span>
                                </div>
                            </td>
                            <td>
                                <span class="w-hidden">{$invoice.normalisedDateCreated}</span>
                                {$invoice.datecreated}
                            </td>
                            <td>
                                <span class="w-hidden">{$invoice.normalisedDateDue}</span>
                                {$invoice.datedue}
                            </td>
                            <td data-order="{$invoice.totalnum}">
                                <strong>{$invoice.total}</strong>
                            </td>
                            <td>
                                <span class="w-hidden">[status-key:{$invoiceStatusClass}]</span>
                                <span class="label status status-{$invoice.statusClass}">{$invoice.status}</span>
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
