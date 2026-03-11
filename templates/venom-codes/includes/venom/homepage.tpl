<div id="venomHomepage" class="venom-homepage" data-venom-page="home">
    <div id="venomThemeControls" class="venom-floating-controls" role="region" aria-label="Theme Controls">
        <div class="venom-floating-controls__anchor">
            <button id="venomThemeToggle" class="venom-toggle-btn" type="button" aria-label="Switch to Dark Theme" aria-controls="venomAccentPalette" aria-haspopup="true" aria-expanded="false">
                <span class="venom-toggle-icon venom-toggle-icon--sun" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="3.6"></circle>
                        <path d="M12 3.2V5.6M12 18.4v2.4M3.2 12h2.4M18.4 12h2.4M5.8 5.8l1.8 1.8M16.4 16.4l1.8 1.8M5.8 18.2l1.8-1.8M16.4 7.6l1.8-1.8"></path>
                    </svg>
                </span>
                <span class="venom-toggle-icon venom-toggle-icon--moon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 13.2A9.2 9.2 0 1 1 10.8 3c-.3.9-.5 1.8-.5 2.8a7.4 7.4 0 0 0 7.4 7.4c1 0 1.9-.2 2.8-.5Z"></path>
                    </svg>
                </span>
            </button>
            <div id="venomAccentPalette" class="venom-accent-picker" role="group" aria-label="Accent Colors">
                <button type="button" class="venom-accent-dot is-active" data-accent="ocean" aria-label="Ocean Accent" aria-pressed="true"></button>
                <button type="button" class="venom-accent-dot" data-accent="emerald" aria-label="Emerald Accent" aria-pressed="false"></button>
                <button type="button" class="venom-accent-dot" data-accent="crimson" aria-label="Crimson Accent" aria-pressed="false"></button>
                <button type="button" class="venom-accent-dot" data-accent="amber" aria-label="Amber Accent" aria-pressed="false"></button>
                <button type="button" class="venom-accent-dot" data-accent="violet" aria-label="Violet Accent" aria-pressed="false"></button>
            </div>
        </div>
    </div>

    <div class="venom-announcement" data-purpose="announcement-bar">
        ⚡ FLASH UPDATE: Version 4.2.0 Load Balancing Logic Optimized ⚡
    </div>

    <header class="venom-header" data-purpose="header">
        <div class="venom-shell venom-header__inner">
            <a href="{$WEB_ROOT}/index.php" class="venom-brand" aria-label="VENOM CODES Home">
                <span class="venom-brand__logo" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="m12 3-1.912 5.813a2 2 0 0 1-1.275 1.275L3 12l5.813 1.912a2 2 0 0 1 1.275 1.275L12 21l1.912-5.813a2 2 0 0 1 1.275-1.275L21 12l-5.813-1.912a2 2 0 0 1-1.275-1.275L12 3Z"></path>
                    </svg>
                </span>
                <span class="venom-brand__text-wrap">
                    <span class="venom-brand__text">VENOM<span>CODES</span></span>
                    <span class="venom-brand__sub">Core Server Management</span>
                </span>
            </a>
            <nav class="venom-nav" aria-label="Primary">
                <a href="#features">Features</a>
                <a href="#architecture">Architecture</a>
                <a href="#pricing">Pricing</a>
                <a class="venom-nav__cta venom-btn venom-btn--solid" href="{$WEB_ROOT}/clientarea.php">Client Login</a>
            </nav>
        </div>
    </header>

    <main>
        <section class="venom-hero" data-purpose="hero-section" id="hero">
            <div class="venom-shell venom-hero__inner">
                <span class="venom-chip">Enterprise Solution</span>
                <h1>
                    Master Your Streams with <br><span class="venom-gradient-text">Absolute Precision.</span>
                </h1>
                <p>
                    The ultimate management layer for IPTV professionals. Automate, monitor, and scale your streaming infrastructure with industrial-grade reliability.
                </p>
                <div class="venom-hero__actions">
                    <a class="venom-btn venom-btn--solid" href="#pricing">Get Started Now</a>
                    <a class="venom-btn venom-btn--ghost" href="#architecture">View System Map</a>
                </div>
            </div>
        </section>

        <section class="venom-architecture" data-purpose="system-diagram" id="architecture">
            <div class="venom-shell">
                <div class="venom-section-head">
                    <h2>Elite Architecture</h2>
                    <p>Engineered for 99.9% uptime with intelligent database distribution.</p>
                </div>

                <div class="venom-architecture__grid">
                    <article class="venom-diagram-card" aria-label="Architecture Diagram">
                        <div class="venom-diagram-grid">
                            <div class="venom-main-node-wrap">
                                <div class="venom-main-node">
                                    <div class="venom-main-node__icon" aria-hidden="true">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2"></path>
                                        </svg>
                                    </div>
                                    <h4>Main Server</h4>
                                    <p>Core Controller</p>
                                </div>
                            </div>

                            <div class="venom-node-column">
                                <div class="venom-lb-node venom-lb-node--muted">LB-NODE-01</div>
                                <div class="venom-lb-node">LB-NODE-02</div>
                            </div>

                            <div class="venom-node-column">
                                <div class="venom-lb-node">LB-NODE-03</div>
                                <div class="venom-lb-node venom-lb-node--muted">LB-NODE-04</div>
                            </div>

                            <div class="venom-node-lines" aria-hidden="true">
                                <span class="venom-line venom-line--v"></span>
                                <span class="venom-line venom-line--h-left"></span>
                                <span class="venom-line venom-line--h-right"></span>
                            </div>
                        </div>
                    </article>

                    <div class="venom-architecture__details" id="features">
                        <article>
                            <h3>Dynamic Load Balancing</h3>
                            <p>Our system automatically routes traffic to the nearest healthy load balancer, reducing latency for end-users across the globe.</p>
                        </article>
                        <article>
                            <h3>Shared DB Connectivity</h3>
                            <p>All nodes communicate via an encrypted MySQL/MariaDB tunnel, ensuring real-time session synchronization and zero packet loss.</p>
                        </article>
                        <article>
                            <h3>Failover Protection</h3>
                            <p>If the Main Server experiences downtime, load balancers maintain existing streams through locally cached headers.</p>
                        </article>
                    </div>
                </div>
            </div>
        </section>

        <section class="venom-pricing" data-purpose="pricing-tables" id="pricing">
            <div class="venom-shell">
                <div class="venom-section-head">
                    <h2>Choose Your License</h2>
                    <p>Scalable plans for streamers of all sizes.</p>
                </div>

                <div class="venom-pricing__grid">
                    <article class="venom-plan-card">
                        <h3>Trial</h3>
                        <p class="venom-plan-subtitle">Test the full power for 7 days</p>
                        <p class="venom-price">$50 <span>/week</span></p>
                        <ul>
                            <li>1 Main Server</li>
                            <li class="venom-unavailable">No Load Balancers</li>
                            <li>24/7 Ticketing</li>
                        </ul>
                        <button type="button" class="venom-plan-btn venom-plan-btn--outline">Start Trial</button>
                    </article>

                    <article class="venom-plan-card venom-plan-card--featured">
                        <span class="venom-badge">Most Popular</span>
                        <h3>Pro</h3>
                        <p class="venom-plan-subtitle">Perfect for growing networks</p>
                        <p class="venom-price">$100 <span>/month</span></p>
                        <ul>
                            <li>1 Main Server</li>
                            <li>1 FREE Load Balancer</li>
                            <li>Additional LB: $10/ea</li>
                        </ul>
                        <button type="button" class="venom-plan-btn venom-plan-btn--solid">Buy Pro</button>
                    </article>

                    <article class="venom-plan-card">
                        <h3>Ultra</h3>
                        <p class="venom-plan-subtitle">Zero limits, peak performance</p>
                        <p class="venom-price">$300 <span>/month</span></p>
                        <ul>
                            <li>1 Main Server</li>
                            <li>UNLIMITED Load Balancers</li>
                            <li>Priority VIP Support</li>
                        </ul>
                        <button type="button" class="venom-plan-btn venom-plan-btn--outline">Go Ultra</button>
                    </article>
                </div>
            </div>
        </section>
    </main>

    <footer class="venom-main-footer">
        <div class="venom-shell">
            <div class="venom-footer-grid">
                <div class="venom-footer-brand">
                    <div class="venom-footer-brand__top">
                        <span class="venom-footer-brand__logo" aria-hidden="true">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="m12 3-1.912 5.813a2 2 0 0 1-1.275 1.275L3 12l5.813 1.912a2 2 0 0 1 1.275 1.275L12 21l1.912-5.813a2 2 0 0 1 1.275-1.275L21 12l-5.813-1.912a2 2 0 0 1-1.275-1.275L12 3Z"></path>
                            </svg>
                        </span>
                        <strong>VENOM CODES</strong>
                    </div>
                    <p>
                        Professional backend solutions for streaming enterprises. We simplify the complexity of server orchestration.
                    </p>
                </div>

                <div>
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="#">Installation Guide</a></li>
                        <li><a href="#">API Documentation</a></li>
                        <li><a href="#">Terms of Service</a></li>
                    </ul>
                </div>

                <div>
                    <h4>Connectivity</h4>
                    <ul>
                        <li><a href="#">Telegram Channel</a></li>
                        <li><a href="#">Discord Server</a></li>
                        <li><a href="#">Support Portal</a></li>
                    </ul>
                </div>
            </div>

            <div class="venom-disclaimer">
                <p>
                    <strong>Legal Disclaimer:</strong> VENOM CODES is a software development firm. We do not provide any IPTV content, playlists, streams, or subscription services. We provide server management software only. Users are responsible for the content they host or distribute through their own infrastructure.
                </p>
            </div>

            <p class="venom-copyright">© {$date_year} VENOM CODES. All rights reserved.</p>
        </div>
    </footer>

    <button id="venomJumpToTop" class="venom-jump-top" type="button" aria-label="Back to top">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
            <path d="M5 15l7-7 7 7"></path>
        </svg>
    </button>

    <div id="venomCookieConsent" class="venom-cookie hidden" role="dialog" aria-live="polite" aria-label="Cookies and Privacy">
        <div class="venom-cookie__head">
            <h5>Cookies &amp; Privacy</h5>
            <button type="button" class="venom-cookie__close" aria-label="Close cookies notice" data-cookie-close>
                <span aria-hidden="true">x</span>
            </button>
        </div>
        <p>We use cookies to improve your dashboard experience and analyze our traffic.</p>
        <div class="venom-cookie__actions">
            <button type="button" class="venom-cookie__btn venom-cookie__btn--solid" data-cookie-close>Accept All</button>
            <button type="button" class="venom-cookie__btn venom-cookie__btn--ghost" data-cookie-close>Manage</button>
        </div>
    </div>
</div>

<script src="{$WEB_ROOT}/templates/{$template}/js/venom-homepage.js?v={$versionHash}"></script>
