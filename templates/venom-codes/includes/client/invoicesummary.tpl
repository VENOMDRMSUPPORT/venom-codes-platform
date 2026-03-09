{* VENOM CODES — Invoice Summary / Line Items Partial *}

<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">

  {* Header *}
  <div style="display: flex; flex-direction: column; gap: 0.5rem; border-bottom: 1px solid hsl(var(--border)); padding: 1rem 1.25rem;">
    <style>@media (min-width: 640px) { .inv-header-row { flex-direction: row !important; align-items: center !important; justify-content: space-between !important; } }</style>
    <div class="inv-header-row" style="display: flex; flex-direction: column; gap: 0.5rem;">
      <div>
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Invoice #{$invoicenum}</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Issued: {$invoicedate} · Due: {$duedate}</p>
      </div>
      {include file="$template/includes/client/statusbadge.tpl" status_variant=$status}
    </div>
  </div>

  {* Line items *}
  {foreach $invoiceitems as $item}
    <div style="display: flex; align-items: center; justify-content: space-between; padding: 0.75rem 1.25rem; font-size: 0.875rem; {if !$item@last}border-bottom: 1px solid hsl(var(--border));{/if}">
      <span class="text-muted-foreground">{$item.description}</span>
      <span style="font-weight: 500;">{$item.amount}</span>
    </div>
  {/foreach}

  {* Totals *}
  <div style="border-top: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.2);">
    <div style="display: flex; align-items: center; justify-content: space-between; padding: 0.625rem 1.25rem; font-size: 0.875rem;">
      <span class="text-muted-foreground">Subtotal</span>
      <span>{$subtotal}</span>
    </div>
    {if isset($tax) && $tax}
      <div style="display: flex; align-items: center; justify-content: space-between; padding: 0.625rem 1.25rem; font-size: 0.875rem;">
        <span class="text-muted-foreground">Tax</span>
        <span>{$tax}</span>
      </div>
    {/if}
    <div style="display: flex; align-items: center; justify-content: space-between; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem; font-size: 0.875rem; font-weight: 600;">
      <span>Total</span>
      <span class="font-display" style="font-size: 1rem;">{$total}</span>
    </div>
  </div>
</div>