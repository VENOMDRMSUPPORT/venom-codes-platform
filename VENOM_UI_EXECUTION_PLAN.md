# Venom UI Execution Plan

## Starting Point: Audit First, Not Direct Conversion

We start from zero on cleanliness — but the right start is not converting pages directly. The right start is:

1. Audit + page mapping
2. Shared shell
3. Auth pages
4. Then internal pages

This approach is backed by previous successful work showing the best execution order:
- Build the shared shell first (header, footer, JS interactions, logo, appearance controls)
- Then auth pages
- While maintaining WHMCS functionality and not touching core files

The V logo was implemented with CSS/HTML only. Header/footer were built first. Auth pages were wrapped inside unified wrappers. Validation, submission, alerts, language, and theme behavior were all preserved.

---

## Phase 1: Audit & Mapping

**Phase goal:** Examine actual files and extract a confirmed mapping before any modification.

**Deliverables:**
- Inventory of Stitch folders
- Inventory of relevant Nexus template files
- Confirmed page mapping table
- Gap report for pages that exist in Stitch but lack a confirmed Nexus target

**Implementation order:** None in this phase — audit only, no production code.

---

## Phase 2: Shared Design System

**Phase goal:** Extract reusable tokens from Stitch designs — do not copy CSS from each page randomly.

**Includes:**
- Colors
- Glass surfaces
- Borders
- Shadows
- Spacing
- Radii
- Typography scale
- Buttons
- Inputs
- Tables
- Badges
- Alerts
- Motion rules
- Responsive rules

---

## Phase 3: Shared Shell

**Phase goal:** Build the common shell first, before individual pages.

Most pages will depend on it.

**Includes:**
- Header
- Footer
- Global announcement bar
- Jump-to-top button
- Cookie banner
- Shared layout wrappers
- Global JS interactions
- Animated V logo

This aligns with previous work: header/footer, V-mark, and appearance/search interactions were implemented as a shared layer before individual pages.

---

## Phase 4: Auth Pages

**Phase goal:** Implement login, register, and password recovery pages first to test visual system and form behavior quality.

**Order:**
1. Login
2. Register
3. Forgot password
4. Password reset related templates
5. 2FA templates (if present)

This aligns with previous implementation: auth pages were applied with unified modules while preserving form functionality, validation, and focus states.

---

## Phase 5: Main Client Area Pages

**Phase goal:** Implement core pages after shared shell and auth stabilize.

**Order:**
1. Client dashboard home
2. My services / licenses
3. Service details / network diagram
4. Account security
5. Billing invoices
6. Checkout payment
7. Manage payment methods
8. Knowledgebase support
9. System announcements

---

## Phase 6: Integration Safety Pass

**Phase goal:** Review WHMCS behavior and ensure appearance changed but methodology did not break.

**Checklist:**
- [ ] No core edits
- [ ] No removed includes without justification
- [ ] Alerts still render
- [ ] Validation still renders
- [ ] Captcha areas preserved
- [ ] Language variables preserved
- [ ] Currency/language switch preserved
- [ ] Mobile behavior valid
- [ ] Dark/light valid
- [ ] No broken JS interactions

This is critical because previous work explicitly documented preserving WHMCS functionality without breaking cart, search, language, theme, or auth behavior.
