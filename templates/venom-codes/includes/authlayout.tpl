<section class="mb-4 mb-md-5">
    <div class="venom-shell">
        <div class="venom-diagram-card">
            <div class="row align-items-stretch">
                <div class="col-12 col-lg-7">
                    {if isset($authBadge) && $authBadge}
                        <span class="venom-chip">{$authBadge}</span>
                    {/if}
                    {if isset($authTitle) && $authTitle}
                        <h1 class="h3 font-weight-bold mb-2">{$authTitle}</h1>
                    {/if}
                    {if isset($authSubtitle) && $authSubtitle}
                        <p class="text-muted mb-4">{$authSubtitle}</p>
                    {/if}
                    {$authContent}
                </div>
                {if isset($authAside) && $authAside}
                    <div class="col-12 col-lg-5 mt-4 mt-lg-0">
                        {$authAside}
                    </div>
                {/if}
            </div>
        </div>
    </div>
</section>
