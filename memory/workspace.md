## Repositories
| Name             | URL                                          |
| ---------------- | -------------------------------------------- |

Repositories should be cloned inside `workspace`.

## Running commands in workspace repos

Use `scripts/workspace-cmd <name> <command> [args...]` to run commands in a workspace repo. It `cd`s into `workspace/<name>` and executes the command. This is the preferred way to run `gh`, `git`, and other commands in workspace repos as it has a blanket permission in `settings.json`.

Always use relative paths (e.g. `scripts/workspace-cmd`) — never absolute paths. The permission rules in `settings.json` use relative paths, so absolute paths won't match and will trigger permission prompts.

Examples:
- `scripts/workspace-cmd harbormaster gh pr list --author @me --state open`
- `scripts/workspace-cmd infra-frontend git log --oneline -5`
