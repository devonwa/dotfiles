.PHONY: *

nixos:
	sudo nixos-rebuild switch --flake .

home-manager:
	home-manager switch --flake .

host:
	pushd hosts/$(shell hostname); stow --no-folding --target=${HOME} dots; popd

dots:
	pushd dots; stow --no-folding --target=${HOME} *; popd

undots:
	pushd dots; stow -D --no-folding --target=${HOME} *; popd
