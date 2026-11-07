This skill can be called for initial setup and to ensure the everything is still setup correctly.

Make sure that:
- files in `memory/skills/*` have a matching Claude `SKILL` with appropriate metadata in `.claude/skills/*/SKILL.md`
  - these skill files' text, besides yaml metadata, should only contain a reference the memory file e.g. `@<filepath>`
  - create/update/remove as needed
- `autoMemoryDirectory` in `.claude/settings.local.json` is the absolute path of this repo's `memory/auto`
- External tools in `memory/tools.md` are filled in and up to date
  - check if the tools you have listed are the ones the user uses
    - remove the ones the user doesn't need from the list, from .claude/settings.json if they are claude plugins, and from mentions in skills
  - check access for tools you have listed
  - ask the user what other external tools you should have access to, (e.g. github, notion, linear, figma) and how to access them
    - the most straightforward access is CLI tools, Claude plugins, and MCPs
    - run `claude mcp list` for mcp tool status, the user should use `/mcp` to manage them
    - help the user set up access for you if needed
  - confirm with the user which tools you are checking for updates in start-of-day
- Projects in `memory/projects.md` are filled in and up to date
  - ask the user what projects you should work on, as git repos or local paths
  - for each, ask whether to clone it or work in place (default: clone git repos)
    - clone: clone into `.workspace/<name>` following the Clone `yes` rules in `memory/projects.md`
    - in place: add Source to `permissions.additionalDirectories` in `.claude/settings.local.json`
  - add the project to the `## Projects` table in `memory/projects.md`
  - for each clone, ask whether it supports parallel work (i.e. multiple instances and the user working on it simultaneously without local-state conflicts) and fill in the `Parallel` column, empty for in place
- `memory/user.md` is filled in and up to date
 - prompt for the user's identity if missing
 - use tools you have access to to pull relevant information about the user
