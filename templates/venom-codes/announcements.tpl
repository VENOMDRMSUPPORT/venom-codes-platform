{assign var="announcementCount" value=$announcements|@count}
{assign var="hasAnnouncementPages" value=false}
{if $prevpage || $nextpage}
    {assign var="hasAnnouncementPages" value=true}
{/if}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">{lang key='announcementstitle'}</span>
            <h1 class="h3 font-weight-bold mb-2">Platform Updates &amp; Operational News</h1>
            <p class="text-muted mb-0">Follow VENOM platform announcements, release communications, and operational notices relevant to infrastructure software deployments.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="knowledgebase.php" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-book fa-fw"></i>
                    {lang key='knowledgebasetitle'}
                </a>
                <a href="downloads.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-download fa-fw"></i>
                    {lang key='downloadstitle'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Current Page Items</h3>
                <i class="fas fa-bullhorn text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{$announcementCount}</p>
            <p class="small text-muted mb-0">Announcements visible in the current listing view.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Pagination</h3>
                <i class="fas fa-stream text-muted"></i>
            </div>
            <p class="h4 font-weight-bold mb-1">{if $hasAnnouncementPages}Enabled{else}Single Page{/if}</p>
            <p class="small text-muted mb-0">Navigation state for older and newer announcement entries.</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-4 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Resource Journey</h3>
                <i class="fas fa-route text-muted"></i>
            </div>
            <p class="small text-muted mb-0">Use announcements for updates, then continue to documentation and downloads for implementation details.</p>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header d-flex flex-column flex-lg-row align-items-lg-center justify-content-lg-between">
        <h3 class="card-title m-0 mb-2 mb-lg-0">
            <i class="fas fa-newspaper"></i>
            {lang key="announcementstitle"}
        </h3>
        <span class="badge badge-info">{$announcementCount}</span>
    </div>
    <div class="card-body">
        <div class="announcements mb-0">
            {foreach $announcements as $announcement}
                <div class="announcement">
                    <h1>
                        <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
                            {$announcement.title}
                        </a>
                        {if $announcement.editLink}
                            <a href="{$announcement.editLink}" class="btn btn-default btn-sm show-on-hover">
                                <i class="fas fa-pencil-alt fa-fw"></i>
                                {lang key='edit'}
                            </a>
                        {/if}
                    </h1>

                    <ul class="list-inline">
                        <li class="list-inline-item text-muted pr-3">
                            <i class="far fa-calendar-alt fa-fw"></i>
                            {$carbon->createFromTimestamp($announcement.timestamp)->format('jS F Y')}
                        </li>
                    </ul>

                    <article>
                        {if $announcement.text|strip_tags|strlen < 350}
                            {$announcement.text}
                        {else}
                            {$announcement.summary}
                        {/if}
                    </article>

                    <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="btn btn-default btn-sm">
                        {lang key="announcementscontinue"}
                        <i class="far fa-arrow-right"></i>
                    </a>
                </div>
            {foreachelse}
                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='noannouncements'}" textcenter=true}
            {/foreach}
        </div>
    </div>
</div>

{if $prevpage || $nextpage}
    <nav aria-label="Announcements navigation">
        <ul class="pagination">
            {foreach $pagination as $item}
                <li class="page-item{if $item.disabled} disabled{/if}{if $item.active} active{/if}">
                    <a class="page-link" href="{$item.link}">{$item.text}</a>
                </li>
            {/foreach}
        </ul>
    </nav>
{/if}

{if $announcementsFbRecommend}
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/{lang key='locale'}/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
{/if}
