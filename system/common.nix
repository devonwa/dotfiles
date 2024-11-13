{ config, pkgs, pkgs-unstable, system, env, ... }:

{
  home.packages = [
    pkgs.alacritty
    pkgs.ansible
    pkgs.bat
    pkgs.cmatrix
    pkgs.dbeaver
    pkgs.direnv
    pkgs.docker
    pkgs.fd
    pkgs.fira-code
    pkgs.fontconfig
    pkgs.fzf
    pkgs.gcc
    pkgs.git
    pkgs.gnumake
    pkgs.go
    pkgs.go-task
    pkgs.htop-vim
    pkgs.jq
    pkgs.k9s
    pkgs.killall
    pkgs.lazygit
    pkgs-unstable.neovim
    pkgs.nodejs
    # pkgs.obsidian # electron marked insecure in nix
    pkgs.ripgrep
    pkgs.starship
    pkgs.stow
    pkgs.tldr
    pkgs.tmux
    pkgs.xclip
    pkgs.yarn
    pkgs.zsh
    pkgs.zoxide
  ];

  programs.home-manager.enable = true;
}

