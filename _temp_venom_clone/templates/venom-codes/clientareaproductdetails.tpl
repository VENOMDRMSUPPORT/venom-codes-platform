{* VENOM CODES — Service Details *}

{* Page header *}
{assign var="breadcrumbs" value=[['label' => 'Services', 'href' => "`$WEB_ROOT`/clientarea.php?action=products"], ['label' => $product]]}
{capture assign="page_actions"}
  <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 0.5rem;">
    {if $moduleclientarea}
      <a href="{$moduleclientarea}" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 17 10 11 4 5"/><line x1="12" y1="19" x2="20" y2="19"/></svg>
        Console
      </a>
    {/if}
  </div>
{/capture}
{include file="$template/includes/client/pageheader.tpl" page_title=$product page_subtitle="Service ID: `$id`"}

{* Status alert *}
{if $status eq "Suspended"}
  <div style="margin-bottom: 1.5rem;">
    {include file="$template/includes/client/alert.tpl" alert_type="warning" alert_title="Service Suspended" alert_content="This service is currently suspended. Please contact support or pay any outstanding invoices."}
  </div>
{elseif $status eq "Active"}
  <div style="margin-bottom: 1.5rem;">
    {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="This service is currently active. Manage it using the controls above."}
  </div>
{/if}

<div style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">
  <style>@media (min-width: 1024px) { .svc-detail-grid { grid-template-columns: 2fr 1fr !important; } }</style>
  <div class="svc-detail-grid" style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">

    {* Main content with tabs *}
    <div>
      <div class="venom-tabs" data-tabs>
        <div style="display: flex; border-bottom: 1px solid hsl(var(--border)); margin-bottom: 1rem;">
          <button class="tab-btn active" data-tab="overview" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Overview</button>
          <button class="tab-btn" data-tab="billing" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Billing</button>
          <button class="tab-btn" data-tab="addons" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Addons</button>
        </div>

        {* Overview tab *}
        <div class="tab-panel active" data-panel="overview">
          <div style="display: flex; flex-direction: column; gap: 1.5rem;">
            {assign var="panel_rows" value=[
              ['label' => 'Product', 'value' => $product],
              ['label' => 'Hostname', 'value' => "<span style='font-family: monospace; font-size: 0.75rem;'>`$domain`</span>"],
              ['label' => 'Primary IP', 'value' => $dedicatedip],
              ['label' => 'Status', 'value' => ''],
              ['label' => 'Registration Date', 'value' => $regdate],
              ['label' => 'Next Due Date', 'value' => $nextduedate]
            ]}
            {include file="$template/includes/client/summarypanel.tpl" panel_title="Service Information"}

            {if $configurableoptions|@count > 0}
              {assign var="config_rows" value=[]}
              {foreach $configurableoptions as $option}
                {append var="config_rows" value=['label' => $option.optionname, 'value' => $option.selectedoption]}
              {/foreach}
              {include file="$template/includes/client/summarypanel.tpl" panel_title="Server Configuration" panel_rows=$config_rows}
            {/if}
          </div>
        </div>

        {* Billing tab *}
        <div class="tab-panel" data-panel="billing" style="display: none;">
          {assign var="panel_rows" value=[
            ['label' => 'Billing Cycle', 'value' => $billingcycle],
            ['label' => 'Amount', 'value' => $recurringamount],
            ['label' => 'Payment Method', 'value' => $paymentmethod],
            ['label' => 'Next Invoice', 'value' => $nextduedate]
          ]}
          {capture assign="billing_footer"}
            <div style="display: flex; gap: 0.5rem;">
              {if $upgradeurl}<a href="{$upgradeurl}" class="venom-btn-secondary" style="font-size: 0.75rem; padding: 0.375rem 0.75rem;">Change Plan</a>{/if}
              {if $cancelurl}<a href="{$cancelurl}" class="venom-btn-secondary" style="font-size: 0.75rem; padding: 0.375rem 0.75rem;">Cancel Service</a>{/if}
            </div>
          {/capture}
          {include file="$template/includes/client/summarypanel.tpl" panel_title="Billing Details" panel_footer=$billing_footer}
        </div>

        {* Addons tab *}
        <div class="tab-panel" data-panel="addons" style="display: none;">
          {if $addons|@count > 0}
            {foreach $addons as $addon}
              {assign var="panel_rows" value=[
                ['label' => 'Name', 'value' => $addon.name],
                ['label' => 'Status', 'value' => $addon.status],
                ['label' => 'Next Due', 'value' => $addon.nextduedate],
                ['label' => 'Amount', 'value' => $addon.recurringamount]
              ]}
              {include file="$template/includes/client/summarypanel.tpl" panel_title=$addon.name}
            {/foreach}
          {else}
            {include file="$template/includes/client/emptystate.tpl" empty_title="No Addons" empty_description="No addons configured for this service." empty_action="<a href='`$WEB_ROOT`/cart.php?a=confproduct&i=`$id`' class='venom-btn-primary' style='font-size: 0.875rem; padding: 0.5rem 1rem;'>Browse Addons</a>"}
          {/if}
        </div>
      </div>
    </div>

    {* Sidebar *}
    <div style="display: flex; flex-direction: column; gap: 1rem;">
      {assign var="panel_rows" value=[
        ['label' => 'Upgrade/Downgrade', 'value' => "<a href='`$WEB_ROOT`/upgrade.php?type=package&id=`$id`' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>Change Plan</a>"],
        ['label' => 'Request Cancellation', 'value' => "<a href='`$WEB_ROOT`/clientarea.php?action=cancel&id=`$id`' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>Cancel</a>"],
        ['label' => 'View Invoices', 'value' => "<a href='`$WEB_ROOT`/clientarea.php?action=invoices' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>Invoices</a>"]
      ]}
      {include file="$template/includes/client/summarypanel.tpl" panel_title="Quick Actions"}

      {assign var="panel_rows" value=[]}
      {assign var="panel_footer" value="<a href='`$WEB_ROOT`/submitticket.php' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>Open Support Ticket →</a>"}
      {include file="$template/includes/client/summarypanel.tpl" panel_title="Related Tickets"}
    </div>

  </div>
</div>