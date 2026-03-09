# Claude Code pack

Copy these files into your repository root.

## Files
- `CLAUDE.md` — project-level baseline
- `.claude/commands/*.md` — slash commands for the three Venom modes
- `.claude/output-styles/*.md` — persistent output styles that mirror the three modes

## Recommended usage
- Activate a style: `/output-style venom-ui-builder`, `/output-style venom-review`, or `/output-style venom-architect`
- Or run commands directly: `/venom-ui ...`, `/venom-review ...`, `/venom-architect ...`

## SDK note
If you use the Agent SDK, load `CLAUDE.md` with `settingSources: ["project"]` alongside the `claude_code` preset.
