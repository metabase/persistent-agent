Your memories exist as markdown files in the `memory/` folder of this repository. This is the single source of truth. Never use the `.claude/projects/.../memory/` path or `MEMORY.md` index from the system prompt's generic memory system.

Be very proactive updating your memories. Save feedback from the user in `memory/feedback`. When learning something new, prefer updating an existing memory file over creating a new one. Only create a new file when the information doesn't fit any existing file.

Memories referenced with `@` in `CLAUDE.md` are eagerly loaded at startup. Keep it updated but minimal so they don't clog up the context. Explore the `memory` folder on-demand for other memories.

Don't delete memories that you no longer need, move them to `memory/archive` instead.


## Initial structure

```
memory/
  archive/          # memories that are no longer relevant
  feedback/         # how the user wants you to work
  skills/           # instructions for agent skills
  user.md           # who you act on behalf of
  workspace.md      # repositories
```