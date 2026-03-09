{* VENOM CODES — Rate Limit Exceeded Error *}

<div style="display: flex; flex: 1; align-items: center; justify-content: center; padding: 4rem 1rem; min-height: 70vh;">
  <div style="width: 100%; max-width: 32rem; text-align: center;">
    
    {* Warning Icon *}
    <div style="margin: 0 auto 2rem; display: inline-flex; height: 5rem; width: 5rem; align-items: center; justify-content: center; border-radius: 1rem; background: hsl(var(--warning) / 0.1, 48 96% 89%);">
      <svg xmlns="http://www.w3.org/2000/svg" style="width: 3rem; height: 3rem; color: hsl(48 96% 53%);" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"/>
        <line x1="12" y1="9" x2="12" y2="13"/>
        <line x1="12" y1="17" x2="12.01" y2="17"/>
      </svg>
    </div>
    
    {* Error Title *}
    <h1 class="font-display" style="font-size: 2.25rem; font-weight: 800; line-height: 1.2; letter-spacing: -0.025em; color: hsl(var(--foreground)); margin-bottom: 1rem;">
      {lang key="errorPage.rateLimitExceeded.title"}
    </h1>
    
    {* Error Subtitle *}
    <h2 class="font-display" style="font-size: 1.5rem; font-weight: 600; letter-spacing: -0.025em; margin-bottom: 1rem; color: hsl(var(--muted-foreground));">
      {lang key="errorPage.rateLimitExceeded.subtitle"}
    </h2>
    
    {* Error Description *}
    <p class="text-muted-foreground" style="font-size: 1rem; margin-bottom: 2rem; line-height: 1.6;">
      {lang key="errorPage.rateLimitExceeded.description"}
    </p>
    
    {* Info Card *}
    <div style="margin: 2rem 0; padding: 1.25rem; border-radius: 0.75rem; background: hsl(var(--muted) / 0.5); border: 1px solid hsl(var(--border)); text-align: left;">
      <div style="display: flex; align-items: start; gap: 0.75rem;">
        <svg xmlns="http://www.w3.org/2000/svg" style="width: 1.25rem; height: 1.25rem; margin-top: 0.125rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="12" cy="12" r="10"/>
          <line x1="12" y1="16" x2="12" y2="12"/>
          <line x1="12" y1="8" x2="12.01" y2="8"/>
        </svg>
        <div style="font-size: 0.875rem; line-height: 1.5;">
          <strong style="display: block; margin-bottom: 0.25rem; color: hsl(var(--foreground));">Why did this happen?</strong>
          <span style="color: hsl(var(--muted-foreground));">We've detected an unusually high number of requests from your connection. This is a security measure to protect our service.</span>
        </div>
      </div>
    </div>
    
    {* Action Button *}
    <div style="display: flex; gap: 0.75rem; justify-content: center; flex-wrap: wrap;">
      <a href="{$systemurl}" class="btn btn-primary" style="display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.75rem 1.5rem; background: hsl(var(--primary)); color: hsl(var(--primary-foreground)); border-radius: 0.5rem; font-weight: 500; text-decoration: none; transition: all 0.2s; box-shadow: 0 1px 2px rgba(0,0,0,0.05);">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
          <polyline points="9 22 9 12 15 12 15 22"/>
        </svg>
        {lang key="errorPage.rateLimitExceeded.home"}
      </a>
    </div>
    
    {* Tips Section *}
    <div style="margin-top: 2.5rem; padding: 1.25rem; border-radius: 0.75rem; background: hsl(var(--accent-muted)); text-align: left;">
      <h3 style="font-size: 0.875rem; font-weight: 600; margin-bottom: 0.75rem; color: hsl(var(--foreground));">Helpful Tips:</h3>
      <ul style="margin: 0; padding-left: 1.25rem; font-size: 0.875rem; color: hsl(var(--muted-foreground)); line-height: 1.6;">
        <li style="margin-bottom: 0.5rem;">Wait a few minutes before trying again</li>
        <li style="margin-bottom: 0.5rem;">Avoid refreshing the page repeatedly</li>
        <li>If you believe this is an error, please contact support</li>
      </ul>
    </div>
    
    {* Security Badge *}
    <div style="margin-top: 2rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
      <svg xmlns="http://www.w3.org/2000/svg" style="width: 0.875rem; height: 0.875rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
      </svg>
      <span>Protected by VENOM CODES security</span>
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

@media (max-width: 640px) {
  .btn {
    width: 100%;
    justify-content: center;
  }
}
</style>
