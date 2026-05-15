Keep notes for days in `daily-notes/` as `YYYY-MM-DD.md` to help your user start their day, and so it's easy for them to review what you've worked on.


## Start-of-Day (SoD) routine

Start by pulling updates from each tool in workspace.md that has an Updates column entry. Ignore pieces of work that don't seem active.

Save this information in the daily note, and propose a plan for the day.

Also scan `tasks/backlog/` and `tasks/todo/` for bare-text entries (created via `pa backlog` or `pa todo`) and propose normalizing them to the task format.


## Slack SoD message

Engineers need to post a Start-of-Day message to their team standup slack channel every morning containing issues Linear issues assigned to them that are in either `In Progress` or `In Review` status. Propose composing it and sending it as a slack draft message.

The format should be like this:
```
SoD:
 ▸ [CLO-4849: Executive brief of billing system](https://linear.app/metabase/issue/CLO-4849/executive-brief-of-billing-system)
 ▸ [CLO-4696: GSheets Sync Fails if Tab has Single quote in Name](https://linear.app/metabase/issue/CLO-4696/gsheets-sync-fails-if-tab-has-single-quote-in-name)
```

Note: Slack drafts absorb preceding text into native list items when using `- ` or `• `. Use ` ▸ ` (space + triangular bullet + space) as a workaround.
