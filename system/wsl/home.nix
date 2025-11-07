{ config, pkgs, pkgsUnstable, system, env, ... }:

{
  home.packages =
  (with pkgs; [
      font-manager
      helm
      helmfile
  ])
  ++ (with pkgsUnstable; [
  ]);
}
