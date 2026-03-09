{* VENOM CODES — Manage Payment Method *}

{assign var="page_title" value="{if $paymentmethod}Edit Payment Method{else}Add Payment Method{/if}"}
{assign var="breadcrumbs" value=[["label" => "Payment Methods", "href" => "{$WEB_ROOT}/clientarea.php?action=paymentmethods"], ["label" => "{if $paymentmethod}Edit{else}Add{/if}"]]}
{include file="$template/includes/client/pageheader.tpl"}

<div style="max-width: 40rem;">
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.5rem;">
    {* WHMCS renders the payment method form via gateway modules *}
    {$body}
  </div>
</div>
