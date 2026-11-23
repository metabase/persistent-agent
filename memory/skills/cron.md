`memory/cron.md` defines prompts to send to the main session on a schedule. Cron jobs live in session memory, so the file is the source of truth and a sync copies it into the session.

Only the main session syncs and runs these jobs, so each fires once. It is the first running `pa`, and `bin/pa-main` exits 0 only there. In other sessions and subagents, don't create these jobs.


## Session jobs

Each entry becomes one recurring `CronCreate` job with this prompt:

`[cron:<name>] Run this entry from memory/cron.md.`

The `[cron:<name>]` prefix marks the job as owned by the file. Never touch jobs without it, like the `/loop 30m work` tick or a reminder.

When a job fires, read the entry named in the prefix and do its prompt as if the user sent it.


## Sync

Sync when the main session starts (a `SessionStart` hook asks for it), after you change `memory/cron.md` in the main session, and when the daily `cron-sync` entry fires.

1. Run `bin/pa-main`. If it fails, this isn't the main session: stop and say so.
2. Call `CronList` and delete every job whose prompt starts with `[cron:`.
3. Read `memory/cron.md` and create one job per entry, 30 minutes before its Cron time, e.g. `0 9 * * 1-5` becomes `30 8 * * 1-5`. If that crosses midnight, move the day fields back a day too.
4. Report the changes in one line, with each job's next run time. If a next run time doesn't match the entry's Cron time, say so.

The scheduler [delays each recurring job](https://code.claude.com/docs/en/scheduled-tasks#jitter) by a fixed offset of up to half its period, at most 30 minutes. Jobs that run hourly or less often have always got the full 30, so creating them 30 minutes early makes them run on time. For jobs that run more often than hourly, use the Cron time as is.

Recreating the jobs restarts their 7-day expiry, so the daily sync keeps them alive. A job recreated after its cron time first runs at the next match, so a sync doesn't make a job fire twice.
