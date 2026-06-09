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

PR text, commit messages, and code comments are read by coworkers. Detailed reasoning, investigation trails, hypotheses, and anything iterative (and often wrong) are for you and the user. These live in the task file, which already holds them. Keep the shared artifacts minimal so a reader isn't wading through notes meant for someone else, or misled when those notes turn out wrong. Once the work is ready to be presented to others, they should compose a good PR description themselves.

- PR body: the issue/task it addresses, plus at most a one-line "what." No rationale, alternatives, hedging, or test logs.
- Commit messages: one terse line.
- Code comments: sparse, matching surrounding density; explain only what the code can't say itself.

Create PRs using this workflow:
1. Push the branch first
2. Then `gh pr create --draft --fill`
