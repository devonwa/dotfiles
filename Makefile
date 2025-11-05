SYSTEM = ${DOTFILES_SYSTEM}
ENV = ${DOTFILES_ENV}

install_nix_standalone:
	bash -c "sh <(curl -L https://nixos.org/nix/install)"

install_hm:
	test -n "$(SYSTEM)"  # $$DOTFILES_ENV \
	nix shell nixpkgs#git \
	nix develop \
	home-manager switch --impure --flake .#${SYSTEM} \
	exit \
	exit

install_shell:
	command -v zsh | sudo tee -a /etc/shells \
	sudo chsh -s "$(command -v zsh)" "${USER}"

switch_hm:
	test -n "$(SYSTEM)"
	home-manager switch --impure --flake .#${SYSTEM}

.PHONY: dots
dots:
	cd dots; stow --no-folding --target=${HOME} *

.PHONY: dots-nixos-desktop
dots-nixos-desktop:
	cd hosts/nixos-desktop; stow --no-folding --target=${HOME} dots

.PHONY: dots-nixos-laptop
dots-nixos-laptop:
	cd hosts/nixos-laptop; stow --no-folding --target=${HOME} dots

.PHONY: env-personal
env-personal:
	cd env/personal/dots; stow --no-folding --target=${HOME} env/

.PHONY: env-work
env-work:
	cd env/work; stow --no-folding --target=${HOME} env/
