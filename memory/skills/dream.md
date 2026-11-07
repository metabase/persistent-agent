Dreaming is offline memory maintenance based on [The components of agent memory](https://www.anthropic.com/research/components-of-agent-memory). Memory is a prediction of what future sessions will need. In a session you can only guess what matters. In a dream you look back at what actually happened, and use it to correct memory, fill in what sessions missed, and keep memory small and easy to navigate.

This repository is also an Obsidian vault, so keep memory the way a good personal knowledge base is kept: small notes with one idea each, linked with `[[name]]` wikilinks, described with YAML properties.


## Sources and layers

Ground truth, to check memory against:
- session transcripts: `pa transcripts <since> [session-id]` prints the user and assistant text of sessions in this repository after `<since>`, grouped by session id
- the current state of projects and tools, for facts that might have drifted

`<since>` is the newest `dreamed` property in `daily-notes/`, from `grep -h '^dreamed:' daily-notes/*.md | sort | tail -1`. If there's none, use the first timestamp of the oldest transcript, since memory can only be checked against sessions that still exist.

Memory, from top to bottom:
- injected context: `memory/auto/MEMORY.md` and the core memories in `CLAUDE.md`. Loaded into every session, so it must stay small. Curated memories (`memory/*.md`, `memory/skills/`) are self-modifications: propose changes to them in the dream log, don't make them.
- notes: `memory/auto/*.md`, what was learned across tasks and days
- tasks and daily notes: `tasks/` and `daily-notes/`, what is known about each piece of work and each day. Most of the working knowledge lives here, written in-session, so it can be wrong or incomplete like any other memory. Files changed since `<since>` are in `git log --since=<since> --name-only --format= -- tasks daily-notes`, plus uncommitted changes in `git status`.
- links: wikilinks between all of the above, and hub notes that gather a topic once it has several notes


## Steps

Note the current time, it becomes the `dreamed` property of this dream.

Split the transcripts since `<since>` into chunks of about 50KB of text, cutting at day boundaries, since one session can span many days. Skip this dream's own session. Read chunks under about 5KB yourself, and give each other chunk to a sub-agent. Give each sub-agent the session id and the chunk's time range, `memory/auto/MEMORY.md`, and the tasks and daily notes changed in that range, and ask for candidates for the passes below, each with the transcript quote and timestamp that supports it. Sub-agents only read and report. You do all the writing, so edits don't overwrite each other.

Then do three passes:

1. Correct. Check the notes, tasks, and daily notes the sessions touched against what actually happened and against the current state of things. For tasks, check their PRs, issues, and deploys with the external tools, since a task can look done in the transcript and still not be. Fix notes that are wrong. Move notes that no longer apply to `memory/archive/` and remove their `MEMORY.md` line. Set `verified` on each note you checked. Add decisions, outcomes, and status changes that tasks are missing to their changelogs, and move tasks whose folder no longer matches their status. Daily notes are a record of the day, so don't rewrite them, add a dated correction instead.
2. Predict. Find what sessions should have remembered but didn't: user corrections, things worked out more than once, traps, decisions and why they were made. Look at tasks too, especially newly archived ones, for lessons that apply beyond that task. Save only what a future session would act on and can't read from code, tools, or the repository. Prefer updating an existing note over making a new one.
3. Consolidate. Merge duplicates, link related notes, and add a hub note when a topic has several notes. Link notes to the tasks and daily notes they came from, and tasks to the notes that apply to them. Fix unresolved links and link orphan notes from where they belong. Keep `MEMORY.md` an index with one line per note, and move detail down into notes. If a note is stable and used often, propose promoting it to a curated memory or skill. That is a self-modification, so propose it in the dream log and only do it while pairing.

Smaller memory is better than bigger memory. Record what was learned, not what happened.


## Note properties

Keep the auto memory frontmatter, and add these properties:

```yaml
created: 2026-11-07
verified: 2026-11-07
sources:
  - "[[2026-11-06]]"
  - "[[fix-login-redirect]]"
  - session 1a2b3c4d
```

`sources` are wikilinks to the daily notes or tasks that support the note, and short ids of the sessions that do.


## Obsidian tooling

When Obsidian is running, the `obsidian` CLI can read the vault's link graph. Run it as `timeout 20 obsidian vault=<this repository's folder name> <command> < /dev/null`, because it can hang waiting for input.
- `unresolved verbose`: links to notes that don't exist, with the files that have them
- `orphans`: notes nothing links to, filter to `memory/`
- `backlinks path=<file>`: what links to a note
- `move path=<file> to=<path>` and `rename path=<file> name=<name>`: move or rename a note and update the links to it
- `properties path=<file>`: a note's properties

Without Obsidian, grep for `[[` instead, and update links by hand when moving or renaming.


## Dream log

Write what the dream changed to a `## Dream` section at the end of today's daily note, so the user can review it. Set the note's `dreamed` property to the time you noted at the start, so the next dream knows where this one stopped. Create the note if there isn't one yet.

```markdown
---
dreamed: 2026-11-07T22:30:00Z
---

## Dream
Sessions 1a2b3c4d and 5e6f7a8b, since 2026-11-06T09:41:56Z.

### Corrected
- [[note-name]]: what was wrong, and what it says now.

### Added

### Consolidated

### Proposed
```

Leave out empty sections. If a dream already ran today, add to its section and update `dreamed`.

Then run `pa save` to commit the memory changes.
