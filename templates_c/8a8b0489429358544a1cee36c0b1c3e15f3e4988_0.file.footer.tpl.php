<?php
/* Smarty version 4.5.3, created on 2026-03-09 03:03:46
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\includes\footer.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae2a82297667_07260193',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8a8b0489429358544a1cee36c0b1c3e15f3e4988' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\includes\\footer.tpl',
      1 => 1773021796,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae2a82297667_07260193 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'F:\\xampp\\htdocs\\venom-codes.test\\client\\vendor\\smarty\\smarty\\libs\\plugins\\modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
?>

<footer class="bg-footer-bg">
  <div class="venom-container venom-section">
    <div class="footer-grid" style="display: grid; gap: 3rem; grid-template-columns: repeat(1, 1fr);">

            <div>
        <div class="flex items-center gap-2" style="margin-bottom: 1rem;">
          <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/logo.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('size'=>28,'animate'=>false), 0, true);
?>
          <span class="font-display text-lg font-bold footer-heading">VENOM CODES</span>
        </div>
        <p class="text-sm footer-text" style="line-height: 1.625;">
          Premium server licensing and infrastructure solutions. Instant activation, scalable deployment.
        </p>
      </div>

            <div>
        <h4 class="font-display text-sm font-semibold uppercase footer-heading" style="letter-spacing: 0.05em; margin-bottom: 1rem;">Product</h4>
        <ul style="list-style: none; padding: 0; margin: 0;" class="space-y-2.5 text-sm">
          <li><a href="#features" class="footer-link">Features</a></li>
          <li><a href="#pricing" class="footer-link">Pricing</a></li>
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/contact.php" class="footer-link">Contact</a></li>
          <li><a href="#faq" class="footer-link">FAQ</a></li>
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/knowledgebase" class="footer-link">Knowledge Base</a></li>
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/serverstatus.php" class="footer-link">System Status</a></li>
        </ul>
      </div>

            <div>
        <h4 class="font-display text-sm font-semibold uppercase footer-heading" style="letter-spacing: 0.05em; margin-bottom: 1rem;">Account</h4>
        <ul style="list-style: none; padding: 0; margin: 0;" class="space-y-2.5 text-sm">
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/clientarea.php" class="footer-link">Sign In</a></li>
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/register.php" class="footer-link">Register</a></li>
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/pwreset.php" class="footer-link">Reset Password</a></li>
        </ul>
      </div>

            <div>
        <h4 class="font-display text-sm font-semibold uppercase footer-heading" style="letter-spacing: 0.05em; margin-bottom: 1rem;">Legal</h4>
        <ul style="list-style: none; padding: 0; margin: 0;" class="space-y-2.5 text-sm">
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/terms.php" class="footer-link">Terms of Service</a></li>
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/privacy.php" class="footer-link">Privacy Policy</a></li>
          <li><a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/sla.php" class="footer-link">SLA</a></li>
        </ul>
      </div>

    </div>

    <style>
      @media (min-width: 768px) {
        .footer-grid { grid-template-columns: repeat(4, 1fr) !important; }
      }
    </style>

    <div style="margin-top: 3rem; border-top: 1px solid hsl(var(--border) / 0.2); padding-top: 2rem; text-align: center;">
      <p class="text-xs footer-text">&copy; <?php echo smarty_modifier_date_format(time(),"%Y");?>
 VENOM CODES. All rights reserved.</p>
    </div>
  </div>
</footer>
<?php }
}
