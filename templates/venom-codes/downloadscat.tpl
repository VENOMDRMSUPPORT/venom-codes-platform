{assign var="downloadSubcategoryCount" value=0}
{assign var="downloadFileCount" value=0}
{if $dlcats}
    {assign var="downloadSubcategoryCount" value=$dlcats|@count}
{/if}
{if $downloads}
    {assign var="downloadFileCount" value=$downloads|@count}
{/if}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">{lang key='downloadstitle'}</span>
            <h1 class="h3 font-weight-bold mb-2">
                {if $kbcat.name}
                    {$kbcat.name}
                {else}
                    {lang key='downloadstitle'}
                {/if}
            </h1>
            <p class="text-muted mb-0">Category-level resource index with direct access to downloadable files, supporting metadata, and nested catalog navigation.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="downloads.php" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-download fa-fw"></i>
                    {lang key='downloadstitle'}
                </a>
                <a href="knowledgebase.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-book fa-fw"></i>
                    {lang key='knowledgebasetitle'}
                </a>
            </div>
        </div>
    </div>
</div>

<form role="form" method="post" action="{routePath('download-search')}" class="mb-4">
    <div class="input-group input-group-lg kb-search margin-bottom">
        <input type="text" name="search" id="inputDownloadsSearch" class="form-control font-weight-light" placeholder="{lang key='downloadssearch'}" value="{$search}" />
        <div class="input-group-append">
            <button type="submit" id="btnDownloadsSearch" class="btn btn-primary btn-input-padded-responsive">
                {lang key='search'}
            </button>
        </div>
    </div>
</form>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Subcategories</h3>
                <i class="fas fa-sitemap text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$downloadSubcategoryCount}</p>
            <p class="small text-muted mb-0">Nested resource groups under the current downloads category.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Files Listed</h3>
                <i class="fas fa-file-download text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$downloadFileCount}</p>
            <p class="small text-muted mb-0">Downloadable resources currently visible in this category view.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Category Scope</h3>
                <i class="fas fa-layer-group text-muted"></i>
            </div>
            <p class="small text-muted mb-0">Maintain route continuity from downloads hub into category-level assets and related metadata.</p>
        </div>
    </div>
</div>

{if $dlcats}
    <div class="card mb-4">
        <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
            <h3 class="card-title m-0 mb-2 mb-lg-0">
                <i class="fas fa-folder-open"></i>
                Download Categories
            </h3>
            <span class="badge badge-info">{$downloadSubcategoryCount}</span>
        </div>
        <div class="card-body">
            <div class="row">
                {foreach $dlcats as $category}
                    <div class="col-xl-6">
                        <div class="card kb-category mb-4 h-100">
                            <a href="{routePath('download-by-cat', {$category.id}, {$category.urlfriendlyname})}" class="card-body">
                                <span class="h5 m-0">
                                    <i class="fal fa-folder fa-fw"></i>
                                    {$category.name}
                                    <span class="badge badge-info float-right">
                                        {lang key="downloads.numDownload{if $kbcat.numarticles != 1}s{/if}" num=$category.numarticles}
                                    </span>
                                </span>
                                <p class="m-0 text-muted"><small>{$category.description}</small></p>
                            </a>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
{/if}

<div class="card mb-4">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-2 mb-lg-0">
            <i class="fal fa-download fa-fw"></i>
            {lang key='downloadsfiles'}
        </h3>
        <span class="badge badge-info">{$downloadFileCount}</span>
    </div>
    <div class="list-group list-group-flush">
        {foreach $downloads as $download}
            <a href="{$download.link}" class="list-group-item kb-article-item">
                {$download.type|replace:'alt':' class="pr-1" alt'}
                {$download.title}
                {if $download.clientsonly}
                    <div class="float-md-right">
                        <span class="label label-danger">
                            <i class="fas fa-lock fa-fw"></i>
                            {lang key='restricted'}
                        </span>
                    </div>
                {/if}
                <small>
                    {$download.description}
                    <br>
                    <strong>{lang key='downloadsfilesize'}: {$download.filesize}</strong>
                </small>
            </a>
        {foreachelse}
            <div class="list-group-item">
                {lang key='downloadsnone'}
            </div>
        {/foreach}
    </div>
</div>

<a href="javascript:history.go(-1)" class="btn btn-default px-4">
    {lang key='clientareabacklink'}
</a>
