<?php
/* Smarty version 4.5.3, created on 2026-03-09 03:07:43
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\includes\header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae2b6fb85f59_78844777',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '311a38f94214a04f80aae74d86d564bc34f564ce' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\includes\\header.tpl',
      1 => 1773022043,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae2b6fb85f59_78844777 (Smarty_Internal_Template $_smarty_tpl) {
?>
<header class="sticky top-0 z-50 border-b" style="border-color: hsl(var(--nav-border)); background: hsl(var(--nav-bg)); backdrop-filter: blur(16px); -webkit-backdrop-filter: blur(16px);">
  <div class="venom-container flex h-16 items-center justify-between">
        <a href="index.php" class="flex items-center gap-2" style="text-decoration: none; color: inherit;">
      <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/logo.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('size'=>32), 0, true);
?>
      <span class="font-display text-lg font-bold" style="letter-spacing: -0.025em;">VENOM CODES</span>
    </a>

        <nav class="hidden items-center gap-8 md:flex">
      <a href="#features" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Features</a>
      <a href="#pricing" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Pricing</a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/knowledgebase" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Docs</a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/contact.php" class="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground" style="text-decoration: none;">Contact</a>
    </nav>

        <div class="hidden items-center gap-3 md:flex">
      <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/themeswitcher.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/clientarea.php" class="venom-btn-secondary text-sm" style="padding: 0.5rem 1rem;">Sign In</a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/register.php" class="venom-btn-primary text-sm" style="padding: 0.5rem 1rem;">Get Started</a>
    </div>

        <div class="flex items-center gap-2 md:hidden">
      <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/themeswitcher.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
      <button id="mobile-menu-toggle" class="p-2">
        <svg id="mobile-icon-open" class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/>
        </svg>
        <svg id="mobile-icon-close" class="h-5 w-5 hidden" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/>
        </svg>
      </button>
    </div>
  </div>

    <div id="mobile-menu" class="hidden border-t bg-card p-4 md:hidden">
    <nav class="flex flex-col gap-3">
      <a href="#features" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Features</a>
      <a href="#pricing" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Pricing</a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/knowledgebase" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Docs</a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/contact.php" class="text-sm font-medium text-muted-foreground" style="text-decoration: none;">Contact</a>
      <hr style="border-color: hsl(var(--border));" />
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/clientarea.php" class="text-sm font-medium" style="text-decoration: none;">Sign In</a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/register.php" class="venom-btn-primary text-sm text-center" style="padding: 0.5rem 1rem;">Get Started</a>
    </nav>
  </div>
</header>
<?php }
}
