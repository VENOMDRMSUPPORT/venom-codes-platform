{include file="$template/includes/flashmessage.tpl"}
{include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}

{assign var="totalTickets" value=$tickets|@count}
{assign var="openTickets" value=0}
{assign var="closedTickets" value=0}
{assign var="unreadTickets" value=0}
{assign var="escalatedTickets" value=0}

{foreach $tickets as $ticket}
    {assign var="ticketStatusKey" value=$ticket.statusClass|strtolower}
    {if $ticketStatusKey == 'closed'}
        {assign var="closedTickets" value=$closedTickets+1}
    {else}
        {assign var="openTickets" value=$openTickets+1}
    {/if}
    {if $ticket.unread}
        {assign var="unreadTickets" value=$unreadTickets+1}
    {/if}
    {assign var="ticketPriorityKey" value=''}
    {if isset($ticket.priority)}
        {assign var="ticketPriorityKey" value=$ticket.priority|strtolower}
    {/if}
    {if $ticketPriorityKey == 'high' || $ticketPriorityKey == 'urgent'}
        {assign var="escalatedTickets" value=$escalatedTickets+1}
    {/if}
{/foreach}

<script>
    jQuery(document).ready(function () {
        var table = jQuery('#tableTicketsList').show().DataTable();
        {if $orderby == 'did' || $orderby == 'dept'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'subject' || $orderby == 'title'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'lastreply'}
            table.order(3, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();

        jQuery('.ticket-status-custom').each(function() {
            var color = jQuery(this).data('status-color');
            if (color) {
                jQuery(this).css('background-color', color);
            }
        });

        jQuery('[data-ticket-filter]').on('click', function(e) {
            e.preventDefault();
            var $button = jQuery(this);
            var filter = $button.data('ticket-filter');

            jQuery('[data-ticket-filter]').removeClass('active');
            $button.addClass('active');

            if (filter === 'all') {
                table.column(2).search('').draw();
            } else {
                table.column(2).search('\\[status-key:' + filter + '\\]', true, false).draw();
            }
        });
    });
</script>

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Support Operations</span>
            <h1 class="h3 font-weight-bold mb-2">Ticket Queue &amp; Incident Tracking</h1>
            <p class="text-muted mb-0">Monitor infrastructure-license support threads, reply velocity, and escalation signals from one operational queue.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="submitticket.php" class="btn venom-btn venom-btn--solid btn-sm mr-2 mb-2">
                    <i class="fas fa-plus-circle fa-fw"></i>
                    {lang key='navopenticket'}
                </a>
                <a href="knowledgebase.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-book fa-fw"></i>
                    {lang key='knowledgebasetitle'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Total Tickets</h3>
                <i class="fas fa-inbox text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$totalTickets}</p>
            <p class="small text-muted mb-0">All support requests associated with this account.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Open Threads</h3>
                <span class="label status status-open">Open</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$openTickets}</p>
            <p class="small text-muted mb-0">Active support conversations still in progress.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Unread Updates</h3>
                <span class="label status status-customer-reply">Unread</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$unreadTickets}</p>
            <p class="small text-muted mb-0">Threads with new responses requiring your review.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-3 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Escalated</h3>
                <span class="label status status-on-hold">Priority</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$escalatedTickets}</p>
            <p class="small text-muted mb-0">High/urgent requests flagged for faster handling.</p>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-3 mb-lg-0">
            <i class="fas fa-life-ring"></i>
            Support Ticket Matrix
        </h3>
        <div class="btn-group btn-group-sm" role="group" aria-label="Ticket status filters">
            <button type="button" class="btn btn-default active" data-ticket-filter="all">All ({$totalTickets})</button>
            <button type="button" class="btn btn-default" data-ticket-filter="open">Open ({$openTickets})</button>
            <button type="button" class="btn btn-default" data-ticket-filter="closed">Closed ({$closedTickets})</button>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-container clearfix mb-0">
            <table id="tableTicketsList" class="table table-list w-hidden">
                <thead>
                    <tr>
                        <th>{lang key='supportticketsdepartment'}</th>
                        <th>{lang key='supportticketssubject'}</th>
                        <th>{lang key='supportticketsstatus'}</th>
                        <th>{lang key='supportticketsticketlastupdated'}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $tickets as $ticket}
                        <tr onclick="window.location='viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}'">
                            <td>
                                {$ticket.department}
                            </td>
                            <td>
                                <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="border-left">
                                    <span class="ticket-number">#{$ticket.tid}</span>
                                    <span class="ticket-subject{if $ticket.unread} unread{/if}">{$ticket.subject|escape}</span>
                                    {if isset($ticket.priority) && $ticket.priority}
                                        <small class="d-block text-muted">{lang key='supportticketspriority'}: {$ticket.priority}</small>
                                    {/if}
                                </a>
                            </td>
                            <td>
                                <span class="w-hidden">[status-key:{$ticket.statusClass|strtolower}]</span>
                                <span class="label status {if is_null($ticket.statusColor)}status-{$ticket.statusClass}{else}status-custom ticket-status-custom{/if}"{if !is_null($ticket.statusColor)} data-status-color="{$ticket.statusColor}"{/if}>
                                    {$ticket.status|strip_tags}
                                </span>
                            </td>
                            <td class="text-center">
                                <span class="w-hidden">{$ticket.normalisedLastReply}</span>
                                {$ticket.lastreply}
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
