{* VENOM CODES — Service Level Agreement *}

<div class="venom-legal-page">
  <div class="venom-legal-shell">
    <section class="venom-legal-hero">
      <span class="venom-badge">Legal</span>
      <h1 class="font-display venom-legal-title">Service Level Agreement (SLA)</h1>
      <p class="venom-legal-subtitle">
        This SLA defines uptime commitments, support response objectives, and service credit eligibility for VENOM CODES platform services.
      </p>
      <p class="text-sm text-muted-foreground">Last updated: {$smarty.now|date_format:"%B %e, %Y"}</p>
    </section>

    <article class="venom-legal-card" style="max-width: 56rem; margin: 0 auto;">
      <section class="venom-legal-section">
        <h2 class="font-display">1. Availability Target</h2>
        <p>Monthly service availability target is <strong class="text-foreground">99.90%</strong> for core licensing API and dashboard endpoints, excluding scheduled maintenance and force majeure events.</p>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">2. Planned Maintenance</h2>
        <p>Scheduled maintenance windows are announced in advance through client notifications or status channels whenever possible.</p>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">3. Incident Severity & Response</h2>
        <ul>
          <li><strong class="text-foreground">Critical:</strong> widespread outage, initial response target within 1 hour</li>
          <li><strong class="text-foreground">High:</strong> major feature impact, initial response target within 4 hours</li>
          <li><strong class="text-foreground">Normal:</strong> limited impact, initial response target within 1 business day</li>
        </ul>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">4. Service Credits</h2>
        <p>If monthly availability falls below target, eligible clients may request service credits within 30 days after the affected month.</p>
        <ul>
          <li>99.0% to 99.89%: 5% monthly fee credit</li>
          <li>95.0% to 98.99%: 10% monthly fee credit</li>
          <li>Below 95.0%: 20% monthly fee credit</li>
        </ul>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">5. Exclusions</h2>
        <p>SLA credits do not apply to outages caused by customer-side misconfiguration, third-party provider failures outside our control, abuse mitigation actions, or unpaid accounts.</p>
      </section>

      <section class="venom-legal-section" style="margin-bottom: 0;">
        <h2 class="font-display">6. Claims & Contact</h2>
        <p>To submit an SLA claim, contact <a href="mailto:support@venomcodes.com" class="text-primary">support@venomcodes.com</a> with incident date/time, affected service, and supporting logs.</p>
      </section>
    </article>
  </div>
</div>
