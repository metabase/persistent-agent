# Persistent Agent

Persistent agent, or `pa`, is a claude-based agent memory and task system that allows a principal to delegate work to an agent, and for the agent to act on behalf of the principal.

`pa` current state stored as markdown files and is meant to be easily interpretable.


## Installation

You'll need to have to have [Claude Code](https://code.claude.com/docs/en/quickstart) installed. Then run `bin/pa install` to add `pa` to your global `$PATH`, and run `pa setup` to perform first-time user setup and connectivity check.


## Memory

`pa` stores memories as markdown files in `memory`.
Initial setup will fill in `memory/principal.md` and `memory/company.md`.
Further usage will add, update, and trim memories.
Memories that should always be present will be added to `CLAUDE.md`.
Memories in `memories/skills` will have claude skills created for them whenever you run `pa setup`.


## Tasks

`pa` has a task system in `tasks` based on folders by status: `inbox`, `in-progress`, `outbox`, `archive`.

`pa tasks` will print a description of current tasks.
`pa inbox <text>` will add a new task file containing `text`, but you can add a task there any other way too.
`pa batch` will attempt to process tasks autonomously in batch.


## Hacking on PA

You can and should edit `pa` to suit you. It is mostly text files.