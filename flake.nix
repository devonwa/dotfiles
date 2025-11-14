{
  description = "Devon's Dots";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgsUnstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgsUnstable,
      home-manager,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgsUnstable = import nixpkgsUnstable {
        inherit system;
        config.allowUnfree = true;
      };
      username = "devn";
      homeDirectory = "/home/${username}";
    in
    {
      nixosConfigurations = {
        nixos-desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos-desktop/configuration.nix
            ./hosts/nixos-desktop/hardware-configuration.nix
            ./system/nixos/configuration.nix
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
        nixos-laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos-laptop/configuration.nix
            ./hosts/nixos-laptop/hardware-configuration.nix
            ./system/nixos/configuration.nix
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
      };

      homeConfigurations = {
        ${username} = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit pkgsUnstable; };
          modules = [
            {
              home = {
                username = username;
                homeDirectory = homeDirectory;
                stateVersion = "25.05";
              };
            }
            ./system/nixos/home.nix
            ./home.nix
          ];
        };

        wsl = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          extraSpecialArgs = { inherit pkgsUnstable; };
          modules = [
            {
              home = {
                username = username;
                homeDirectory = homeDirectory;
                stateVersion = "25.05";
              };
            }
            ./system/wsl/home.nix
            ./home.nix
          ];
        };
      };
    };
}
