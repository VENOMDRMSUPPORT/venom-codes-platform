(function () {
    "use strict";

    var STORAGE_THEME = "venom_theme";
    var STORAGE_ACCENT = "venom_accent";
    var STORAGE_COOKIE_CONSENT = "venom_cookie_consent";
    var DEFAULT_THEME = "light";
    var DEFAULT_ACCENT = "ocean";
    var THEMES = ["light", "dark"];
    var ACCENTS = ["ocean", "emerald", "crimson", "amber", "violet"];

    function safeGetStorage(key) {
        try {
            return window.localStorage.getItem(key);
        } catch (e) {
            return null;
        }
    }

    function safeSetStorage(key, value) {
        try {
            window.localStorage.setItem(key, value);
        } catch (e) {
            /* template should still function without storage */
        }
    }

    function normalize(value, allowed, fallback) {
        return allowed.indexOf(value) !== -1 ? value : fallback;
    }

    function setTheme(theme) {
        var normalizedTheme = normalize(theme, THEMES, DEFAULT_THEME);
        document.documentElement.setAttribute("data-venom-theme", normalizedTheme);
        safeSetStorage(STORAGE_THEME, normalizedTheme);

        var toggleButton = document.getElementById("venomThemeToggle");
        if (toggleButton) {
            toggleButton.setAttribute("data-theme", normalizedTheme);
            toggleButton.setAttribute("aria-pressed", String(normalizedTheme === "dark"));
            toggleButton.setAttribute(
                "aria-label",
                normalizedTheme === "light" ? "Switch to Dark Theme" : "Switch to Light Theme"
            );
        }
    }

    function setAccent(accent) {
        var normalizedAccent = normalize(accent, ACCENTS, DEFAULT_ACCENT);
        document.documentElement.setAttribute("data-venom-accent", normalizedAccent);
        safeSetStorage(STORAGE_ACCENT, normalizedAccent);

        var accentButtons = document.querySelectorAll(".venom-accent-dot[data-accent]");
        accentButtons.forEach(function (button) {
            var isActive = button.getAttribute("data-accent") === normalizedAccent;
            button.classList.toggle("is-active", isActive);
            button.setAttribute("aria-pressed", String(isActive));
        });
    }

    function toggleThemeNow() {
        var currentTheme = document.documentElement.getAttribute("data-venom-theme") || DEFAULT_THEME;
        setTheme(currentTheme === "light" ? "dark" : "light");
    }

    function initThemeControls() {
        var floatingControls = document.getElementById("venomThemeControls") || document.querySelector(".venom-floating-controls");
        var toggleButton = document.getElementById("venomThemeToggle");
        var accentPalette = document.getElementById("venomAccentPalette");
        var isTouchLike = window.matchMedia("(hover: none), (pointer: coarse)").matches;
        var closeTimer = null;

        function setControlsOpen(isOpen) {
            if (!floatingControls || !toggleButton) {
                return;
            }
            floatingControls.classList.toggle("is-open", isOpen);
            toggleButton.setAttribute("aria-expanded", String(isOpen));
        }

        function clearTouchCloseTimer() {
            if (!closeTimer) {
                return;
            }
            window.clearTimeout(closeTimer);
            closeTimer = null;
        }

        function scheduleTouchClose() {
            if (!isTouchLike) {
                return;
            }
            clearTouchCloseTimer();
            closeTimer = window.setTimeout(function () {
                setControlsOpen(false);
            }, 3000);
        }

        if (floatingControls) {
            floatingControls.addEventListener("focusout", function (event) {
                if (!floatingControls.contains(event.relatedTarget)) {
                    setControlsOpen(false);
                }
            });

            document.addEventListener("click", function (event) {
                if (!floatingControls.contains(event.target)) {
                    setControlsOpen(false);
                }
            }, false);

            document.addEventListener("keydown", function (event) {
                if (event.key === "Escape") {
                    setControlsOpen(false);
                }
            });

            if (!isTouchLike) {
                floatingControls.addEventListener("mouseleave", function () {
                    setControlsOpen(false);
                });
            }
        }

        if (toggleButton) {
            toggleButton.addEventListener("click", function (event) {
                event.stopPropagation();
                toggleThemeNow();
                setControlsOpen(true);
                scheduleTouchClose();
            });
        }

        if (accentPalette) {
            accentPalette.addEventListener("click", function (event) {
                event.stopPropagation();
                scheduleTouchClose();
            });
        }

        var accentButtons = document.querySelectorAll(".venom-accent-dot[data-accent]");
        accentButtons.forEach(function (button) {
            button.addEventListener("click", function (event) {
                event.stopPropagation();
                setAccent(button.getAttribute("data-accent"));

                if (isTouchLike) {
                    setControlsOpen(false);
                }
            });
        });
    }

    function initJumpToTop() {
        var jumpButton = document.getElementById("venomJumpToTop");
        if (!jumpButton) {
            return;
        }

        function refreshVisibility() {
            var shouldShow = window.scrollY > 500;
            jumpButton.classList.toggle("is-visible", shouldShow);
        }

        refreshVisibility();

        window.addEventListener("scroll", refreshVisibility, { passive: true });

        jumpButton.addEventListener("click", function () {
            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });
        });
    }

    function initCookieNotice() {
        var cookieCard = document.getElementById("venomCookieConsent");
        if (!cookieCard) {
            return;
        }

        if (safeGetStorage(STORAGE_COOKIE_CONSENT) === "accepted") {
            cookieCard.classList.add("hidden");
            return;
        }

        var cookieButtons = cookieCard.querySelectorAll("[data-cookie-close]");
        cookieButtons.forEach(function (button) {
            button.addEventListener("click", function () {
                if (button.hasAttribute("data-cookie-accept")) {
                    safeSetStorage(STORAGE_COOKIE_CONSENT, "accepted");
                }
                cookieCard.classList.add("hidden");
            });
        });

        window.setTimeout(function () {
            cookieCard.classList.remove("hidden");
        }, 2000);
    }

    function initHomepageFlag() {
        document.documentElement.setAttribute("data-venom-home", "1");
        if (document.body) {
            document.body.setAttribute("data-venom-home", "1");
        }
    }

    function boot() {
        initHomepageFlag();
        setTheme(normalize(safeGetStorage(STORAGE_THEME), THEMES, DEFAULT_THEME));
        setAccent(normalize(safeGetStorage(STORAGE_ACCENT), ACCENTS, DEFAULT_ACCENT));
        initThemeControls();
        initJumpToTop();
        initCookieNotice();
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", boot);
    } else {
        boot();
    }
})();
