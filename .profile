alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
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

export EDITOR='/usr/bin/vim'

function perf {
  curl -o /dev/null -s -w "Establish Connection: %{time_connect}s\nTTFB: %{time_starttransfer}s\nTotal: %{time_total}s\n" "$1"
}

function sshup {
    if [ -z "$1" ]
    then
        echo "No key file supplied"
        return 1
    fi

    eval "$(ssh-agent -s)" && ssh-add "$1"
}
