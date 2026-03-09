{* VENOM CODES — Payment Methods *}

{assign var="breadcrumbs" value=[['label' => 'Billing']]}
{include file="$template/includes/client/pageheader.tpl" page_title="Billing" page_subtitle="Manage your payment methods, funds, and transaction history."}

{* Stat cards *}
<div style="margin-bottom: 1.5rem; display: grid; grid-template-columns: 1fr; gap: 1rem;">
  <style>@media (min-width: 640px) { .billing-stats { grid-template-columns: repeat(3, 1fr) !important; } }</style>
  <div class="billing-stats" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
    {include file="$template/includes/client/statcard.tpl" stat_icon='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/><path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/><path d="M18 12a2 2 0 0 0 0 4h4v-4Z"/></svg>' stat_label="Account Credit" stat_value=$credit}
    {include file="$template/includes/client/statcard.tpl" stat_icon='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>' stat_label="Payment Methods" stat_value=$paymentmethods|@count}
    {include file="$template/includes/client/statcard.tpl" stat_icon='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>' stat_label="Total Transactions" stat_value=$transactions|@count}
  </div>
</div>

{* Billing tabs *}
<div class="venom-tabs" data-tabs>
  <div style="display: flex; border-bottom: 1px solid hsl(var(--border)); margin-bottom: 1rem;">
    <button class="tab-btn active" data-tab="methods" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Payment Methods</button>
    <button class="tab-btn" data-tab="funds" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Add Funds</button>
    <button class="tab-btn" data-tab="transactions" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Transactions</button>
  </div>

  {* Payment Methods tab *}
  <div class="tab-panel active" data-panel="methods">
    <div style="display: flex; flex-direction: column; gap: 1rem;">

      {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="Your default payment method is used for automatic invoice payments and renewals."}

      {* Existing methods *}
      {foreach $paymentmethods as $method}
        <div style="display: flex; align-items: center; justify-content: space-between; border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1rem;">
          <div style="display: flex; align-items: center; gap: 1rem;">
            <div style="display: flex; height: 2.5rem; width: 2.5rem; align-items: center; justify-content: center; border-radius: 0.5rem; background: hsl(var(--primary) / 0.1); color: hsl(var(--primary));">
              <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
            </div>
            <div>
              <p style="font-size: 0.875rem; font-weight: 600;">
                {$method.cardtype} •••• {$method.cardlastfour}
                {if $method.isdefault}
                  <span style="margin-left: 0.5rem; border-radius: 0.25rem; background: hsl(var(--primary) / 0.1); padding: 0.125rem 0.375rem; font-size: 0.625rem; font-weight: 600; color: hsl(var(--primary));">Default</span>
                {/if}
              </p>
              <p class="text-muted-foreground" style="font-size: 0.75rem;">Expires {$method.cardexpiry}</p>
            </div>
          </div>
          <div style="display: flex; align-items: center; gap: 0.5rem;">
            {if !$method.isdefault}
              <a href="{$WEB_ROOT}/clientarea.php?action=creditcard&setdefault={$method.id}" style="font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;">Set Default</a>
            {/if}
            <a href="{$WEB_ROOT}/clientarea.php?action=creditcard&delete={$method.id}" onclick="return confirm('Remove this payment method?')" style="border-radius: 0.5rem; padding: 0.5rem; color: hsl(var(--muted-foreground)); transition: all 0.15s;" aria-label="Remove">
              <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>
            </a>
          </div>
        </div>
      {foreachelse}
        <p class="text-muted-foreground" style="text-align: center; padding: 1.5rem; font-size: 0.875rem;">No payment methods on file.</p>
      {/foreach}

      {* Add new method form *}
      <form method="post" action="{$WEB_ROOT}/clientarea.php?action=creditcard">
        <input type="hidden" name="token" value="{$token}" />
        <input type="hidden" name="submit" value="1" />
        <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
          <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
            <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Add Payment Method</h3>
            <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Add a new credit card or payment method to your account.</p>
          </div>
          <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
            <div>
              <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Card Number <span class="text-destructive">*</span></label>
              <input type="text" name="cardnumber" class="venom-input" style="font-family: monospace;" placeholder="•••• •••• •••• ••••" required />
            </div>
            <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
              <style>@media (min-width: 640px) { .card-row-3 { grid-template-columns: repeat(3, 1fr) !important; } }</style>
              <div class="card-row-3" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                <div>
                  <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Expiry Date <span class="text-destructive">*</span></label>
                  <input type="text" name="cardexpiry" class="venom-input" placeholder="MM/YY" required />
                </div>
                <div>
                  <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">CVV <span class="text-destructive">*</span></label>
                  <input type="text" name="cardcvv" class="venom-input" placeholder="•••" required />
                </div>
                <div>
                  <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Cardholder Name <span class="text-destructive">*</span></label>
                  <input type="text" name="ccname" class="venom-input" placeholder="Name on card" required />
                </div>
              </div>
            </div>
          </div>
          <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
            <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">
              <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              Add Method
            </button>
          </div>
        </div>
      </form>

    </div>
  </div>

  {* Add Funds tab *}
  <div class="tab-panel" data-panel="funds" style="display: none;">
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
            <button type="submit" name="addfunds" value="1" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 1rem;">
              <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/><path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/><path d="M18 12a2 2 0 0 0 0 4h4v-4Z"/></svg>
              Add Funds
            </button>
          </div>
        </div>
      </form>

      {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="Account credit is applied automatically to new invoices. Unused credit does not expire."}
    </div>
  </div>

  {* Transactions tab *}
  <div class="tab-panel" data-panel="transactions" style="display: none;">
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
              <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Amount</th>
            </tr>
          </thead>
          <tbody>
            {foreach $transactions as $txn}
              <tr style="border-bottom: 1px solid hsl(var(--border)); transition: background 0.15s;" onmouseover="this.style.background='hsl(var(--muted) / 0.2)'" onmouseout="this.style.background='transparent'">
                <td style="padding: 0.75rem 1rem;" class="text-muted-foreground">{$txn.date}</td>
                <td style="padding: 0.75rem 1rem;"><span style="font-family: monospace; font-size: 0.75rem;">{$txn.transid}</span></td>
                <td style="padding: 0.75rem 1rem; font-weight: 500;">{$txn.description}</td>
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
  </div>

</div>