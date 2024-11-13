# start direnv on shell start
eval "$(direnv hook zsh)"

# starship
eval "$(starship init zsh)"

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
