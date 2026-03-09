{* VENOM CODES — Ticket Submission Confirmation *}

<div style="max-width: 32rem; margin: 3rem auto; text-align: center;">

  <div style="margin: 0 auto 1.5rem; display: flex; height: 4rem; width: 4rem; align-items: center; justify-content: center; border-radius: 9999px; background: hsl(160 84% 39% / 0.1);">
    <svg class="h-7 w-7" style="color: hsl(160 84% 39%);" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
  </div>

  <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Ticket Submitted!</h1>
  <p class="text-muted-foreground" style="margin-top: 0.5rem; font-size: 0.9375rem; line-height: 1.625;">
    Your ticket <strong>#{$tid}</strong> has been created successfully. We'll get back to you as soon as possible.
  </p>

  <div style="margin-top: 2rem; display: flex; flex-direction: column; align-items: center; gap: 0.75rem;">
    <a href="{$WEB_ROOT}/viewticket.php?tid={$tid}&c={$c}" class="venom-btn-primary text-sm" style="padding: 0.625rem 1.5rem;">
      <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
      View Ticket
    </a>
    <a href="{$WEB_ROOT}/supporttickets.php" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1.25rem;">
      Back to Tickets
    </a>
  </div>

</div>
