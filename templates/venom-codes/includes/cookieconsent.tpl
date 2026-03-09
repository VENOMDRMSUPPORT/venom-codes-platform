{* VENOM CODES — Cookie Consent Banner. Requires: js/cookie-consent.js *}

<div id="cookie-consent"
     class="fixed bottom-0 left-0 right-0 z-50 border-t bg-card p-4 shadow-lg sm:bottom-6 sm:left-auto sm:right-6 sm:max-w-md sm:rounded-xl sm:border translate-y-full opacity-0 pointer-events-none"
     style="transition: all 0.3s ease;">
  <div class="flex items-start gap-3">
    <div class="shrink-0 rounded-lg p-2" style="background: hsl(var(--accent-muted));">
      <svg class="h-5 w-5 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 2a10 10 0 1 0 10 10 4 4 0 0 1-5-5 4 4 0 0 1-5-5"/><path d="M8.5 8.5v.01"/><path d="M16 15.5v.01"/><path d="M12 12v.01"/><path d="M11 17v.01"/><path d="M7 14v.01"/>
      </svg>
    </div>
    <div style="flex: 1;">
      <h4 class="font-display text-sm font-semibold" style="margin-bottom: 0.25rem;">Cookie Notice</h4>
      <p class="text-xs text-muted-foreground" style="line-height: 1.625;">
        We use essential cookies for authentication and session management. Read our
        <a href="{$WEB_ROOT}/privacy.php" class="text-primary" style="text-decoration: underline; text-underline-offset: 2px;">Privacy Policy</a>
        to learn more.
      </p>
      <div style="margin-top: 0.75rem; display: flex; align-items: center; gap: 0.5rem;">
        <button onclick="VenomCookie.accept()" class="venom-btn-primary" style="padding: 0.375rem 1rem; font-size: 0.75rem;">Accept</button>
        <button onclick="VenomCookie.decline()" class="venom-btn-secondary" style="padding: 0.375rem 1rem; font-size: 0.75rem;">Decline</button>
      </div>
    </div>
    <button onclick="VenomCookie.decline()" class="shrink-0 text-muted-foreground hover:text-foreground" style="background: none; border: none; cursor: pointer;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/>
      </svg>
    </button>
  </div>
</div>
