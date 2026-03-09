{* VENOM CODES — Affiliate Signup *}

<div style="max-width: 32rem; margin: 3rem auto; text-align: center;">

  <div style="margin: 0 auto 1.5rem; display: flex; height: 4rem; width: 4rem; align-items: center; justify-content: center; border-radius: 9999px; background: hsl(var(--primary) / 0.1);">
    <svg class="h-7 w-7" style="color: hsl(var(--primary));" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
  </div>

  <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Join Our Affiliate Program</h1>
  <p class="text-muted-foreground" style="margin-top: 0.5rem; font-size: 0.9375rem; line-height: 1.625; max-width: 28rem; margin-left: auto; margin-right: auto;">
    Earn commissions by referring new customers. Share your unique link and earn on every sale.
  </p>

  <div style="margin-top: 2rem;">
    <form method="post" action="{$smarty.server.PHP_SELF}">
      <input type="hidden" name="action" value="activate" />
      <input type="hidden" name="token" value="{$token}" />
      <button type="submit" class="venom-btn-primary" style="padding: 0.75rem 2rem;">
        Activate Affiliate Account
      </button>
    </form>
  </div>

</div>
