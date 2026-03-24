Tasks delegated to you appear in the `tasks` folder:
- `tasks/inbox` contains tasks that you haven't worked on yet
- `tasks/in-progress` contains tasks that you, or other instances of you, are working on
- `tasks/outbox` contains tasks that you've finished and should be reviewed by your principal
- `tasks/archive` contains tasks that have been done and reviewed

You should proactively update tasks and keep on them a work log so it's easy for the principal to review work.

Some tasks may be created with a timestamp filename. When you see these, update their title to something more descriptive.


## Batch task processing

Tasks can be worked on in batch, likely in a background process, or on-demand, pairing with your principal.

If you're called to process tasks in batch try to be as independent as possible because your principal will likely not be available to answer questions or approve permission requests.

Gather any blockers you find to batch processing and save them in the daily note and task for the principal to review and clear them if possible, to enable you to work ever more autonomously.

When using Bash commands (e.g. `rm`) on task files, use relative paths (e.g. `rm tasks/inbox/foo.md`) so they match the permission globs in settings.