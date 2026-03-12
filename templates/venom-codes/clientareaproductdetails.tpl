{if $modulecustombuttonresult}
    {if $modulecustombuttonresult == "success"}
        {include file="$template/includes/alert.tpl" type="success" msg="{lang key='moduleactionsuccess'}" textcenter=true idname="alertModuleCustomButtonSuccess"}
    {else}
        {include file="$template/includes/alert.tpl" type="error" msg="{lang key='moduleactionfailed'}"|cat:' ':$modulecustombuttonresult textcenter=true idname="alertModuleCustomButtonFailed"}
    {/if}
{/if}

{if $pendingcancellation}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='cancellationrequestedexplanation'}" textcenter=true idname="alertPendingCancellation"}
{/if}

{if $unpaidInvoice}
    <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
        <div class="float-right">
            <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-xs btn-default">
                {lang key='payInvoice'}
            </a>
        </div>
        {$unpaidInvoiceMessage}
    </div>
{/if}

<div class="tab-content margin-bottom">
    <div class="tab-pane fade show active" role="tabpanel" id="tabOverview">
        {if $tplOverviewTabOutput}
            {$tplOverviewTabOutput}
        {else}

        {assign var="serviceStatusClass" value=$rawstatus|strtolower}
        {assign var="serviceNodeLabel" value=$domain}
        {if !$serviceNodeLabel}
            {if $serverdata && $serverdata.ipaddress}
                {assign var="serviceNodeLabel" value=$serverdata.ipaddress}
            {elseif $dedicatedip}
                {assign var="serviceNodeLabel" value=$dedicatedip}
            {else}
                {assign var="serviceNodeLabel" value='N/A'}
            {/if}
        {/if}

        <div class="venom-diagram-card mb-4">
            <div class="row align-items-lg-center">
                <div class="col-12 col-lg-8 mb-4 mb-lg-0">
                    <span class="venom-chip">Service Details</span>
                    <div class="d-flex flex-column flex-md-row align-items-md-center mb-2">
                        <h1 class="h3 font-weight-bold mb-2 mb-md-0 mr-md-3">{$product}</h1>
                        <span class="label status status-{$serviceStatusClass}">{$status}</span>
                    </div>
                    <p class="text-muted mb-2">{$groupname}</p>
                    <p class="text-muted mb-0">
                        {if $domain}
                            {$domain}
                            <span class="mx-1">&middot;</span>
                        {/if}
                        {lang key='clientareahostingnextduedate'}: {$nextduedate}
                    </p>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="d-flex flex-wrap justify-content-lg-end">
                        {if $packagesupgrade}
                            <a href="upgrade.php?type=package&amp;id={$id}" class="btn btn-success btn-sm mr-2 mb-2">
                                <i class="fas fa-level-up-alt fa-fw"></i>
                                {lang key='upgrade'}
                            </a>
                        {/if}
                        {if $showRenewServiceButton === true}
                            <a href="{routePath('service-renewals-service', $id)}" class="btn btn-primary btn-sm mr-2 mb-2">
                                <i class="fas fa-sync fa-fw"></i>
                                {lang key='renewService.titleSingular'}
                            </a>
                        {/if}
                        {if $showcancelbutton}
                            <a href="clientarea.php?action=cancel&amp;id={$id}" class="btn btn-danger btn-sm mr-2 mb-2 {if $pendingcancellation}disabled{/if}">
                                <i class="fas fa-ban fa-fw"></i>
                                {if $pendingcancellation}
                                    {lang key='cancellationrequested'}
                                {else}
                                    {lang key='clientareacancelrequestbutton'}
                                {/if}
                            </a>
                        {/if}
                        <a href="submitticket.php" class="btn btn-default btn-sm mb-2">
                            <i class="fas fa-life-ring fa-fw"></i>
                            {lang key='navtickets'}
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-12 col-sm-6 col-xl-3 mb-3">
                <div class="venom-plan-card h-100">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h3 class="h6 font-weight-bold mb-0">Service State</h3>
                        <span class="label status status-{$serviceStatusClass}">{$status}</span>
                    </div>
                    <p class="h5 font-weight-bold mb-1">{if $type eq "server"}Infrastructure{else}License{/if}</p>
                    <p class="small text-muted mb-0">Runtime status from the active WHMCS service profile.</p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3 mb-3">
                <div class="venom-plan-card h-100">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h3 class="h6 font-weight-bold mb-0">{lang key='orderbillingcycle'}</h3>
                        <i class="fas fa-calendar-alt text-muted"></i>
                    </div>
                    <p class="h5 font-weight-bold mb-1">{$billingcycle}</p>
                    <p class="small text-muted mb-0">{lang key='orderpaymentmethod'}: {$paymentmethod}</p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3 mb-3">
                <div class="venom-plan-card h-100">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h3 class="h6 font-weight-bold mb-0">{lang key='clientareahostingnextduedate'}</h3>
                        <i class="fas fa-clock text-muted"></i>
                    </div>
                    <p class="h5 font-weight-bold mb-1">{$nextduedate}</p>
                    <p class="small text-muted mb-0">{lang key='clientareahostingregdate'}: {$regdate}</p>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3 mb-3">
                <div class="venom-plan-card h-100">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h3 class="h6 font-weight-bold mb-0">{lang key='recurringamount'}</h3>
                        <i class="fas fa-receipt text-muted"></i>
                    </div>
                    <p class="h5 font-weight-bold mb-1">
                        {if $billingcycle != "{lang key='orderpaymenttermonetime'}" && $billingcycle != "{lang key='orderfree'}"}
                            {$recurringamount}
                        {else}
                            {$firstpaymentamount}
                        {/if}
                    </p>
                    <p class="small text-muted mb-0">
                        {if $firstpaymentamount neq $recurringamount}
                            {lang key='firstpaymentamount'}: {$firstpaymentamount}
                        {else}
                            {lang key='orderpaymentmethod'}: {$paymentmethod}
                        {/if}
                    </p>
                </div>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-12 col-xl-7 mb-4 mb-xl-0">
                <div class="venom-diagram-card h-100">
                    <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between mb-3">
                        <div>
                            <h2 class="h5 font-weight-bold mb-1">Infrastructure Topology</h2>
                            <p class="small text-muted mb-0">Load-distribution summary aligned to your live service metadata.</p>
                        </div>
                        <a href="clientarea.php?action=services" class="btn btn-default btn-sm mt-3 mt-sm-0">
                            <i class="fas fa-server fa-fw"></i>
                            {lang key='clientareanavservices'}
                        </a>
                    </div>
                    <div class="venom-diagram-grid">
                        <div class="venom-main-node-wrap">
                            <article class="venom-main-node">
                                <div class="venom-main-node__icon">
                                    <i class="fas fa-{if $type eq "server"}database{else}shield-alt{/if}"></i>
                                </div>
                                <h4>{$product}</h4>
                                <p>{$serviceNodeLabel}</p>
                            </article>
                        </div>
                        <div class="venom-node-column">
                            <div class="venom-lb-node">EDGE A</div>
                            <div class="venom-lb-node venom-lb-node--muted">{lang key='orderbillingcycle'}: {$billingcycle}</div>
                        </div>
                        <div class="venom-node-column">
                            <div class="venom-lb-node">EDGE B</div>
                            <div class="venom-lb-node venom-lb-node--muted">{lang key='clientareahostingnextduedate'}: {$nextduedate}</div>
                        </div>
                        <div class="venom-node-lines">
                            <span class="venom-line venom-line--v"></span>
                            <span class="venom-line venom-line--h-left"></span>
                            <span class="venom-line venom-line--h-right"></span>
                        </div>
                    </div>
                    <p class="small text-muted mt-3 mb-0">
                        {if $quantitySupported && $quantity > 1}
                            {lang key='quantity'}: {$quantity}
                        {else}
                            Service lifecycle and billing telemetry are synchronized from this account record.
                        {/if}
                    </p>
                </div>
            </div>
            <div class="col-12 col-xl-5">
                <div class="card h-100">
                    <div class="card-header">
                        <h3 class="card-title m-0">
                            <i class="fas fa-cogs"></i>
                            Technical Summary
                        </h3>
                    </div>
                    <div class="list-group list-group-flush">
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <span>{lang key='clientareahostingregdate'}</span>
                            <strong>{$regdate}</strong>
                        </div>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <span>{lang key='orderbillingcycle'}</span>
                            <strong>{$billingcycle}</strong>
                        </div>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <span>{lang key='clientareahostingnextduedate'}</span>
                            <strong>{$nextduedate}</strong>
                        </div>
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            <span>{lang key='orderpaymentmethod'}</span>
                            <strong>{$paymentmethod}</strong>
                        </div>
                        {if $suspendreason}
                            <div class="list-group-item">
                                <strong>{lang key='suspendreason'}:</strong>
                                <div class="text-muted mt-1">{$suspendreason}</div>
                            </div>
                        {/if}
                    </div>
                    <div class="card-footer">
                        <div class="d-flex flex-wrap">
                            {if $domain}
                                <a href="http://{$domain}" class="btn btn-default btn-sm mr-2 mb-2" target="_blank">
                                    <i class="fas fa-external-link-alt fa-fw"></i>
                                    {lang key='visitwebsite'}
                                </a>
                                {if $domainId}
                                    <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-default btn-sm mr-2 mb-2" target="_blank">
                                        <i class="fas fa-globe fa-fw"></i>
                                        {lang key='managedomain'}
                                    </a>
                                {/if}
                            {/if}
                            <a href="supporttickets.php" class="btn btn-default btn-sm mb-2">
                                <i class="fas fa-life-ring fa-fw"></i>
                                {lang key='navtickets'}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            {foreach $hookOutput as $output}
                <div class="mb-4">
                    {$output}
                </div>
            {/foreach}

            {if $domain || $moduleclientarea || $configurableoptions || $customfields || $lastupdate}

                <ul class="nav nav-tabs responsive-tabs-sm">
                    {if $domain}
                        <li class="nav-item">
                            <a href="#domain" data-toggle="tab" class="nav-link active"><i class="fas fa-globe fa-fw"></i> {if $type eq "server"}{lang key='sslserverinfo'}{elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}{lang key='hostingInfo'}{else}{lang key='clientareahostingdomain'}{/if}</a>
                        </li>
                    {elseif $moduleclientarea}
                        <li class="nav-item">
                            <a href="#manage" data-toggle="tab" class="nav-link active"><i class="fas fa-globe fa-fw"></i> {lang key='manage'}</a>
                        </li>
                    {/if}
                    {if $configurableoptions}
                        <li class="nav-item">
                            <a href="#configoptions" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea} active{/if}"><i class="fas fa-cubes fa-fw"></i> {lang key='orderconfigpackage'}</a>
                        </li>
                    {/if}
                    {if $metricStats}
                        <li class="nav-item">
                            <a href="#metrics" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$configurableoptions} active{/if}"><i class="fas fa-chart-line fa-fw"></i> {lang key='metrics.title'}</a>
                        </li>
                    {/if}
                    {if $customfields}
                        <li class="nav-item">
                            <a href="#additionalinfo" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$metricStats && !$configurableoptions} active{/if}"><i class="fas fa-info fa-fw"></i> {lang key='additionalInfo'}</a>
                        </li>
                    {/if}
                    {if $lastupdate}
                        <li class="nav-item">
                            <a href="#resourceusage" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$configurableoptions && !$customfields} active{/if}"><i class="fas fa-inbox fa-fw"></i> {lang key='resourceUsage'}</a>
                        </li>
                    {/if}
                </ul>
                <div class="responsive-tabs-sm-connector"><div class="channel"></div><div class="bottom-border"></div></div>
                <div class="tab-content bg-white product-details-tab-container">
                    {if $domain}
                        <div class="tab-pane fade show active text-center" role="tabpanel" id="domain">
                            {if $type eq "server"}
                                <div class="row">
                                    <div class="col-sm-5 text-right">
                                        <strong>{lang key='serverhostname'}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$domain}
                                    </div>
                                </div>
                                {if $dedicatedip}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='primaryIP'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$dedicatedip}
                                        </div>
                                    </div>
                                {/if}
                                {if $assignedips}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='assignedIPs'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$assignedips|nl2br}
                                        </div>
                                    </div>
                                {/if}
                                {if $ns1 || $ns2}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='domainnameservers'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$ns1}<br />{$ns2}
                                        </div>
                                    </div>
                                {/if}
                            {else}
                                {if $domain}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='orderdomain'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$domain}
                                        </div>
                                    </div>
                                {/if}
                                {if $username}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='serverusername'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$username}
                                        </div>
                                    </div>
                                {/if}
                                {if $serverdata}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='servername'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$serverdata.hostname}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='domainregisternsip'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$serverdata.ipaddress}
                                        </div>
                                    </div>
                                    {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='domainnameservers'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left">
                                                {if $serverdata.nameserver1}{$serverdata.nameserver1} ({$serverdata.nameserver1ip})<br />{/if}
                                                {if $serverdata.nameserver2}{$serverdata.nameserver2} ({$serverdata.nameserver2ip})<br />{/if}
                                                {if $serverdata.nameserver3}{$serverdata.nameserver3} ({$serverdata.nameserver3ip})<br />{/if}
                                                {if $serverdata.nameserver4}{$serverdata.nameserver4} ({$serverdata.nameserver4ip})<br />{/if}
                                                {if $serverdata.nameserver5}{$serverdata.nameserver5} ({$serverdata.nameserver5ip})<br />{/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/if}
                                {if $domain && $sslStatus}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='sslState.sslStatus'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left{if $sslStatus->isInactive()} ssl-inactive{/if}">
                                            <img src="{$sslStatus->getImagePath()}" width="12" data-type="service" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}"/>
                                            <span id="statusDisplayLabel">
                                                {if !$sslStatus->needsResync()}
                                                    {$sslStatus->getStatusDisplayLabel()}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </span>
                                        </div>
                                    </div>
                                    {if $sslStatus->isActive() || $sslStatus->needsResync()}
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='sslState.startDate'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left" id="ssl-startdate">
                                                {if !$sslStatus->needsResync() || $sslStatus->startDate}
                                                    {$sslStatus->startDate->toClientDateFormat()}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='sslState.expiryDate'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left" id="ssl-expirydate">
                                                {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
                                                    {$sslStatus->expiryDate->toClientDateFormat()}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='sslState.issuerName'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left" id="ssl-issuer">
                                                {if !$sslStatus->needsResync() || $sslStatus->issuerName}
                                                    {$sslStatus->issuerName}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/if}
                                <br>
                                <p>
                                    <a href="http://{$domain}" class="btn btn-default" target="_blank">{lang key='visitwebsite'}</a>
                                    {if $domainId}
                                        <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-default" target="_blank">{lang key='managedomain'}</a>
                                    {/if}
                                </p>
                            {/if}
                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                        {if $sslStatus}
                            <div class="tab-pane fade text-center" role="tabpanel" id="ssl-info">
                                {if $sslStatus->isActive()}
                                    <div class="alert alert-success" role="alert">
                                        {lang key='sslActive' expiry=$sslStatus->expiryDate->toClientDateFormat()}
                                    </div>
                                {else}
                                    <div class="alert alert-warning ssl-required" role="alert">
                                        {lang key='sslInactive'}
                                    </div>
                                {/if}
                            </div>
                        {/if}
                    {elseif $moduleclientarea}
                        <div class="tab-pane fade{if !$domain} show active{/if} text-center" role="tabpanel" id="manage">
                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                    {/if}
                    {if $configurableoptions}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea} show active{/if} text-center" role="tabpanel" id="configoptions">
                            {foreach from=$configurableoptions item=configoption}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$configoption.optionname}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {if $configoption.optiontype eq 3}{if $configoption.selectedqty}{lang key='yes'}{else}{lang key='no'}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $metricStats}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions} show active{/if}" role="tabpanel" id="metrics">
                            {include file="$template/clientareaproductusagebilling.tpl"}
                        </div>
                    {/if}
                    {if $customfields}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions && !$metricStats} show active{/if} text-center" role="tabpanel" id="additionalinfo">
                            {foreach from=$customfields item=field}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$field.name}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$field.value}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $lastupdate}
                        <div class="tab-pane fade text-center" role="tabpanel" id="resourceusage">
                            <div class="row">
                                <div class="col-sm-10 offset-sm-1">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h4>{lang key='diskSpace'}</h4>
                                            <input type="text" value="{$diskpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                            <p>{$diskusage}MB / {$disklimit}MB</p>
                                        </div>
                                        <div class="col-sm-6">
                                            <h4>{lang key='bandwidth'}</h4>
                                            <input type="text" value="{$bwpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                            <p>{$bwusage}MB / {$bwlimit}MB</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p class="text-muted mb-0">{lang key='clientarealastupdated'}: {$lastupdate}</p>
                            <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                            <script>
                                jQuery(function() {
                                    jQuery(".dial-usage").knob({
                                        'format': function(v) {
                                            alert(v);
                                        }
                                    });
                                });
                            </script>
                        </div>

                    {/if}
                </div>
            {/if}

        {/if}

    </div>
    <div class="tab-pane fade" role="tabpanel" id="tabDownloads">

        <h3>{lang key='downloadstitle'}</h3>

        {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductDownloadsAvailable"}" textcenter=true}

        <div class="row">
            {foreach from=$downloads item=download}
                <div class="col-10 offset-1">
                    <h4>{$download.title}</h4>
                    <p>
                        {$download.description}
                    </p>
                    <p>
                        <a href="{$download.link}" class="btn btn-default"><i class="fas fa-download"></i> {lang key='downloadname'}</a>
                    </p>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade" id="tabAddons">

        <h3>{lang key='clientareahostingaddons'}</h3>

        {if $addonsavailable}
            {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductAddonsAvailable"}" textcenter=true}
        {/if}

        <div class="row">
            {foreach from=$addons item=addon}
                <div class="col-10 offset-1">
                    <div class="card bg-default card-accent-blue">
                        <div class="card-header">
                            {$addon.name}
                            <div class="float-right label status-{$addon.rawstatus|strtolower}">{$addon.status}</div>
                        </div>
                        <div class="row card-body">
                            <div class="col-md-6">
                                <p>
                                    {$addon.pricing}
                                </p>
                                <p>
                                    {lang key='registered'}: {$addon.regdate}
                                </p>
                                <p>
                                    {lang key='clientareahostingnextduedate'}: {$addon.nextduedate}
                                </p>
                            </div>
                        </div>
                        <div class="card-footer">
                            {$addon.managementActions}
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade" id="tabChangepw">

        <div class="card">
            <div class="card-body">
                <h3 class="card-title">{lang key='serverchangepassword'}</h3>

                {if $modulechangepwresult}
                    {if $modulechangepwresult == "success"}
                        {include file="$template/includes/alert.tpl" type="success" msg=$modulechangepasswordmessage textcenter=true}
                    {elseif $modulechangepwresult == "error"}
                        {include file="$template/includes/alert.tpl" type="error" msg=$modulechangepasswordmessage|strip_tags textcenter=true}
                    {/if}
                {/if}

                <form class="using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw" role="form">
                    <input type="hidden" name="id" value="{$id}" />
                    <input type="hidden" name="modulechangepassword" value="true" />

                    <div id="newPassword1" class="form-group row has-feedback">
                        <label for="inputNewPassword1" class="col-xl-4 col-form-label">{lang key='newpassword'}</label>
                        <div class="col-xl-5">
                            <input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
                            {include file="$template/includes/pwstrength.tpl"}
                        </div>
                        <div class="col-xl-3">
                            <button type="button" class="btn btn-default btn-block generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                {lang key='generatePassword.btnLabel'}
                            </button>
                        </div>
                    </div>
                    <div id="newPassword2" class="form-group row has-feedback">
                        <label for="inputNewPassword2" class="col-xl-4 col-form-label">{lang key='confirmnewpassword'}</label>
                        <div class="col-xl-5">
                            <input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
                            <div id="inputNewPassword2Msg">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-xl-4 col-xl-6">
                            <input class="btn btn-primary" type="submit" value="{lang key='clientareasavechanges'}" />
                            <input class="btn" type="reset" value="{lang key='cancel'}" />
                        </div>
                    </div>

                </form>
            </div>
        </div>

    </div>
</div>
