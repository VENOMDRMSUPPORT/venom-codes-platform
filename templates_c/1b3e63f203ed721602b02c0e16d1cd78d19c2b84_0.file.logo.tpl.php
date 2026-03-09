<?php
/* Smarty version 4.5.3, created on 2026-03-09 02:35:05
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\includes\logo.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae23c9289401_15457165',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1b3e63f203ed721602b02c0e16d1cd78d19c2b84' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\includes\\logo.tpl',
      1 => 1773020062,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae23c9289401_15457165 (Smarty_Internal_Template $_smarty_tpl) {
if (!(isset($_smarty_tpl->tpl_vars['size']->value))) {
$_smarty_tpl->_assignInScope('size', 40);
}
if (!(isset($_smarty_tpl->tpl_vars['animate']->value))) {
$_smarty_tpl->_assignInScope('animate', true);
}?>

<div class="relative inline-flex items-center justify-center" style="width: <?php echo $_smarty_tpl->tpl_vars['size']->value;?>
px; height: <?php echo $_smarty_tpl->tpl_vars['size']->value;?>
px;">
  <?php if ($_smarty_tpl->tpl_vars['animate']->value) {?>
    <div class="absolute inset-0 venom-gradient-bg rounded-sm blur-md animate-logo-pulse"></div>
  <?php }?>
  <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"
       style="width: <?php echo $_smarty_tpl->tpl_vars['size']->value;?>
px; height: <?php echo $_smarty_tpl->tpl_vars['size']->value;?>
px;" class="relative z-10">
    <defs>
      <linearGradient id="venom-logo-grad" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" stop-color="hsl(var(--accent-gradient-from))" />
        <stop offset="100%" stop-color="hsl(var(--accent-gradient-to))" />
      </linearGradient>
    </defs>
    <path d="M24 2L46 24L24 46L2 24Z"
          stroke="url(#venom-logo-grad)" stroke-width="2.5" stroke-linejoin="round" fill="none"
          <?php if ($_smarty_tpl->tpl_vars['animate']->value) {?>class="animate-draw-path"<?php }?> />
    <path d="M15 14L24 34L33 14"
          stroke="url(#venom-logo-grad)" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" fill="none"
          <?php if ($_smarty_tpl->tpl_vars['animate']->value) {?>class="animate-draw-path-delayed"<?php }?> />
  </svg>
</div>
<?php }
}
