ENV = ${DOTFILES_ENV}
appDotfiles = ./apps

install_nix_standalone:
	bash -c "sh <(curl -L https://nixos.org/nix/install)"

install_hm:
	test -n "$(ENV)"  # $$DOTFILES_ENV \
	nix shell nixpkgs#git \
	nix develop \
	home-manager switch --impure --flake .#${ENV} \
	exit \
	exit

switch_hm:
	test -n "$(ENV)"  # $$DOTFILES_ENV
	home-manager switch --impure --flake .#${ENV}

dots:
	cd ${appDotfiles}; stow --no-folding --target=${HOME} *
