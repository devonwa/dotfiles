{ config, pkgs, system, env, ... }:

{
  imports = [
    ../common.nix
  ];

  home.packages = [
    pkgs.font-manager
    pkgs.google-chrome #mac issue
    pkgs.helm #mac issue
    pkgs.helmfile #mac issue
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    pkgs.neovide
    pkgs.sxhkd # no mac
    pkgs.vscode
  ];

  fonts.fontconfig.enable = true;
}

