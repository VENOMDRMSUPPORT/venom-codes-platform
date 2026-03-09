# VENOM CODES — WHMCS Theme Architecture

## Wrapper Strategy

This theme uses **five distinct wrapper/rendering patterns**. Every `.tpl` file falls into exactly one category.

---

### 1. Standalone Full-Document Wrapper

This template owns the entire HTML document (`<!DOCTYPE>` through `</html>`), including `<head>`, asset loading, and `<body>`.

| File | Purpose | Assets Loaded |
|---|---|---|
| `clientarea.tpl` | Client area shell (sidebar + header + `{$content}` slot) | `theme.css`, `theme-switcher.js`, `client-sidebar.js`, `client-tabs.js` |

**`clientarea.tpl`** renders the sidebar, header, and `<main>` container, then injects the active page template into `{$content}`.

---

### 2. Homepage Wrapper-Handoff Fragment (`homepage.tpl`)

`homepage.tpl` is a **content fragment**, not a full-document wrapper.

- WHMCS still loads root `header.tpl` first and `footer.tpl` last.
- `homepage.tpl` performs a controlled handoff: it closes the default `header.tpl` page container, renders full-width landing sections, then re-opens the container shape expected by `footer.tpl`.
- Homepage behavior (theme toggle, mobile menu, FAQ, cookie consent, scroll-to-top) is delivered by scripts loaded through `footer.tpl`, not by document tags inside `homepage.tpl`.

---

### 3. Root Header/Footer Pair (WHMCS Standard)

WHMCS auto-includes `header.tpl` and `footer.tpl` for public pages (knowledgebase, announcements, contact, downloads, etc.). Together they form the document wrapper.

| File | Role |
|---|---|
| `header.tpl` | **Document opener** — outputs `<!DOCTYPE>` through `<body>`, site nav, and opens `<main>` |
| `footer.tpl` | **Document closer** — closes `<main>`, renders site footer, scripts, closes `</body></html>` |

---

### 4. Content-Only Fragments (Client Area)

Rendered inside `clientarea.tpl` via `{$content}`. **No document-level markup allowed.**

| File | WHMCS Route |
|---|---|
| `clientareahome.tpl` | `clientarea.php` (dashboard) |
| `clientareaproducts.tpl` | `clientarea.php?action=products` |
| `clientareaproductdetails.tpl` | `clientarea.php?action=productdetails&id=X` |
| `clientareainvoices.tpl` | `clientarea.php?action=invoices` |
| `viewinvoice.tpl` | `viewinvoice.php?id=X` |
| `invoice-payment.tpl` | Invoice payment page |
| `masspay.tpl` | Pay multiple invoices |
| `clientareadomains.tpl` | `clientarea.php?action=domains` |
| `clientareadomaindetails.tpl` | `clientarea.php?action=domaindetails&id=X` |
| `clientareadomaindns.tpl` | Domain DNS management |
| `clientareadomaincontactinfo.tpl` | Domain WHOIS contact info |
| `clientareadomainemailforwarding.tpl` | Domain email forwarding |
| `clientareadomaingetepp.tpl` | Domain EPP/transfer code |
| `clientareadetails.tpl` | `clientarea.php?action=details` |
| `clientareasecurity.tpl` | `clientarea.php?action=security` |
| `clientareacancelrequest.tpl` | Service cancellation request |
| `account-paymentmethods.tpl` | Payment methods list |
| `account-paymentmethods-manage.tpl` | Manage single payment method |
| `account-contacts-manage.tpl` | Manage/edit contact |
| `account-contacts-new.tpl` | New contact (alias) |
| `clientareaaddfunds.tpl` | Add funds |
| `clientareatransactions.tpl` | Transaction history |
| `clientareaemails.tpl` | Email history list |
| `viewemail.tpl` | View single email |
| `clientareaquotes.tpl` | Quotes list |
| `user-profile.tpl` | User profile settings |
| `user-password.tpl` | Change password |
| `user-security.tpl` | Security settings (2FA, sessions) |
| `supportticketslist.tpl` | `supporttickets.php` |
| `supportticketsubmit-stepone.tpl` | Select department |
| `supportticketsubmit-steptwo.tpl` | Submit ticket form |
| `supportticketsubmit-confirm.tpl` | Ticket confirmation |
| `viewticket.tpl` | `viewticket.php?tid=X&c=Y` |
| `ticketfeedback.tpl` | Ticket feedback/rating |
| `affiliates.tpl` | Affiliate dashboard |
| `affiliatessignup.tpl` | Affiliate signup |

---

### 5. Content-Only Fragments (Public Pages)

Rendered between root `header.tpl` and `footer.tpl` by WHMCS.

| File | WHMCS Route |
|---|---|
| `contact.tpl` | `contact.php` |
| `announcements.tpl` | `announcements.php` |
| `viewannouncement.tpl` | `announcements.php?id=X` |
| `knowledgebase.tpl` | `knowledgebase.php` |
| `knowledgebasecat.tpl` | `knowledgebase.php?action=displaycat&catid=X` |
| `knowledgebasearticle.tpl` | `knowledgebase.php?action=displayarticle&id=X` |
| `serverstatus.tpl` | `serverstatus.php` |
| `downloads.tpl` | `downloads.php` |
| `downloadscat.tpl` | `downloads.php?action=displaycat&catid=X` |
| `domain-pricing.tpl` | Domain pricing table |

---

### 6. Content-Only Fragments (Authentication)

Auth templates use `{include file="includes/authlayout.tpl"}` for centered card with animated border. **WHMCS provides the outer document wrapper.**

| File | WHMCS Route |
|---|---|
| `login.tpl` | `login.php` |
| `clientregister.tpl` | `register.php` |
| `password-reset-email-prompt.tpl` | `pwreset.php` (enter email) |
| `password-reset-change-prompt.tpl` | `pwreset.php` (set new password) |
| `password-reset-security-prompt.tpl` | `pwreset.php` (security question) |
| `password-reset-container.tpl` | Wrapper for password reset steps |
| `user-verify-email.tpl` | Email verification |
| `two-factor-challenge.tpl` | 2FA verification prompt |
| `two-factor-new-backup-code.tpl` | Display new 2FA backup code |

**Auth template pattern:**
```smarty
{assign var="auth_title" value="Page Title"}
{capture assign="auth_content"}
  <!-- form HTML here -->
{/capture}
{include file="includes/authlayout.tpl"}
```

---

## Shared Includes

### Global Includes (`templates/includes/`)

| File | Purpose |
|---|---|
| `header.tpl` | Public site navigation bar |
| `footer.tpl` | Public site footer |
| `announcement.tpl` | Top announcement banner |
| `authlayout.tpl` | Auth card wrapper with animated border |
| `pagelayout.tpl` | Header + main + footer assembly |
| `logo.tpl` | SVG logo partial |
| `themeswitcher.tpl` | Theme/accent switcher dropdown |
| `cookieconsent.tpl` | Cookie consent banner |
| `scrolltotop.tpl` | Scroll-to-top button |

### Landing Section Includes (`templates/includes/landing/`)

| File | Purpose |
|---|---|
| `hero.tpl` | Hero section with CTA |
| `truststrip.tpl` | Client/partner logos strip |
| `features.tpl` | Feature grid |
| `pricing.tpl` | Pricing cards |
| `whychoose.tpl` | Why choose us section |
| `faq.tpl` | FAQ accordion |
| `finalcta.tpl` | Final call-to-action |

### Client Area Includes (`templates/includes/client/`)

| File | Purpose |
|---|---|
| `sidebar.tpl` | Navigation sidebar with active state |
| `header.tpl` | Top bar with user menu |
| `pageheader.tpl` | Page title, breadcrumbs, actions |
| `statcard.tpl` | Stat/metric card |
| `statusbadge.tpl` | Colored status badge |
| `summarypanel.tpl` | Key-value summary rows |
| `datatable.tpl` | Responsive data table |
| `searchfilterbar.tpl` | Search + filter dropdowns |
| `pagination.tpl` | Page navigation |
| `formsection.tpl` | Form card with title/fields/actions |
| `accountsettingslayout.tpl` | Two-column settings layout |
| `alert.tpl` | Alert banner (info/success/warning/error) |
| `emptystate.tpl` | Empty data placeholder |
| `invoicesummary.tpl` | Invoice line items and totals |
| `ticketconversation.tpl` | Ticket reply thread |

---

## Assets

### CSS (`css/`)

| File | Purpose |
|---|---|
| `theme.css` | Primary visual source: current token system (`--accent-*`, `--background`, `--primary`, etc.), light/dark variables, utilities, and component styling used across header/footer/homepage/client wrappers |

### JavaScript (`js/`)

| File | Purpose | Used By |
|---|---|---|
| `theme-switcher.js` | Light/dark toggle + accent persistence | All wrappers |
| `client-sidebar.js` | Sidebar collapse/expand | `clientarea.tpl` |
| `client-tabs.js` | Tab switching | `clientarea.tpl` |
| `mobile-menu.js` | Header hamburger menu | `homepage.tpl`, `header.tpl` |
| `faq-accordion.js` | FAQ expand/collapse | `homepage.tpl` |
| `cookie-consent.js` | Cookie banner | `homepage.tpl`, `footer.tpl` |
| `scroll-to-top.js` | Scroll-to-top button | `homepage.tpl`, `footer.tpl` |

### Config

| File | Purpose |
|---|---|
| `theme.yaml` | WHMCS theme registration |

---

## Current Cleanup And Enforcement Workflow

- Run guard from `client/` root:
  - `python .kilocode/scripts/theme_guard.py`
- Default mode is `strict-new`:
  - audits changed/new scope from `git diff` (not full legacy template),
  - blocks new hardcoded visual debt (for example raw colors and inline style attributes).
- Optional `legacy-safe` mode:
  - keeps existing legacy structure tolerated,
  - still blocks newly introduced high-risk visual debt.
- Full-file audits are opt-in only:
  - `python .kilocode/scripts/theme_guard.py --full-file <path>`
- Agent/rules source of truth for this workflow:
  - `client/.kilocode/skills/*` (especially `venom-token-audit` and `.kilocode/scripts/theme_guard.py` wrapper).

---

## Smarty Variable Reference

Key WHMCS Smarty variables used across templates:

| Variable | Template | Notes |
|---|---|---|
| `$clientsstats.productsnumactive` | Dashboard | Active services count |
| `$clientsstats.numunpaidinvoices` | Dashboard | Unpaid invoices count |
| `$clientsstats.numactivetickets` | Dashboard | Open tickets count |
| `$clientsstats.numactivedomains` | Dashboard | Active domains count |
| `$invoice.id`, `$invoice.invoicenum` | Invoices | Invoice identifier |
| `$invoice.datecreated`, `$invoice.datedue` | Invoices | Invoice dates |
| `$invoice.total`, `$invoice.status` | Invoices | Amount and status |
| `$domain.id`, `$domain.domain` | Domains | Domain identifier |
| `$domain.registrationdate`, `$domain.nextduedate` | Domains | Domain dates |
| `$domain.statusClass`, `$domain.statustext` | Domains | Status display |
| `$ticket.tid`, `$ticket.c` | Tickets | Ticket ID and access hash |
| `$ticket.department`, `$ticket.subject` | Tickets | Ticket metadata |
| `$descreplies` | View ticket | Array of ticket replies |
| `$reply.requestor.name` | Ticket reply | Reply author name |
| `$service.id`, `$service.product` | Services | Service identifier |
| `$service.domain`, `$service.status` | Services | Service metadata |
| `$token` | All forms | CSRF token |
| `$WEB_ROOT` | All templates | Base URL |
| `$companyname`, `$charset` | Global | System config |

---

## Theme Features

- **Light Mode + Dark Mode** via `.dark` class on `<html>`, persisted in `localStorage`
- **5 Accent Presets** (Blue, Purple, Emerald, Orange, Rose) via `data-accent` attribute
- **All colors use CSS HSL variables** — no hardcoded colors in templates
- **Responsive** — 320px to 1920px+
- **No JavaScript frameworks** — pure vanilla JS
- **Semantic classes** — `.venom-btn-primary`, `.venom-input`, `.venom-card`, etc.

---

## File Count Summary

| Category | Count |
|---|---|
| Document wrappers | 3 (`clientarea.tpl`, `header.tpl`, `footer.tpl`) |
| Homepage wrapper-handoff fragment | 1 (`homepage.tpl`) |
| Client area pages | 36 |
| Public pages | 10 |
| Auth pages | 9 |
| Shared includes | 31 |
| CSS | 1 |
| JavaScript | 7 |
| Config | 2 (theme.yaml, ARCHITECTURE.md) |
| **Total** | **100** |

---

## Deployment Checklist

1. Copy `whmcs-theme/` contents into WHMCS `templates/your-theme-name/`
2. Set theme as active in WHMCS admin → Setup → General Settings → Ordering
3. Verify all WHMCS Smarty variables resolve correctly (test with real data)
4. Test light/dark mode toggle persists across page navigations
5. Test all 5 accent presets render correctly
6. Test responsive breakpoints on mobile, tablet, desktop
7. Verify root `header.tpl`/`footer.tpl` pair works for public pages
