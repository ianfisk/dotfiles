# Helpful Tidbits

A collection of helpful commands and workflows I've leveraged in my life as a professional software engineer, mostly for my own recollection. My custom VSCode keybindings, bash aliases, and Navel shortcuts are not listed here but should be considered a part of the complete package.

## Bash

- `ctrl+r` - Search command history. Keep pressing `ctrl+r` to cycle through the matched history items.

- `ctrl+a` - Move cursor to the front of the current command.

- `ctrl+e` - Move cursor to the end of the current command.

- `ctrl+k` - Clear command from current position to the end.

- `ctrl+t` - Transpose characters.

- `cmd+k` - Clear entire screen (similar to clear but this can be used when a command is partially written in the buffer.)

- `cmd+<number>` - Go to the terminal tab in the corresponding position.

- `ctrl+w` - Delete from the current position to the start of the word.

- `pushd <dir>`, `popd` - Move around the file systems by pushing and popping location from a stack.

## Git

Recommended reading for beginners: https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository and https://www.atlassian.com/git (good workflow examples)

Also see presentation I put together for Noah from the Methow on my basic git workflow [here](https://docs.google.com/presentation/d/1ysDcqWkBORyktLzNlvPg5xz-y1O9Kpibbv-lKYXCVHw/edit#slide=id.gc6f73a04f_0_0).

- I prefer `git pull --rebase` to keep a clean, linear git history after adding my local commits. (See `gp` alias.)

- Always specify the **remote** and **branch** when pushing. E.g., `git push origin main`.

- `git branch -vv` - View local branches and what they track in the remote repo.

- `git checkout -b ＜new-branch＞` - Create and checkout a new branch, e.g. for feature development.

- `git push -u origin <new-branch>` - Push the new branch and set the local branch to track the upstream remote branch.

- `git remote -vv` - View tracked remote repositories.

- `git remote show origin` - Show information about a remote (branches, URLs, etc.)

- `git reset --hard` - Reset all changes to tracked files AND delete all new, untracked files. Resets the world back to the last commit (or a specified commit)

- `git reset --soft HEAD~1` - Reset HEAD back one commit while keeping the changes of the commit.

- `git show <commit hash>` - Show a commit's changes in the terminal.

- `git rebase -i HEAD~5` - Interactively rebase the last 5 commits to, say, squash a temporary commit into another one before pushing to the remote.

My global config values:

```
init.defaultbranch=main
user.name=Ian Fisk
user.email=<...>
pull.rebase=true
```

## Vim

- `dd` - Cut a line

- `p` - Paste material copied with the `dd` command. `cmd+v` or `shift+ins` pastes material copied from outside of vim.

- `shift+ins` - Paste normal copy bin into vim.

## OSX

- `cmd+ctrl+space` - Open emoji menu on mac.

- `ctrl+left/right arrow` - Move left/right in the desktop list.

- `ctrl+down arrow` - Show all windows of a current program.

- `cmd+shift+4` - Screenshoot tool, also very useful to get a straight line on the screen for UI development.
