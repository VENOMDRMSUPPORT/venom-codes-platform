<header id="header" class="header header-client">
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
                                        <span class="d-none d-md-inline-block">{lang key='admin.returnToAdmin'}</span>
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
            <a class="navbar-brand mr-3" href="{$WEB_ROOT}/clientarea.php">
                {if $assetLogoPath}
                    <img src="{$assetLogoPath}" alt="{$companyname}" class="logo-img">
                {else}
                    {$companyname}
                {/if}
            </a>

            <ul class="navbar-nav toolbar flex-row align-items-center ml-auto">
                <li class="nav-item">
                    <a class="btn nav-link" href="{$WEB_ROOT}/clientarea.php">{lang key='clientareanavhome'}</a>
                </li>
                <li class="nav-item ml-2">
                    <a class="btn nav-link" href="{$WEB_ROOT}/clientarea.php?action=services">{lang key='clientareanavservices'}</a>
                </li>
                <li class="nav-item ml-2">
                    <a class="btn nav-link" href="{$WEB_ROOT}/clientarea.php?action=invoices">{lang key='navinvoices'}</a>
                </li>
                <li class="nav-item ml-2">
                    <a class="btn nav-link" href="{$WEB_ROOT}/supporttickets.php">{lang key='navtickets'}</a>
                </li>
            </ul>
        </div>
    </div>
</header>
