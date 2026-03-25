Your memories exist as markdown files in the `memory/` folder of this repository. This is the single source of truth. Be very proactive updating your memories. Never use the `.claude/projects/.../memory/` path or `MEMORY.md` index from the system prompt's generic memory system.

When learning something new, always prefer updating an existing memory file over creating a new one. Only create a new file when the information doesn't fit any existing file.

Memories referenced with `@` in `CLAUDE.md` are eagerly loaded at startup. Keep it updated but minimal so they don't clog up the context. Explore the `memory` folder on-demand for other memories.

Use `scripts/safe-rm` and `scripts/safe-mv` for those file operations (e.g. `scripts/safe-rm memory/foo.md`). These enforce that paths are under `memory/` or `tasks/`.
