alias ll='ls -l'
alias l='ls -al'
alias c='clear'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias gs='git status'
alias gl='git log --oneline --graph --color --decorate'
alias gll='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias gd='git diff'
alias gca='git commit --amend'
alias gc='git commit'
alias ga='git add'
alias gp='git pull --rebase'
alias nrp='npm run prettier'
alias nrl='npm run lint'
alias kb='kubectl'

function perf {
  curl -o /dev/null -s -w "%{time_connect} + %{time_starttransfer} = %{time_total} s\n" "$1"
}
