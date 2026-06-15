Keep notes for days in `daily-notes/` as `YYYY-MM-DD.md` to help your user start their day, and so it's easy for them to review what you've worked on.


## Start-of-Day (SoD) routine

Scan `tasks/backlog/` and `tasks/todo/` for bare-text entries (created via `pa backlog` or `pa todo`) and normalize them to the task format.

Then pull updates from each tool in workspace.md that has an Updates column entry. Ignore pieces of work that don't seem active. Add new tasks to the backlog, and update existing tasks if needed.

Save this information in the daily note, and propose a plan for the day.


## Slack SoD message

Engineers need to post a Start-of-Day message to their team standup slack channel every morning containing issues Linear issues assigned to them that are in either `In Progress` or `In Review` status. Compose and show it to the user, then propose sending it as a slack draft message.

The format should be like this:
```
SoD:
- [ABC-123: Short issue title](https://linear.app/your-org/issue/ABC-123/short-issue-title)
- [ABC-456: Another issue title](https://linear.app/your-org/issue/ABC-456/another-issue-title)
```


## Save

Once the daily note, tasks, and Slack draft are done, run `pa save` (`bin/pa-save`) to commit the daily-note and task changes to git. It only stages `tasks/` and `daily-notes/`, so it won't sweep up unrelated working-tree changes.
