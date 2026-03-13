.PHONY: *

nixos:
	sudo nixos-rebuild switch --flake .

home-manager:
	home-manager switch --flake .

host:
	pushd hosts/$(shell hostname); stow --no-folding --target=${HOME} dots; popd

dots:
	pushd dots; stow --no-folding --target=${HOME} *; popd
	@echo ""
	@echo "Dotfiles installed. Run 'make setup' to install app-specific plugins."
	@echo ""

undots:
	pushd dots; stow -D --no-folding --target=${HOME} *; popd

setup: setup-tmux
	@echo ""
	@echo "All app setup complete."

setup-tmux:
	@echo "Setting up tmux plugins..."
	@bash bin/install-tmux-plugins
