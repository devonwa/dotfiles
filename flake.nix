{
  description = "Devon's Dots";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }@inputs: {
    packages.x86_64-linux.default = home-manager.defaultPackage.x86_64-linux;
    packages.x86_64-darwin.default = home-manager.defaultPackage.x86_64-darwin;

    devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell { buildInputs = [ self.packages.x86_64-linux.default ]; };
    devShell.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.mkShell { buildInputs = [ self.packages.x86_64-darwin.default ]; };

    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./system/nixos/configuration.nix ];
      };

      nixos-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./system/nixos/configuration.nix ];
      };
    };

    homeConfigurations = {
      wsl = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
            pkgs-unstable = import nixpkgs-unstable{};
            system = "wsl";
            env = "personal";
        };
        modules = [
          ./system/wsl/home.nix
          {
            home = {
              username = "devn";
              homeDirectory = "/home/devn";
              stateVersion = "22.05";
            };
          }
        ];
      };

      nixos = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
            pkgs-unstable = import nixpkgs-unstable{};
            system = "nixos";
            env = "personal";
        };
        modules = [
          ./system/nixos/home.nix
          {
            home = {
              username = "devn";
              homeDirectory = "/home/devn";
              stateVersion = "22.05";
            };
          }
        ];
      };

      work = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        extraSpecialArgs = {
            pkgs-unstable = import nixpkgs-unstable{};
            system = "macos";
            env = "work";
        };
        modules = [
          ./system/macos/home.nix
          {
            home = {
              username = "devwalker";
              homeDirectory = "/Users/devwalker";
              stateVersion = "22.05";
            };
          }
        ];
      };
    };
  };
}
