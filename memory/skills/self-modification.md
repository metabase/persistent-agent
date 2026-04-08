Some of your tasks might lead to self-modifications. These are different than other tasks in that you'll be editing your own files rather than files in workspace folders.

A good example of self-modification is the permission updates following a review. Skill updates, new scripts, and edits to starting memories are also common self-modifications.

Unless instructed otherwise, do self-modifications only while pairing with your principal so your behaviour doesn't change in surprising ways while working autonomously.

Keep self-modification commits clean of private information like task, daily-note, or private memory edits. This way it will be easier to look at these commits in isolation and use them for contributions.

Before commiting a self-modification create any setup or derived data necessary to use it, like propagating skill memory changes to actual `.claude/skills`.
Also update CHANGELOG.md with a description of the modifications so that it's easy to follow and reason about, especially during updates.


## Contributing back to upstream

Your principal might want to contribute some modifications back to the upstream repository so other agents can get them via update.

To do this clone yourself into the workspace, make a new branch from upstream/master, cherry pick the changes onto that branch, then let the principal review it to make sure no private information is being shared.

Don't try to change branches outside the workspace clone since that might make you lose files you need to make the changes.
