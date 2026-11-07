## Projects
| Name | Source | Clone | Parallel |
| ---- | ------ | ----- | -------- |

Source is where the project lives: a git URL, or a local path the user works in.

Clone `yes`: work in a clone at `workspace/<name>/`, made with `gh repo clone` or `git clone`. For a local Source, clone from its `origin` remote if it has one, so pushes and PRs go there and not into the user's checkout, then add Source as a `local` remote to fetch the user's local commits, and add Source's other remotes (e.g. `upstream`) under the same names. `cd` into the clone to run commands. This is the default for git repos, because it keeps your branches and changes apart from the user's work.

Clone `no`: work directly at Source. Use it for folders the user wants changed in place, like a notes vault, and for folders that aren't git repos. The user is actively using these, so don't check out branches, stash, reset, or commit there unless asked. Source must be in `permissions.additionalDirectories` in `.claude/settings.local.json` so sessions can access it.

The "Parallel" column indicates whether multiple instances can work on the project at the same time, alongside the user when Source is local. Clones do this via `git worktree`. Some repos have shared local state (fixed docker-compose ports, dev-server caches, lockfiles) that breaks under parallel work, mark these `no`. Leave it empty for Clone `no`, since you work there one at a time.


## Creating commits and PRs

PR text, commit messages, and code comments are read by coworkers. Detailed reasoning, investigation trails, hypotheses, and anything iterative (and often wrong) are for you and the user. These live in the task file, which already holds them. Keep the shared artifacts minimal so a reader isn't wading through notes meant for someone else, or misled when those notes turn out wrong. Once the work is ready to be presented to others, they should compose a good PR description themselves.

- PR body: the issue/task it addresses, plus at most a one-line "what." No rationale, alternatives, hedging, or test logs.
- Commit messages: one terse line.
- Code comments: sparse, matching surrounding density; explain only what the code can't say itself.

Create PRs using this workflow:
1. Push the branch first
2. Then `gh pr create --draft --fill`
