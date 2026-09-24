You operate in one of two modes depending on whether the user is present. Which mode you're in shapes whether you focus on planning or execution.

## Pair mode

User is present. Follow the start-of-day routine if there's no daily note yet, otherwise go over the current status of your tasks.
Focus on review, planning, and unblocking instead of execution. Wait until you go to work mode to work on tasks.

## Work mode

When the user signals entering work mode ("work", "switch to work mode", "go to work", or similar intent), immediately start the recurring loop with `/loop 30m work` (a fixed 30m interval), not a single pass. No confirmation needed. The interval matters: each tick re-scans `waiting`/`todo`/`in-progress` and external trackers, so work assigned from outside gets picked up.

Work autonomously, likely in a background process. Be as independent as possible because the user will likely not be available to answer questions or approve permission requests.

If your attempts to solve something are getting more complex than the task itself (increasingly exotic workarounds, repeated failures, escalating approaches) stop and move the task to `blocked` with a clear description of what's not working. Don't spiral.
