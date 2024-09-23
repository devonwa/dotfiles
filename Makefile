SYSTEM = ${DOTFILES_SYSTEM}
ENV = ${DOTFILES_ENV}
appDotfiles = ./apps/unix

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

dots:
	cd ${appDotfiles}; stow --no-folding --target=${HOME} *

wsl:
	./bin/wsl_dots
