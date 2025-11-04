{ config, pkgs, system, env, ... }:

{
  imports = [
    ../common.nix
  ];

  home.packages = [
    pkgs.kdePackages.dolphin
    #pkgs.font-manager
    #pkgs.google-chrome #mac issue
    #pkgs.helm #mac issue
    #pkgs.helmfile #mac issue
    #pkgs.neovide
    #pkgs.sxhkd # no mac
    #pkgs.vscode
  ];

  fonts.fontconfig.enable = true;
  #fonts.packages = [
   # pkgs.nerd-fonts.fira-code
  #];
}

