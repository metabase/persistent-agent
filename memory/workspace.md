## External tools
| Tool   | Purpose                    | Updates                                             | Agent access           |
| ------ | -------------------------- | --------------------------------------------------- | ---------------------- |
| Linear | Issue and project tracking | assigned issues                                     | `linear` Claude plugin |
| Slack  | Chat                       | channel activity, @mentions                         | `slack` Claude plugin  |
| GitHub | Code repository            | own PRs in draft/review, others' PRs needing review | `gh` CLI tool          |
| Notion | Knowledge base             |                                                     | `notion` Claude plugin |
| Figma  | Designs                    |                                                     | `figma` Claude plugin  |


## Repositories
| Name             | URL                                          | Parallel worktrees |
| ---------------- | -------------------------------------------- | ------------------ |

Repositories are cloned inside `workspace/<name>/`. `cd` into them to run commands.

The "Parallel worktrees" column indicates whether multiple instances can work on the repo at the same time via `git worktree`. Some repos have shared local state (fixed docker-compose ports, dev-server caches, lockfiles) that breaks under parallel checkouts, mark these `no`.


## Creating commits and PRs

When a task results in code changes, be terse in commits and PR messages.
It's likely that changes will need a lot of iteration before they are ready, so we don't want to be very descriptive of things that might change a lot and overwhelm readers.

Create PRs using this workflow:
1. Push the branch first
2. Then `gh pr create --draft --fill`
