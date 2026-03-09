{* VENOM CODES — Mass Pay *}

{assign var="page_title" value="Pay Multiple Invoices"}
{assign var="page_subtitle" value="Select invoices to pay in a single transaction"}
{assign var="breadcrumbs" value=[["label" => "Invoices", "href" => "{$WEB_ROOT}/clientarea.php?action=invoices"], ["label" => "Mass Payment"]]}
{include file="$template/includes/client/pageheader.tpl"}

{if $invoices}
  <form method="post" action="{$smarty.server.PHP_SELF}">
    <input type="hidden" name="submit" value="true" />

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden; margin-bottom: 1.5rem;">
      <div style="overflow-x: auto;">
        <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
          <thead>
            <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
              <th style="padding: 0.75rem 1rem; text-align: left; width: 2.5rem;">
                <input type="checkbox" id="selectall" style="accent-color: hsl(var(--primary));" />
              </th>
              <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Invoice #</th>
              <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Due Date</th>
              <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Amount</th>
            </tr>
          </thead>
          <tbody>
            {foreach $invoices as $invoice}
              <tr style="{if !$invoice@last}border-bottom: 1px solid hsl(var(--border));{/if}">
                <td style="padding: 0.75rem 1rem;">
                  <input type="checkbox" name="invoiceids[]" value="{$invoice.id}" class="invoice-check" style="accent-color: hsl(var(--primary));" />
                </td>
                <td style="padding: 0.75rem 1rem; font-weight: 500;">#{$invoice.invoicenum}</td>
                <td style="padding: 0.75rem 1rem; color: hsl(var(--muted-foreground));">{$invoice.duedate}</td>
                <td style="padding: 0.75rem 1rem; text-align: right; font-weight: 600;">{$invoice.total}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>

    {* Payment method + submit *}
    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem;">
      <div style="display: flex; flex-direction: column; gap: 1rem;">
        <div>
          <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Payment Method</label>
          <select name="paymentmethod" class="venom-input">
            {foreach $gateways as $gateway}
              <option value="{$gateway.sysname}">{$gateway.name}</option>
            {/foreach}
          </select>
        </div>
        <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
          Pay Selected Invoices
        </button>
      </div>
    </div>
  </form>

  <script>
    document.getElementById('selectall').addEventListener('change', function() {
      document.querySelectorAll('.invoice-check').forEach(function(cb) { cb.checked = this.checked; }.bind(this));
    });
  </script>
{else}
  {include file="$template/includes/client/emptystate.tpl" empty_title="No Unpaid Invoices" empty_description="All your invoices are paid. Nothing to do here!"}
{/if}