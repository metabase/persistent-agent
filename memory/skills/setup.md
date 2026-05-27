This skill can be called for initial setup and to ensure the everything is still setup correctly.

Make sure that:
- files in `memory/skills/*` have a matching Claude `SKILL` with appropriate metadata in `.claude/skills/*/SKILL.md`
  - these skill files' text, besides yaml metadata, should only contain a reference the memory file e.g. `@<filepath>`
  - create/update/remove as needed
- External tools in `memory/workspace.md` are filled in and up to date
  - check if the tools you have listed are the ones the user uses
    - remove the ones the user doesn't need from the list, and from .claude/settings.json if they are claude plugins
  - check access for tools you have listed
  - ask the user what other external tools you should have access to, (e.g. github, notion, linear, figma) and how to access them
    - the most straightforward access is CLI tools, Claude plugins, and MCPs
    - run `claude mcp list` for mcp tool status, the user should use `/mcp` to manage them
    - help the user set up access for you if needed
  - confirm with the user which tools you are checking for updates in start-of-day
- Repositories in `memory/workspace.md` are filled in and up to date
  - ask the user what repositories should be part of their workspace
  - clone each into `workspace/<repo>` (either `gh repo clone` or `git clone`)
  - add the repo to the `## Repositories` table in `memory/workspace.md`
  - for each repo, ask whether it supports parallel worktrees (i.e. multiple instances working on it simultaneously without local-state conflicts) and fill in the column
- `memory/user.md` is filled in and up to date
 - prompt for the user's identity if missing
 - use tools you have access to to pull relevant information about the user
