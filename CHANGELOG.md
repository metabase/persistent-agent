## 2026-06-15

### License, README polish, and pre-open-source cleanup
- Added an MIT `LICENSE` (Copyright Metabase).
- `README.md`: clarified install (fork first, clone, local vs global `pa`), dropped a stale `pa save` line, softened "the `pa` repo" to "a shared `pa` repo".
- `memory/skills/start-of-day.md`: replaced the two real example Linear issues in the SoD message format with generic placeholders (`ABC-123`/`your-org`), so the public template carries no internal issue references.
- `README.md`: genericized the setup example from `metabase/harbormaster` (a private repo) to `your-org/your-repo`.

## 2026-06-09

### Minimal verbosity in PRs, commits, and code comments
- `memory/workspace.md` "Creating commits and PRs": detailed reasoning, investigation trails, hypotheses, and iterative (often-wrong) notes stay in the **task file**, not in coworker-facing artifacts. PR body = issue/task ref + at most a one-line "what"; commit message = one terse line; code comments sparse, only what the code can't say. When work is ready to present, compose a proper PR description. Rationale: coworkers read PRs/code, and reasoning meant for you/the user misleads them when it later turns out wrong. Sharpens the prior soft "be terse" guidance.

## 2026-05-29

### SoD ends with `pa save`
- `memory/skills/start-of-day.md`: added a closing "Save" step — once the daily note, tasks, and Slack draft are done, run `pa save` (`bin/pa-save`) to commit daily-note and task changes. It stages only `tasks/` and `daily-notes/`, so it won't sweep up unrelated working-tree changes.

### Modes of operation extracted to its own skill
- New `memory/skills/modes.md` (+ `.claude/skills/modes/SKILL.md` stub, eagerly loaded via `@memory/skills/modes.md` in CLAUDE.md). The "## Modes of operation" section was **moved out of `memory/skills/tasks.md`** — if you have local edits to that section, they now belong in `modes.md`, not `tasks.md`. Pair/work mode are central enough to be a first-class skill rather than buried in tasks.
- New behavior in work mode: entering work mode via a natural-language phrase ("work", "switch to work mode", or similar) now immediately starts `/loop 30m work` instead of a single pass. The fixed 30m interval re-scans tasks and external trackers so externally-assigned work is picked up. A directly-typed `/work` remains a one-shot. No hook/settings.json — intent recognition is the agent's, and `modes.md` is eagerly loaded so the trigger is always in context.

### Work skill: never work the backlog
- `memory/skills/work.md`: added an explicit rule that the agent must not start work on `backlog` tasks. Backlog is triage-only; a task is workable only once the user moves it to `todo`. Importance signals ("this is important", "I'll look at it") are not assignment. When no `waiting`/`todo`/`in-progress` work remains, stop and surface that. Complements the 2026-05-28 change that defaults new tasks to backlog.

## 2026-05-28

### Task folder defaults
- `memory/skills/tasks.md`: new tasks now default to `tasks/backlog`, regardless of their status in external trackers (e.g. a Linear issue that's "In Progress" but has no local work). A task only moves to `tasks/todo` when the user explicitly assigns it. Previously the agent could file freshly-discovered tasks straight into `todo`.

## 2026-05-15

### Parallel-worktrees metadata
- add a `Parallel worktrees` column to the Repositories table in `memory/workspace.md`. Indicates whether multiple instances can work on the repo at the same time via `git worktree` without local-state conflicts (docker ports, dev-server caches, lockfiles).
- when dispatching sub-agents against a repo marked `yes`, pass `isolation: "worktree"` to the `Agent` tool so each gets a clean checkout. The work skill encodes this.
- setup skill now asks for this value when adding a repo.
- migration note for existing users: existing rows in `memory/workspace.md` get a `?` placeholder; ask the user so you can fill in `yes`/`no` per repo.

### `memory/feedback/`
- add `memory/feedback/` (with a `.gitkeep`) as the standard location for feedback memories — guidance the user has given about how to approach work. Reference it in the `memory/skills/memory.md` initial-structure block.

### `principal` → `user`
- rename `memory/principal.md` → `memory/user.md`. Update CLAUDE.md core memories reference and all skill files that mentioned `principal` / `Principal`.
- remove `memory/glossary.md`. The glossary's main purpose was defining `agent` / `principal` — with `user` replacing `principal` the pair becomes self-evident, and the `Metabase` row was personal-config anyway.
- migration note for existing users: edits to `CLAUDE.md` and `memory/principal.md` will conflict on update. Resolve by accepting the rename (delete `principal.md`, take `user.md` from upstream) and merge your personal identity into the new file.

### Permissions
- flip `defaultMode` from `dontAsk` to `auto`. The classifier handles routine tool calls and prompts on uncertainty, so the hand-rolled `allow` list and curation flow are no longer needed.
- `.claude/settings.json` now only `ask`s on edits to `.claude/settings.json` / `.claude/settings.local.json` so the agent can't silently change its own gates. Everything else falls through to the classifier.
- remove the `PermissionRequest` hook, `.claude/hooks/log-permission-request.sh`, and `scripts/truncate-perms-log` — auto mode means no logged prompts to review.
- remove the `permissions` skill (`memory/skills/permissions.md` and `.claude/skills/permissions/`) — there's no longer a curation flow to document.

### workspace-cmd retired
- remove `scripts/workspace-cmd` and the `deny Bash(cd workspace/*)` rule. The wrapper existed because `dontAsk` mode couldn't pattern-match across compound commands like `cd workspace/foo && git ...`; auto mode reasons about full commands directly, so the wrapper no longer earns its keep. `cd` into `workspace/<repo>` directly.
- `memory/workspace.md` shortened: drop the "Running commands in workspace repos" section and the workspace-cmd PR example.

### Start-of-day skill
- drop the "review permission requests" step (no more log to review).

## 2026-04-17

### Tasks skill
- add `repo chores` (lint, format, typecheck, pre-PR checks) as an explicit phase before draft PR review
- replace `type` (single value) with `tags` (open-ended list); tags double as skill hints (e.g. `self-modification` → run that skill). Existing tasks should be migrated to this new format.

### Start-of-day skill
- scan `tasks/backlog/` and `tasks/todo/` for bare-text entries (from `pa backlog`/`pa todo`) and propose normalizing them (filename, frontmatter, Goal section)

### Work skill
- normalize bare-text todo/backlog entries before working on them (autonomous, since principal isn't present)

### bin/pa
- forward args with `"$@"` instead of `"$*"`; flags like `pa --permission-mode dontAsk` now work. Multi-word prompts still work (claude accepts variadic positional).
- `pa update` now starts with `--permission-mode default` so the update flow can prompt for permissions instead of silently blocking under `dontAsk`.
- new `pa work` CLI shortcut — starts `pa` on the autonomous `/loop work` loop.

### CLAUDE.md
- note that `pa` starts in `don't ask mode` and that the agent should tell the user to exit it (`shift+tab`) when it needs a permission it doesn't have.

### Setup skill
- spell out the clone step: clone into `workspace/<repo>` and add the repo to the workspace.md table. First-time setup was silently blocked under `dontAsk` because the clone step wasn't explicit.

### Permissions
- add `Bash(git clone * workspace/*)` so `git clone` into `workspace/` works alongside the existing `gh repo clone *`.

## 2026-04-16

### Permissions
- `permissions.defaultMode` set to `dontAsk` — `pa` starts with only pre-approved tools allowed and blocks tasks that need anything else, instead of interrupting for prompts. Exit with `shift+tab` to get permission requests again; restart `pa` to re-enter `dontAsk`.

### README
- document `dontAsk` default and how to exit it
- move `pa save` line up next to the rest of the getting-started flow

## 2026-04-15

### Tasks skill
- clarify `blocked` vs `waiting`: principal review of a PR goes to `blocked` (it's principal input); `waiting` is for non-principal external steps (CI, third-party review, merge)

## 2026-04-14

### Permissions
- add `Bash(scripts/workspace-cmd * awk *)`, `Bash(scripts/workspace-cmd * md5sum *)`, `Bash(scripts/workspace-cmd * test *)` — safe read-only tools used in workspace
- add `Edit/Read/Write(daily-notes/**)` — daily-notes/ moved to top level on Apr 10 but perms weren't propagated
- remove non-functional `Bash(*&&*)` / `Bash(*||*)` deny rules — Claude Code splits compound commands on shell operators and matches each subcommand against rules independently, so these patterns never matched. Subcommand splitting already prevents chained-command bypass of other deny rules.

## 2026-04-10

### Structure
- `tasks/known/` → `tasks/backlog/`

## 2026-04-09

### Task file format
- YAML frontmatter replaces markdown key/value metadata (title, created, type, links)
- `type` values: bug | feature | refactor | chore | docs | self-modification
- `links` is a YAML list for URLs and `repo/branch` workspace refs
- H1 heading removed — `title` in frontmatter is the source of truth
- Status removed from file — the folder is the source of truth
- "Work log" renamed to "Changelog"
- ISO 8601 UTC timestamps for changelog entries and `created` field
- New tasks use Goal + Scope sections; existing tasks keep their current sections (Summary, Notes, etc)
- Existing date-only entries are fine — don't backfill times you don't know

## 2026-04-08

### Skills
- new: `memory/skills/self-modification.md` — guidance for tasks that edit the agent's own files (skills, scripts, starting memories, permissions); covers pairing expectation, keeping self-modification commits clean of private info, propagating to `.claude/skills`, updating CHANGELOG.md, and contributing back via the workspace clone

### CLAUDE.md
- eagerly load `memory/skills/self-modification.md` as a core memory

## 2026-04-03

### Structure
- `tasks/inbox/` → split into `tasks/known/` and `tasks/todo/`
- `memory/company.md` removed, content moved to `memory/principal.md` (AI policy) and `memory/workspace.md` (tools)
- `memory/archive/` added for retired memories
- `scripts/data-cmd` removed, use `mv` directly (permissions added for `mv memory/*` and `mv tasks/*`)
- `bin/pa-inbox` → `bin/pa-todo`
- `.claude/settings.local.json` removed, gitignored

### Skills
- `memory/skills/memory-management.md` → `memory/skills/memory.md`
- `memory/skills/permission-management.md` → `memory/skills/permissions.md`
- `memory/skills/task-management.md` → `memory/skills/tasks.md` (rewritten: pair/work modes replace pairing/solo, explicit task phases, no more polling loops in task skill)
- `memory/skills/daily-note.md` → `memory/skills/start-of-day.md`
- new: `memory/skills/update.md` — pull upstream changes, use CHANGELOG.md for conflict resolution
- new: `memory/skills/work.md` — autonomous work loop with priority order
- new: `memory/skills/changelog.md` — summarize changes for update conflict resolution

### CLAUDE.md
- core memories trimmed: only glossary, principal, workspace, memory skill, tasks skill are eagerly loaded
- removed "Current context" section

### Permissions
- many new `Bash(...)` allow rules (gh, workspace-cmd expansions, mv, unzip, wc, etc.)
- sorted alphabetically
- `WebSearch`, `WebFetch`, `Read(/tmp/**)` added
- Notion/Linear/Slack/Figma plugin permissions expanded
