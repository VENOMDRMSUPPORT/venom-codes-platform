{* VENOM CODES — Access Denied Page *}

<div style="display: flex; flex: 1; align-items: center; justify-content: center; padding: 4rem 1rem; min-height: 70vh;">
  <div style="width: 100%; max-width: 32rem;">
    
    {* Access Denied Card *}
    <div style="border-radius: 1rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 2rem; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05); text-align: center;">
      
      {* Icon *}
      <div style="margin: 0 auto 1.5rem; display: inline-flex; height: 4rem; width: 4rem; align-items: center; justify-content: center; border-radius: 1rem; background: hsl(var(--destructive) / 0.1);">
        <svg xmlns="http://www.w3.org/2000/svg" style="width: 2.5rem; height: 2.5rem; color: hsl(var(--destructive));" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="12" cy="12" r="10"/>
          <line x1="4.93" y1="4.93" x2="19.07" y2="19.07"/>
        </svg>
      </div>
      
      {* Title *}
      <h1 class="font-display" style="font-size: 2rem; font-weight: 800; letter-spacing: -0.025em; margin-bottom: 1rem;">
        {lang key='oops'}!
      </h1>
      
      {* Message *}
      <div style="padding: 1rem 0; font-size: 1rem; color: hsl(var(--muted-foreground)); line-height: 1.6;">
        {lang key='subaccountpermissiondenied'}
      </div>
      
      {* Allowed Permissions *}
      {if !empty($allowedpermissions)}
        <div style="margin: 1.5rem 0; padding: 1.25rem; border-radius: 0.75rem; background: hsl(var(--muted) / 0.5); border: 1px solid hsl(var(--border)); text-align: left;">
          <div style="font-size: 0.875rem; font-weight: 600; margin-bottom: 0.75rem; color: hsl(var(--foreground));">
            {lang key='subaccountallowedperms'}
          </div>
          <div style="display: flex; flex-direction: column; gap: 0.5rem;">
            {foreach $allowedpermissions as $permission}
              <div style="display: flex; align-items: center; gap: 0.5rem; padding: 0.5rem 0.75rem; border-radius: 0.375rem; background: hsl(var(--background)); border: 1px solid hsl(var(--border)); font-size: 0.875rem;">
                <svg xmlns="http://www.w3.org/2000/svg" style="width: 0.875rem; height: 0.875rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="20 6 9 17 4 12"/>
                </svg>
                <span style="color: hsl(var(--foreground));">{$permission}</span>
              </div>
            {/foreach}
          </div>
        </div>
      {/if}
      
      {* Contact Message *}
      <div style="margin: 1.5rem 0; padding: 1rem; border-radius: 0.5rem; background: hsl(var(--accent-muted)); font-size: 0.875rem; line-height: 1.5; color: hsl(var(--muted-foreground));">
        <div style="display: flex; align-items: start; gap: 0.5rem;">
          <svg xmlns="http://www.w3.org/2000/svg" style="width: 1rem; height: 1rem; margin-top: 0.125rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"/>
            <line x1="12" y1="16" x2="12" y2="12"/>
            <line x1="12" y1="8" x2="12.01" y2="8"/>
          </svg>
          <span>{lang key='subaccountcontactmaster'}</span>
        </div>
      </div>
      
      {* Action Buttons *}
      <div style="display: flex; gap: 0.75rem; justify-content: center; padding-top: 1rem; flex-wrap: wrap;">
        <a href="javascript:history.go(-1)" class="btn btn-secondary" style="display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.75rem 1.25rem; background: hsl(var(--muted)); color: hsl(var(--foreground)); border-radius: 0.5rem; font-weight: 500; text-decoration: none; transition: all 0.2s; border: 1px solid hsl(var(--border));">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="19" y1="12" x2="5" y2="12"/>
            <polyline points="12 19 5 12 12 5"/>
          </svg>
          {lang key='goback'}
        </a>
        <a href="index.php" class="btn btn-primary" style="display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.75rem 1.25rem; background: hsl(var(--primary)); color: hsl(var(--primary-foreground)); border-radius: 0.5rem; font-weight: 500; text-decoration: none; transition: all 0.2s; box-shadow: 0 1px 2px rgba(0,0,0,0.05);">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
            <polyline points="9 22 9 12 15 12 15 22"/>
          </svg>
          {lang key='returnhome'}
        </a>
      </div>
      
    </div>
    
    {* Security Badge *}
    <div style="margin-top: 1.5rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
      <svg xmlns="http://www.w3.org/2000/svg" style="width: 0.875rem; height: 0.875rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
      </svg>
      <span>Account permissions enforced by VENOM CODES</span>
    </div>
    
  </div>
</div>

<style>
.btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1) !important;
}

.btn-primary:hover {
  background: hsl(var(--primary) / 0.9) !important;
}

.btn-secondary:hover {
  background: hsl(var(--muted) / 0.8) !important;
}

@media (max-width: 640px) {
  .btn {
    width: 100%;
    justify-content: center;
  }
}
</style>
