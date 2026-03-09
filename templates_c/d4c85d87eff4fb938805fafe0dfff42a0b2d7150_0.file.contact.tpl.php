<?php
/* Smarty version 4.5.3, created on 2026-03-09 02:54:35
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\contact.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae285bb2dd67_94365476',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd4c85d87eff4fb938805fafe0dfff42a0b2d7150' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\contact.tpl',
      1 => 1773020062,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae285bb2dd67_94365476 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div style="max-width: 40rem; margin: 0 auto;">

    <div style="margin-bottom: 2rem; text-align: center;">
    <div style="margin: 0 auto 1rem; display: inline-flex; height: 3rem; width: 3rem; align-items: center; justify-content: center; border-radius: 0.75rem; background: hsl(var(--accent-muted));">
      <svg class="h-6 w-6 text-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
    </div>
    <h1 class="font-display" style="font-size: 1.5rem; font-weight: 700; letter-spacing: -0.025em;">Contact Us</h1>
    <p class="text-sm text-muted-foreground" style="margin-top: 0.5rem;">Have a question or need help? Send us a message.</p>
  </div>

    <div style="border-radius: 0.75rem; border: 1px solid hsl(var(--border)); background: hsl(var(--card)); padding: 1.5rem;">

    <?php if ($_smarty_tpl->tpl_vars['sent']->value) {?>
      <div class="alert-success" style="border-radius: 0.5rem; padding: 1rem; margin-bottom: 1rem; background: hsl(160 84% 39% / 0.1); border: 1px solid hsl(160 84% 39% / 0.2); color: hsl(160 84% 39%);">
        <p style="font-size: 0.875rem; font-weight: 500;">Your message has been sent successfully. We'll get back to you soon.</p>
      </div>
    <?php }?>

    <form method="post" action="<?php echo routePath('contact-us');?>
" style="display: flex; flex-direction: column; gap: 1.25rem;">
      <input type="hidden" name="token" value="<?php echo $_smarty_tpl->tpl_vars['token']->value;?>
" />

      <div>
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Your Name</label>
        <input type="text" name="name" value="<?php echo $_smarty_tpl->tpl_vars['name']->value;?>
" class="venom-input" placeholder="John Doe" required />
      </div>

      <div>
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Email Address</label>
        <input type="email" name="email" value="<?php echo $_smarty_tpl->tpl_vars['email']->value;?>
" class="venom-input" placeholder="you@example.com" required />
      </div>

      <div>
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Subject</label>
        <input type="text" name="subject" value="<?php echo $_smarty_tpl->tpl_vars['subject']->value;?>
" class="venom-input" placeholder="How can we help?" required />
      </div>

      <div>
        <label style="display: block; margin-bottom: 0.375rem; font-size: 0.875rem; font-weight: 500;">Message</label>
        <textarea name="message" class="venom-input" rows="6" placeholder="Tell us more…" required style="resize: vertical;"><?php echo $_smarty_tpl->tpl_vars['message']->value;?>
</textarea>
      </div>

      <?php if ($_smarty_tpl->tpl_vars['captcha']->value) {?>
        <div><?php echo $_smarty_tpl->tpl_vars['captcha']->value;?>
</div>
      <?php }?>

      <button type="submit" class="venom-btn-primary" style="width: 100%; padding: 0.75rem;">
        <svg class="h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
        Send Message
      </button>
    </form>
  </div>

</div>
<?php }
}
