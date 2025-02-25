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
# source /usr/local/opt/zinit/zinit.zsh
zinit ice lucid depth=1
zinit light jeffreytse/zsh-vi-mode
zinit ice lucid depth=1 wait"2"
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid depth=1 wait"2"
zinit light joshskidmore/zsh-fzf-history-search
zinit ice lucid depth=1 wait"3"
zinit light zsh-users/zsh-syntax-highlighting

source $HOME/.config/env
