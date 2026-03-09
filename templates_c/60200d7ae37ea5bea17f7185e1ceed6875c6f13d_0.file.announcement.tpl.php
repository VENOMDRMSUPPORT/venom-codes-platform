<?php
/* Smarty version 4.5.3, created on 2026-03-09 02:35:05
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\includes\announcement.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae23c90190c4_43495670',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '60200d7ae37ea5bea17f7185e1ceed6875c6f13d' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\includes\\announcement.tpl',
      1 => 1773020062,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae23c90190c4_43495670 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div id="announcement-banner" class="venom-gradient-bg">
  <div class="venom-container flex items-center justify-center gap-3 py-2.5 px-10 text-center relative">
        <svg class="hidden h-4 w-4 shrink-0 sm:block" style="color: hsl(var(--accent-primary-foreground) / 0.8);" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="m3 11 18-5v12L3 13v-2z"/><path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/>
    </svg>
    <p class="text-xs font-medium sm:text-sm" style="color: hsl(var(--accent-primary-foreground));">
      🚀 <strong>New:</strong> Check out our latest updates and offers.
      <a href="#pricing" class="underline underline-offset-2 hover:opacity-80">Learn More →</a>
    </p>
    <button onclick="document.getElementById('announcement-banner').style.display='none'"
            class="absolute right-3 top-1/2 -translate-y-1/2 rounded p-1 transition-colors"
            style="color: hsl(var(--accent-primary-foreground) / 0.6);"
            aria-label="Dismiss">
      <svg class="h-3.5 w-3.5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/>
      </svg>
    </button>
  </div>
</div>
<?php }
}
