set fish_greeting "o hai"

alias g="git"
alias gaa="git add ."
alias gcm="git commit -m"
alias gac="git add . ; git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gplo="git pull origin"
alias gplom="git pull origin master"
alias gfom="git fetch origin master"

# ubuntu defaults python to python3
if test (uname) = "Linux"
    alias python="python3"
end

# weird MacOS env
if test (uname) != "Linux"
    set -x ANDROID_HOME /Users/cal/Library/Android/sdk
    set -x ANDROID_SDK_ROOT /Users/cal/Library/Android/sdk

    set -x PATH $PATH /Applications/Rakudo/bin /Applications/Rakudo/share/perl6/site/bin
    set -x PATH $PATH /Users/cal/sites/flutter/bin
    set -x PATH $PATH /opt/homebrew/bin
end

set -x NVM_DIR ~/cal/.nvm

set -x PATH $PATH $HOME/.cargo/bin
fnm env | source

source (rbenv init -|psub)
eval (/opt/homebrew/bin/brew shellenv)

set PATH $HOME/.rbenvs/shims $PATH
set PATH $HOME/.rbenvs/bin $PATH
