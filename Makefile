.PHONY: *

nixos:
	sudo nixos-rebuild switch --flake .

home-manager:
	home-manager switch --flake .

host:
	pushd hosts/$(shell hostname); stow --no-folding --target=${HOME} dots; popd

dots:
	@bash bin/stow-dots

undots:
	pushd dots; stow -D --no-folding --target=${HOME} *; popd

setup: setup-tmux
	@echo ""
	@echo "All app setup complete."

setup-tmux:
	@echo "Setting up tmux plugins..."
	@bash bin/install-tmux-plugins
