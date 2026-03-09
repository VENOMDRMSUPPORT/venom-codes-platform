<?php
/* Smarty version 4.5.3, created on 2026-03-09 03:03:46
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\privacy.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae2a8249f741_29871545',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '02f914630b45a11e78de80f587ddaf5213f27be1' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\privacy.tpl',
      1 => 1773021791,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae2a8249f741_29871545 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'F:\\xampp\\htdocs\\venom-codes.test\\client\\vendor\\smarty\\smarty\\libs\\plugins\\modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
?>

<div class="venom-legal-page">
  <div class="venom-legal-shell">
    <section class="venom-legal-hero">
      <span class="venom-badge">Legal</span>
      <h1 class="font-display venom-legal-title">Privacy Policy</h1>
      <p class="venom-legal-subtitle">
        This policy explains what data we collect, why we process it, and how we protect your information when you use VENOM CODES licensing and infrastructure services.
      </p>
      <p class="text-sm text-muted-foreground">Last updated: <?php echo smarty_modifier_date_format(time(),"%B %e, %Y");?>
</p>
    </section>

    <div class="venom-legal-grid">
      <article class="venom-legal-card">
        <div class="alert-info" style="border: 1px solid; border-radius: 0.75rem; padding: 1rem; margin-bottom: 1.5rem;">
          <p class="text-sm" style="margin: 0; line-height: 1.6;">
            VENOM CODES is a software licensing and infrastructure platform. We do not provide or distribute media content or streaming services.
          </p>
        </div>

        <section class="venom-legal-section">
          <h2 class="font-display">1. Information We Collect</h2>
          <p>We may collect account profile details, billing information, technical metadata, and license telemetry needed to operate and secure our services.</p>
          <ul>
            <li>Account data: name, email, company details, contact preferences</li>
            <li>License data: activation IDs, hardware/server fingerprinting for validation</li>
            <li>Service usage data: feature usage, diagnostic events, uptime-related logs</li>
            <li>Transaction data: payment status and invoices via secure payment providers</li>
          </ul>
        </section>

        <section class="venom-legal-section">
          <h2 class="font-display">2. How We Use Data</h2>
          <ul>
            <li>Deliver and maintain licensed services</li>
            <li>Protect account and platform integrity</li>
            <li>Process payments and fraud checks</li>
            <li>Provide support and operational notifications</li>
            <li>Meet legal, accounting, and security obligations</li>
          </ul>
        </section>

        <section class="venom-legal-section">
          <h2 class="font-display">3. Legal Basis & Sharing</h2>
          <p>We process data under contractual necessity, legitimate interests, compliance obligations, and consent where required.</p>
          <p>We never sell personal data. We may share limited data with vetted processors such as payment gateways, cloud infrastructure, and fraud prevention providers.</p>
        </section>

        <section class="venom-legal-section">
          <h2 class="font-display">4. Retention & Security</h2>
          <p>We retain personal data only for as long as needed for service delivery, legal compliance, and dispute resolution. We use encryption in transit, strict access controls, and audit logging to protect user data.</p>
        </section>

        <section class="venom-legal-section">
          <h2 class="font-display">5. Your Rights</h2>
          <ul>
            <li>Access, correct, or delete eligible personal data</li>
            <li>Object to processing or request restriction where applicable</li>
            <li>Request data export in a portable format</li>
            <li>Withdraw consent for optional processing</li>
          </ul>
          <p>For requests, contact us at <a href="mailto:privacy@venomcodes.com" class="text-primary">privacy@venomcodes.com</a>.</p>
        </section>

        <section class="venom-legal-section" style="margin-bottom: 0;">
          <h2 class="font-display">6. Cookies</h2>
          <p>We use essential cookies for authentication and session continuity. Optional analytics cookies may be used to improve service performance.</p>
        </section>
      </article>

      <aside class="venom-legal-side">
        <div class="venom-legal-side-card">
          <h3 class="font-display">Quick Summary</h3>
          <ul>
            <li>We collect only service-relevant account and technical data.</li>
            <li>We do not sell personal information.</li>
            <li>You can request access, correction, or deletion.</li>
            <li>Security controls are applied across storage and transit.</li>
          </ul>
        </div>

        <div class="venom-legal-side-card">
          <h3 class="font-display">Need Help?</h3>
          <p class="text-sm text-muted-foreground">For privacy inquiries or formal data requests, contact our team.</p>
          <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/contact.php" class="venom-btn-primary" style="width: 100%; margin-top: 0.75rem;">Contact Support</a>
        </div>
      </aside>
    </div>
  </div>
</div>
<?php }
}
