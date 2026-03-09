<?php
/* Smarty version 4.5.3, created on 2026-03-09 03:05:37
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\clientregister.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae2af1b2d6e0_76084818',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '29b43a9f3d6a411ada967e5d92fbc2d5c3249c66' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\clientregister.tpl',
      1 => 1773021819,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae2af1b2d6e0_76084818 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('auth_title', "Create Account");
$_smarty_tpl->_assignInScope('auth_subtitle', "Get started with VENOM CODES today");
$_smarty_tpl->_assignInScope('auth_icon_svg', '<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="8.5" cy="7" r="4"/><line x1="20" y1="8" x2="20" y2="14"/><line x1="23" y1="11" x2="17" y2="11"/></svg>');?>

<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "auth_content", null);?>
<form method="post" action="<?php echo $_smarty_tpl->tpl_vars['systemurl']->value;?>
register.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="<?php echo $_smarty_tpl->tpl_vars['token']->value;?>
" />

  <div style="display: grid; gap: 1.25rem; grid-template-columns: repeat(2, 1fr);">
    <div>
      <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">First Name</label>
      <input type="text" name="firstname" class="venom-input" placeholder="John" required />
    </div>
    <div>
      <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Last Name</label>
      <input type="text" name="lastname" class="venom-input" placeholder="Doe" required />
    </div>
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Address</label>
    <input type="email" name="email" class="venom-input" placeholder="you@example.com" required />
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Password</label>
    <input type="password" name="password" class="venom-input" placeholder="Min. 8 characters" required />
  </div>

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Confirm Password</label>
    <input type="password" name="password2" class="venom-input" placeholder="••••••••" required />
  </div>

  <div style="display: flex; align-items: flex-start; gap: 0.5rem;">
    <input type="checkbox" name="accepttos" id="terms" style="margin-top: 0.25rem; border-radius: 0.25rem;" required />
    <label for="terms" class="text-xs text-muted-foreground">
      I agree to the
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/terms.php" class="text-primary" style="text-decoration: underline;">Terms of Service</a>
      and
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/privacy.php" class="text-primary" style="text-decoration: underline;">Privacy Policy</a>
    </label>
  </div>

  <?php if ($_smarty_tpl->tpl_vars['captcha']->value) {?>
    <div><?php echo $_smarty_tpl->tpl_vars['captcha']->value;?>
</div>
  <?php }?>

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="8.5" cy="7" r="4"/><line x1="20" y1="8" x2="20" y2="14"/><line x1="23" y1="11" x2="17" y2="11"/></svg>
    Create Account
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  Already have an account?
  <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/clientarea.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Sign in</a>
</p>
<?php $_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>

<?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/authlayout.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
}
}
