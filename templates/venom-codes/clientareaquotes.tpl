{include file="$template/includes/tablelist.tpl" tableName="QuotesList"  noSortColumns="5" filterColumn="4"}

{assign var="totalQuotes" value=$quotes|@count}
{assign var="acceptedQuotes" value=0}
{assign var="openQuotes" value=0}
{assign var="closedQuotes" value=0}

{foreach $quotes as $quote}
    {assign var="quoteStageKey" value=$quote.stageClass|lower}
    {if $quoteStageKey == 'accepted'}
        {assign var="acceptedQuotes" value=$acceptedQuotes+1}
    {elseif $quoteStageKey == 'dead' || $quoteStageKey == 'lost'}
        {assign var="closedQuotes" value=$closedQuotes+1}
    {else}
        {assign var="openQuotes" value=$openQuotes+1}
    {/if}
{/foreach}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableQuotesList').show().DataTable();

        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'validuntil'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'stage'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();

        jQuery('[data-quote-filter]').on('click', function(e) {
            e.preventDefault();
            var $button = jQuery(this);
            var filter = $button.data('quote-filter');

            jQuery('[data-quote-filter]').removeClass('active');
            $button.addClass('active');

            if (filter === 'all') {
                table.column(4).search('').draw();
            } else if (filter === 'closed') {
                table.column(4).search('\\[stage-key:(dead|lost)\\]', true, false).draw();
            } else {
                table.column(4).search('\\[stage-key:' + filter + '\\]', true, false).draw();
            }
        });
    });
</script>

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Commercial Billing</span>
            <h1 class="h3 font-weight-bold mb-2">Quotes &amp; Proposal Tracking</h1>
            <p class="text-muted mb-0">Review commercial proposals, approval stages, and quote documents linked to your infrastructure licensing account.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="clientarea.php?action=invoices" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-file-invoice fa-fw"></i>
                    {lang key='invoices'}
                </a>
                <a href="clientarea.php?action=services" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-server fa-fw"></i>
                    {lang key='clientareanavservices'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Total Quotes</h3>
                <i class="fas fa-file-signature text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$totalQuotes}</p>
            <p class="small text-muted mb-0">All quote records generated for this client account.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Open</h3>
                <span class="label status status-pending">Open</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$openQuotes}</p>
            <p class="small text-muted mb-0">Quotes currently awaiting acceptance or further action.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Accepted</h3>
                <span class="label status status-paid">Accepted</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$acceptedQuotes}</p>
            <p class="small text-muted mb-0">Approved quotes converted or ready for invoicing actions.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Closed</h3>
                <span class="label status status-cancelled">Closed</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$closedQuotes}</p>
            <p class="small text-muted mb-0">Quotes marked as closed, dead, or otherwise finalized.</p>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-3 mb-lg-0">
            <i class="fas fa-file-contract"></i>
            Quote Ledger
        </h3>
        <div class="btn-group btn-group-sm" role="group" aria-label="Quote stage filters">
            <button type="button" class="btn btn-default active" data-quote-filter="all">All ({$totalQuotes})</button>
            <button type="button" class="btn btn-default" data-quote-filter="accepted">Accepted ({$acceptedQuotes})</button>
            <button type="button" class="btn btn-default" data-quote-filter="closed">Closed ({$closedQuotes})</button>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-container clearfix mb-0">
            <table id="tableQuotesList" class="table table-list w-hidden">
                <thead>
                    <tr>
                        <th>{lang key='quotenumber'}</th>
                        <th>{lang key='quotesubject'}</th>
                        <th>{lang key='quotedatecreated'}</th>
                        <th>{lang key='quotevaliduntil'}</th>
                        <th>{lang key='quotestage'}</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $quotes as $quote}
                        <tr onclick="clickableSafeRedirect(event, 'viewquote.php?id={$quote.id}', true)">
                            <td>{$quote.id}</td>
                            <td>{$quote.subject}</td>
                            <td><span class="w-hidden">{$quote.normalisedDateCreated}</span>{$quote.datecreated}</td>
                            <td><span class="w-hidden">{$quote.normalisedValidUntil}</span>{$quote.validuntil}</td>
                            <td>
                                <span class="w-hidden">[stage-key:{$quote.stageClass|lower}]</span>
                                <span class="label status status-{$quote.stageClass}">{$quote.stage}</span>
                            </td>
                            <td class="text-center">
                                <form method="post" action="dl.php">
                                    <input type="hidden" name="type" value="q" />
                                    <input type="hidden" name="id" value="{$quote.id}" />
                                    <button type="submit" class="btn btn-default btn-sm"><i class="fas fa-download"></i> {lang key='quotedownload'}</button>
                                </form>
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
