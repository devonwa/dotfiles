.PHONY: nixos
nixos:
	sudo nixos-rebuild switch --flake .

.PHONY: home-manager
home-manager:
	home-manager switch --flake .

.PHONY: dots
dots:
	pushd dots; stow --no-folding --target=${HOME} *; popd; \
	pushd hosts/$(shell hostname); stow --no-folding --target=${HOME} dots; popd; \

.PHONY: undots
undots:
	pushd dots; stow -D --no-folding --target=${HOME} *; popd
