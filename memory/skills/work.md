## Priority

This is your priority order when working:
1. Check the status of waiting tasks and move them along if possible
2. Pick up a new task from your todos if you have none in-progress
3. Continue working on in-progress tasks using sub-agents
4. Check for new tasks and add them to the backlog


## Waiting tasks

For each task with a PR:
- CI flaked -> note the flake, re-run the failed CI job
- CI failed -> move to `in-progress`, note and fix the failure
- Changes requested -> move to `in-progress`, note the feedback, work on it
- Approved + merged -> move to `archive`
- Still waiting -> leave in `waiting`


## New backlog tasks

New backlog tasks can come directly from your principal, or from tools in workspace.md that have an Updates column entry.

Tasks coming from tools always go into the backlog, regardless of their status in the tool.

Ignore pieces of work that don't seem active, or that seem like someone else is already on them.


## Loop duration

Use a 10m loop unless otherwise specified.
