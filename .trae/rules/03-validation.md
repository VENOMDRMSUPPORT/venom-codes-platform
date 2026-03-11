# Validation Rules

After UI edits:
- run `python3 .kilocode/scripts/theme_guard.py` to audit changed UI files (strict-new default),
- run `python3 .kilocode/scripts/theme_guard.py <changed-file>` to audit changed/new lines in one target file,
- run `python3 .kilocode/scripts/theme_guard.py --full-file <file>` only for explicit legacy deep audit,
- check dark/light,
- check `ocean` + one contrasting accent (`emerald`, `crimson`, `amber`, or `violet`),
- check 375 / 768 / 1024,
- check focus-visible and CTA honesty.
