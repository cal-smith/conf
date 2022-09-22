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
end

set -x NVM_DIR ~/cal/.nvm

set -x PATH $PATH $HOME/.cargo/bin
fnm env | source

# stripe conf
source (rbenv init -|psub)
# source (nodenv init -|psub)
source ~/stripe/space-commander/bin/sc-env-activate.fish

set PATH $HOME/stripe/space-commander/bin $PATH
set PATH $HOME/stripe/password-vault/bin $PATH
set PATH $HOME/stripe/henson/bin $PATH
set PATH $HOME/.rbenvs/shims $PATH
set PATH $HOME/.rbenvs/bin $PATH
alias stripe-preview=/Users/$USER/stripe/stripe-preview/stripe-preview
