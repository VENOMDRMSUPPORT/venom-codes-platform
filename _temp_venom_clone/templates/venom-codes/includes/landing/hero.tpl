{* VENOM CODES — Hero Section
   Landing page hero with headline, CTA, and stats. *}

<section class="relative overflow-hidden bg-hero-bg" style="padding-top: 8rem; padding-bottom: 5rem;">
  {* Background glow *}
  <div style="position: absolute; inset: 0; overflow: hidden;">
    <div class="venom-gradient-bg" style="position: absolute; top: 25%; left: 50%; transform: translateX(-50%); height: 500px; width: 800px; border-radius: 9999px; opacity: 0.07; filter: blur(120px);"></div>
  </div>

  <div class="venom-container" style="position: relative;">
    <div class="animate-fade-in-up" style="max-width: 48rem; margin: 0 auto; text-align: center;">
      <div style="margin-bottom: 1.5rem; display: inline-flex; align-items: center; gap: 0.5rem; border-radius: 9999px; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 0.375rem 1rem; font-size: 0.75rem; font-weight: 500;">
        <svg class="h-3 w-3 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
        </svg>
        <span>Instant Activation &middot; Zero Downtime</span>
      </div>

      <h1 class="font-display hero-h1" style="font-size: 2.25rem; font-weight: 700; letter-spacing: -0.025em; line-height: 1.1;">
        Server Licensing &amp;<br>
        <span class="venom-gradient-text">Infrastructure Solutions</span>
      </h1>

      <p class="text-muted-foreground" style="margin-top: 1.5rem; font-size: 1.125rem; line-height: 1.625;">
        Deploy, scale, and manage your infrastructure with enterprise-grade licensing.
        Instant provisioning. Unlimited scalability. Premium support.
      </p>

      <div class="hero-cta" style="margin-top: 2.5rem; display: flex; flex-direction: column; align-items: center; gap: 1rem;">
        <a href="{$WEB_ROOT}/register.php" class="venom-btn-primary" style="padding: 0.875rem 2rem; font-size: 1rem;">
          Start Free Trial
          <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/>
          </svg>
        </a>
        <a href="#pricing" class="venom-btn-secondary" style="padding: 0.875rem 2rem; font-size: 1rem;">View Pricing</a>
      </div>
    </div>

    {* Stats *}
    <div class="hero-stats animate-fade-in-up" style="margin-top: 5rem; display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem; animation-delay: 0.3s;">
      <div style="text-align: center;">
        <div class="font-display hero-stat-value" style="font-size: 1.5rem; font-weight: 700;">—</div>
        <div class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Uptime SLA</div>
      </div>
      <div style="text-align: center;">
        <div class="font-display hero-stat-value" style="font-size: 1.5rem; font-weight: 700;">&lt;30s</div>
        <div class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Activation Time</div>
      </div>
      <div style="text-align: center;">
        <div class="font-display hero-stat-value" style="font-size: 1.5rem; font-weight: 700;">24/7</div>
        <div class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Monitoring</div>
      </div>
      <div style="text-align: center;">
        <div class="font-display hero-stat-value" style="font-size: 1.5rem; font-weight: 700;">—</div>
        <div class="text-sm text-muted-foreground" style="margin-top: 0.25rem;">Active Licenses</div>
      </div>
    </div>

    <style>
      @media (min-width: 640px) {
        .hero-stats { grid-template-columns: repeat(4, 1fr) !important; }
        .hero-h1 { font-size: 3rem !important; }
        .hero-stat-value { font-size: 1.875rem !important; }
        .hero-cta { flex-direction: row !important; justify-content: center !important; }
      }
      @media (min-width: 1024px) {
        .hero-h1 { font-size: 3.75rem !important; }
      }
    </style>
  </div>
</section>