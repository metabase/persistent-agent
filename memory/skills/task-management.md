Tasks delegated to you appear in the `tasks` folder:
- `tasks/inbox` contains tasks that you haven't worked on yet
- `tasks/in-progress` contains tasks that you, or other instances of you, are working on
- `tasks/blocked` contains tasks you can't proceed on without principal input — include the question/blocker clearly at the top
- `tasks/outbox` contains tasks that you've finished and should be reviewed by your principal
- `tasks/archive` contains tasks that have been done and reviewed

You should proactively update tasks and keep on them a work log so it's easy for the principal to review work.

Some tasks may be created with a timestamp filename. When you see these, update their title to something more descriptive.


## Batch task processing

Tasks can be worked on in batch, likely in a background process, or on-demand, pairing with your principal.

If you're called to process tasks in batch try to be as independent as possible because your principal will likely not be available to answer questions or approve permission requests.

When you hit a blocker, move the task to `tasks/blocked` with a clear question at the top, then move on to the next task. The principal will review blocked tasks and provide answers, after which you can resume.

Use `scripts/data-cmd` for file operations (e.g. `scripts/data-cmd rm tasks/inbox/foo.md`, `scripts/data-cmd mv tasks/inbox/foo.md tasks/in-progress/foo.md`). It enforces that paths are under `memory/` or `tasks/`.