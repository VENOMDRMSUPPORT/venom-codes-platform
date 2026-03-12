{assign var="downloadCategoryCount" value=0}
{assign var="popularDownloadCount" value=0}
{if $dlcats}
    {assign var="downloadCategoryCount" value=$dlcats|@count}
{/if}
{if $mostdownloads}
    {assign var="popularDownloadCount" value=$mostdownloads|@count}
{/if}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">{lang key='downloadstitle'}</span>
            <h1 class="h3 font-weight-bold mb-2">Downloads &amp; Resource Library</h1>
            <p class="text-muted mb-0">Access deployment packages, operational tools, and documentation resources for VENOM software infrastructure environments.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="knowledgebase.php" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-book fa-fw"></i>
                    {lang key='knowledgebasetitle'}
                </a>
                <a href="{routePath('announcement-index')}" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-bullhorn fa-fw"></i>
                    {lang key='announcementstitle'}
                </a>
            </div>
        </div>
    </div>
</div>

<form role="form" method="post" action="{routePath('download-search')}" class="mb-4">
    <div class="input-group input-group-lg kb-search margin-bottom">
        <input type="text" name="search" id="inputDownloadsSearch" class="form-control font-weight-light" placeholder="{lang key='downloadssearch'}" />
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
                <h3 class="h6 font-weight-bold mb-0">Categories</h3>
                <i class="fas fa-folder-open text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$downloadCategoryCount}</p>
            <p class="small text-muted mb-0">Resource categories currently available in the public downloads hub.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Popular Items</h3>
                <i class="fas fa-star text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$popularDownloadCount}</p>
            <p class="small text-muted mb-0">Most requested downloads across the current catalog.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Resource Flow</h3>
                <i class="fas fa-route text-muted"></i>
            </div>
            <p class="small text-muted mb-0">Navigate from resource catalogs into category-specific file listings while preserving direct download actions.</p>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-2 mb-lg-0">
            <i class="fas fa-folder-open"></i>
            Download Categories
        </h3>
        <span class="badge badge-info">{$downloadCategoryCount}</span>
    </div>
    <div class="card-body">
        {if $dlcats}
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
        {else}
            {include file="$template/includes/alert.tpl" type="info" msg="{lang key='downloadsnone'}" textcenter=true}
        {/if}
    </div>
</div>

{if $mostdownloads}
    <div class="card">
        <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
            <h3 class="card-title m-0 mb-2 mb-lg-0">
                <i class="fal fa-star fa-fw"></i>
                {lang key='downloadspopular'}
            </h3>
            <span class="badge badge-info">{$popularDownloadCount}</span>
        </div>
        <div class="list-group list-group-flush">
            {foreach $mostdownloads as $download}
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
            {/foreach}
        </div>
    </div>
{/if}
