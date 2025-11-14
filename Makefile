.PHONY: nixos
nixos:
	sudo nixos-rebuild switch --flake .

.PHONY: home-manager
home-manager:
	home-manager switch --flake .

.PHONY: host
host:
	pushd hosts/$(shell hostname); stow --no-folding --target=${HOME} dots; popd

.PHONY: dots
dots:
	pushd dots; stow --no-folding --target=${HOME} *; popd

.PHONY: undots
undots:
	pushd dots; stow -D --no-folding --target=${HOME} *; popd
