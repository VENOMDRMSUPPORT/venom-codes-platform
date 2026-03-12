{assign var="kbCategoryCount" value=0}
{assign var="kbArticleCount" value=0}
{if $kbcats}
    {assign var="kbCategoryCount" value=$kbcats|@count}
{/if}
{if $kbarticles}
    {assign var="kbArticleCount" value=$kbarticles|@count}
{/if}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">{lang key='knowledgebasetitle'}</span>
            <h1 class="h3 font-weight-bold mb-2">
                {if $kbcurrentcat.name}
                    {$kbcurrentcat.name}
                {elseif $tag}
                    {lang key='kbviewingarticlestagged'} '{$tag}'
                {else}
                    {lang key='knowledgebasetitle'}
                {/if}
            </h1>
            <p class="text-muted mb-0">Review category-specific documentation and navigate into detailed operation articles using the same route-aware knowledgebase flow.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="knowledgebase.php" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-book fa-fw"></i>
                    {lang key='knowledgebasetitle'}
                </a>
                <a href="submitticket.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-life-ring fa-fw"></i>
                    {lang key='navopenticket'}
                </a>
            </div>
        </div>
    </div>
</div>

<form role="form" method="post" action="{routePath('knowledgebase-search')}" class="mb-4">
    <div class="input-group input-group-lg kb-search">
        <input type="text" id="inputKnowledgebaseSearch" name="search" class="form-control font-weight-light" placeholder="{lang key='clientHomeSearchKb'}" value="{$searchterm}" />
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
                <h3 class="h6 font-weight-bold mb-0">Subcategories</h3>
                <i class="fas fa-sitemap text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$kbCategoryCount}</p>
            <p class="small text-muted mb-0">Child sections available for deeper documentation navigation.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Articles</h3>
                <i class="fas fa-file-alt text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$kbArticleCount}</p>
            <p class="small text-muted mb-0">Published entries currently available in this view.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">View Mode</h3>
                <i class="fas fa-filter text-muted"></i>
            </div>
            <p class="small text-muted mb-0">
                {if $tag}
                    {lang key='kbviewingarticlestagged'} '{$tag}'
                {else}
                    Standard category listing with article previews.
                {/if}
            </p>
        </div>
    </div>
</div>

{if $kbcats}
    <div class="card mb-4">
        <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
            <h3 class="card-title m-0 mb-2 mb-lg-0">
                <i class="fas fa-folder-open"></i>
                Category Navigation
            </h3>
            <span class="badge badge-info">{$kbCategoryCount}</span>
        </div>
        <div class="card-body">
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
        </div>
    </div>
{/if}

{if $kbarticles || !$kbcats}
    <div class="card mb-4">
        <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
            <h3 class="card-title m-0 mb-2 mb-lg-0">
                <i class="fal fa-folder-open fa-fw"></i>
                {if $tag}
                    {lang key='kbviewingarticlestagged'} '{$tag}'
                {else}
                    {lang key='knowledgebasearticles'}
                {/if}
            </h3>
            <span class="badge badge-info">{$kbArticleCount}</span>
        </div>
        <div class="list-group list-group-flush">
            {foreach $kbarticles as $categoryArticle}
                <a href="{routePath('knowledgebase-article-view', {$categoryArticle.id}, {$categoryArticle.urlfriendlytitle})}" class="list-group-item kb-article-item" data-id="{$categoryArticle.id}">
                    <i class="fal fa-file-alt fa-fw text-black-50"></i>
                    {$categoryArticle.title}
                    {if $categoryArticle.editLink}
                        <button class="btn btn-sm btn-default show-on-card-hover" id="btnEditArticle-{$categoryArticle.id}" data-url="{$categoryArticle.editLink}" type="button">
                            {lang key="edit"}
                        </button>
                    {/if}
                    <small>{$categoryArticle.article|truncate:100:"..."}</small>
                </a>
            {foreachelse}
                <div class="list-group-item">
                    {lang key='knowledgebasenoarticles'}
                </div>
            {/foreach}
        </div>
    </div>
{/if}

<div class="d-flex flex-wrap justify-content-between">
    <a href="javascript:history.go(-1)" class="btn btn-default px-4 mb-2 mb-sm-0">
        {lang key='clientareabacklink'}
    </a>

    {if $kbcurrentcat.editLink}
        <a href="{$kbcurrentcat.editLink}" class="btn btn-default px-4">
            <i class="fas fa-pencil-alt fa-fw"></i>
            {lang key='edit'}
        </a>
    {/if}
</div>
