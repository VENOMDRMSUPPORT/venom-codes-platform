{* VENOM CODES — Add Funds *}

{assign var="breadcrumbs" value=[['label' => 'Billing', 'href' => "`$WEB_ROOT`/clientarea.php?action=creditcard"], ['label' => 'Add Funds']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Add Funds" page_subtitle="Add credit to your account."}

<div style="max-width: 32rem; margin: 0 auto; display: flex; flex-direction: column; gap: 1.5rem;">

  {assign var="panel_rows" value=[['label' => 'Account Credit', 'value' => "<span class='font-display' style='font-size: 1.125rem; font-weight: 700;'>`$credit`</span>"]]}
  {include file="$template/includes/client/summarypanel.tpl" panel_title="Current Balance"}

  <form method="post" action="{$WEB_ROOT}/clientarea.php?action=addfunds">
    <input type="hidden" name="token" value="{$token}" />
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
      <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Add Funds to Account</h3>
        <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Add credit to your account for future invoices and purchases.</p>
      </div>
      <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Amount <span class="text-destructive">*</span></label>
          <div style="position: relative;">
            <span style="position: absolute; left: 0.75rem; top: 50%; transform: translateY(-50%); color: hsl(var(--muted-foreground)); font-weight: 500;">$</span>
            <input type="number" name="amount" class="venom-input" style="padding-left: 1.75rem;" placeholder="0.00" min="{$minamount}" max="{$maxamount}" step="0.01" required />
          </div>
          <p class="text-muted-foreground" style="margin-top: 0.25rem; font-size: 0.75rem;">Minimum: {$minamount}. Maximum: {$maxamount}.</p>
        </div>
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Payment Method <span class="text-destructive">*</span></label>
          <select name="paymentmethod" class="venom-input" required>
            {foreach $gateways as $gateway}
              <option value="{$gateway.sysname}">{$gateway.name}</option>
            {/foreach}
          </select>
        </div>
      </div>
      <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
        <button type="submit" name="addfunds" value="1" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">Add Funds</button>
      </div>
    </div>
  </form>

  {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="Account credit is applied automatically to new invoices. Unused credit does not expire."}
</div>