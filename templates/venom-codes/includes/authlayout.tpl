<section class="venom-auth-section">
    <div class="venom-auth-shell">
        <div class="venom-diagram-card venom-auth-frame">
            <div class="row align-items-stretch venom-auth-grid">
                <div class="col-12 col-xl-7 venom-auth-main">
                    <div class="venom-auth-main__inner">
                        {if isset($authBadge) && $authBadge}
                            <span class="venom-chip">{$authBadge}</span>
                        {/if}
                        {if isset($authTitle) && $authTitle}
                            <h1 class="h3 font-weight-bold mb-2">{$authTitle}</h1>
                        {/if}
                        {if isset($authSubtitle) && $authSubtitle}
                            <p class="text-muted mb-4">{$authSubtitle}</p>
                        {/if}
                        <div class="venom-auth-content">
                            {$authContent}
                        </div>
                    </div>
                </div>
                <div class="col-12 col-xl-5 mt-4 mt-xl-0 venom-auth-side">
                    <div class="venom-auth-side__inner">
                        <article class="venom-auth-story">
                            <h2 class="h5 font-weight-bold mb-2">Enterprise License Access</h2>
                            <p class="text-muted small mb-3">Operate IPTV infrastructure software licenses with controlled account access and clear support channels.</p>
                            <ul class="list-unstyled mb-0">
                                <li><i class="fas fa-user-shield fa-fw"></i> Secure client session controls</li>
                                <li><i class="fas fa-network-wired fa-fw"></i> Infrastructure-focused service visibility</li>
                                <li><i class="fas fa-life-ring fa-fw"></i> Direct support escalation path</li>
                            </ul>
                        </article>
                        {if isset($authAside) && $authAside}
                            <div class="mt-3">
                                {$authAside}
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
