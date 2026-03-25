# Persistent Agent

Persistent agent, or `pa`, is a claude-based agent memory and task system that allows a principal to delegate work to an agent, and for the agent to act on behalf of the principal.

`pa` current state stored as markdown files and is meant to be easily interpretable.


## Installation

You'll need to have to have [Claude Code](https://code.claude.com/docs/en/quickstart) installed. Then run `bin/pa install` to add `pa` to your global `$PATH`, and run `pa setup <your name>` to perform first-time user setup and connectivity check.


## Getting started

Run `pa sod`, or just say `sod` on a existing session (`pa <anything>` will just start `pa` with `<anything>` as prompt).
`pa` will propose a day plan, ask you if you want to send the start-of-day draft, and save a daily note.

Pick a couple of your tasks and tell `pa` to add them to your inbox.
Then say `batch` to start batch processing them.
`pa` will try to be as independent as possible and stop when it can't progress.
Ask about blockers and clear them, then say `batch` again to continue autonomously.


## Workspace

`pa` will clone repositories inside of `workspace`.
Files in that directory are ignored by git when updating this repository.


## Tasks

`pa` has a task system in `tasks` based on folders by status: `inbox`, `in-progress`, `blocked`, `outbox`, `archive`.

`pa tasks` will print a description of current tasks.
`pa inbox <text>` will add a new task file containing `text`, but you can add a task there any other way too.
`pa batch` will attempt to process tasks autonomously in batch.

Batch processing tries to be as autonomous as possible. When there's a blocker or a plan that requires review, `pa` will move the task to `blocked` so it waits for the next time you are around. When a task seems fully done it will be in `outbox`.


## Memory

`pa` stores memories as markdown files in `memory`.
Initial setup will fill in `memory/principal.md` and `memory/company.md`.
Further usage will add, update, and trim memories.
Memories that should always be present will be added to `CLAUDE.md`.
Memories in `memories/skills` will have claude skills created for them whenever you run `pa setup`.


## Hacking on PA

You can and should edit `pa` to suit you. It is mostly text files.