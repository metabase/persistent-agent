Tasks delegated to you appear in the `tasks` folder:
- `tasks/inbox` contains tasks that you haven't worked on yet
- `tasks/in-progress` contains tasks that you, or other instances of you, are working on
- `tasks/blocked` contains tasks you can't proceed on without principal input, include the question/blocker clearly at the top
- `tasks/waiting` contains tasks done on our side but dependent on external outcomes (CI, review, merge). Poll periodically.
- `tasks/archive` contains tasks that have been done

You should proactively update tasks and keep on them a work log so it's easy for the principal to review work.

Some tasks may be created with a timestamp filename. When you see these, update their title to something more descriptive.


## Polling waiting tasks

Use a 10m loop to check `tasks/waiting` periodically. For each task with a PR:
- CI flaked -> note the flake, re-run the failed CI job
- CI failed -> move to `in-progress`, note the failure
- Changes requested -> move to `in-progress`, note the feedback
- Approved + merged -> move to `archive`
- Still pending -> leave in `waiting`

Example:
```
/loop 10m /task-management poll waiting tasks
```


## Tasks as a persistent agent

As an agent you already know how to generally perform tasks. But in the context of a persistent agent, you're not guaranteed to always have a principal at hand, so you need to focus more on working independently, making your work legible, increasing principal confidence, and improving your processes over time.

For non-trivial tasks try to separate planning and execution. Plan your approach, or even multiple approaches, and add it as a blocker to the task to review it with your principal. Be proactive in planning during start-of-day. When you take on bugs make sure to reproduce them first, then fix them.

If you're missing tooling for common dev tasks, like the ability to run tests or builds, block on it and ask your principal to unblock you.


## Working modes

### Pairing mode
Principal is present. Focus on review, planning, and unblocking instead of execution. When reviewing blocked tasks, move them from `blocked` → `inbox` (unblocked, ready to work) but don't start working on them. Go through all blockers first.

### Solo mode
Work autonomously, likely in a background process. Pick up unblocked tasks from `inbox`, execute them, and be as independent as possible because the principal will likely not be available to answer questions or approve permission requests.

When you hit a blocker, move the task to `tasks/blocked` with a clear question at the top, then move on to the next task. The principal will review blocked tasks and provide answers, after which you can resume.

Use `scripts/data-cmd` for file operations (e.g. `scripts/data-cmd rm tasks/inbox/foo.md`, `scripts/data-cmd mv tasks/inbox/foo.md tasks/in-progress/foo.md`). It enforces that paths are under `memory/` or `tasks/`.


## Creating PRs

When a task results in code changes, create PRs using this workflow:
1. Push the branch first
2. Then `gh pr create --draft --fill`

Use `scripts/workspace-cmd <repo> gh pr create ...` to run in the right directory.
