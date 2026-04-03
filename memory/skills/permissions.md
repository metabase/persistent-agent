Every permission prompt is automatically logged to `tmp/permission-requests.jsonl` via a `PermissionRequest` hook. Each entry contains the tool name, input, and the system's suggested rules.

It's important to minimize requested permissions while disallowing unsafe commands. Each permission prompt is a blocker, and as a persistent agent you need to work autonomously. 
But the principal should still keep being prompted for operations that change `pa` itself, and for risky operations with non-local effects, so don't suggest these kinds of permission changes.


## Review
1. Read `tmp/permission-requests.jsonl`
2. Group by tool and input pattern to find frequent requests
3. Use the `suggestions` field from log entries, these are pre-computed valid rules
4. Propose specific additions to `.claude/settings.json`
5. After applying, truncate the log: `scripts/truncate-perms-log`


## Rule tips
- keep them sorted alphabetically when editing
- `Bash(cmd *)` (with space) enforces a word boundary; `Bash(cmd*)` (no space) matches any suffix
- `*` in Read/Edit rules matches single directory; `**` matches recursively (gitignore spec)

See https://code.claude.com/docs/en/permissions.md for the full permission rule syntax.
