{* VENOM CODES — Services List *}

{* Page header *}
{assign var="breadcrumbs" value=[['label' => 'Services']]}
{capture assign="page_actions"}
  <a href="{$WEB_ROOT}/cart.php" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
    Order New
  </a>
{/capture}
{include file="$template/includes/client/pageheader.tpl" page_title="My Services" page_subtitle="Manage your active products and services."}

{* Search & filter *}
{capture assign="filter_html"}
  <select name="status" class="venom-input" style="width: auto; padding: 0.5rem 0.75rem;">
    <option value="">All Statuses</option>
    <option value="Active"{if $smarty.get.status eq 'Active'} selected{/if}>Active</option>
    <option value="Pending"{if $smarty.get.status eq 'Pending'} selected{/if}>Pending</option>
    <option value="Suspended"{if $smarty.get.status eq 'Suspended'} selected{/if}>Suspended</option>
    <option value="Cancelled"{if $smarty.get.status eq 'Cancelled'} selected{/if}>Cancelled</option>
  </select>
{/capture}
{include file="$template/includes/client/searchfilterbar.tpl" search_placeholder="Search services…" search_value=$smarty.get.search}

{* Services table *}
{if $services|@count > 0}
<div style="overflow: hidden; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
  <div style="overflow-x: auto;">
    <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
      <thead>
        <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Product/Service</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Hostname</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Status</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Billing Cycle</th>
          <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Next Due</th>
          <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Amount</th>
        </tr>
      </thead>
      <tbody>
        {foreach $services as $service}
          <tr style="border-bottom: 1px solid hsl(var(--border)); transition: background 0.15s;" onmouseover="this.style.background='hsl(var(--muted) / 0.2)'" onmouseout="this.style.background='transparent'">
            <td style="padding: 0.75rem 1rem;"><a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={$service.id}" style="font-weight: 500; color: hsl(var(--primary)); text-decoration: none;">{$service.product}</a></td>
            <td style="padding: 0.75rem 1rem;"><span style="font-family: monospace; font-size: 0.75rem; color: hsl(var(--muted-foreground));">{$service.domain}</span></td>
            <td style="padding: 0.75rem 1rem;"><td style="padding: 0.75rem 1rem;">{include file="$template/includes/client/statusbadge.tpl" status_variant=$service.status|lower}</td></td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$service.billingcycle}</td>
            <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$service.nextduedate}</td>
            <td style="padding: 0.75rem 1rem; text-align: right; font-weight: 500;">{$service.recurringamount}</td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  </div>
</div>

{* Pagination *}
{include file="$template/includes/client/pagination.tpl"}

{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Services Found" empty_description="You don't have any services yet." empty_action="<a href='`$WEB_ROOT`/cart.php' class='venom-btn-primary' style='font-size: 0.875rem; padding: 0.5rem 1rem;'>Order Now</a>"}
{/if}