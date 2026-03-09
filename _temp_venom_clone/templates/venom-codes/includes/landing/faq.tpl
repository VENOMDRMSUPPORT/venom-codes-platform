{* VENOM CODES — FAQ Section. Requires: js/faq-accordion.js *}

<section id="faq" class="venom-section bg-surface-sunken">
  <div class="venom-container">
    <div style="max-width: 42rem; margin: 0 auto; text-align: center; margin-bottom: 4rem;">
      <span class="venom-badge" style="margin-bottom: 1rem;">FAQ</span>
      <h2 class="font-display" style="font-size: 1.875rem; font-weight: 700; letter-spacing: -0.025em; margin-top: 1rem;">
        Frequently Asked Questions
      </h2>
    </div>

    <div style="max-width: 48rem; margin: 0 auto; display: flex; flex-direction: column; gap: 0.75rem;">

      {* FAQ Item 1 *}
      <div data-faq-item style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
        <button data-faq-trigger style="display: flex; width: 100%; align-items: center; justify-content: space-between; padding: 1.25rem; text-align: left; background: none; border: none; cursor: pointer; color: inherit;">
          <span class="font-display text-sm" style="font-weight: 600; padding-right: 1rem;">How fast is license activation?</span>
          <svg data-faq-chevron class="h-4 w-4 text-muted-foreground" style="flex-shrink: 0; transition: transform 0.2s;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div data-faq-answer class="faq-answer max-h-0 opacity-0 overflow-hidden">
          <p class="text-sm text-muted-foreground" style="padding: 0 1.25rem 1.25rem; line-height: 1.625;">Licenses activate instantly — typically within 30 seconds of purchase. No manual review or approval process is required.</p>
        </div>
      </div>

      {* FAQ Item 2 *}
      <div data-faq-item style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
        <button data-faq-trigger style="display: flex; width: 100%; align-items: center; justify-content: space-between; padding: 1.25rem; text-align: left; background: none; border: none; cursor: pointer; color: inherit;">
          <span class="font-display text-sm" style="font-weight: 600; padding-right: 1rem;">Can I upgrade my plan later?</span>
          <svg data-faq-chevron class="h-4 w-4 text-muted-foreground" style="flex-shrink: 0; transition: transform 0.2s;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div data-faq-answer class="faq-answer max-h-0 opacity-0 overflow-hidden">
          <p class="text-sm text-muted-foreground" style="padding: 0 1.25rem 1.25rem; line-height: 1.625;">Yes. You can upgrade from Trial to Pro or Ultra at any time. Your existing deployment stays online during the transition with zero downtime.</p>
        </div>
      </div>

      {* FAQ Item 3 *}
      <div data-faq-item style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
        <button data-faq-trigger style="display: flex; width: 100%; align-items: center; justify-content: space-between; padding: 1.25rem; text-align: left; background: none; border: none; cursor: pointer; color: inherit;">
          <span class="font-display text-sm" style="font-weight: 600; padding-right: 1rem;">What happens when my license expires?</span>
          <svg data-faq-chevron class="h-4 w-4 text-muted-foreground" style="flex-shrink: 0; transition: transform 0.2s;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div data-faq-answer class="faq-answer max-h-0 opacity-0 overflow-hidden">
          <p class="text-sm text-muted-foreground" style="padding: 0 1.25rem 1.25rem; line-height: 1.625;">You'll receive reminders before expiration. If not renewed, your license will gracefully deactivate. Your data and configurations are preserved for 30 days.</p>
        </div>
      </div>

      {* FAQ Item 4 *}
      <div data-faq-item style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
        <button data-faq-trigger style="display: flex; width: 100%; align-items: center; justify-content: space-between; padding: 1.25rem; text-align: left; background: none; border: none; cursor: pointer; color: inherit;">
          <span class="font-display text-sm" style="font-weight: 600; padding-right: 1rem;">How do load balancers work?</span>
          <svg data-faq-chevron class="h-4 w-4 text-muted-foreground" style="flex-shrink: 0; transition: transform 0.2s;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div data-faq-answer class="faq-answer max-h-0 opacity-0 overflow-hidden">
          <p class="text-sm text-muted-foreground" style="padding: 0 1.25rem 1.25rem; line-height: 1.625;">Pro includes 1 load balancer. Additional ones cost $15/mo each. Ultra includes unlimited load balancers at no extra cost. All provisioned instantly.</p>
        </div>
      </div>

      {* FAQ Item 5 *}
      <div data-faq-item style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
        <button data-faq-trigger style="display: flex; width: 100%; align-items: center; justify-content: space-between; padding: 1.25rem; text-align: left; background: none; border: none; cursor: pointer; color: inherit;">
          <span class="font-display text-sm" style="font-weight: 600; padding-right: 1rem;">Is there a refund policy?</span>
          <svg data-faq-chevron class="h-4 w-4 text-muted-foreground" style="flex-shrink: 0; transition: transform 0.2s;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div data-faq-answer class="faq-answer max-h-0 opacity-0 overflow-hidden">
          <p class="text-sm text-muted-foreground" style="padding: 0 1.25rem 1.25rem; line-height: 1.625;">Please refer to our Terms of Service for details on our refund and cancellation policy.</p>
        </div>
      </div>

      {* FAQ Item 6 *}
      <div data-faq-item style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); overflow: hidden;">
        <button data-faq-trigger style="display: flex; width: 100%; align-items: center; justify-content: space-between; padding: 1.25rem; text-align: left; background: none; border: none; cursor: pointer; color: inherit;">
          <span class="font-display text-sm" style="font-weight: 600; padding-right: 1rem;">Do you offer custom plans?</span>
          <svg data-faq-chevron class="h-4 w-4 text-muted-foreground" style="flex-shrink: 0; transition: transform 0.2s;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="6 9 12 15 18 9"/></svg>
        </button>
        <div data-faq-answer class="faq-answer max-h-0 opacity-0 overflow-hidden">
          <p class="text-sm text-muted-foreground" style="padding: 0 1.25rem 1.25rem; line-height: 1.625;">Please contact our team to discuss your specific requirements. We can work with you to find the right solution for your needs.</p>
        </div>
      </div>

    </div>
  </div>
</section>
