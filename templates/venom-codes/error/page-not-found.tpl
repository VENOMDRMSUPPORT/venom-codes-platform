{* VENOM CODES — 404 Page Not Found Error *}

<div style="display: flex; flex: 1; align-items: center; justify-content: center; padding: 4rem 1rem; min-height: 70vh;">
  <div style="width: 100%; max-width: 32rem; text-align: center;">
    
    {* Error Icon *}
    <div style="margin: 0 auto 2rem; display: inline-flex; height: 5rem; width: 5rem; align-items: center; justify-content: center; border-radius: 1rem; background: hsl(var(--muted) / 0.5);">
      <svg xmlns="http://www.w3.org/2000/svg" style="width: 3rem; height: 3rem; color: hsl(var(--primary));" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10"/>
        <path d="M16 16s-1.5-2-4-2-4 2-4 2"/>
        <line x1="9" y1="9" x2="9.01" y2="9"/>
        <line x1="15" y1="9" x2="15.01" y2="9"/>
      </svg>
    </div>
    
    {* Error Code *}
    <h1 class="font-display" style="font-size: 6rem; font-weight: 800; line-height: 1; letter-spacing: -0.05em; color: hsl(var(--primary)); margin-bottom: 1rem;">
      {lang key="errorPage.404.title"}
    </h1>
    
    {* Error Title *}
    <h2 class="font-display" style="font-size: 1.875rem; font-weight: 700; letter-spacing: -0.025em; margin-bottom: 1rem;">
      {lang key="errorPage.404.subtitle"}
    </h2>
    
    {* Error Description *}
    <p class="text-muted-foreground" style="font-size: 1rem; margin-bottom: 2rem; line-height: 1.6;">
      {lang key="errorPage.404.description"}
    </p>
    
    {* Action Buttons *}
    <div style="display: flex; gap: 0.75rem; justify-content: center; flex-wrap: wrap;">
      <a href="{$systemurl}" class="btn btn-primary" style="display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.75rem 1.5rem; background: hsl(var(--primary)); color: hsl(var(--primary-foreground)); border-radius: 0.5rem; font-weight: 500; text-decoration: none; transition: all 0.2s; box-shadow: 0 1px 2px rgba(0,0,0,0.05);">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
          <polyline points="9 22 9 12 15 12 15 22"/>
        </svg>
        {lang key="errorPage.404.home"}
      </a>
      <a href="{$systemurl}contact.php" class="btn btn-secondary" style="display: inline-flex; align-items: center; gap: 0.5rem; padding: 0.75rem 1.5rem; background: hsl(var(--muted)); color: hsl(var(--foreground)); border-radius: 0.5rem; font-weight: 500; text-decoration: none; transition: all 0.2s; border: 1px solid hsl(var(--border));">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M21.2 8.4c.5.38.8.97.8 1.6v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V10a2 2 0 0 1 .8-1.6l8-6a2 2 0 0 1 2.4 0l8 6Z"/>
          <path d="m22 10-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 10"/>
        </svg>
        {lang key="errorPage.404.submitTicket"}
      </a>
    </div>
    
    {* Decorative Element *}
    <div style="margin-top: 3rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
      <svg xmlns="http://www.w3.org/2000/svg" style="width: 0.875rem; height: 0.875rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
      </svg>
      <span>Error tracked and logged</span>
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
