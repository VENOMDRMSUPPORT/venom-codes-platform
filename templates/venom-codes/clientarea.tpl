{* VENOM CODES — Client Area Layout Wrapper
   WHMCS: clientarea.tpl (main wrapper)
   Wrapper type: FULL-DOCUMENT
   Renders sidebar + header, injects page content via $content. *}

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{$pagetitle} - VENOM CODES</title>
  <link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/theme.css">
</head>
<body class="bg-background text-foreground">

<div class="vs-layout-shell">

  {* Sidebar *}
  {include file="$template/includes/client/sidebar.tpl"}

  {* Main content area *}
  <div class="vs-layout-main-col">

    {* Header *}
    {include file="$template/includes/client/header.tpl"}

    {* Page content *}
    <main class="vs-main-content-pad">
      <div class="client-main">
        {$content}
      </div>
    </main>

  </div>
</div>

<script src="{$WEB_ROOT}/templates/{$template}/js/theme-switcher.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/client-sidebar.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/client-tabs.js"></script>

</body>
</html>
