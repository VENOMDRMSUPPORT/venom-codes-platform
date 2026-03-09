<?php
/* Smarty version 4.5.3, created on 2026-03-09 02:54:21
  from 'F:\xampp\htdocs\venom-codes.test\client\templates\venom-codes\header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.3',
  'unifunc' => 'content_69ae284dd94754_20890639',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '35576fcb14994e0b4ab8b4a25e0938b157df34d8' => 
    array (
      0 => 'F:\\xampp\\htdocs\\venom-codes.test\\client\\templates\\venom-codes\\header.tpl',
      1 => 1773021259,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69ae284dd94754_20890639 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="<?php echo $_smarty_tpl->tpl_vars['charset']->value;?>
" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title><?php echo $_smarty_tpl->tpl_vars['pagetitle']->value;?>
 - <?php echo $_smarty_tpl->tpl_vars['companyname']->value;?>
</title>
  <?php if ((isset($_smarty_tpl->tpl_vars['metadescription']->value))) {?><meta name="description" content="<?php echo $_smarty_tpl->tpl_vars['metadescription']->value;?>
" /><?php }?>
  <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/<?php echo $_smarty_tpl->tpl_vars['template']->value;?>
/css/theme.css" />
  <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/<?php echo $_smarty_tpl->tpl_vars['template']->value;?>
/css/react-full.css?v=1" />
  <?php echo $_smarty_tpl->tpl_vars['headoutput']->value;?>

</head>
<body class="bg-background text-foreground">

<?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/announcement.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
$_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>

<main class="page-main" style="flex: 1;">
  <div class="venom-container" style="padding: 2rem 1rem;">
<?php }
}
