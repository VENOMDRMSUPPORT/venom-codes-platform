{* VENOM CODES — Client Area Dashboard *}

{* Page header *}
{assign var="breadcrumbs" value=[['label' => 'Dashboard']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Dashboard" page_subtitle="Welcome back. Here's an overview of your account."}

{* Unpaid invoice alert *}
{if $clientsstats.numunpaidinvoices > 0}
  <div style="margin-bottom: 1.5rem;">
    {include file="$template/includes/client/alert.tpl" alert_type="warning" alert_title="Unpaid Invoice" alert_content="You have an outstanding invoice. <a href='`$WEB_ROOT`/clientarea.php?action=invoices' style='text-decoration: underline; font-weight: 600;'>View invoices →</a>"}
  </div>
{/if}

{* Stat cards *}
<div style="margin-bottom: 2rem; display: grid; grid-template-columns: 1fr; gap: 1rem;">
  <style>
    @media (min-width: 640px) { .dash-stats { grid-template-columns: repeat(2, 1fr) !important; } }
    @media (min-width: 1024px) { .dash-stats { grid-template-columns: repeat(4, 1fr) !important; } }
  </style>
  <div class="dash-stats" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"/><rect x="2" y="14" width="20" height="8" rx="2" ry="2"/><line x1="6" y1="6" x2="6.01" y2="6"/><line x1="6" y1="18" x2="6.01" y2="18"/></svg>' stat_label="Active Services" stat_value=$clientsstats.productsnumactive}
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>' stat_label="Unpaid Invoices" stat_value=$clientsstats.numunpaidinvoices}
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>' stat_label="Open Tickets" stat_value=$clientsstats.numactivetickets}
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>' stat_label="Active Domains" stat_value=$clientsstats.numactivedomains}
  </div>
</div>

{* Recent items grid *}
<div style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">
  <style>@media (min-width: 1024px) { .dash-grid { grid-template-columns: repeat(2, 1fr) !important; } }</style>
  <div class="dash-grid" style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">

    {* Recent Services *}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="display: flex; align-items: center; justify-content: space-between; border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h2 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Recent Services</h2>
        <a href="{$WEB_ROOT}/clientarea.php?action=products" style="display: flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;">
          View All <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
        </a>
      </div>
      <div>
        {foreach $services as $service}
          <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$service.id}" style="display: flex; align-items: center; justify-content: space-between; padding: 0.75rem 1.25rem; font-size: 0.875rem; text-decoration: none; color: inherit; transition: background 0.15s; border-bottom: 1px solid hsl(var(--border));">
            <div>
              <p style="font-weight: 500;">{$service.product}</p>
              <p class="text-muted-foreground" style="font-size: 0.75rem;">Due: {$service.nextduedate}</p>
            </div>
            {include file="$template/includes/client/statusbadge.tpl" status_variant=$service.status|lower}
          </a>
        {foreachelse}
          <p class="text-muted-foreground" style="padding: 1.5rem 1.25rem; text-align: center; font-size: 0.875rem;">No active services.</p>
        {/foreach}
      </div>
    </div>

    {* Recent Invoices *}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="display: flex; align-items: center; justify-content: space-between; border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h2 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Recent Invoices</h2>
        <a href="{$WEB_ROOT}/clientarea.php?action=invoices" style="display: flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;">
          View All <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
        </a>
      </div>
      <div>
        {foreach $invoices as $invoice}
          <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}" style="display: flex; align-items: center; justify-content: space-between; padding: 0.75rem 1.25rem; font-size: 0.875rem; text-decoration: none; color: inherit; transition: background 0.15s; border-bottom: 1px solid hsl(var(--border));">
            <div>
              <p style="font-weight: 500;">#{$invoice.invoicenum}</p>
              <p class="text-muted-foreground" style="font-size: 0.75rem;">{$invoice.datecreated}</p>
            </div>
            <div style="display: flex; align-items: center; gap: 0.75rem;">
              <span style="font-weight: 500;">{$invoice.total}</span>
              {include file="$template/includes/client/statusbadge.tpl" status_variant=$invoice.status|lower}
            </div>
          </a>
        {foreachelse}
          <p class="text-muted-foreground" style="padding: 1.5rem 1.25rem; text-align: center; font-size: 0.875rem;">No invoices.</p>
        {/foreach}
      </div>
    </div>

    {* Recent Tickets *}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="display: flex; align-items: center; justify-content: space-between; border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h2 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Recent Tickets</h2>
        <a href="{$WEB_ROOT}/supporttickets.php" style="display: flex; align-items: center; gap: 0.25rem; font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;">
          View All <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
        </a>
      </div>
      <div>
        {foreach $tickets as $ticket}
          <a href="{$WEB_ROOT}/viewticket.php?tid={$ticket.tid}&c={$ticket.c}" style="display: flex; align-items: center; justify-content: space-between; padding: 0.75rem 1.25rem; font-size: 0.875rem; text-decoration: none; color: inherit; transition: background 0.15s; border-bottom: 1px solid hsl(var(--border));">
            <div>
              <p style="font-weight: 500;">{$ticket.subject}</p>
              <p class="text-muted-foreground" style="font-size: 0.75rem;">#{$ticket.tid} · {$ticket.date}</p>
            </div>
            {include file="$template/includes/client/statusbadge.tpl" status_variant=$ticket.status|lower}
          </a>
        {foreachelse}
          <p class="text-muted-foreground" style="padding: 1.5rem 1.25rem; text-align: center; font-size: 0.875rem;">No tickets.</p>
        {/foreach}
      </div>
    </div>

    {* Account Summary *}
    {assign var="panel_rows" value=[
      ['label' => 'Name', 'value' => "`$clientsdetails.firstname` `$clientsdetails.lastname`"],
      ['label' => 'Email', 'value' => $clientsdetails.email],
      ['label' => 'Company', 'value' => $clientsdetails.companyname]
    ]}
    {assign var="panel_footer" value="<a href='`$WEB_ROOT`/clientarea.php?action=details' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>Edit Profile →</a>"}
    {include file="$template/includes/client/summarypanel.tpl" panel_title="Account Summary"}

  </div>
</div>