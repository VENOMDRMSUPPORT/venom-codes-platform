<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    <script>
        (function () {
            var defaultTheme = "light";
            var defaultAccentByTheme = {
                light: "violet",
                dark: "violet"
            };
            var theme = defaultTheme;
            var accent = defaultAccentByTheme[defaultTheme];
            var storedTheme = null;
            var storedAccent = null;

            try {
                storedTheme = window.localStorage.getItem("venom_theme");
                storedAccent = window.localStorage.getItem("venom_accent");
            } catch (e) {
                storedTheme = null;
                storedAccent = null;
            }

            if (storedTheme === "light" || storedTheme === "dark") {
                theme = storedTheme;
            }

            if (
                storedAccent === "ocean"
                || storedAccent === "emerald"
                || storedAccent === "crimson"
                || storedAccent === "amber"
                || storedAccent === "violet"
            ) {
                accent = storedAccent;
            } else {
                accent = defaultAccentByTheme[theme] || "violet";
            }

            document.documentElement.setAttribute("data-venom-theme", theme);
            document.documentElement.setAttribute("data-venom-accent", accent);
        })();
    </script>
    {include file="$template/includes/head.tpl"}
    {$headoutput}

    {assign var="isClientShell" value=false}
    {if $loggedin && ($templatefile|substr:0:10 == 'clientarea' || $templatefile == 'account-paymentmethods' || $templatefile == 'account-contacts-manage' || $templatefile == 'account-contacts-new' || $templatefile == 'account-user-management' || $templatefile == 'account-user-permissions' || $templatefile == 'user-profile' || $templatefile == 'user-password' || $templatefile == 'user-security' || $templatefile == 'supportticketslist' || $templatefile == 'supportticketsubmit-stepone' || $templatefile == 'supportticketsubmit-steptwo' || $templatefile == 'supportticketsubmit-confirm' || $templatefile == 'viewticket' || $templatefile == 'masspay' || $templatefile == 'invoice-payment')}
        {assign var="isClientShell" value=true}
    {/if}

    {assign var="venomShellClass" value='venom-shell-public'}
    {if $isClientShell}
        {assign var="venomShellClass" value='venom-shell-client'}
    {/if}

    {assign var="isAuthPage" value=false}
    {if $templatefile == 'login' || $templatefile == 'clientregister' || $templatefile == 'pwreset' || $templatefile == 'password-reset-container' || $templatefile == 'two-factor-login' || $templatefile == 'two-factor-challenge' || $templatefile == 'two-factor-new-backup-code' || $templatefile == 'user-verify-email' || $templatefile == 'password-reset-change-prompt' || $templatefile == 'password-reset-email-prompt' || $templatefile == 'password-reset-security-prompt'}
        {assign var="isAuthPage" value=true}
    {/if}

    {assign var="isClientHomePage" value=false}
    {if $templatefile == 'clientareahome'}
        {assign var="isClientHomePage" value=true}
    {/if}

    {assign var="isClientProductDetailsPage" value=false}
    {if $templatefile == 'clientareaproductdetails'}
        {assign var="isClientProductDetailsPage" value=true}
    {/if}
</head>
<body class="{$venomShellClass}{if $isAuthPage} venom-page-auth{/if}{if $isClientHomePage} venom-page-client-home{/if}{if $isClientProductDetailsPage} venom-page-product-details{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">
    {if $captcha}{$captcha->getMarkup()}{/if}
    {$headeroutput}

    {if $isClientShell}
        {include file="$template/includes/client/header.tpl"}
    {else}
    <header id="header" class="header header-public">
        {if $loggedin}
            <div class="topbar">
                <div class="container">
                    <div class="d-flex">
                        <div class="mr-auto">
                            <button type="button" class="btn" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                                <i class="far fa-flag"></i>
                                {if count($clientAlerts) > 0}
                                    {count($clientAlerts)}
                                    <span class="d-none d-sm-inline">{lang key='notifications'}</span>
                                {else}
                                    <span class="d-sm-none">0</span>
                                    <span class="d-none d-sm-inline">{lang key='nonotifications'}</span>
                                {/if}
                            </button>
                            <div id="accountNotificationsContent" class="w-hidden">
                                <ul class="client-alerts">
                                {foreach $clientAlerts as $alert}
                                    <li>
                                        <a href="{$alert->getLink()}">
                                            <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                            <div class="message">{$alert->getMessage()}</div>
                                        </a>
                                    </li>
                                {foreachelse}
                                    <li class="none">
                                        {lang key='notificationsnone'}
                                    </li>
                                {/foreach}
                                </ul>
                            </div>
                        </div>

                        <div class="ml-auto">
                            <div class="input-group active-client" role="group">
                                <div class="input-group-prepend d-none d-md-inline">
                                    <span class="input-group-text">{lang key='loggedInAs'}:</span>
                                </div>
                                <div class="btn-group">
                                    <a href="{$WEB_ROOT}/clientarea.php?action=details" class="btn btn-active-client">
                                        <span>
                                            {if $client.companyname}
                                                {$client.companyname}
                                            {else}
                                                {$client.fullName}
                                            {/if}
                                        </span>
                                    </a>
                                    <a href="{routePath('user-accounts')}" class="btn" data-toggle="tooltip" data-placement="bottom" title="Switch Account">
                                        <i class="fad fa-random"></i>
                                    </a>
                                    {if $adminMasqueradingAsClient || $adminLoggedIn}
                                        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                                            <i class="fas fa-redo-alt"></i>
                                            <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        <div class="navbar navbar-light">
            <div class="container">
                {include file="$template/includes/venom/logo.tpl" href="{$WEB_ROOT}/index.php" extraClass="mr-3"}

                {if $isAuthPage}
                    {include file="$template/includes/venom/main-header.tpl"}
                {else}
                    <form method="post" action="{routePath('knowledgebase-search')}" class="form-inline ml-auto">
                        <div class="input-group search d-none d-xl-flex">
                            <div class="input-group-prepend">
                                <button class="btn btn-default" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                            <input class="form-control appended-form-control font-weight-light" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                        </div>
                    </form>

                    <ul class="navbar-nav toolbar">
                        <li class="nav-item ml-3">
                            <a class="btn nav-link cart-btn" href="{$WEB_ROOT}/cart.php?a=view">
                                <i class="far fa-shopping-cart fa-fw"></i>
                                <span id="cartItemCount" class="badge badge-info">{$cartitemcount}</span>
                                <span class="sr-only">{lang key="carttitle"}</span>
                            </a>
                        </li>
                        <li class="nav-item ml-3 d-xl-none">
                            <button class="btn nav-link" type="button" data-toggle="collapse" data-target="#mainNavbar">
                                <span class="fas fa-bars fa-fw"></span>
                            </button>
                        </li>
                        <li class="nav-item ml-2 ml-xl-3">
                            <div class="venom-header-theme">
                                {include file="$template/includes/venom/theme-controls.tpl" inHeader=true}
                            </div>
                        </li>
                    </ul>
                {/if}
            </div>
        </div>

        {if !$isAuthPage}
        <div class="navbar navbar-expand-xl main-navbar-wrapper">
            <div class="container">
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <form method="post" action="{routePath('knowledgebase-search')}" class="d-xl-none">
                        <div class="input-group search w-100 mb-2">
                            <div class="input-group-prepend">
                                <button class="btn btn-default" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                            <input class="form-control prepended-form-control" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                        </div>
                    </form>
                    <ul id="nav" class="navbar-nav mr-auto">
                        {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
                    </ul>
                </div>
            </div>
        </div>
        {/if}
    </header>
    {/if}

    {include file="$template/includes/network-issues-notifications.tpl"}

    {if !$isAuthPage}
    <nav class="master-breadcrumb" aria-label="breadcrumb">
        <div class="container">
            {include file="$template/includes/breadcrumb.tpl"}
        </div>
    </nav>
    {/if}

    {include file="$template/includes/validateuser.tpl"}
    {include file="$template/includes/verifyemail.tpl"}

    {if $templatefile == 'homepage'}
        {if $registerdomainenabled || $transferdomainenabled}
            {include file="$template/includes/domain-search.tpl"}
        {/if}
    {/if}

    {if $isClientShell}
        {include file="$template/clientarea.tpl" mode="start"}
    {else}
        <section id="main-body">
            <div class="{if !$skipMainBodyContainer}container{/if}">
                {assign var="showSidebar" value=($templatefile != 'clientregister' && !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren()))}
                <div class="{if $showSidebar}row{/if}">

                {if $showSidebar}
                    <div class="col-lg-4 col-xl-3">
                        <div class="sidebar">
                            {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                        </div>
                        {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                            <div class="d-none d-lg-block sidebar">
                                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                            </div>
                        {/if}
                    </div>
                {/if}
                <div class="{if $showSidebar}col-lg-8 col-xl-9{/if} primary-content">
    {/if}
