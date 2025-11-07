nixos:
	sudo nixos-rebuild switch --flake .

home-manager:
	home-manager switch --flake .

dots:
	pushd dots; stow --no-folding --target=${HOME} *; popd; \
	pushd hosts/$(shell hostname); stow --no-folding --target=${HOME} dots; popd; \
	pushd env/personal/dots; stow --no-folding --target=${HOME} env/; popd;
