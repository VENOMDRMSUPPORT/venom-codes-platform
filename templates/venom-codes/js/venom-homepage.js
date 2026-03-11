(function () {
    "use strict";

    var STORAGE_THEME = "venom_theme";
    var STORAGE_ACCENT = "venom_accent";
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
            // Intentionally empty; template should still function without storage.
        }
    }

    function normalize(value, allowed, fallback) {
        return allowed.indexOf(value) !== -1 ? value : fallback;
    }

    function setTheme(theme) {
        var normalizedTheme = normalize(theme, THEMES, DEFAULT_THEME);
        document.documentElement.setAttribute("data-venom-theme", normalizedTheme);
        safeSetStorage(STORAGE_THEME, normalizedTheme);

        var toggleLabel = document.querySelector("#venomThemeToggle .venom-toggle-btn__label");
        if (toggleLabel) {
            toggleLabel.textContent = normalizedTheme === "light" ? "Dark Theme" : "Light Theme";
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

    function initThemeControls() {
        var toggleButton = document.getElementById("venomThemeToggle");
        if (toggleButton) {
            toggleButton.addEventListener("click", function () {
                var currentTheme = document.documentElement.getAttribute("data-venom-theme") || DEFAULT_THEME;
                setTheme(currentTheme === "light" ? "dark" : "light");
            });
        }

        var accentButtons = document.querySelectorAll(".venom-accent-dot[data-accent]");
        accentButtons.forEach(function (button) {
            button.addEventListener("click", function () {
                setAccent(button.getAttribute("data-accent"));
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

        var cookieButtons = cookieCard.querySelectorAll("[data-cookie-close]");
        cookieButtons.forEach(function (button) {
            button.addEventListener("click", function () {
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
