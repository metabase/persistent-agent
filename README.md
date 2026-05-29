# Persistent Agent

Persistent agent, or `pa`, is a claude-based agent memory, and task system that allows a user to delegate work to an agent, and for the agent to act on behalf of the user.

`pa`'s current state is stored as markdown files and is meant to be easily interpretable and customized.


## Installation

You'll need to have to have [Claude Code](https://code.claude.com/docs/en/quickstart) installed. 

Run `bin/pa install` to add `pa` to your global `$PATH`. 
You can call `pa` it from any folder, but it will always run in this folder.
If you want to run multiple `pa`, you can use the local `bin/pa` instead of globally installed `pa`.

Then run `pa setup <your name>` to perform first-time user setup.
It will ask you for the tools and repositories you want on your workspace, and you can answer in github shorthand like `metabase/metabase` or `metabase/harbormaster`.
It will also tell you how to connect tools it needs to work.


## Getting started

You use `pa` by alternating between [modes](./memory/skills/modes.md): pairing with the agent, and leaving the agent to work autonomously.

Run `pa` then say `sod` or `pair` to trigger the [start-of-day](./memory/skills/start-of-day.md) routine.
`pa` will look at tasks and updates from tools to propose a day plan and a slack start-of-day draft.
It will then try to unblock itself and others that are waiting for your input.

Give `pa` tasks to work by telling it to add them to its todos.
Then say `work` and `pa` starts working on them autonomously on a repeating [work](./memory/skills/work.md) loop, checking for newly-assigned work every 30 minutes.
You can also start `pa` on the work loop from the CLI with `pa work`.

Say `pair` to get the current status from `pa`, unblock or work with it. Then say `work` again to continue autonomously.

Run `pa save` from your terminal whenever you want to commit daily notes and task changes to git.


## CLI usage

`pa <anything>` will just start `pa` with `<anything>` as prompt, with a few exceptions that are plain scripts instead:
- `pa install`: installs `pa` into `$PATH`
- `pa save`: git commit changes to tasks and daily notes
- `pa today`: show todays daily note
- `pa tasks`: lists task status
- `pa backlog <text>`: adds a new task to the backlog folder
- `pa todo <text>`: adds a new task to the todo folder
- `pa update`: pull new changes to `pa` and merge them into the current branch


## Permissions

`pa` starts in [`auto mode`](https://code.claude.com/docs/en/permission-modes#eliminate-prompts-with-auto-mode), which uses Claude itself to allow or deny permission prompts.
You can edit (or ask `pa` to) `.claude/settings.json` with `ask`/`deny` rules for things that you want to manually control permissions for.

Use `shift+tab` to switch modes if you want stricter or looser behavior.


## Updating, modifying, and contributing back

Run `pa update` to fetch and merge the latest changes from upstream. Conflicts are resolved automatically using `CHANGELOG.md` for context.

You can and should edit `pa` to suit the way you work. The `memory` folder has all the instructions on how `pa` works as markdown files. 
Edit them directly or work with `pa` on self-modification tasks.

If you want to contribute them back to the `pa` repo, ask `pa` to help you do that or follow the instructions in `memory/skills/self-modification.md` yourself.


## Remote control

Use Claude's [remote control](https://code.claude.com/docs/en/remote-control) to drive a local `pa` session from the Code tab in the Claude mobile app.

To enable it type `/remote-control` inside an existing session, or run `/config` and set **Enable Remote Control for all sessions** to `true`.
