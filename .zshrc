# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="clean"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize docker golang gcloud vscode fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cal/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cal/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cal/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cal/google-cloud-sdk/completion.zsh.inc'; fi

alias k="kubectl"
alias kb="kubie"

alias kg="kubectl get"
alias kgy="kubectl get -o yaml"
alias kgp="kubectl get po"
alias kd="kubectl describe"
alias kl="kubectl logs"
alias kgn='kubectl get nodes -ocustom-columns="NAME:.metadata.name,TYPE:.metadata.labels.type,CREATED_AT:.metadata.creationTimestamp,TAINTS:.spec.taints[*].key,VERSION:.status.nodeInfo.kubeletVersion,ID:.spec.providerID" --sort-by .metadata.creationTimestamp'

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

# pnpm
export PNPM_HOME="/Users/cal/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(direnv hook zsh)"

_completions_hook() {
  trap -- '' SIGINT;
  if (( ${+DIRENV_FILE} )); then
    local fpath_before=$fpath
    typeset -xUT XDG_DATA_DIRS xdg_data_dirs
    local xdg_data_dir
    for xdg_data_dir in $xdg_data_dirs; do
        if [ -d "$xdg_data_dir"/zsh/site-functions ]; then
            fpath+=("$xdg_data_dir"/zsh/site-functions)
        fi
    done
    if [[ $fpath != $fpath_before ]]; then
        compinit
    fi
  fi
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_completions_hook]+1}" ]]; then
  precmd_functions=( ${precmd_functions[@]} _completions_hook )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_completions_hook]+1}" ]]; then
  chpwd_functions=( ${chpwd_functions[@]} _completions_hook )
fi


# [ -f "/Users/cal/.ghcup/env" ] && . "/Users/cal/.ghcup/env" # ghcup-env

# opam configuration
# [[ ! -r /Users/cal/.opam/opam-init/init.zsh ]] || source /Users/cal/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
