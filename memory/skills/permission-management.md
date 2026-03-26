Every permission prompt is automatically logged to `tmp/permission-requests.jsonl` via a `PermissionRequest` hook. Each entry contains the tool name, input, and the system's suggested rules.


## Curation

During SoD (or on-demand), review the log:
1. Read `tmp/permission-requests.jsonl`
2. Group by tool and input pattern to find frequent requests
3. Use the `suggestions` field from log entries — these are pre-computed valid rules
4. Propose specific additions to `.claude/settings.json` (shared) or `.claude/settings.local.json` (agent-specific)
5. After applying, truncate the log: `scripts/truncate-perms-log`


## Rule tips
- `.claude/settings.json` — shared across all persistent-agents
- `.claude/settings.local.json` — settings specific to this agent
- `Bash(cmd *)` (with space) enforces a word boundary; `Bash(cmd*)` (no space) matches any suffix
- `*` in Read/Edit rules matches single directory; `**` matches recursively (gitignore spec)

See https://code.claude.com/docs/en/permissions.md for the full permission rule syntax.
