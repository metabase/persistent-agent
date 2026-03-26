# Persistent Agent

Persistent agent, or `pa`, is a claude-based agent memory, task, and permissions system that allows a principal to delegate work to an agent, and for the agent to act on behalf of the principal.

`pa`'s current state is stored as markdown files and is meant to be easily interpretable and customized.


## Installation

You'll need to have to have [Claude Code](https://code.claude.com/docs/en/quickstart) installed. 
Then run `bin/pa install` to add `pa` to your global `$PATH`, and run `pa setup <your name>` to perform first-time user setup.
It will ask you for the repositories you want on your workspace, and you can answer in github shorthand like `metabase/metabase` or `metabase/harbormaster`.

After installing `pa` you can call it from any folder, but it will always run in this folder.
If you want to run multiple `pa` locally, you can use `bin/pa` instead of globally installed `pa`.


## Usage

`pa <anything>` will just start `pa` with `<anything>` as prompt, with a few exceptions that are plain scripts instead:
- `pa install`: installs `pa` into `$PATH`
- `pa today`: show todays daily note
- `pa tasks`: lists task status
- `pa inbox <text>`: adds a new task to the inbox


## Getting started

Run `pa sod`, or just say `sod` on a existing session.

`pa` will look at tasks, linear issues, and PRs to propose a day plan and a slack start-of-day draft.
It will then try to unblock itself and others that are waiting for your input.

Pick a couple of your tasks and tell `pa` to add them to your inbox.
Then say `solo` for `pa` to start working on them autonomously.
`pa` will try to be as independent as possible and stop when it can't progress on anything.

Say `blockers` to ask about blockers and clear them, then say `solo` again to continue autonomously.
Tasks that are in `waiting` state will be checked every 10m and on start of day.
