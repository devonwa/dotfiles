{ config, pkgs, ... }:

{
  networking.hostName = "nixos-laptop";

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
