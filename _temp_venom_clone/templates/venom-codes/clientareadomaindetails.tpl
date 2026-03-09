{* VENOM CODES — Domain Details *}

{assign var="breadcrumbs" value=[['label' => 'Domains', 'href' => "`$WEB_ROOT`/clientarea.php?action=domains"], ['label' => $domain]]}
{capture assign="page_actions"}
  <div style="display: flex; flex-wrap: wrap; align-items: center; gap: 0.5rem;">
    <a href="{$WEB_ROOT}/clientarea.php?action=domainrenew&domainid={$id}" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/></svg>
      Renew
    </a>
    <a href="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$id}&modop=custom&a=manage" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
      Manage
    </a>
  </div>
{/capture}
{include file="$template/includes/client/pageheader.tpl" page_title=$domain page_subtitle="Domain ID: `$id`"}

<div style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">
  <style>@media (min-width: 1024px) { .domain-detail-grid { grid-template-columns: 2fr 1fr !important; } }</style>
  <div class="domain-detail-grid" style="display: grid; grid-template-columns: 1fr; gap: 1.5rem;">

    {* Main content with tabs *}
    <div>
      <div class="venom-tabs" data-tabs>
        <div style="display: flex; border-bottom: 1px solid hsl(var(--border)); margin-bottom: 1rem;">
          <button class="tab-btn active" data-tab="overview" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Overview</button>
          <button class="tab-btn" data-tab="nameservers" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Nameservers</button>
          <button class="tab-btn" data-tab="dns" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">DNS Management</button>
          <button class="tab-btn" data-tab="contact" style="padding: 0.5rem 1rem; font-size: 0.875rem; font-weight: 500; border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent; color: hsl(var(--muted-foreground));">Contact Info</button>
        </div>

        {* Overview *}
        <div class="tab-panel active" data-panel="overview">
          {assign var="panel_rows" value=[
            ['label' => 'Domain Name', 'value' => "<span style='font-family: monospace; font-size: 0.875rem;'>`$domain`</span>"],
            ['label' => 'Status', 'value' => ''],
            ['label' => 'Registration Date', 'value' => $registrationdate],
            ['label' => 'Expiry Date', 'value' => $expirydate],
            ['label' => 'Auto Renew', 'value' => "`$donotrenew`"],
            ['label' => 'Registrar Lock', 'value' => "`$lockstatus`"]
          ]}
          {include file="$template/includes/client/summarypanel.tpl" panel_title="Domain Information"}
        </div>

        {* Nameservers *}
        <div class="tab-panel" data-panel="nameservers" style="display: none;">
          <form method="post" action="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$id}">
            <input type="hidden" name="token" value="{$token}" />
            <input type="hidden" name="sub" value="savens" />
            <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
              <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
                <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">Nameservers</h3>
                <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Configure the nameservers for your domain.</p>
              </div>
              <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
                {foreach from=[1,2,3,4,5] item=n}
                  <div>
                    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Nameserver {$n}</label>
                    <input type="text" name="ns{$n}" value="{$nameservers[$n-1]}" class="venom-input" style="font-family: monospace; font-size: 0.875rem;" placeholder="ns{$n}.example.com" />
                  </div>
                {/foreach}
              </div>
              <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
                <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Update Nameservers</button>
              </div>
            </div>
          </form>
        </div>

        {* DNS Management *}
        <div class="tab-panel" data-panel="dns" style="display: none;">
          {include file="$template/includes/client/emptystate.tpl" empty_title="DNS Management" empty_description="Manage DNS records for this domain." empty_action="<a href='`$WEB_ROOT`/clientarea.php?action=domaindetails&id=`$id`&modop=custom&a=managedns' class='venom-btn-primary' style='font-size: 0.875rem; padding: 0.5rem 1rem;'>Manage DNS</a>"}
        </div>

        {* Contact Info *}
        <div class="tab-panel" data-panel="contact" style="display: none;">
          <form method="post" action="{$WEB_ROOT}/clientarea.php?action=domaindetails&id={$id}">
            <input type="hidden" name="token" value="{$token}" />
            <input type="hidden" name="sub" value="savecontact" />
            <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card));">
              <div style="border-bottom: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
                <h3 class="font-display" style="font-size: 0.875rem; font-weight: 600;">WHOIS Contact Information</h3>
                <p class="text-muted-foreground" style="margin-top: 0.125rem; font-size: 0.75rem;">Update the registrant contact details for this domain.</p>
              </div>
              <div style="padding: 1.25rem; display: flex; flex-direction: column; gap: 1rem;">
                <div style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                  <style>@media (min-width: 640px) { .contact-row-2 { grid-template-columns: repeat(2, 1fr) !important; } }</style>
                  <div class="contact-row-2" style="display: grid; grid-template-columns: 1fr; gap: 1rem;">
                    <div>
                      <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">First Name <span class="text-destructive">*</span></label>
                      <input type="text" name="contactdetails[Registrant][First Name]" value="{$contactdetails.Registrant['First Name']}" class="venom-input" required />
                    </div>
                    <div>
                      <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Last Name <span class="text-destructive">*</span></label>
                      <input type="text" name="contactdetails[Registrant][Last Name]" value="{$contactdetails.Registrant['Last Name']}" class="venom-input" required />
                    </div>
                  </div>
                </div>
                <div>
                  <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email <span class="text-destructive">*</span></label>
                  <input type="email" name="contactdetails[Registrant][Email]" value="{$contactdetails.Registrant.Email}" class="venom-input" required />
                </div>
                <div>
                  <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Organization</label>
                  <input type="text" name="contactdetails[Registrant][Organisation]" value="{$contactdetails.Registrant.Organisation}" class="venom-input" />
                </div>
                <div>
                  <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Phone <span class="text-destructive">*</span></label>
                  <input type="tel" name="contactdetails[Registrant][Phone]" value="{$contactdetails.Registrant.Phone}" class="venom-input" required />
                </div>
              </div>
              <div style="display: flex; justify-content: flex-end; gap: 0.5rem; border-top: 1px solid hsl(var(--border)); padding: 0.75rem 1.25rem;">
                <button type="button" onclick="history.back()" class="venom-btn-secondary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Cancel</button>
                <button type="submit" class="venom-btn-primary" style="font-size: 0.875rem; padding: 0.5rem 0.75rem;">Save Contact</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    {* Sidebar *}
    <div style="display: flex; flex-direction: column; gap: 1rem;">
      {assign var="panel_rows" value=[
        ['label' => 'Transfer Away', 'value' => "<a href='`$WEB_ROOT`/clientarea.php?action=domaindetails&id=`$id`&modop=custom&a=getepp' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>Get EPP Code</a>"],
        ['label' => 'ID Protection', 'value' => "`$idprotection`"],
        ['label' => 'Email Forwarding', 'value' => "<a href='`$WEB_ROOT`/clientarea.php?action=domaindetails&id=`$id`&modop=custom&a=emailforwarding' style='font-size: 0.75rem; color: hsl(var(--primary)); text-decoration: none;'>Configure</a>"]
      ]}
      {include file="$template/includes/client/summarypanel.tpl" panel_title="Quick Actions"}

      {include file="$template/includes/client/alert.tpl" alert_type="info" alert_content="Domain changes may take up to 48 hours to propagate globally."}
    </div>

  </div>
</div>