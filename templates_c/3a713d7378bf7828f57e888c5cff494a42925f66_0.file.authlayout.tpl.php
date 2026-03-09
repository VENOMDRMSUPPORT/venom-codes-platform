<?php
/* Smarty version 4.5.3, created on 2026-03-09 02:37:35
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\includes\authlayout.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae245f66f775_55181636',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3a713d7378bf7828f57e888c5cff494a42925f66' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\includes\\authlayout.tpl',
      1 => 1773020062,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae245f66f775_55181636 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div style="display: flex; flex: 1; align-items: center; justify-content: center; padding: 7rem 1rem 8rem;">
  <div style="width: 100%; max-width: 28rem;">

        <div style="margin-bottom: 2rem; text-align: center;">
      <div style="margin: 0 auto 1rem; display: inline-flex; height: 3rem; width: 3rem; align-items: center; justify-content: center; border-radius: 0.75rem; background: hsl(var(--accent-muted));">
        <?php if ((isset($_smarty_tpl->tpl_vars['auth_icon_svg']->value))) {?>
          <?php echo $_smarty_tpl->tpl_vars['auth_icon_svg']->value;?>

        <?php } else { ?>
          <svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
        <?php }?>
      </div>
      <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;"><?php echo $_smarty_tpl->tpl_vars['auth_title']->value;?>
</h1>
      <?php if ((isset($_smarty_tpl->tpl_vars['auth_subtitle']->value))) {?>
        <p class="text-sm text-muted-foreground" style="margin-top: 0.5rem;"><?php echo $_smarty_tpl->tpl_vars['auth_subtitle']->value;?>
</p>
      <?php }?>
    </div>

        <div class="auth-card-wrapper" style="position: relative; border-radius: 1rem; padding: 1px;">
      <div class="auth-card-border" style="position: absolute; inset: 0; border-radius: 1rem;"></div>
      <div style="position: relative; border-radius: 1rem; border: 1px solid hsl(var(--border) / 0.5); background: hsl(var(--card)); padding: 1.5rem; box-shadow: 0 10px 25px -5px rgba(0,0,0,0.1);">
        <?php echo $_smarty_tpl->tpl_vars['auth_content']->value;?>

      </div>
    </div>

        <div style="margin-top: 1.5rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem; font-size: 0.75rem; color: hsl(var(--muted-foreground));">
      <svg class="h-3 w-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
      <span>Protected by VENOM CODES security</span>
    </div>

  </div>
</div>
<?php }
}
