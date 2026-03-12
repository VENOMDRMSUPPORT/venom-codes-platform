<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Identity Access</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key='oops'}! {lang key='subaccountpermissiondenied'}</h1>
            <p class="text-muted mb-0">Your active identity does not currently have permission for this action in the selected account context.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="{routePath('user-accounts')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-random fa-fw"></i>
                    Switch Account
                </a>
                <a href="index.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-home fa-fw"></i>
                    {lang key='returnhome'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="text-center">
    <div class="card py-3 mb-4">
        <div class="card-body">
            <h2 class="h3 mb-3">{lang key='subaccountpermissiondenied'}</h2>
            {if !empty($allowedpermissions)}
                <div class="mb-2">{lang key='subaccountallowedperms'}</div>
                <div class="list-group list-group-flush mb-3">
                    {foreach $allowedpermissions as $permission}
                        <div class="list-group-item">{$permission}</div>
                    {/foreach}
                </div>
            {/if}
            <div>{lang key='subaccountcontactmaster'}</div>
        </div>
        <div class="buttons pt-2 pb-4">
            <a href="javascript:history.go(-1)" class="btn btn-primary">
                <i class="fas fa-arrow-circle-left"></i>
                {lang key='goback'}
            </a>
            <a href="index.php" class="btn btn-default">
                <i class="fas fa-home"></i>
                {lang key='returnhome'}
            </a>
        </div>
    </div>
</div>
