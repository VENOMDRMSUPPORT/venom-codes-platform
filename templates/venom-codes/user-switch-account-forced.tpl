<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Identity Access</span>
            <h1 class="h3 font-weight-bold mb-2">Required Account Switch</h1>
            <p class="text-muted mb-0">Your current action requires switching to the account context below before continuing.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="{routePath('user-accounts')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-random fa-fw"></i>
                    Switcher
                </a>
                <a href="{routePath('clientarea-home')}" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-tachometer-alt fa-fw"></i>
                    Dashboard
                </a>
            </div>
        </div>
    </div>
</div>

<div class="card mw-750 mb-4">
    <div class="card-header">
        <h3 class="card-title m-0">{lang key="switchAccount.forcedSwitchRequest"}</h3>
    </div>
    <div class="card-body">
        <div class="venom-plan-card mb-4 text-center">
            <p class="mb-0">
                <strong>
                    {$requiredClient->fullName}
                    {if $requiredClient->companyName}
                        ({$requiredClient->companyName})
                    {/if}
                </strong>
                <br>
                <span class="text-muted">{$requiredClient->email}</span>
            </p>
        </div>
        <form method="post" action="{routePath('user-accounts')}">
            <div class="d-flex flex-column flex-sm-row justify-content-center">
                <input type="hidden" name="id" value="{$requiredClient->id}" >
                <button type="submit" class="btn btn-primary mb-2 mb-sm-0 mr-sm-3">
                    {lang key="continue"}
                    <i class="fas fa-arrow-right"></i>
                </button>
                <a href="{routePath('clientarea-home')}" class="btn btn-default">
                    {lang key="switchAccount.cancelAndReturn"}
                </a>
            </div>
        </form>
    </div>
</div>
