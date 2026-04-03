## Tools
| Tool   | Purpose                    | Agent access           |
| ------ | -------------------------- | ---------------------- |
| Linear | Issue and project tracking | `linear` Claude plugin |
| Slack  | Chat                       | `slack` Claude plugin  |
| GitHub | Code repository            | `gh` CLI tool          |
| Notion | Knowledge base             | `notion` Claude plugin |
| Figma  | Designs                    | `figma` Claude plugin  |

When using `gh` prefer individual bash tool calls for each repository instead of for loops or more involved commands, so that existing permissions are used instead of asking the user for permission for new bash call commands.


## Repositories
| Name             | URL                                          |
| ---------------- | -------------------------------------------- |

Repositories should be cloned inside `workspace`.


## Running commands in workspace repos

Don't try to run commands in workspace folder by changing to that folder and then running a command, e.g. `cd workspace/foo && git something`. This is insecure and will trigger an unavoidable permissions prompt.

Instead use `scripts/workspace-cmd <name> <command> [args...]` to run commands in a workspace folder. It `cd`s into `workspace/<name>` and executes the command. This is the preferred way to run `gh`, `git`, and other commands in workspace repos as it has a blanket permission in `settings.json`.

Always use relative paths (e.g. `scripts/workspace-cmd`) — never absolute paths. The permission rules in `settings.json` use relative paths, so absolute paths won't match and will trigger permission prompts.

Examples:
- `scripts/workspace-cmd harbormaster gh pr list --author @me --state open`
- `scripts/workspace-cmd infra-frontend git log --oneline -5`


## Creating PRs

When a task results in code changes, create PRs using this workflow:
1. Push the branch first
2. Then `gh pr create --draft --fill`

Use `scripts/workspace-cmd <repo> gh pr create ...` to run `git` in the workspace directory for the repository.