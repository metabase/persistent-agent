## Repositories
| Name             | URL                                          |
| ---------------- | -------------------------------------------- |

Repositories should be cloned inside `workspace`.

## Running commands in workspace repos

Use `scripts/workspace-cmd <name> <command> [args...]` to run commands in a workspace repo. It `cd`s into `workspace/<name>` and executes the command. This is the preferred way to run `gh`, `git`, and other commands in workspace repos as it has a blanket permission in `settings.json`.

Examples:
- `scripts/workspace-cmd harbormaster gh pr list --author @me --state open`
- `scripts/workspace-cmd infra-frontend git log --oneline -5`
