# TODO

- Remember order of branches that have been checked out and provide a way to get to the last few branches that have been visited
- Support showing history (git log and git log -p) of specified branch
- Support rebasing a branch off of the latest master (it auto pulls latest master before rebasing)
- Support merging a branch into master after rebasing the latest master (automation of multiple git commands)
- Consider supporting the idea of automatically detecting which trunk a branch is branched off of and being able to trigger a rebase simply without having to specify the target trunk to rebase
- Support navigating to an older revision within the same branch with autocomplete
- Detect branches that do not have a corresponding remote branch (because they got merged already into master), and offer the feature to prune all of them or just select some (one by one) to prune.
- Consider adding a shortcut to clear the typed filter query text or use ESC BACKSPACE to delete words one at a time when separated by dashes
