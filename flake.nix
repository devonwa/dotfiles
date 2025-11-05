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

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos-desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
            ./hosts/nixos-desktop/configuration.nix
            ./hosts/nixos-desktop/hardware-configuration.nix
            ./system/nixos/configuration.nix
          ];
        };
  
        nixos-laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
            ./hosts/nixos-laptop/configuration.nix
            ./hosts/nixos-laptop/hardware-configuration.nix
            ./system/nixos/configuration.nix
          ];
        };
      };
  
      homeConfigurations = {
        nixos = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
              pkgs-unstable = import nixpkgs-unstable{};
              system = "nixos";
              env = "personal";
          };
          modules = [
            {
              home = {
                username = "devn";
                homeDirectory = "/home/devn";
                stateVersion = "25.05";
              };
            }
            ./system/nixos/home.nix
          ];
        };

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
      };
    };
}
