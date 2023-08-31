{
  description = "Dotfiles for Devon Walker";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }@inputs: {
    packages.x86_64-linux.default = home-manager.defaultPackage.x86_64-linux;
    packages.x86_64-darwin.default = home-manager.defaultPackage.x86_64-darwin;

    devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell { buildInputs = [ self.packages.x86_64-linux.default ]; };
    devShell.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.mkShell { buildInputs = [ self.packages.x86_64-darwin.default ]; };

    homeConfigurations = {
      personal = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { dotfilesEnv = "personal"; };
        modules = [
          ./home.nix
          {
            home = {
              username = "devonwa";
              homeDirectory = "/home/devonwa";
              stateVersion = "22.05";
            };
          }
        ];
      };

      work = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        extraSpecialArgs = { dotfilesEnv = "work"; };
        modules = [
          ./home.nix
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
