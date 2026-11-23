## Cron
| Name | When | Cron | Prompt |
| ---- | ---- | ---- | ------ |
| cron-sync | Daily 12:00 | `0 12 * * *` | Sync with the `cron` skill. |
| start-of-day | Weekdays 9:00 | `0 9 * * 1-5` | Run the start-of-day routine and save the Slack SoD draft. |

Prompts sent to the main session on a schedule, while it runs. Changes apply at the next sync: when `pa` starts, at the daily `cron-sync`, or when you ask the main session to sync with the `cron` skill.

- Name: unique, in kebab-case.
- When: the run time in words, local time.
- Cron: 5 fields in local time, in backticks, e.g. `0 9 * * 1-5`. Write the time you want it to run, the sync accounts for the scheduler's delay.
- Prompt: one line. Put long instructions in a skill and call it here.
