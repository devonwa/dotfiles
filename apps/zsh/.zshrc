# start direnv on shell start
eval "$(direnv hook zsh)"

# starship
eval "$(starship init zsh)"

# zinit plugin manager
source /usr/local/opt/zinit/zinit.zsh
zinit ice lucid depth=1
zinit light jeffreytse/zsh-vi-mode
zinit ice lucid depth=1 wait"2"
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid depth=1 wait"2"
zinit light joshskidmore/zsh-fzf-history-search
zinit ice lucid depth=1 wait"3"
zinit light zsh-users/zsh-syntax-highlighting

. $HOME/dotfiles/env/$DOTFILES_ENV/env
