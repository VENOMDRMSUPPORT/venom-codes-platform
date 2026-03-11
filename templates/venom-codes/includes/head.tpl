{if $templatefile == "homepage"}
<script>
    (function () {
        var defaultTheme = "light";
        var defaultAccentByTheme = {
            light: "ocean",
            dark: "emerald"
        };
        var theme;
        var accent;

        try {
            theme = window.localStorage.getItem("venom_theme");
            accent = window.localStorage.getItem("venom_accent");
        } catch (e) {
            theme = null;
            accent = null;
        }

        if (theme !== "light" && theme !== "dark") {
            theme = defaultTheme;
        }

        if (
            accent !== "ocean"
            && accent !== "emerald"
            && accent !== "crimson"
            && accent !== "amber"
            && accent !== "violet"
        ) {
            accent = defaultAccentByTheme[theme] || "ocean";
        }

        document.documentElement.setAttribute("data-venom-home", "1");
        document.documentElement.setAttribute("data-venom-theme", theme);
        document.documentElement.setAttribute("data-venom-accent", accent);
    })();
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&family=JetBrains+Mono:wght@400;700&family=Montserrat:wght@700;800&display=swap" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/css/venom-homepage.css?v={$versionHash}" rel="stylesheet">
{/if}

<!-- Styling -->
{\WHMCS\View\Asset::fontCssInclude('open-sans-family.css')}
<link href="{$WEB_ROOT}/templates/{$template}/css/theme.css?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/css/flags.css?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/fonts/css/fontawesome.min.css" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-solid.min.css" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-regular.min.css" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-light.min.css" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-brands.min.css" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/fonts/css/fontawesome-duotone.min.css" rel="stylesheet">


<script>
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";
    {if $captcha}{$captcha->getPageJs()}{/if}
</script>
<script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
