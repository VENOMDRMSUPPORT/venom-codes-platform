{* VENOM CODES — 3D Secure Authentication Page *}

<div class="container" style="max-width: 48rem; margin: 0 auto; padding: 2rem 1rem;">
  
  {* Info Alert *}
  <div style="margin-bottom: 2rem; padding: 1.25rem; border-radius: 0.75rem; background: hsl(var(--primary) / 0.1); border: 1px solid hsl(var(--primary) / 0.2); text-align: center;">
    <div style="display: flex; align-items: center; gap: 0.75rem; justify-content: center; flex-wrap: wrap;">
      <svg xmlns="http://www.w3.org/2000/svg" style="width: 1.25rem; height: 1.25rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10"/>
        <line x1="12" y1="16" x2="12" y2="12"/>
        <line x1="12" y1="8" x2="12.01" y2="8"/>
      </svg>
      <span style="font-size: 0.875rem; color: hsl(var(--foreground)); line-height: 1.5;">
        {lang key='creditcard3dsecure'}
      </span>
    </div>
  </div>
  
  {* 3D Secure Card *}
  <div style="border-radius: 1rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);">
    <div style="padding: 2rem;">
      
      {* Header *}
      <div style="margin-bottom: 1.5rem; text-align: center;">
        <div style="margin: 0 auto 1rem; display: inline-flex; height: 3.5rem; width: 3.5rem; align-items: center; justify-content: center; border-radius: 0.75rem; background: hsl(var(--primary) / 0.1);">
          <svg xmlns="http://www.w3.org/2000/svg" style="width: 2rem; height: 2rem; color: hsl(var(--primary));" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect x="1" y="4" width="22" height="16" rx="2" ry="2"/>
            <line x1="1" y1="10" x2="23" y2="10"/>
          </svg>
        </div>
        <h2 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em; margin-bottom: 0.5rem;">
          Payment Authentication
        </h2>
        <p class="text-muted-foreground" style="font-size: 0.875rem;">
          Please complete the verification below to continue with your payment
        </p>
      </div>
      
      {* Hidden Form Container *}
      <div id="frmThreeDAuth" class="w-hidden" style="display: none;">
        {$code}
      </div>
      
      {* 3D Secure Authentication Frame *}
      <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--muted) / 0.3); padding: 1rem; min-height: 500px;">
        <iframe name="3dauth" 
                height="500" 
                scrolling="auto" 
                src="about:blank" 
                class="submit-3d" 
                style="width: 100%; border: none; border-radius: 0.5rem; background: white;">
        </iframe>
      </div>
      
      {* Security Info *}
      <div style="margin-top: 1.5rem; padding: 1rem; border-radius: 0.5rem; background: hsl(var(--muted) / 0.5); display: flex; align-items: start; gap: 0.75rem;">
        <svg xmlns="http://www.w3.org/2000/svg" style="width: 1.125rem; height: 1.125rem; margin-top: 0.125rem; color: hsl(var(--primary)); flex-shrink: 0;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
        </svg>
        <div style="font-size: 0.875rem; line-height: 1.5; color: hsl(var(--muted-foreground));">
          <strong style="color: hsl(var(--foreground));">Secure Payment Authentication</strong>
          <p style="margin: 0.25rem 0 0;">This verification is provided by your card issuer to ensure your transaction is secure. Your payment information is protected and encrypted.</p>
        </div>
      </div>
      
    </div>
  </div>
  
  {* Loading Indicator *}
  <div id="3dSecureLoading" style="margin-top: 1.5rem; text-align: center; color: hsl(var(--muted-foreground)); font-size: 0.875rem;">
    <div style="display: inline-flex; align-items: center; gap: 0.5rem;">
      <svg style="width: 1rem; height: 1rem; animation: spin 1s linear infinite;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 12a9 9 0 1 1-6.219-8.56"/>
      </svg>
      <span>Loading secure authentication...</span>
    </div>
  </div>
  
</div>

<style>
@keyframes spin {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

iframe[name="3dauth"] {
  display: block;
  margin: 0 auto;
}

/* Hide loading indicator after iframe loads */
iframe[name="3dauth"]:not([src="about:blank"]) ~ #3dSecureLoading {
  display: none;
}
</style>

<script>
jQuery(document).ready(function() {
    // Target the form inside the hidden container to the iframe
    jQuery("#frmThreeDAuth").find("form:first").attr('target', '3dauth');
    
    // Auto-submit the form after a brief delay
    setTimeout(function() {
        autoSubmitFormByContainer('frmThreeDAuth');
        
        // Hide loading indicator after submission
        setTimeout(function() {
            jQuery('#3dSecureLoading').fadeOut();
        }, 1000);
    }, 1000);
});
</script>
