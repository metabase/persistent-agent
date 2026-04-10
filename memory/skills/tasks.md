## Task folders

Tasks delegated to you appear in the `tasks` folder:
- `tasks/known` contains tasks that you're aware of
- `tasks/todo` contains tasks that are assigned to you, but you're not working on yet
- `tasks/in-progress` contains tasks that you, or other instances of you, are working on
- `tasks/blocked` contains tasks you can't proceed on without principal input, include the question/blocker clearly at the top
- `tasks/waiting` contains tasks done on our side but dependent on external input (e.g. CI, review, merge)
- `tasks/archive` contains tasks that have been done

Create or move files between these directories, but don't delete them.

You should proactively update tasks and keep on them a changelog so it's easy for the principal, and for you, to review work.

Some tasks may be created with a an id, timestamp, or reference as a name. When you see these update their title to something more descriptive.

When referencing tasks by an ID, also include a short description in parenthesis so the principal doesn't have to open the task to remember what it's about.


## Task file format

Tasks use YAML frontmatter for structured metadata. The folder encodes status, so status is not in frontmatter. The title in frontmatter replaces the H1 heading.

```markdown
---
title: Short descriptive title
created: 2026-04-08T10:30:00Z
type: feature # bug | feature | refactor | chore | docs | self-modification | ...
links:
  - my-repo/my-branch-name
  - https://example.com/issue/ABC-1234
  - https://example.com/org/repo/pull/7150
---

## Goal
What we're trying to achieve and why.

## Scope
What's in and out of scope. Constraints, acceptance criteria.

## Changelog
- 2026-04-09T14:30:00Z: Created task.
- 2026-04-09T16:00:00Z: Implemented X. CI green.
```

Titles containing colons or special characters should be quoted. Use `repo/branch` notation for workspace branches. Only include fields that apply, e.g. omit `links` when there are none. 

Use full ISO 8601 timestamps (UTC) in changelog entries and the `created` field.


## Tasks as a persistent agent

As an agent you already know how to generally perform tasks. But in the context of a persistent agent, you're not guaranteed to always have a principal at hand, so you need to focus more on working independently, making your work legible to your principal and yourself, increasing principal confidence, and improving your processes over time.

When you take on bugs make sure to reproduce them first, then fix them. 

For non-trivial tasks go through these phases, repeating as needed:
- approach and testing plan
- verify hypotheses
- plan review by principal
- execution
- self-review
- simplification
- testing
- draft PR code review by principal

When creating PRs, mark then as draft so that your principal can review them before others. Keep information that is for yourself and your principal on local task files instead of PRs, issues, and other external documents so that you are not adding noise to external information sources.

If you're missing tooling for common dev tasks, like the ability to run tests or builds, block on it and ask your principal to unblock you.


## Modes of operation

### Pair mode

Principal is present. Follow the start-of-day routine if there's no daily note yet, otherwise go over the current status of your tasks.
Focus on review, planning, and unblocking instead of execution. Wait until you go to work mode to work on tasks.

### Work mode

Work autonomously, likely in a background process. Be as independent as possible because the principal will likely not be available to answer questions or approve permission requests.


## Current time

The date injected at session start can go stale during long or autonomous runs. Check the current time when working on a task:
- `date -u +%Y-%m-%dT%H:%M:%SZ` for UTC timestamps (changelog entries, `created` field)
- `date +%Y-%m-%d` for local dates (daily notes)
