{* VENOM CODES — Status Badge Partial *}

{if !isset($status_label)}{assign var="status_label" value=$status_variant|ucfirst}{/if}

<span class="status-{$status_variant}" style="display: inline-flex; align-items: center; border-radius: 9999px; padding: 0.125rem 0.625rem; font-size: 0.75rem; font-weight: 600;">
  {$status_label}
</span>
