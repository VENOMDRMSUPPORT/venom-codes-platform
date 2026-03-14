<!-- Unified Auth Controls Header (Shared between Homepage and Auth Pages) -->
<div class="d-flex align-items-center ml-auto mb-0 venom-auth-nav-inline">
    <a class="btn venom-btn venom-btn--solid venom-auth-btn-deploy" href="{$WEB_ROOT}/register.php" aria-label="Deploy">
        <i class="fas fa-rocket" aria-hidden="true"></i>
        <span class="d-none d-md-inline">Deploy</span>
    </a>
    <div class="venom-auth-controls-pill">
        <a class="venom-auth-pill-link" href="{$WEB_ROOT}/clientarea.php" aria-label="Login">
            <span class="venom-auth-pill-icon">
                <i class="fas fa-sign-in-alt" aria-hidden="true"></i>
            </span>
            <span class="venom-auth-pill-text d-none d-md-inline">Login</span>
        </a>
        <div class="venom-auth-pill-divider d-none d-md-block"></div>
        <div class="venom-auth-pill-mode">
            <span class="venom-auth-pill-text d-none d-md-inline">Mode</span>
            <div class="venom-header-theme">
                {include file="$template/includes/venom/theme-controls.tpl" inHeader=true}
            </div>
        </div>
    </div>
</div>
