{assign var="knowledgebaseCategoryCount" value=0}
{assign var="knowledgebasePopularCount" value=0}
{if $kbcats}
    {assign var="knowledgebaseCategoryCount" value=$kbcats|@count}
{/if}
{if $kbmostviews}
    {assign var="knowledgebasePopularCount" value=$kbmostviews|@count}
{/if}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">{lang key='knowledgebasetitle'}</span>
            <h1 class="h3 font-weight-bold mb-2">Knowledge Base &amp; Documentation Hub</h1>
            <p class="text-muted mb-0">Browse operational documentation, setup guidance, and troubleshooting references for VENOM software infrastructure deployments.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="submitticket.php" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-life-ring fa-fw"></i>
                    {lang key='navopenticket'}
                </a>
                <a href="downloads.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-download fa-fw"></i>
                    {lang key='downloadstitle'}
                </a>
            </div>
        </div>
    </div>
</div>

<form role="form" method="post" action="{routePath('knowledgebase-search')}" class="mb-4">
    <div class="input-group input-group-lg kb-search">
        <input type="text" id="inputKnowledgebaseSearch" name="search" class="form-control font-weight-light" placeholder="{lang key='clientHomeSearchKb'}" />
        <div class="input-group-append">
            <button type="submit" id="btnKnowledgebaseSearch" class="btn btn-primary btn-input-padded-responsive">
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
            <p class="h4 font-weight-bold mb-1">{$knowledgebaseCategoryCount}</p>
            <p class="small text-muted mb-0">Organized documentation sections available in the public library.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Popular Articles</h3>
                <i class="fas fa-star text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$knowledgebasePopularCount}</p>
            <p class="small text-muted mb-0">Most viewed guides frequently used by operations teams.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Support Continuity</h3>
                <i class="fas fa-shield-alt text-muted"></i>
            </div>
            <p class="small text-muted mb-0">Use knowledgebase references first, then escalate to ticket support when issue resolution requires direct intervention.</p>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-2 mb-lg-0">
            <i class="fas fa-book-open"></i>
            Documentation Categories
        </h3>
        <span class="badge badge-info">{$knowledgebaseCategoryCount}</span>
    </div>
    <div class="card-body">
        {if $kbcats}
            <div class="row">
                {foreach $kbcats as $category}
                    <div class="col-xl-6">
                        <div class="card kb-category mb-4 h-100">
                            <a href="{routePath('knowledgebase-category-view', {$category.id}, {$category.urlfriendlyname})}" class="card-body" data-id="{$category.id}">
                                <span class="h5 m-0">
                                    <span class="badge badge-info float-right">
                                        {lang key="knowledgebase.numArticle{if $category.numarticles != 1}s{/if}" num=$category.numarticles}
                                    </span>
                                    <i class="fal fa-folder fa-fw"></i>
                                    {$category.name}
                                    {if $category.editLink}
                                        <button class="btn btn-sm btn-default show-on-card-hover" id="btnEditCategory-{$category.id}" data-url="{$category.editLink}" type="button">
                                            {lang key="edit"}
                                        </button>
                                    {/if}
                                </span>
                                <p class="m-0 text-muted"><small>{$category.description}</small></p>
                            </a>
                        </div>
                    </div>
                {/foreach}
            </div>
        {else}
            {include file="$template/includes/alert.tpl" type="info" msg="{lang key='knowledgebasenoarticles'}" textcenter=true}
        {/if}
    </div>
</div>

{if $kbmostviews}
    <div class="card">
        <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
            <h3 class="card-title m-0 mb-2 mb-lg-0">
                <i class="fal fa-star fa-fw"></i>
                {lang key='knowledgebasepopular'}
            </h3>
            <span class="badge badge-info">{$knowledgebasePopularCount}</span>
        </div>
        <div class="list-group list-group-flush">
            {foreach $kbmostviews as $kbarticle}
                <a href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" class="list-group-item kb-article-item" data-id="{$kbarticle.id}">
                    <i class="fal fa-file-alt fa-fw text-black-50"></i>
                    {$kbarticle.title}
                    {if $kbarticle.editLink}
                        <button class="btn btn-sm btn-default show-on-card-hover" id="btnEditArticle-{$kbarticle.id}" data-url="{$kbarticle.editLink}" type="button">
                            {lang key="edit"}
                        </button>
                    {/if}
                    <small>{$kbarticle.article|truncate:100:"..."}</small>
                </a>
            {/foreach}
        </div>
    </div>
{/if}
