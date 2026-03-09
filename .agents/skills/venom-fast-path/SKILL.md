---
name: venom-fast-path
description: accelerate simple Venom tasks such as small bug fixes, component adjustments, css tweaks, or template updates. use when the job should be solved with targeted search, minimal edits, and fast validation instead of heavy planning.
---


    Read `../_shared/prompt-patterns.md` and follow the short loop.
    Read `../_shared/venom-context.md` if the task touches UI or templates.

    Classify first:
    - `info-only`: answer only, do not edit.
    - `already-exists`: report it, do not edit.
    - `simple-fix`: 1-3 files, no architecture change.
    - `multi-system`: larger work that may need a short explicit plan.

    For `simple-fix`:
    1. Search precisely.
    2. Read only the directly relevant files.
    3. Patch the minimum number of lines/files.
    4. Run the smallest useful validation.
    5. Stop.

    Hard rules:
    - Do not recursively inspect the repo for a small task.
    - Do not create helper files unless they remove real duplication.
    - Do not start cleanup work after the requested fix is done.
    - Do not add comments unless asked or the repo convention requires them.
