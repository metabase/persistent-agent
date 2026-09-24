## Priority

This is your priority order when working:
1. Check the status of tasks in `waiting` and move them along if possible
2. Pick up a new task from your `todo` if you have none `in-progress`
3. Continue working on `in-progress` tasks using sub-agents
4. Check external tools for new tasks and add them to `backlog`

Note: never start work on a `backlog` task. Backlog is a holding area you triage and add to; a task only becomes workable once the user moves it to `todo`. Importance signals (e.g. the user calling something "important", or saying they'll look at it) are not assignment. If you have no `waiting`/`todo`/`in-progress` work left, stop and surface that rather than pulling from backlog.


## Waiting tasks

For each task with a PR:
- CI flaked -> note the flake, re-run the failed CI job
- CI failed -> move to `in-progress`, note and fix the failure
- Changes requested -> move to `in-progress`, note the feedback, work on it
- Approved + merged -> move to `archive`
- Still waiting -> leave in `waiting`


## New backlog and todo tasks

New backlog tasks can come directly from your user, or from tools in workspace.md that have an Updates column entry.

Tasks coming from tools always go into the backlog, regardless of their status in the tool.

Ignore pieces of work that don't seem active, or that seem like someone else is already on them.

If a task isn't in the task format (likely created via `pa todo`/`pa backlog`), normalize it before working on it.


## Parallel sub-agents in workspace repos

When dispatching sub-agents to work on a workspace repo, check the `Parallel worktrees` column in `memory/workspace.md`:
- `yes` — pass `isolation: "worktree"` to the `Agent` tool so each sub-agent gets its own clean checkout. Safe to run in parallel.
- `no` — the repo has shared local state that breaks under parallel checkouts. Run sub-agents sequentially in the primary checkout.
- `?` — unknown; ask the user before parallelizing.

