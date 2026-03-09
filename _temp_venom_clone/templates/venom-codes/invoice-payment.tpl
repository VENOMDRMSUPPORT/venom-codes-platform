{* VENOM CODES — Invoice Payment *}

<div style="max-width: 40rem; margin: 0 auto;">

  {* Page header *}
  {assign var="breadcrumbs" value=[["label" => "Invoices", "href" => "{$WEB_ROOT}/clientarea.php?action=invoices"], ["label" => "Payment"]]}
  {assign var="page_title" value="Pay Invoice #{$invoiceid}"}
  {include file="$template/includes/client/pageheader.tpl"}

  {* Invoice summary *}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; margin-bottom: 1.5rem;">
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1rem;">
      <span class="text-sm text-muted-foreground">Amount Due</span>
      <span class="font-display" style="font-size: 1.5rem; font-weight: 700;">{$total}</span>
    </div>
    <div style="display: flex; align-items: center; justify-content: space-between; font-size: 0.875rem;">
      <span class="text-muted-foreground">Due Date</span>
      <span style="font-weight: 500;">{$duedate}</span>
    </div>
  </div>

  {* Payment method selection *}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Select Payment Method</h3>
    </div>
    <div style="padding: 1.25rem;">
      {if $gateways}
        <form method="post" action="{$smarty.server.PHP_SELF}" style="display: flex; flex-direction: column; gap: 0.75rem;">
          <input type="hidden" name="id" value="{$invoiceid}" />
          {foreach $gateways as $gateway}
            <label style="display: flex; align-items: center; gap: 0.75rem; border-radius: 0.5rem; border: 1px solid hsl(var(--border)); padding: 0.875rem 1rem; cursor: pointer; transition: border-color 0.15s;">
              <input type="radio" name="gateway" value="{$gateway.sysname}" {if $gateway@first}checked{/if} style="accent-color: hsl(var(--primary));" />
              <span style="font-size: 0.875rem; font-weight: 500;">{$gateway.name}</span>
            </label>
          {/foreach}
          <button type="submit" name="submit" value="true" class="venom-btn-primary" style="width: 100%; padding: 0.75rem; margin-top: 0.5rem;">
            <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
            Pay Now
          </button>
        </form>
      {else}
        <p class="text-sm text-muted-foreground">No payment methods available.</p>
      {/if}
    </div>
  </div>

</div>
