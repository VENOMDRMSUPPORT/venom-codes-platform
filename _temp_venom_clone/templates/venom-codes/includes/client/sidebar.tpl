{* VENOM CODES — Client Area Sidebar *}

<aside id="client-sidebar" class="sidebar-expanded" style="width: 16rem; border-right: 1px solid hsl(var(--border)); background: hsl(var(--card)); display: flex; flex-direction: column; min-height: 100vh; flex-shrink: 0;">

  {* Logo header *}
  <div style="display: flex; height: 3.5rem; align-items: center; gap: 0.5rem; border-bottom: 1px solid hsl(var(--border)); padding: 0 1rem;">
    {include file="$template/includes/logo.tpl" size=24}
    <span class="font-display text-sm" style="font-weight: 700; letter-spacing: -0.025em;">VENOM CODES</span>
  </div>

  {* Navigation *}
  <nav style="flex: 1; padding: 0.5rem; overflow-y: auto;">

    {* Main group *}
    <p class="text-xs text-muted-foreground" style="padding: 0.5rem 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em;">Main</p>
    <ul style="list-style: none; padding: 0; margin: 0 0 0.5rem;">
      <li><a href="{$WEB_ROOT}/clientarea.php" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'clientareahome'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
        Dashboard
      </a></li>
      <li><a href="{$WEB_ROOT}/clientarea.php?action=products" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'clientareaproducts' || $filename eq 'clientareaproductdetails'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"/><rect x="2" y="14" width="20" height="8" rx="2" ry="2"/><line x1="6" y1="6" x2="6.01" y2="6"/><line x1="6" y1="18" x2="6.01" y2="18"/></svg>
        Services
      </a></li>
      <li><a href="{$WEB_ROOT}/clientarea.php?action=domains" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'clientareadomains' || $filename eq 'clientareadomaindetails'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
        Domains
      </a></li>
      <li><a href="{$WEB_ROOT}/clientarea.php?action=invoices" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'clientareainvoices' || $filename eq 'viewinvoice'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/></svg>
        Invoices
      </a></li>
      <li><a href="{$WEB_ROOT}/clientarea.php?action=creditcard" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'clientareacreditcard' || $filename eq 'addfunds' || $filename eq 'clientareatransactions'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
        Billing
      </a></li>
    </ul>

    {* Support group *}
    <p class="text-xs text-muted-foreground" style="padding: 0.5rem 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em;">Support</p>
    <ul style="list-style: none; padding: 0; margin: 0 0 0.5rem;">
      <li><a href="{$WEB_ROOT}/supporttickets.php" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'supporttickets' || $filename eq 'viewticket' || $filename eq 'submitticket'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
        Support Tickets
      </a></li>
      <li><a href="{$WEB_ROOT}/knowledgebase" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s;">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
        Knowledge Base
      </a></li>
    </ul>

    {* Account group *}
    <p class="text-xs text-muted-foreground" style="padding: 0.5rem 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em;">Account</p>
    <ul style="list-style: none; padding: 0; margin: 0;">
      <li><a href="{$WEB_ROOT}/clientarea.php?action=security" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'clientareasecurity'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
        Security
      </a></li>
      <li><a href="{$WEB_ROOT}/clientarea.php?action=details" class="flex items-center gap-3" style="border-radius: 0.5rem; padding: 0.5rem 0.75rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); text-decoration: none; transition: all 0.15s; {if $filename eq 'clientareasettings' || $filename eq 'clientareadetails'}background: hsl(var(--primary) / 0.1); color: hsl(var(--primary)); font-weight: 500;{/if}">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
        Settings
      </a></li>
    </ul>

  </nav>

  {* Footer *}
  <div style="border-top: 1px solid hsl(var(--border)); padding: 0.75rem; text-align: center;">
    <p style="font-size: 0.6875rem; color: hsl(var(--muted-foreground));">© {$smarty.now|date_format:"%Y"} Venom Codes</p>
  </div>

</aside>
