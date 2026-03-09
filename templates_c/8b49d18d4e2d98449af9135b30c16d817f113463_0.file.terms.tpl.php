<?php
/* Smarty version 4.5.3, created on 2026-03-09 03:03:55
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\terms.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae2a8bec4c38_14239624',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8b49d18d4e2d98449af9135b30c16d817f113463' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\terms.tpl',
      1 => 1773021791,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae2a8bec4c38_14239624 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'F:\\xampp\\htdocs\\venom-codes.test\\client\\vendor\\smarty\\smarty\\libs\\plugins\\modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
?>

<div class="venom-legal-page">
  <div class="venom-legal-shell">
    <section class="venom-legal-hero">
      <span class="venom-badge">Legal</span>
      <h1 class="font-display venom-legal-title">Terms of Service</h1>
      <p class="venom-legal-subtitle">
        These terms govern your use of VENOM CODES software licensing, control panel integrations, and infrastructure management services.
      </p>
      <p class="text-sm text-muted-foreground">Last updated: <?php echo smarty_modifier_date_format(time(),"%B %e, %Y");?>
</p>
    </section>

    <article class="venom-legal-card" style="max-width: 56rem; margin: 0 auto;">
      <section class="venom-legal-section">
        <h2 class="font-display">1. Acceptance of Terms</h2>
        <p>By using our website or services, you agree to these Terms of Service and all applicable laws. If you disagree, do not use the services.</p>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">2. Service Scope</h2>
        <p>VENOM CODES provides software products, license delivery, and infrastructure tooling. We do not operate as a content or streaming provider.</p>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">3. License Grant</h2>
        <p>Licenses are non-exclusive, non-transferable, and revocable upon breach. Usage rights are limited to the purchased plan and documented terms.</p>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">4. Acceptable Use</h2>
        <ul>
          <li>No unlawful, abusive, or deceptive use of our software</li>
          <li>No reverse engineering, bypassing validation, or unauthorized redistribution</li>
          <li>No sharing of credentials, license keys, or restricted platform access</li>
        </ul>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">5. Billing & Renewals</h2>
        <p>Fees are charged according to the selected billing cycle. Late or failed payment may result in suspension, degraded access, or termination.</p>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">6. Suspension & Termination</h2>
        <p>We may suspend or terminate services for security threats, policy violations, abuse, or payment defaults. Upon termination, license rights cease.</p>
      </section>

      <section class="venom-legal-section">
        <h2 class="font-display">7. Disclaimer & Liability</h2>
        <p>Services are provided "as is" and "as available". To the maximum extent permitted by law, VENOM CODES is not liable for indirect, incidental, or consequential damages.</p>
      </section>

      <section class="venom-legal-section" style="margin-bottom: 0;">
        <h2 class="font-display">8. Contact</h2>
        <p>Legal questions can be directed to <a href="mailto:legal@venomcodes.com" class="text-primary">legal@venomcodes.com</a> or through the <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/contact.php" class="text-primary">contact page</a>.</p>
      </section>
    </article>
  </div>
</div>
<?php }
}
