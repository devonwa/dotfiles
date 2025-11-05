{ config, pkgs, ... }:

{
  networking.hostName = "nixos-laptop";

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
