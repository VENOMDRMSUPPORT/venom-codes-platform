# Venom Agent Brief

This brief is the compact operating context for all agents in this pack.
It is distilled from the two Venom intelligence reports bundled in `reports/`.

## Project identity
- Venom is a custom WHMCS + Smarty template for Venom Solutions.
- Product context: IPTV server management and load-balancing **software licensing only**.
- Tone: technical, trustworthy, premium, calm, not flashy.
- Primary UX promise: dark-first enterprise SaaS quality with full dark/light parity and 5 accent colors.

## The main quality problem to solve
Agents keep inventing visual systems instead of respecting the existing one.
That causes:
- duplicate classes,
- conflicting borders and shadows,
- token drift,
- hardcoded colors,
- theme breaks,
- partial components that fight the current design system.

## Non-negotiables
1. Reuse existing classes, tokens, includes, and patterns before creating anything new.
2. Never hardcode colors. Prefer existing project tokens (`--accent-*`, semantic `--*` variables, and other established tokens) or add a token in the canonical token file first.
3. Never add inline `style=""`.
4. Never introduce a parallel border/card/button system.
5. Never edit vendor files like `theme.min.css`.
6. Keep both themes working, and check at least cyan plus one contrasting accent.
7. Keep diffs focused. Do not rewrite files just to "clean them up" unless asked.

## Canonical Venom file zones
- Primary template zone: `client/templates/venom-codes/*.tpl`
- Shared Smarty includes: `client/templates/venom-codes/includes/*.tpl`
- Primary stylesheet: `client/templates/venom-codes/css/theme.css`
- Secondary stylesheet used by wrapper pages: `client/templates/venom-codes/css/react-full.css`
- Theme scripts: `client/templates/venom-codes/js/*.js`
- Ignore stale architecture assumptions from audits that conflict with actual files on disk.

## Policy modes
- `legacy-safe` (default): preserve current system and block new regressions.
- `strict-new` (opt-in): enforce stricter naming/token policy on changed/new lines only.

## Preferred workflow
1. Search first.
2. Read the smallest useful set of files.
3. Reuse an existing pattern.
4. Patch the minimum number of lines/files.
5. Validate theme, accent, accessibility, and destination honesty.
6. Stop when the request is satisfied.

## Red flags to catch immediately
- raw `#hex`, `rgb()`, `hsl()` in UI edits,
- `style="..."`,
- new `bg-color-*`, `panel-*`, `card-*`, or duplicate utility classes,
- new token families that duplicate existing semantic/accent token intent,
- CTAs whose label does not match their destination,
- edits that only perfect dark mode and ignore light mode,
- unnecessary comments or broad refactors.

## Quality gates after UI work
- Validate dark and light.
- Validate cyan and one contrasting accent (green or orange).
- Check 375px, 768px, and 1024px.
- Check focus-visible states and 44px targets for interactive UI.
- Check CTA honesty.
- Run `python .kilocode/scripts/theme_guard.py` for strict-new changed-file checks.
- Use `python .kilocode/scripts/theme_guard.py --full-file <file>` only for explicit legacy deep audit.

## Priority order
1. Accessibility and correctness
2. Both themes working
3. Token consistency
4. Reuse existing patterns
5. Mobile correctness
6. Visual polish
7. Optional cleanup

## What "faster" means in this pack
- Do not audit the whole repo for a small fix.
- Do not create long plans for a 1-3 file UI change.
- Do not create new files when editing an existing shared component is enough.
- Do not keep working after acceptance criteria are met.
