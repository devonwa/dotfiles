{ config, pkgs, system, env, ... }:

{
  # fonts.fontconfig.enable = true;

  imports = [
    ../common.nix
  ];

  home.packages = [
    pkgs.font-manager
    pkgs.helm
    pkgs.helmfile
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    pkgs.neovide
  ];
}

