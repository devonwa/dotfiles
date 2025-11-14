########################################
########################################
# shell configs

# start direnv on shell start
eval "$(direnv hook zsh)"

# starship
eval "$(starship init zsh)"

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

# zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice lucid depth=1
zinit light kutsan/zsh-system-clipboard

zinit ice lucid depth=1 atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid depth=1 wait"1"
zinit light zsh-users/zsh-syntax-highlighting

zinit ice lucid depth=1 wait"2"
zinit light joshskidmore/zsh-fzf-history-search

zinit ice lucid depth=1
zinit light softmoth/zsh-vim-mode
# zinit light jeffreytse/zsh-vi-mode # had issue with shift+tab

# plugin after-load config
MODE_CURSOR_VIINS="#00ff00 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
bindkey '^[[Z' autosuggest-accept # autosuggest (shift+tab)
KEYTIMEOUT=1 # 10ms for key sequences - remove ESC delay

########################################
########################################
# app and user configs

export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/dotfiles

alias base='cd $(git rev-parse --show-toplevel)' # use base to cd to the base of a git repo
alias c='code .'
alias bat='bat --style plain'
alias kc='kubectl'
alias nv='neovide --maximized &!'
alias lg='lazygit'
alias ll='ls -lha'
alias ls='ls --color=auto'
alias v='nvim'

# docker
alias d='docker'
func dlog()  {
    if [[ $# -eq 0 ]] ; then
        echo 'missing docker container id argument'
        return 1
    fi
    docker logs -f ${1} 2>&1 | lnav
}
alias dc='docker compose'

# fzf
## Use fd instead of find to respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
## nix paths
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

#java
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# git
alias gll='git logline'
alias gp='git pull'
alias gP='git push'
alias gs='git status'
alias gS='git switch'
alias gw='git worktree'
alias gitMergedBranch='git branch --merged | egrep -v "(^\*|master|main|dev)"'
alias gitMergedBranchPrune='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'

# go
export GOPATH=$HOME
export GOBIN=$GOPATH/bin

# nix
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export NIXPKGS_ALLOW_UNFREE=1;

# rust
export PATH="$HOME/.cargo/bin:$PATH"
if [ -e "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# tmux
newTmuxSession() {
    $XDG_CONFIG_HOME/tmux/templates/basic $(fd --type d . | fzf)
}
alias ta='tmux attach'
func tn() { . $DOTFILES/bin/tmux-new.sh }

# zoxide
eval "$(zoxide init zsh)"

# run env-specific config for personal or work
if [ -f $HOME/.config/env ]; then
  source $HOME/.config/env
else
  echo "~/.config/env does not exist"
fi
