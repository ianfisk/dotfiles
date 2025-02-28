# If not running interactively (e.g., a shell script), don't do anything.
# IANFISK: There will be a login loop on the pi without this block.
case $- in
    *i*) ;;
      *) return;;
esac

alias ls='ls -G'
alias grep='grep --color=auto'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias ll='ls -l'
alias l='ls -al'
alias c='clear'
alias .1='cd ../'
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
alias lock='dm-tool lock'
alias pip='python3 -m pip'

# Aliases no longer necessary after installing JDK 23 on my machine. That fixed issues with /usr/bin/java
# alias java='/Applications/Eclipse.app/Contents/Eclipse/plugins/org.eclipse.justj.openjdk.hotspot.jre.full.macosx.x86_64_21.0.4.v20240802-1551/jre/bin/java'
# alias javac='/Applications/Eclipse.app/Contents/Eclipse/plugins/org.eclipse.justj.openjdk.hotspot.jre.full.macosx.x86_64_21.0.4.v20240802-1551/jre/bin/javac'

export EDITOR='/usr/bin/vim'
export BASH_SILENCE_DEPRECATION_WARNING=1
# export CLASSPATH='/Applications/Eclipse.app/Contents/Eclipse/plugins/*:~/code/eclipse-workspace/shared-classpath/*'

function perf {
  curl -o /dev/null -s -w "%{time_connect} + %{time_starttransfer} = %{time_total} s\n" "$1"
}

function sshup {
    # If ssh auth isn't working, try running:
    # ssh -vT github
    # NOTE this ssh test will fail if using:
    # ssh -vT git@github.com
    # becuase it doesn't seem to find the SSH config for github.com...
    #
    # If all else fails, run:
    # sshup .ssh/<github key> and try again.
    # It's possible to clear all SSH identities with:
    # ssh-add -D

    if [ -z "$1" ]
    then
        echo "No key file supplied"
        return 1
    fi

    eval "$(ssh-agent -s)" && ssh-add "$1"
}

export PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ "

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# If running bash...
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.cargo/env" ]; then
        . "$HOME/.cargo/env"
    fi
fi

# Per the Jekyll install instructions and https://stackoverflow.com/questions/51126403/you-dont-have-write-permissions-for-the-library-ruby-gems-2-3-0-directory-ma
# installing another version of Ruby (chruby) alongside Apple's packaged version we don't want to change.
# Configure bash to use chruby.
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.5
