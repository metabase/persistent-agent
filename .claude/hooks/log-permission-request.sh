#!/bin/bash
# Logs every PermissionRequest to JSONL for later curation.
# Exits 0 so the user still sees the normal permission dialog.
LOG="$(cd "$(dirname "$0")/../.." && pwd)/tmp/permission-requests.jsonl"
jq -c '{
  ts: (now | todate),
  tool: .tool_name,
  input: .tool_input,
  suggestions: .permission_suggestions
}' >> "$LOG"
exit 0
