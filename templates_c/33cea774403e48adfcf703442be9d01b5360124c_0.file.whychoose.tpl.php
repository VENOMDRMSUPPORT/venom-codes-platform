<?php
/* Smarty version 4.5.3, created on 2026-03-09 02:35:05
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\includes\landing\whychoose.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae23c9bea9d8_87771550',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '33cea774403e48adfcf703442be9d01b5360124c' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\includes\\landing\\whychoose.tpl',
      1 => 1773020062,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae23c9bea9d8_87771550 (Smarty_Internal_Template $_smarty_tpl) {
?>
<section class="venom-section bg-background">
  <div class="venom-container">
    <div class="why-grid" style="display: grid; align-items: center; gap: 4rem; grid-template-columns: repeat(1, 1fr);">

      <div class="animate-fade-in-left">
        <span class="venom-badge" style="margin-bottom: 1rem;">Why VENOM CODES</span>
        <h2 class="font-display" style="font-size: 1.875rem; font-weight: 700; letter-spacing: -0.025em; margin-top: 1rem;">
          Infrastructure You Can Trust
        </h2>
        <p class="text-muted-foreground" style="margin-top: 1rem; line-height: 1.625;">
          We don't just sell licenses — we provide the backbone for your production environment.
          Built by engineers, for engineers.
        </p>
      </div>

      <div class="animate-fade-in-right" style="display: flex; flex-direction: column; gap: 1rem;">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, array('Zero-downtime license transitions and upgrades','Hardware-bound keys prevent unauthorized sharing','Dedicated infrastructure, not shared tenancy','Transparent pricing with no hidden fees','Technical support available around the clock','Secure infrastructure and processes'), 'reason');
$_smarty_tpl->tpl_vars['reason']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['reason']->value) {
$_smarty_tpl->tpl_vars['reason']->do_else = false;
?>
          <div style="display: flex; align-items: flex-start; gap: 0.75rem; border-radius: 0.5rem; background: hsl(var(--card)); border: 1px solid hsl(var(--border)); padding: 1rem;">
            <svg class="h-5 w-5 text-primary" style="margin-top: 2px; flex-shrink: 0;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
            <span class="text-sm font-medium"><?php echo $_smarty_tpl->tpl_vars['reason']->value;?>
</span>
          </div>
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
      </div>

    </div>

    <style>
      @media (min-width: 1024px) {
        .why-grid { grid-template-columns: repeat(2, 1fr) !important; }
      }
    </style>
  </div>
</section><?php }
}
