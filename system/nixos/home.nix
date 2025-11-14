{ config, pkgs, pkgsUnstable, ... }:

{
  programs.git = {
    enable = true;
    userName = "Devon Walker";
    userEmail = "devon@devonwa.com";
  };
}
