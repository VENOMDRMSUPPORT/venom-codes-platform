{* VENOM CODES — Public Site Footer *}

<footer class="bg-footer-bg">
  <div class="venom-container venom-section">
    <div class="footer-grid" style="display: grid; gap: 3rem; grid-template-columns: repeat(1, 1fr);">

      {* Brand *}
      <div>
        <div class="flex items-center gap-2" style="margin-bottom: 1rem;">
          {include file="$template/includes/logo.tpl" size=28 animate=false}
          <span class="font-display text-lg font-bold footer-heading">VENOM CODES</span>
        </div>
        <p class="text-sm footer-text" style="line-height: 1.625;">
          Premium server licensing and infrastructure solutions. Instant activation, scalable deployment.
        </p>
      </div>

      {* Product *}
      <div>
        <h4 class="font-display text-sm font-semibold uppercase footer-heading" style="letter-spacing: 0.05em; margin-bottom: 1rem;">Product</h4>
        <ul style="list-style: none; padding: 0; margin: 0;" class="space-y-2.5 text-sm">
          <li><a href="#features" class="footer-link">Features</a></li>
          <li><a href="#pricing" class="footer-link">Pricing</a></li>
          <li><a href="{$WEB_ROOT}/contact.php" class="footer-link">Contact</a></li>
          <li><a href="#faq" class="footer-link">FAQ</a></li>
          <li><a href="{$WEB_ROOT}/knowledgebase" class="footer-link">Knowledge Base</a></li>
          <li><a href="{$WEB_ROOT}/serverstatus.php" class="footer-link">System Status</a></li>
        </ul>
      </div>

      {* Account *}
      <div>
        <h4 class="font-display text-sm font-semibold uppercase footer-heading" style="letter-spacing: 0.05em; margin-bottom: 1rem;">Account</h4>
        <ul style="list-style: none; padding: 0; margin: 0;" class="space-y-2.5 text-sm">
          <li><a href="{$WEB_ROOT}/clientarea.php" class="footer-link">Sign In</a></li>
          <li><a href="{$WEB_ROOT}/register.php" class="footer-link">Register</a></li>
          <li><a href="{$WEB_ROOT}/pwreset.php" class="footer-link">Reset Password</a></li>
        </ul>
      </div>

      {* Legal *}
      <div>
        <h4 class="font-display text-sm font-semibold uppercase footer-heading" style="letter-spacing: 0.05em; margin-bottom: 1rem;">Legal</h4>
        <ul style="list-style: none; padding: 0; margin: 0;" class="space-y-2.5 text-sm">
          <li><a href="{$WEB_ROOT}/terms.php" class="footer-link">Terms of Service</a></li>
          <li><a href="{$WEB_ROOT}/privacy.php" class="footer-link">Privacy Policy</a></li>
          <li><a href="{$WEB_ROOT}/sla.php" class="footer-link">SLA</a></li>
        </ul>
      </div>

    </div>

    <style>
      @media (min-width: 768px) {
        .footer-grid { grid-template-columns: repeat(4, 1fr) !important; }
      }
    </style>

    <div style="margin-top: 3rem; border-top: 1px solid hsl(var(--border) / 0.2); padding-top: 2rem; text-align: center;">
      <p class="text-xs footer-text">&copy; {$smarty.now|date_format:"%Y"} VENOM CODES. All rights reserved.</p>
    </div>
  </div>
</footer>
