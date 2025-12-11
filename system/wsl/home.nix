{ pkgs, pkgsUnstable, ... }:
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
