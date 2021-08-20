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

set -x ANDROID_HOME /Users/cal/Library/Android/sdk
set -x ANDROID_SDK_ROOT /Users/cal/Library/Android/sdk

set -x NVM_DIR "/Users/cal/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] ; . "$NVM_DIR/nvm.sh"  # This loads nvm
#. "$NVM_DIR/nvm.sh"

set -x PATH $PATH /Applications/Rakudo/bin /Applications/Rakudo/share/perl6/site/bin
set -x PATH $PATH /Users/cal/sites/flutter/bin

# opam configuration
# source /Users/cal/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# opam configuration
# source /Users/cal/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -x PATH $PATH /Users/cal/.cargo/bin
