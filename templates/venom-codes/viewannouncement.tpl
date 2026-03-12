<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">{lang key='announcementstitle'}</span>
            <h1 class="h3 font-weight-bold mb-2">{$title}</h1>
            <p class="text-muted mb-0">Operational update record for VENOM platform services and infrastructure software lifecycle communications.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="{routePath('announcement-index')}" class="btn btn-default btn-sm mr-2 mb-2">
                    <i class="fas fa-arrow-left fa-fw"></i>
                    {lang key='announcementstitle'}
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
    <div class="col-12 col-sm-6 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Published Date</h3>
                <i class="far fa-calendar-alt text-muted"></i>
            </div>
            <p class="small text-muted mb-0">{$carbon->createFromTimestamp($timestamp)->format('l, jS F, Y')}</p>
        </div>
    </div>
    <div class="col-12 col-sm-6 mb-3">
        <div class="venom-plan-card h-100">
            <div class="d-flex align-items-center justify-content-between mb-2">
                <h3 class="h6 font-weight-bold mb-0">Published Time</h3>
                <i class="far fa-clock text-muted"></i>
            </div>
            <p class="small text-muted mb-0">{$carbon->createFromTimestamp($timestamp)->format('H:ia')}</p>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-body extra-padding">
        <h2 class="h3 mb-3">
            {$title}
            {if $twittertweet}
                <span class="float-right">
                    <a href="https://twitter.com/share" class="twitter-share-button" data-count="vertical" data-size="large" data-via="{$twitterusername}">
                        Tweet
                    </a>
                    <script src="https://platform.twitter.com/widgets.js"></script>
                </span>
            {/if}
        </h2>

        <ul class="list-inline">
            <li class="list-inline-item text-muted pr-3">
                <i class="far fa-calendar-alt fa-fw"></i>
                {$carbon->createFromTimestamp($timestamp)->format('l, jS F, Y')}
            </li>
            <li class="list-inline-item text-muted pr-3">
                <i class="far fa-clock fa-fw"></i>
                {$carbon->createFromTimestamp($timestamp)->format('H:ia')}
            </li>
        </ul>

        <article class="py-5 markdown-content">
            {$text}
        </article>

        {if $facebookrecommend}
            <div id="fb-root"></div>
            <script>
                (function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) {
                        return;
                    }
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
            </script>
            <div class="fb-like" data-href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend">
            </div>
        {/if}
    </div>
</div>

{if $facebookcomments}
    <div class="card">
        <div class="card-body p-5">
            <div id="fb-root">
            </div>
            <script>
                (function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) {
                        return;
                    }
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
            </script>
            <fb:comments href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" num_posts="5" width="100%"></fb:comments>
        </div>
    </div>
{/if}

<div class="d-flex flex-wrap justify-content-between">
    <a href="{routePath('announcement-index')}" class="btn btn-default px-4 mb-2 mb-sm-0">
        {lang key='clientareabacklink'}
    </a>

    {if $editLink}
        <a href="{$editLink}" class="btn btn-default px-4">
            <i class="fas fa-pencil-alt fa-fw"></i>
            {lang key='edit'}
        </a>
    {/if}
</div>
