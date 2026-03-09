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

<div style="min-height: 100vh; display: flex; width: 100%;">

  {* Sidebar *}
  {include file="$template/includes/client/sidebar.tpl"}

  {* Main content area *}
  <div style="flex: 1; display: flex; flex-direction: column; min-width: 0;">

    {* Header *}
    {include file="$template/includes/client/header.tpl"}

    {* Page content *}
    <main style="flex: 1; padding: 1rem;">
      <style>@media (min-width: 1024px) { .client-main { padding: 1.5rem !important; } }</style>
      <div class="client-main" style="padding: 1rem;">
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
