{assign var="relatedArticleCount" value=0}
{if $kbarticles}
    {assign var="relatedArticleCount" value=$kbarticles|@count}
{/if}

{if $kbarticle.voted}
    {include file="$template/includes/alert.tpl" type="success alert-bordered-left" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
{/if}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">{lang key='knowledgebasetitle'}</span>
            <h1 class="h3 font-weight-bold mb-2">{$kbarticle.title}</h1>
            <p class="text-muted mb-0">Read technical documentation details and apply the article guidance directly to your infrastructure and licensing workflow.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="#" class="btn btn-default btn-sm mr-2 mb-2" onclick="window.print();return false">
                    <i class="fas fa-print"></i>
                    {lang key='print'}
                </a>
                <a href="knowledgebase.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-book fa-fw"></i>
                    {lang key='knowledgebasetitle'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-body">
        <ul class="list-inline mb-4">
            {if $kbarticle.tags}
                <li class="list-inline-item pr-3 mb-2 mb-md-0">
                    <span class="badge badge-pill badge-info">
                        <i class="fas fa-code mr-1"></i>
                        {$kbarticle.tags}
                    </span>
                </li>
            {/if}
            <li class="list-inline-item text-sm pr-3 text-muted mb-2 mb-md-0">
                <i class="fas fa-thumbs-up mr-2"></i>
                {$kbarticle.useful}
            </li>
        </ul>

        <article class="markdown-content">
            {$kbarticle.text}
        </article>

        {if !$kbarticle.voted}
            <hr>
            <h4 class="mb-3">{lang key='knowledgebasehelpful'}</h4>
            <form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post" class="d-flex flex-wrap align-items-center justify-content-between">
                <input type="hidden" name="useful" value="vote">
                <div class="d-flex flex-wrap">
                    <button class="btn btn-sm btn-secondary px-4 mr-2 mb-2" type="submit" name="vote" value="yes">
                        <i class="fas fa-thumbs-up"></i>
                        {lang key='knowledgebaseyes'}
                    </button>
                    <button class="btn btn-sm btn-secondary px-4 mb-2" type="submit" name="vote" value="no">
                        <i class="fas fa-thumbs-down"></i>
                        {lang key='knowledgebaseno'}
                    </button>
                </div>
            </form>
        {/if}
    </div>
</div>

{if $kbarticles}
    <div class="card mb-4">
        <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
            <h3 class="card-title m-0 mb-2 mb-lg-0">
                <i class="fal fa-folder-open fa-fw"></i>
                {lang key='knowledgebaserelated'}
            </h3>
            <span class="badge badge-info">{$relatedArticleCount}</span>
        </div>
        <div class="list-group list-group-flush">
            {foreach $kbarticles as $relatedArticle}
                <a href="{routePath('knowledgebase-article-view', {$relatedArticle.id}, {$relatedArticle.urlfriendlytitle})}" class="list-group-item kb-article-item" data-id="{$relatedArticle.id}">
                    <i class="fal fa-file-alt fa-fw text-black-50"></i>
                    {$relatedArticle.title}
                    {if $relatedArticle.editLink}
                        <button class="btn btn-sm btn-default show-on-card-hover" id="btnEditArticle-{$relatedArticle.id}" data-url="{$relatedArticle.editLink}" type="button">
                            {lang key="edit"}
                        </button>
                    {/if}
                    <small>{$relatedArticle.article|truncate:100:"..."}</small>
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

    {if $kbarticle.editLink}
        <a href="{$kbarticle.editLink}" class="btn btn-default px-4">
            <i class="fas fa-pencil-alt fa-fw"></i>
            {lang key='edit'}
        </a>
    {/if}
</div>
