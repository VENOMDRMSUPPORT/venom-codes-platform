---
name: venom-codes-guardrails
description: Enforce project guardrails for template and design work. This skill should be used when requests involve UI, theme, styling, template edits, or frontend presentation changes in this workspace.
---

# Venom Codes Guardrails

Enforce strict project rules for design and template work.

## Purpose

Apply mandatory constraints for template targeting and content language during implementation.

## When to Use

Use this skill for any request involving:
- Template selection or template editing
- Styling, CSS, HTML, TPL, UI layout, frontend visuals
- Theme customization, branding, or design adjustments

## Mandatory Rules

1. Restrict all design/template work to `client/templates/venom-codes/`.
2. Reject or avoid edits to other client theme templates such as `client/templates/six/`, `client/templates/twenty-one/`, or any other non-`venom-codes` template path.
3. Keep all project file content in English only.
4. Allow Arabic only in chat responses; do not write Arabic text into source code, templates, comments, docs, or configuration files in the repository.
5. Prefer existing token variables (`--venom-*` and semantic `--*`) and avoid hardcoded colors.
6. Validate theme parity in dark/light and accent parity with `ocean` plus one contrasting accent (`emerald`, `crimson`, `amber`, or `violet`) after UI-affecting edits.

## Execution Workflow

1. Identify whether the request is design/template related.
2. Map every planned file change to `client/templates/venom-codes/` or its direct supporting assets.
3. If a requested change targets another template path, remap implementation to `venom-codes` equivalents.
4. Before writing changes, verify all inserted text is English.
5. After changes, run a quick path and content sanity check to confirm compliance.

## Compliance Checks

- Path check: every design/template file edit must be under `client/templates/venom-codes/`.
- Language check: no Arabic characters are added to repository files.
- Scope check: no edits in alternative templates unless the request is explicitly non-design and technically required.
