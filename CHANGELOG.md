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
