<div id="venomHomepage" class="venom-homepage" data-venom-page="home">

    <div class="venom-announcement" data-purpose="announcement-bar">
        ⚡ FLASH UPDATE: Version 4.2.0 Load Balancing Logic Optimized ⚡
    </div>

    <header class="venom-header" data-purpose="header">
        <div class="venom-shell venom-header__inner">
            {include file="$template/includes/venom/logo.tpl" href="{$WEB_ROOT}/index.php" extraClass="venom-header-logo"}
            {include file="$template/includes/venom/main-header.tpl"}
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

    <!-- Footer is now globally managed by footer.tpl for unified SaaS look -->

    <div id="venomCookieConsent" class="venom-cookie hidden" role="dialog" aria-live="polite" aria-label="Cookies and Privacy">
        <div class="venom-cookie__head">
            <h5>Cookies &amp; Privacy</h5>
            <button type="button" class="venom-cookie__close" aria-label="Close cookies notice" data-cookie-close>
                <span aria-hidden="true">x</span>
            </button>
        </div>
        <p>We use cookies to improve your dashboard experience and analyze our traffic.</p>
        <div class="venom-cookie__actions">
            <button type="button" class="venom-cookie__btn venom-cookie__btn--solid" data-cookie-close data-cookie-accept>Accept All</button>
            <button type="button" class="venom-cookie__btn venom-cookie__btn--ghost" data-cookie-close>Manage</button>
        </div>
    </div>
</div>
