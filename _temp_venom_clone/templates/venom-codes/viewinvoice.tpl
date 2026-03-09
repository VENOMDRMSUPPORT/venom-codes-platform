{* VENOM CODES — Invoice Details *}

{assign var="breadcrumbs" value=[['label' => 'Invoices', 'href' => "`$WEB_ROOT`/clientarea.php?action=invoices"], ['label' => "#`$invoicenum`"]]}
{capture assign="page_actions"}
  <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 0.5rem;">
    <a href="javascript:window.print()" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 6 2 18 2 18 9"/><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"/><rect x="6" y="14" width="12" height="8"/></svg>
      Print
    </a>
    <a href="{$WEB_ROOT}/dl.php?type=i&id={$invoiceid}" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
      Download PDF
    </a>
    {if $status eq "Unpaid"}
      <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoiceid}&a=pay" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
        Pay Now
      </a>
    {/if}
  </div>
{/capture}
{include file="$template/includes/client/pageheader.tpl" page_title="Invoice #`$invoicenum`"}

{* Unpaid alert *}
{if $status eq "Unpaid"}
  <div style="margin-bottom: 1.5rem;">
    {include file="$template/includes/client/alert.tpl" alert_type="warning" alert_title="Payment Due" alert_content="This invoice is unpaid. Please make payment before the due date."}
  </div>
{/if}

<div style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">
  <style>@media (min-width: 1024px) { .inv-detail-grid { grid-template-columns: 2fr 1fr !important; } }</style>
  <div class="inv-detail-grid" style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">

    {* Invoice line items *}
    {include file="$template/includes/client/invoicesummary.tpl" invoicenum=$invoicenum invoicedate=$date duedate=$duedate status=$status|lower}

    {* Sidebar *}
    <div style="display: flex; flex-direction: column; gap: 1rem;">
      {assign var="panel_rows" value=[
        ['label' => 'Payment Method', 'value' => $paymentmethod],
        ['label' => 'Transaction ID', 'value' => $transid],
        ['label' => 'Invoice Date', 'value' => $date],
        ['label' => 'Due Date', 'value' => $duedate]
      ]}
      {include file="$template/includes/client/summarypanel.tpl" panel_title="Payment Information"}

      {assign var="panel_rows" value=[
        ['label' => 'Name', 'value' => "`$clientsdetails.firstname` `$clientsdetails.lastname`"],
        ['label' => 'Company', 'value' => $clientsdetails.companyname],
        ['label' => 'Address', 'value' => $clientsdetails.address1]
      ]}
      {include file="$template/includes/client/summarypanel.tpl" panel_title="Billing Address"}
    </div>

  </div>
</div>