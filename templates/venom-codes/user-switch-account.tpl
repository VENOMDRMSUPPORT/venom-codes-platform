{assign var="totalAccounts" value=$accounts->count()}
{assign var="ownerAccounts" value=0}
{assign var="closedAccounts" value=0}
{foreach $accounts as $account}
    {if $account->authedUserIsOwner()}
        {assign var="ownerAccounts" value=$ownerAccounts+1}
    {/if}
    {if $account->status == 'Closed'}
        {assign var="closedAccounts" value=$closedAccounts+1}
    {/if}
{/foreach}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Identity Access</span>
            <h1 class="h3 font-weight-bold mb-2">Account Switching</h1>
            <p class="text-muted mb-0">Select the account context you want to operate in for billing, services, and support actions.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="{routePath('clientarea-home')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-tachometer-alt fa-fw"></i>
                    Dashboard
                </a>
                <a href="{routePath('cart-index')}" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-shopping-cart fa-fw"></i>
                    {lang key="shopNow"}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Available Accounts</h3>
                <i class="fas fa-users text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$totalAccounts}</p>
            <p class="small text-muted mb-0">Accounts currently linked to your authenticated user.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Owner Access</h3>
                <i class="fas fa-user-shield text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$ownerAccounts}</p>
            <p class="small text-muted mb-0">Accounts where your identity has owner-level permissions.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Closed Accounts</h3>
                <span class="label status status-pending">Closed</span>
            </div>
            <p class="h4 font-weight-bold mb-1">{$closedAccounts}</p>
            <p class="small text-muted mb-0">Unavailable account contexts that cannot be selected.</p>
        </div>
    </div>
</div>

<div class="card mw-750 mb-4">
    <div class="card-header">
        <h3 class="card-title m-0">Select Account Context</h3>
    </div>
    <div class="card-body">
        {include file="$template/includes/flashmessage.tpl"}

        {if $accounts->count() == 0}
            <p>{lang key="switchAccount.noneFound"}</p>
            <p>{lang key="switchAccount.createInstructions"}</p>
            <p class="mb-0">
                <a href="{routePath('cart-index')}" class="btn btn-default">
                    {lang key="shopNow"}
                </a>
            </p>
        {else}
            <p>{lang key="switchAccount.choose"}</p>

            <div class="select-account">
                {foreach $accounts as $account}
                    <a href="#" data-id="{$account->id}"{if $account->status == 'Closed'} class="disabled"{/if}>
                        {$account->displayName}
                        {if $account->authedUserIsOwner()}
                            <span class="label label-info">{lang key="clientOwner"}</span>
                        {/if}
                        {if $account->status == 'Closed'}
                            <span class="label label-default">{$account->status}</span>
                        {/if}
                    </a>
                {/foreach}
            </div>
        {/if}
    </div>
</div>

<form method="post" action="{routePath('user-accounts')}">
    <input type="hidden" name="id" value="" id="inputSwitchAcctId">
</form>

<script>
    $(document).ready(function() {
        $('.select-account a').click(function(e) {
            e.preventDefault();
            $('#inputSwitchAcctId').val($(this).data('id'))
                .parent('form').submit();
        });
    });
</script>
