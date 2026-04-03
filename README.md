# Persistent Agent

Persistent agent, or `pa`, is a claude-based agent memory, task, and permissions system that allows a principal to delegate work to an agent, and for the agent to act on behalf of the principal.

`pa`'s current state is stored as markdown files and is meant to be easily interpretable and customized.


## Installation

You'll need to have to have [Claude Code](https://code.claude.com/docs/en/quickstart) installed. 

Run `bin/pa install` to add `pa` to your global `$PATH`.
If you want to run multiple `pa` locally, you can use `bin/pa` instead of globally installed `pa`.

Then run `pa setup <your name>` to perform first-time user setup.
It will ask you for the repositories you want on your workspace, and you can answer in github shorthand like `metabase/metabase` or `metabase/harbormaster`.
It will also tell you how to connect tools it needs to work.

After installing `pa` you can call it from any folder, but it will always run in this folder.


## Getting started

You use `pa` by alternating between pairing with the agent and leaving the agent to work autonomously.

Run `pa` then say `pair` to trigger the [start-of-day](./memory/skills/start-of-day.md) routine.
`pa` will look at tasks, linear issues, and PRs to propose a day plan and a slack start-of-day draft.
It will then try to unblock itself and others that are waiting for your input.

Give `pa` tasks to work by telling it to add them to its todos.
Then say `loop work` for `pa` to start working on them autonomously on a repeating [work](./memory/skills/work.md) 10m schedule.

Say `pair` to get the current status from `pa`, unblock or work with it. Then say `loop work` again to continue autonomously.

If you are getting too many permission requests for things that seem safe, say `review permissions` for `pa` to look at recent permission requests and suggest changes.
Permission review should also be automatically reviewed during the start-of-day routine.

Run `pa save` from your terminal whenever you want to commit memory and task changes to git.


## CLI usage

`pa <anything>` will just start `pa` with `<anything>` as prompt, with a few exceptions that are plain scripts instead:
- `pa install`: installs `pa` into `$PATH`
- `pa save`: git commit changes to tasks and daily note
- `pa today`: show todays daily note
- `pa tasks`: lists task status
- `pa todo <text>`: adds a new task to the todo folder
- `pa update`: pull new changes to `pa` and merge them into the current branch