.PHONY: *

nixos:
	sudo nixos-rebuild switch --flake .

home-manager:
	home-manager switch --flake .

host:
	pushd hosts/$(shell hostname); stow --no-folding --target=${HOME} dots; popd

dots:
	pushd dots; stow --no-folding --target=${HOME} *; popd
	@echo "Setting up platform-specific configs..."
	@rm -f ${HOME}/.config/ghostty/config
	@if [ "$$(uname)" = "Darwin" ]; then \
		cat ${HOME}/.config/ghostty/config.base ${HOME}/.config/ghostty/config.macos.override > ${HOME}/.config/ghostty/config; \
		echo "Generated Ghostty config for macOS"; \
	elif [ "$$(uname)" = "Linux" ]; then \
		cat ${HOME}/.config/ghostty/config.base ${HOME}/.config/ghostty/config.linux.override > ${HOME}/.config/ghostty/config; \
		echo "Generated Ghostty config for Linux"; \
	fi
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
