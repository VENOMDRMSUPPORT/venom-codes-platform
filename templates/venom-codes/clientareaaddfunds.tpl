{if $addfundsdisabled}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='clientareaaddfundsdisabled'}" textcenter=true}
{elseif $notallowed}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='clientareaaddfundsnotallowed'}" textcenter=true}
{elseif $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}
{/if}

{if !$addfundsdisabled}
    {assign var="gatewayCount" value=$gateways|@count}

    <div class="venom-diagram-card mb-4">
        <div class="row align-items-lg-center">
            <div class="col-12 col-lg-8 mb-4 mb-lg-0">
                <span class="venom-chip">Billing Credit</span>
                <h1 class="h3 font-weight-bold mb-2">{lang key='addfunds'}</h1>
                <p class="text-muted mb-0">Add account credit for faster invoice settlement and uninterrupted software licensing operations.</p>
            </div>
            <div class="col-12 col-lg-4">
                <div class="d-flex flex-wrap justify-content-lg-end">
                    <a href="clientarea.php?action=invoices" class="btn btn-default btn-sm mr-2 mb-2">
                        <i class="fas fa-file-invoice-dollar fa-fw"></i>
                        {lang key='invoices'}
                    </a>
                    <a href="{routePath('account-paymentmethods')}" class="btn btn-default btn-sm mb-2">
                        <i class="fas fa-credit-card fa-fw"></i>
                        {lang key='paymentMethods.title'}
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-12 col-md-4 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">{lang key='addfundsminimum'}</h3>
                    <i class="fas fa-arrow-down text-muted"></i>
                </div>
                <p class="h4 font-weight-bold mb-1">{$minimumamount}</p>
                <p class="small text-muted mb-0">Minimum credit top-up amount for this account.</p>
            </div>
        </div>
        <div class="col-12 col-md-4 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">{lang key='addfundsmaximum'}</h3>
                    <i class="fas fa-arrow-up text-muted"></i>
                </div>
                <p class="h4 font-weight-bold mb-1">{$maximumamount}</p>
                <p class="small text-muted mb-0">Maximum allowed amount for a single credit transaction.</p>
            </div>
        </div>
        <div class="col-12 col-md-4 mb-3">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">{lang key='addfundsmaximumbalance'}</h3>
                    <i class="fas fa-wallet text-muted"></i>
                </div>
                <p class="h4 font-weight-bold mb-1">{$maximumbalance}</p>
                <p class="small text-muted mb-0">Maximum account-credit balance threshold enforced by billing policy.</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-8 mb-4">
            <div class="card h-100">
                <div class="card-header">
                    <h3 class="card-title m-0">{lang key='addfunds'}</h3>
                </div>
                <div class="card-body">
                    <form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds">
                        <fieldset>
                            <div class="form-group">
                                <label for="amount" class="col-form-label">{lang key='addfundsamount'}:</label>
                                <input type="text" name="amount" id="amount" value="{$amount}" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label for="paymentmethod" class="col-form-label">{lang key='orderpaymentmethod'}:</label><br/>
                                <select name="paymentmethod" id="paymentmethod" class="form-control custom-select">
                                    {foreach $gateways as $gateway}
                                        <option value="{$gateway.sysname}">{$gateway.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">
                                {lang key='addfunds'}
                            </button>
                        </fieldset>
                    </form>
                </div>
                <div class="card-footer">
                    <small>{lang key='addfundsnonrefundable'}</small>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-4 mb-4">
            <div class="venom-plan-card h-100">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h3 class="h6 font-weight-bold mb-0">Gateway Availability</h3>
                    <i class="fas fa-university text-muted"></i>
                </div>
                <p class="h4 font-weight-bold mb-1">{$gatewayCount}</p>
                <p class="small text-muted mb-0">Payment gateways currently enabled for adding account credit.</p>
            </div>
        </div>
    </div>
{/if}
