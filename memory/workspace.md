## Tools
| Tool   | Purpose                    | Updates                                             | Agent access           |
| ------ | -------------------------- | --------------------------------------------------- | ---------------------- |
| Linear | Issue and project tracking | assigned issues                                     | `linear` Claude plugin |
| Slack  | Chat                       | channel activity, @mentions                         | `slack` Claude plugin  |
| GitHub | Code repository            | own PRs in draft/review, others' PRs needing review | `gh` CLI tool          |
| Notion | Knowledge base             |                                                     | `notion` Claude plugin |
| Figma  | Designs                    |                                                     | `figma` Claude plugin  |

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


## Creating commits and PRs

When a task results in code changes, be terse in commits and PR messages.
It's likely that changes will need a lot of iteration before they are ready, so we don't want to be very descriptive of things that might change a lot and overwhelm readers.

Create PRs using this workflow:
1. Push the branch first
2. Then `gh pr create --draft --fill`

Use `scripts/workspace-cmd <repo> gh pr create ...` to run `git` in the workspace directory for the repository.