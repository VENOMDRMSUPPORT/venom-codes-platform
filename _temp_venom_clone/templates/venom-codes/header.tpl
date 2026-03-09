{* VENOM CODES — Root Header (document opener) *}

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="{$charset}" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>{$pagetitle} - {$companyname}</title>
  {if isset($metadescription)}<meta name="description" content="{$metadescription}" />{/if}
  <link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/theme.css" />
  {$headoutput}
</head>
<body class="bg-background text-foreground">

{include file="$template/includes/announcement.tpl"}
{include file="$template/includes/header.tpl"}

<main class="page-main" style="flex: 1;">
  <div class="venom-container" style="padding: 2rem 1rem;">
