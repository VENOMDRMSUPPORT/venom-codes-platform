{* VENOM CODES — Transaction History *}

{assign var="breadcrumbs" value=[['label' => 'Billing', 'href' => "`$WEB_ROOT`/clientarea.php?action=creditcard"], ['label' => 'Transactions']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Transaction History" page_subtitle="View your payment and credit history."}

{include file="$template/includes/client/searchfilterbar.tpl" search_placeholder="Search transactions…"}

{if $transactions|@count > 0}
<div style="overflow: hidden; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  <div style="overflow-x: auto;">
    <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
      <thead>
        <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Date</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Transaction</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Description</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Gateway</th>
          <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Amount</th>
        </tr>
      </thead>
      <tbody>
        {foreach $transactions as $txn}
          <tr style="border-bottom: 1px solid hsl(var(--border)); transition: background 0.15s;" onmouseover="this.style.background='hsl(var(--muted) / 0.2)'" onmouseout="this.style.background='transparent'">
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$txn.date}</td>
            <td style="padding: 0.75rem 1rem;"><span style="font-family: monospace; font-size: 0.75rem;">{$txn.transid}</span></td>
            <td style="padding: 0.75rem 1rem; font-weight: 500;">{$txn.description}</td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$txn.gateway}</td>
            <td style="padding: 0.75rem 1rem; text-align: right; font-weight: 500;">{$txn.amountin}{if $txn.amountout}-{$txn.amountout}{/if}</td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
</div>

{include file="$template/includes/client/pagination.tpl"}

{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Transactions" empty_description="No transaction history found."}
{/if}