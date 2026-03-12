{include file="$template/includes/flashmessage.tpl"}

<div class="venom-diagram-card mb-4">
    <div class="row align-items-lg-center">
        <div class="col-12 col-lg-8 mb-4 mb-lg-0">
            <span class="venom-chip">Support Intake</span>
            <h1 class="h3 font-weight-bold mb-2">{lang key="createNewSupportRequest"}</h1>
            <p class="text-muted mb-0">Your request has been queued. Continue into the conversation thread to provide updates or attachments.</p>
        </div>
        <div class="col-12 col-lg-4">
            <div class="d-flex flex-wrap justify-content-lg-end">
                <a href="supporttickets.php" class="btn btn-default btn-sm mb-2">
                    <i class="fas fa-list fa-fw"></i>
                    {lang key='navtickets'}
                </a>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-body extra-padding">

        <div class="alert alert-success text-center">
            <strong>
                {lang key='supportticketsticketcreated'}
                <a id="ticket-number" href="viewticket.php?tid={$tid}&amp;c={$c}" class="alert-link">#{$tid}</a>
            </strong>
        </div>

        <div class="row">
            <div class="col-12 col-lg-10 offset-lg-1">
                <p class="mb-0">{lang key='supportticketsticketcreateddesc'}</p>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-primary mr-2 mb-2">
                {lang key='continue'}
                <i class="fas fa-arrow-circle-right"></i>
            </a>
            <a href="supporttickets.php" class="btn btn-default mb-2">
                {lang key='navtickets'}
            </a>
        </div>

    </div>
</div>
