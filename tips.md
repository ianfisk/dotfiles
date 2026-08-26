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

- `qpdf --qdf --object-streams=disable [infile] [outfile]` - Uncompress a PDF's object streams and generate a file that is inspectable in a text editor. This can be useful to look at PDF comments that fail to render on (most?) PDF viewers.

- `less <file>` - Display contents of a file page-by-page in the terminal. Related: `head` and `tail`: `head -n <n_lines> <file>`

- `curl ipinfo.io/<ip-addr>` - Display location information for a given IP address.

- `traceroute <addr>` - Display the network path to the destination.

## Git

Recommended reading for beginners: https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository and https://www.atlassian.com/git (good workflow examples)

- I prefer `git pull --rebase` to keep a clean, linear git history after adding my local commits. (See `gp` alias.)

- Always specify the **remote** and **branch** when pushing. E.g., `git push origin main`.

- `git branch -vv -a` - View local and remote branches and what they track in the remote repo.

- `git checkout -b <new-branch>` - Create and checkout a new branch, e.g. for feature development like [this](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow).

- `git branch -D <branch-name>` followed by `git push origin --delete <branch-name>` - Delete a branch locally and on the remote. If already deleted on the remote, `git remote prune origin` removes references locally.

- `git push -u origin <new-branch>` - Push the new branch and set the local branch to track the upstream remote branch.

- `git remote -vv` - View tracked remote repositories.

- `git remote show origin` - Show information about a remote (branches, URLs, etc.)

- `git reset --hard` - Reset all changes to tracked files AND delete all new, untracked files. Resets the world back to the last commit (or a specified commit)

- `git reset --soft HEAD~1` - Reset HEAD back one commit while keeping the changes of the commit.

- `git show <commit hash>` - Show a commit's changes in the terminal.

- `git log --all --decorate --oneline --graph` - Show the branch tree in the terminal. (Similar to `gll` alias.)

- `git rebase -i HEAD~5` - Interactively rebase the last 5 commits to, say, squash a temporary commit into another one before pushing to the remote.

- `git add -p <filename>` - Interactively add chunks of a file (`-p` == `--patch`)

- `git add '*blobPattern*'` - Use blob patterns to stage files. Must use in tics `''`, at least on my mac.

- `git stash push -p -m "my commit message"` - Interactively stash chunks (`-p`) with a message.

- `git config --list --show-scope` - Show config values and their scope. Use `git config --<scope> <key> <value>` to set. My global config values:

	```
	git config --global init.defaultbranch "main"
	git config --global user.name "Ian Fisk"
	git config --global user.email "<...>"
	git config --global pull.rebase "true"
	git config --global alias.fpush "push --force-with-lease --force-if-includes"
	git config --global alias.

 	# Delete all `maiao` branches on a given remote $1. Usage: git cleanup origin
	git config --global alias.cleanup '!f() { git branch -r --list "$1/maiao.*" | sed "s|$1/||" | xargs git push "$1" --delete; }; f'
	```

### Stacked Diffs

I prefer using a [stacked diffs](https://jg.gg/2018/09/29/stacked-diffs-versus-pull-requests/) [workflow](https://newsletter.pragmaticengineer.com/p/stacked-diffs), like what we used at Google. To support this, I use https://github.com/runetes/maiao with auth configured through `~/.netrc`.

- `git review install` - Install the [Gerrit](https://opensource.google/projects/gerrit) commit-msg hook in your code repo.

- `git review` - Open stacked PRs. Use `git review --remote <remote-name>` to open a stack on a specific remote.

- `git commit --fixup <commit-hash>` - Add changes to a previous commit. Follow by `git rebase --autosquash` and `git review` to update PR stack.
	- NOTE: Interactive rebasing also works; `git review` uses persistent `Change-Id`s to track canonical commits across rebases.

## Vim

Cheatsheet: https://devhints.io/vim

- `dd` - Cut a line

- `p` - Paste material copied with the `dd` command. `cmd+v` or `shift+ins` pastes material copied from outside of vim.

- `shift+ins` - Paste normal copy bin into vim.

- `A` - Append at the end of the line.

## OSX

- `cmd+ctrl+space` - Open emoji menu on mac.

- `ctrl+left/right arrow` - Move left/right in the desktop list.

- `ctrl+down arrow` - Show all windows of a current program.

- `cmd+shift+4` - Screenshoot tool, also very useful to get a straight line on the screen for UI development.

- Kill "Control Center" to get rid of OSX's "You're screen is being shared" purple toolbar item.

- Zoom window
	- Enable "Use scroll gesture with modifier keys to zoom."
	- Set "Modifier key for scroll gesture" to Control (hold control and scroll => zooms)
	- Zoom style: Picture-in-picture
	- Advanced > "Zoomed image moves" Continuously with pointer
	- Advanced > Modifiers for Temporary Actions > Enable Toggle Zoom with ^⌥

## Tools

- Network monitoring: Charles Proxy, Wireshark

- Audio/video manipulation: `ffmpeg`

## Jupyter

- You can run the brew-installed version using the command `jupyter notebook`, BUT this is not in the same environment as `pip` installed modules. To get around this, you can run the `pip` installed version using `python3 -m notebook`.

## Debugging

- `F5` - Typically I like to set this as the shortcut to run the application in **debug** mode

- `shift+F5` - Stop the debugging session (typical Visual Studio hotkey)

- `F10` or `cmd+'` - Step over (typical Visual Studio/Chrome Debugger hotkey)

- `cmd+;`  - Step into (from the Chrome debugger; note F11 is hijacked on OSX)

## tmux

- `tmux new -s <session-name>` - Create a new named session.

- `tmux a -t <target-session>` - _Attach_ to a target session by name.

- `tmux ls` - List all sessions.

_In tmux..._

- `Ctrl+b, d` - Detach from the session.

- `Ctrl+b, :` - Open the command prompt. Useful commands are `kill-window`, `rename-window`

- `Ctrl+b, n` - Go to the next window.

- `Ctrl+b, l` - Go to the previous window.

- `Ctrl+b, "` - Split the screen into two panes.
	- `Ctrl+b, o` - Switch pane.
 	- `Ctrl+b, x` - Close pane.
