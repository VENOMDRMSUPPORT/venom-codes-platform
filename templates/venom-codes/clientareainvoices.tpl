{* VENOM CODES — Invoices List *}

{assign var="breadcrumbs" value=[['label' => 'Invoices']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Invoices" page_subtitle="View and manage your billing history."}

{* Search & filter *}
{capture assign="filter_html"}
  <select name="status" class="venom-input" style="width: auto; padding: 0.5rem 0.75rem;">
    <option value="">All Statuses</option>
    <option value="Paid"{if $smarty.get.status eq 'Paid'} selected{/if}>Paid</option>
    <option value="Unpaid"{if $smarty.get.status eq 'Unpaid'} selected{/if}>Unpaid</option>
    <option value="Overdue"{if $smarty.get.status eq 'Overdue'} selected{/if}>Overdue</option>
  </select>
{/capture}
{include file="$template/includes/client/searchfilterbar.tpl" search_placeholder="Search invoices…"}

{* Invoices table *}
{if $invoices|@count > 0}
<div style="overflow: hidden; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  <div style="overflow-x: auto;">
    <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
      <thead>
        <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Invoice #</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Date</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Due Date</th>
          <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Total</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Status</th>
        </tr>
      </thead>
      <tbody>
        {foreach $invoices as $invoice}
          <tr style="border-bottom: 1px solid hsl(var(--border)); transition: background 0.15s;" onmouseover="this.style.background='hsl(var(--muted) / 0.2)'" onmouseout="this.style.background='transparent'">
            <td style="padding: 0.75rem 1rem;"><a href="{$WEB_ROOT}/viewinvoice.php?id={$invoice.id}" style="font-weight: 500; color: hsl(var(--primary)); text-decoration: none;">{$invoice.invoicenum}</a></td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$invoice.datecreated}</td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$invoice.datedue}</td>
            <td style="padding: 0.75rem 1rem; text-align: right; font-weight: 500;">{$invoice.total}</td>
            <td style="padding: 0.75rem 1rem;"><td style="padding: 0.75rem 1rem;">{include file="$template/includes/client/statusbadge.tpl" status_variant=$invoice.status|lower}</td></td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
</div>

{include file="$template/includes/client/pagination.tpl"}

{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Invoices" empty_description="You don't have any invoices yet."}
{/if}