{include file="$template/includes/flashmessage.tpl"}
{assign var="departmentCount" value=$departments|@count}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Support Intake</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key="createNewSupportRequest"}</h1>
            <p class="text-muted mb-0">{lang key='supportticketsheader'}</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="supporttickets.php" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-list fa-fw"></i>
                    {lang key='navtickets'}
                </a>
                <a href="knowledgebase.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-book fa-fw"></i>
                    {lang key='knowledgebasetitle'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Departments</h3>
                <i class="fas fa-sitemap text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$departmentCount}</p>
            <p class="small text-muted mb-0">Routing groups available for your request.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Submission Stage</h3>
                <i class="fas fa-stream text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">1 / 3</p>
            <p class="small text-muted mb-0">Choose department, submit details, then track conversation.</p>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header">
        <h3 class="card-title m-0">
            <i class="fas fa-envelope-open-text"></i>
            Select Support Department
        </h3>
    </div>
    <div class="card-body extra-padding">
        <div class="list-group list-group-flush">
            {foreach $departments as $num => $department}
                <a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}" class="list-group-item list-group-item-action d-block">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <strong>{$department.name}</strong>
                            {if $department.description}
                                <div class="small text-muted mt-1">{$department.description}</div>
                            {/if}
                        </div>
                        <span class="text-muted"><i class="fas fa-arrow-right"></i></span>
                    </div>
                </a>
            {foreachelse}
                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='nosupportdepartments'}" textcenter=true}
            {/foreach}
        </div>
    </div>
</div>
