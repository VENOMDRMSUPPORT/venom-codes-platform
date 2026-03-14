(function () {
    "use strict";

    var STORAGE_THEME = "venom_theme";
    var STORAGE_ACCENT = "venom_accent";
    var STORAGE_COOKIE_CONSENT = "venom_cookie_consent";
    var DEFAULT_THEME = "light";
    var DEFAULT_ACCENT = "violet";
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
        
        var toggleButtons = document.querySelectorAll(".venom-toggle-btn");
        toggleButtons.forEach(function(toggleButton) {
            toggleButton.setAttribute("data-theme", normalizedTheme);
            toggleButton.setAttribute("aria-pressed", String(normalizedTheme === "dark"));
            toggleButton.setAttribute(
                "aria-label",
                normalizedTheme === "light" ? "Switch to Dark Theme" : "Switch to Light Theme"
            );
        });
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
        var raw = document.documentElement.getAttribute("data-venom-theme") || DEFAULT_THEME;
        var currentTheme = normalize(raw, THEMES, DEFAULT_THEME);
        setTheme(currentTheme === "light" ? "dark" : "light");
    }

    function initThemeControls() {
        var isTouchLike = window.matchMedia("(hover: none), (pointer: coarse)").matches;
        var closeTimer = null;

        function setControlsOpen(controlsElement, isOpen) {
            if (!controlsElement) return;
            controlsElement.classList.toggle("is-open", isOpen);
            var toggleBtn = controlsElement.querySelector(".venom-toggle-btn");
            if (toggleBtn) {
                toggleBtn.setAttribute("aria-expanded", String(isOpen));
            }
        }

        function closeAllControls() {
            var allControls = document.querySelectorAll(".venom-floating-controls");
            allControls.forEach(function(controls) {
                setControlsOpen(controls, false);
            });
        }

        function clearTouchCloseTimer() {
            if (closeTimer) {
                window.clearTimeout(closeTimer);
                closeTimer = null;
            }
        }

        function scheduleTouchClose() {
            if (!isTouchLike) return;
            clearTouchCloseTimer();
            closeTimer = window.setTimeout(closeAllControls, 3000);
        }

        var allControls = document.querySelectorAll(".venom-floating-controls");
        allControls.forEach(function(controls) {
            controls.addEventListener("focusout", function (event) {
                if (!controls.contains(event.relatedTarget)) {
                    setControlsOpen(controls, false);
                }
            });

            if (!isTouchLike) {
                controls.addEventListener("mouseleave", function () {
                    setControlsOpen(controls, false);
                });
            }

            var toggleButton = controls.querySelector(".venom-toggle-btn");
            if (toggleButton) {
                toggleButton.addEventListener("click", function (event) {
                    event.stopPropagation();
                    toggleThemeNow();
                    var wasOpen = controls.classList.contains("is-open");
                    closeAllControls();
                    if (!wasOpen) {
                        setControlsOpen(controls, true);
                        scheduleTouchClose();
                    }
                });
            }

            var accentPalette = controls.querySelector(".venom-accent-picker");
            if (accentPalette) {
                accentPalette.addEventListener("click", function (event) {
                    event.stopPropagation();
                    scheduleTouchClose();
                });
            }
        });

        document.addEventListener("click", function (event) {
            var clickedInsideControls = event.target.closest ? event.target.closest(".venom-floating-controls") : null;
            if (!clickedInsideControls) {
                closeAllControls();
            }
        }, false);

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") {
                closeAllControls();
            }
        });

        var accentButtons = document.querySelectorAll(".venom-accent-dot[data-accent]");
        accentButtons.forEach(function (button) {
            button.addEventListener("click", function (event) {
                event.stopPropagation();
                setAccent(button.getAttribute("data-accent"));

                if (isTouchLike) {
                    closeAllControls();
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

    function boot() {
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
