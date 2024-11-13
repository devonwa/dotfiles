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

switch_hm:
	test -n "$(SYSTEM)"
	home-manager switch --impure --flake .#${SYSTEM}

.PHONY: dots
dots:
	stow --no-folding --target=${HOME} ./dots/*

