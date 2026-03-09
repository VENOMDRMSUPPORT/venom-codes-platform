{* VENOM CODES — Banned User Page *}

<div style="display: flex; flex: 1; align-items: center; justify-content: center; padding: 4rem 1rem; min-height: 70vh;">
  <div style="width: 100%; max-width: 36rem;">
    
    {* Banned Alert Card *}
    <div style="border-radius: 1rem; border: 2px solid hsl(var(--destructive) / 0.5); background: hsl(var(--card)); box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1); overflow: hidden;">
      
      {* Header with gradient background *}
      <div style="padding: 2rem; background: linear-gradient(135deg, hsl(var(--destructive) / 0.1) 0%, hsl(var(--destructive) / 0.05) 100%); border-bottom: 1px solid hsl(var(--destructive) / 0.2);">
        <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 1rem;">
          <div style="display: flex; align-items: center; justify-content: center; width: 3rem; height: 3rem; border-radius: 0.75rem; background: hsl(var(--destructive)); flex-shrink: 0;">
            <svg xmlns="http://www.w3.org/2000/svg" style="width: 1.75rem; height: 1.75rem; color: white;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"/>
              <circle cx="12" cy="12" r="3"/>
            </svg>
          </div>
          <div style="flex: 1;">
            <h1 class="font-display" style="font-size: 1.75rem; font-weight: 800; letter-spacing: -0.025em; margin: 0; color: hsl(var(--foreground));">
              Access Suspended
            </h1>
          </div>
        </div>
        <p style="margin: 0; font-size: 0.875rem; color: hsl(var(--muted-foreground)); line-height: 1.5;">
          Your access has been temporarily restricted due to a security policy violation.
        </p>
      </div>
      
      {* Content *}
      <div style="padding: 2rem;">
        
        {* Main Message *}
        <div style="margin-bottom: 1.5rem; padding: 1.25rem; border-radius: 0.75rem; background: hsl(var(--destructive) / 0.05); border: 1px solid hsl(var(--destructive) / 0.2);">
          <div style="display: flex; align-items: start; gap: 0.75rem;">
            <svg xmlns="http://www.w3.org/2000/svg" style="width: 1.125rem; height: 1.125rem; margin-top: 0.125rem; color: hsl(var(--destructive)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10"/>
              <line x1="12" y1="8" x2="12" y2="12"/>
              <line x1="12" y1="16" x2="12.01" y2="16"/>
            </svg>
            <div style="font-size: 0.875rem; line-height: 1.6;">
              <strong style="display: block; color: hsl(var(--destructive)); margin-bottom: 0.25rem;">
                {lang key='bannedyourip'} <code style="padding: 0.125rem 0.375rem; background: hsl(var(--muted)); border-radius: 0.25rem; font-size: 0.8125rem;">{$ip}</code> {lang key='bannedhasbeenbanned'}
              </strong>
            </div>
          </div>
        </div>
        
        {* Ban Details *}
        <div style="display: flex; flex-direction: column; gap: 1rem; margin-bottom: 1.5rem;">
          
          {* Reason *}
          <div style="padding: 1rem; border-radius: 0.5rem; background: hsl(var(--muted) / 0.5); border: 1px solid hsl(var(--border));">
            <div style="display: flex; align-items: start; gap: 0.75rem;">
              <svg xmlns="http://www.w3.org/2000/svg" style="width: 1rem; height: 1rem; margin-top: 0.125rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
              </svg>
              <div style="flex: 1;">
                <div style="font-size: 0.8125rem; font-weight: 600; color: hsl(var(--muted-foreground)); margin-bottom: 0.25rem; text-transform: uppercase; letter-spacing: 0.05em;">
                  {lang key='bannedbanreason'}
                </div>
                <div style="font-size: 0.9375rem; font-weight: 600; color: hsl(var(--foreground)); word-break: break-word;">
                  {$reason}
                </div>
              </div>
            </div>
          </div>
          
          {* Expiration *}
          <div style="padding: 1rem; border-radius: 0.5rem; background: hsl(var(--muted) / 0.5); border: 1px solid hsl(var(--border));">
            <div style="display: flex; align-items: start; gap: 0.75rem;">
              <svg xmlns="http://www.w3.org/2000/svg" style="width: 1rem; height: 1rem; margin-top: 0.125rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"/>
                <polyline points="12 6 12 12 16 14"/>
              </svg>
              <div style="flex: 1;">
                <div style="font-size: 0.8125rem; font-weight: 600; color: hsl(var(--muted-foreground)); margin-bottom: 0.25rem; text-transform: uppercase; letter-spacing: 0.05em;">
                  {lang key='bannedbanexpires'}
                </div>
                <div style="font-size: 0.9375rem; font-weight: 600; color: hsl(var(--foreground));">
                  {$expires}
                </div>
              </div>
            </div>
          </div>
          
        </div>
        
        {* Help Section *}
        <div style="padding: 1.25rem; border-radius: 0.75rem; background: hsl(var(--accent-muted)); border: 1px solid hsl(var(--border));">
          <h3 style="font-size: 0.875rem; font-weight: 600; margin: 0 0 0.75rem; color: hsl(var(--foreground)); display: flex; align-items: center; gap: 0.5rem;">
            <svg xmlns="http://www.w3.org/2000/svg" style="width: 0.875rem; height: 0.875rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10"/>
              <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/>
              <line x1="12" y1="17" x2="12.01" y2="17"/>
            </svg>
            What should I do?
          </h3>
          <ul style="margin: 0; padding-left: 1.25rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); line-height: 1.6;">
            <li style="margin-bottom: 0.5rem;">Wait for the ban period to expire</li>
            <li style="margin-bottom: 0.5rem;">Review our terms of service and acceptable use policy</li>
            <li style="margin-bottom: 0.5rem;">If you believe this is an error, contact our support team</li>
            <li>Do not attempt to bypass this restriction</li>
          </ul>
        </div>
        
      </div>
      
    </div>
    
    {* Security Badge *}
    <div style="margin-top: 1.5rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
      <svg xmlns="http://www.w3.org/2000/svg" style="width: 0.875rem; height: 0.875rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
      </svg>
      <span>Protected by VENOM CODES security</span>
    </div>
    
  </div>
</div>

<style>
@media (max-width: 640px) {
  code {
    display: inline-block;
    margin-top: 0.25rem;
  }
}
</style>
