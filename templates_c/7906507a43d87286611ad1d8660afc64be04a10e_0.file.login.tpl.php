<?php
/* Smarty version 4.5.3, created on 2026-03-09 03:05:56
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae2b0457ccf2_92129181',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7906507a43d87286611ad1d8660afc64be04a10e' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\login.tpl',
      1 => 1773020062,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae2b0457ccf2_92129181 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('auth_title', "Welcome Back");
$_smarty_tpl->_assignInScope('auth_subtitle', "Sign in to your VENOM CODES account");
$_smarty_tpl->_assignInScope('auth_icon_svg', '<svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>');?>

<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "auth_content", null);?>
<form method="post" action="<?php echo $_smarty_tpl->tpl_vars['systemurl']->value;?>
dologin.php" style="display: flex; flex-direction: column; gap: 1.25rem;">
  <input type="hidden" name="token" value="<?php echo $_smarty_tpl->tpl_vars['token']->value;?>
" />

  <div>
    <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Address</label>
    <input type="email" name="username" class="venom-input" placeholder="you@example.com" required />
  </div>

  <div>
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.375rem;">
      <label style="font-size: 0.875rem; font-weight: 500;">Password</label>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/pwreset.php" class="text-primary" style="font-size: 0.75rem; text-decoration: none;">Forgot password?</a>
    </div>
    <input type="password" name="password" class="venom-input" placeholder="••••••••" required />
  </div>

  <?php if ($_smarty_tpl->tpl_vars['captcha']->value) {?>
    <div><?php echo $_smarty_tpl->tpl_vars['captcha']->value;?>
</div>
  <?php }?>

  <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
    <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
    Sign In
  </button>
</form>

<p style="margin-top: 1.5rem; text-align: center; font-size: 0.875rem; color: hsl(var(--muted-foreground));">
  Don't have an account?
  <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/register.php" class="text-primary" style="font-weight: 500; text-decoration: none;">Create one</a>
</p>
<?php $_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>

<?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/authlayout.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
}
}
