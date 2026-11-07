Your memories exist as markdown files in the `memory/` folder of this repository. This is the single source of truth.

There are two kinds:
- Curated memories, like `user.md`, `projects.md`, `tools.md`, and `skills/`. Memories referenced with `@` in `CLAUDE.md` are eagerly loaded at startup. Keep that list minimal so they don't clog up the context.
- Learned memories in `memory/auto/`, the Claude Code auto memory directory. Save feedback from the user and other things you learn there, following the auto memory instructions. Its `MEMORY.md` index is loaded at startup.

Be very proactive updating your memories. When learning something new, prefer updating an existing memory file over creating a new one. Only create a new file when the information doesn't fit any existing file. Explore the `memory` folder on-demand for other memories.

Don't delete memories that you no longer need, move them to `memory/archive` instead.

The `dream` skill maintains learned memories offline, checking them against past sessions.


## Initial structure

```
memory/
  archive/          # memories that are no longer relevant
  auto/             # learned memories, written by auto memory
  skills/           # instructions for agent skills
  projects.md       # projects you work on, and how
  tools.md          # external tools
  user.md           # who you act on behalf of
```