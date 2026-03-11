# Venom Codes Template - Technical Improvement Plan (Revised)

## Core Principle: **Unify and Reduce Files**

---

## 1. Initial Assessment - Current Issues

### 1.1 Current CSS Files

```
css/all.css           74KB  - DUPLICATE (same as theme.css)
css/all.min.css       58KB  - DELETE
css/custom.css        4KB   - MERGE with theme.css
css/dynamic-store.css 17KB  - MERGE with store.css
css/invoice.css       193KB - MOVE to includes
css/invoice.min.css   149KB - DELETE
css/oauth.css         1KB   - MERGE with theme.css
css/store.css         94KB  - MERGE
css/theme.css         271KB - Main file
css/theme.min.css     210KB - DELETE
css/venom-homepage.css 19KB - MOVE vars to theme.css
```

### 1.2 Issues Identified

| Issue | File(s) | Solution |
|-------|---------|----------|
| Duplicates | all.css, store.css, dynamic-store.css | Merge into theme.css |
| Minified files | *.min.css | Delete from source |
| Scattered variables | custom.css, venom-homepage.css | Move to theme.css |
| Large invoice.css | 193KB | Move to includes |

---

## 2. Proposed Solution: Unified Structure

### 2.1 New CSS Structure (Single Main File)

```
css/
└── theme.css         ← ONLY main file (contains all variables and styles)
```

### 2.2 New Includes Structure

```
includes/
├── tokens.tpl        ← NEW: Ready-to-use CSS variables
├── variables.tpl     ← NEW: Helper functions for variables
├── alert.tpl
├── modal.tpl
├── panel.tpl
├── sidebar.tpl
├── navbar.tpl
├── flashmessage.tpl
├── tablelist.tpl
├── head.tpl
└── venom/
    └── homepage.tpl
```

---

## 3. Implementation: Merge Steps

### 3.1 Step 1: Delete Duplicate Files

```bash
# Files to delete from css/
- all.min.css
- all.css       - duplicate of theme.css
- invoice.min.css
- theme.min.css - should be generated, not stored
```

### 3.2 Step 2: Move Variables to theme.css

**From custom.css:**
```css
/* Move all variables to theme.css */
:root {
    --white: #fff;
    --neutral-50: #fbf9fa;
    --neutral-100: #f4f5f7;
    /* ... all variables */
}
```

**From venom-homepage.css:**
```css
/* Move required styles to theme.css */
:root {
    /* homepage-specific tokens if necessary */
}
```

### 3.3 Step 3: Merge Store Files

```css
/* Merge store.css + dynamic-store.css into theme.css */
```

### 3.4 Step 4: Invoice File

```css
/* Move invoice.css to includes/invoice.css */
```

---

## 4. Global Ready-to-Use CSS Variables

### 4.1 New Variables File: `includes/tokens.tpl`

```smarty
{* includes/tokens.tpl - Ready-to-use variables for all pages *}
<style>
:root {
    /* Primary Colors */
    --venom-primary: #{$primary_color};        /* ready-to-use */
    --venom-secondary: #{$secondary_color};    /* ready-to-use */
    --venom-accent: {$accent_color};           /* ready-to-use */
    
    /* Status Colors */
    --venom-success: #00a63e;
    --venom-warning: #f54a00;
    --venom-error: #e7000b;
    --venom-info: #155dfc;
    
    /* Shadows */
    --venom-shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
    --venom-shadow-md: 0 4px 6px rgba(0,0,0,0.1);
    --venom-shadow-lg: 0 10px 15px rgba(0,0,0,0.1);
    
    /* Borders */
    --venom-radius-sm: 0.25rem;
    --venom-radius-md: 0.5rem;
    --venom-radius-lg: 0.75rem;
    
    /* Spacing */
    --venom-spacing-xs: 0.25rem;
    --venom-spacing-sm: 0.5rem;
    --venom-spacing-md: 1rem;
    --venom-spacing-lg: 1.5rem;
    --venom-spacing-xl: 2rem;
}
</style>
```

### 4.2 Usage in Any Page

```smarty
{* In any tpl file *}
{include file="$template/includes/tokens.tpl"}

<div class="card" style="background: var(--venom-primary);">
    <button class="btn" style="border-radius: var(--venom-radius-md);">
        Example Button
    </button>
</div>
```

---

## 5. Implementation Roadmap

### Phase 1 (Week 1): Delete and Unify

| Task | File | Risk | Mitigation |
|------|------|------|------------|
| Delete all.min.css | css/all.min.css | Low | Verify not referenced |
| Delete theme.min.css | css/theme.min.css | Low | Verify not referenced |
| Delete invoice.min.css | css/invoice.min.css | Low | Verify not referenced |
| Delete all.css | css/all.css | Medium | Test all pages |

### Phase 2 (Week 2): Move Variables

| Task | Source | Target | Risk | Mitigation |
|------|--------|--------|------|------------|
| Move custom.css vars | custom.css | theme.css | Low | Test homepage |
| Move homepage vars | venom-homepage.css | theme.css | Low | Test homepage |

### Phase 3 (Week 3): Merge Files

| Task | Files | Target | Risk | Mitigation |
|------|-------|--------|------|------------|
| Merge store | store.css + dynamic-store.css | theme.css | Medium | Test store pages |
| Merge oauth | oauth.css | theme.css | Low | Test OAuth page |

### Phase 4 (Week 4): Global Variables

| Task | Deliverable | Risk | Mitigation |
|------|-------------|------|------------|
| Create includes/tokens.tpl | Variables file | Low | Document usage |
| Update includes/head.tpl | Load variables | Low | Test all pages |
| Delete custom.css | Unnecessary file | Low | Verify coverage |
| Delete venom-homepage.css | Unnecessary file | Low | Verify coverage |

---

## 6. Quality Standards

### 6.1 Validation Required After Each Change

```bash
# CSS validation
python .kilocode/scripts/theme_guard.py

# Visual verification
- Dark mode
- Light mode
- Ocean accent
- Contrast accent
- Mobile (375px)
- Tablet (768px)
- Desktop (1024px)
```

### 6.2 CSS Rules

- ❌ No raw hex colors
- ❌ No inline styles
- ❌ No duplicate selectors
- ✅ Use var(--venom-*) everywhere

---

## 7. Final Result Summary

### Before:
```
css/ (11 files, ~924KB)
```

### After:
```
css/
└── theme.css     ← Single main file (~300KB after merge)

includes/
├── tokens.tpl   ← Ready-to-use variables
└── ...          ← Other components
```

---

## 8. Risks and Mitigation

| Risk | Impact | Mitigation |
|------|--------|------------|
| Breaking pages | High | Test in staging first |
| Losing styles | High | Backup before merge |
| Variable conflicts | Medium | Use clear prefix --venom- |
| Longer load time | Low | Same file after unification |

---

*Plan updated: 2026-03-10*
*Approach: Unify and reduce files*
