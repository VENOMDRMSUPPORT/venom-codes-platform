{* VENOM CODES — Affiliates Dashboard *}

{assign var="page_title" value="Affiliate Program"}
{assign var="page_subtitle" value="Track your referrals and earnings"}
{assign var="breadcrumbs" value=[["label" => "Affiliates"]]}
{include file="$template/includes/client/pageheader.tpl"}

{* Stats *}
<div style="margin-bottom: 2rem; display: grid; grid-template-columns: 1fr; gap: 1rem;">
  <style>@media (min-width: 640px) { .aff-stats { grid-template-columns: repeat(2, 1fr) !important; } } @media (min-width: 1024px) { .aff-stats { grid-template-columns: repeat(4, 1fr) !important; } }</style>
  <div class="aff-stats" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>' stat_label="Visitors" stat_value=$affiliatedata.visitors}
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>' stat_label="Signups" stat_value=$affiliatedata.signups}
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>' stat_label="Commissions" stat_value=$affiliatedata.commissionspending}
    {include file="$template/includes/client/statcard.tpl" stat_icon_svg='<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>' stat_label="Withdrawn" stat_value=$affiliatedata.withdrawnearnings}
  </div>
</div>

{* Referral link *}
<div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.25rem; margin-bottom: 1.5rem;">
  <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600; margin-bottom: 0.75rem;">Your Referral Link</h3>
  <div style="display: flex; align-items: center; gap: 0.5rem;">
    <input type="text" value="{$affiliatedata.referrallink}" class="venom-input" id="refLink" readonly style="flex: 1; font-family: monospace; font-size: 0.8125rem;" />
    <button onclick="navigator.clipboard.writeText(document.getElementById('refLink').value)" class="venom-btn-secondary text-sm" style="padding: 0.5rem 0.75rem; flex-shrink: 0;">Copy</button>
  </div>
</div>

{* Referrals list *}
{if $referrals}
  <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
    <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
      <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Referral History</h3>
    </div>
    <div style="overflow-x: auto;">
      <table style="width: 100%; font-size: 0.875rem; border-collapse: collapse;">
        <thead>
          <tr style="border-bottom: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3);">
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Date</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Service</th>
            <th style="padding: 0.75rem 1rem; text-align: right; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Amount</th>
            <th style="padding: 0.75rem 1rem; text-align: left; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; color: hsl(var(--muted-foreground));">Status</th>
          </tr>
        </thead>
        <tbody>
          {foreach $referrals as $referral}
            <tr style="{if !$referral@last}border-bottom: 1px solid hsl(var(--border));{/if}">
              <td style="padding: 0.75rem 1rem;">{$referral.date}</td>
              <td style="padding: 0.75rem 1rem;">{$referral.service}</td>
              <td style="padding: 0.75rem 1rem; text-align: right; font-weight: 500;">{$referral.amount}</td>
              <td style="padding: 0.75rem 1rem;">{include file="$template/includes/client/statusbadge.tpl" status_variant=$referral.status|lower}</td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  </div>
{/if}

{* Withdrawal *}
{if $affiliatedata.balance > 0}
  <div style="margin-top: 1.5rem; text-align: right;">
    <form method="post" action="{$smarty.server.PHP_SELF}">
      <input type="hidden" name="action" value="withdraw" />
      <input type="hidden" name="token" value="{$token}" />
      <button type="submit" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.25rem;">
        Request Withdrawal ({$affiliatedata.balance})
      </button>
    </form>
  </div>
{/if}