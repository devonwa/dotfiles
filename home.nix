{ config, pkgs, pkgsUnstable, ... }:

{
  home.packages =
  (with pkgs; [
    ansible
    bat
    cmatrix
    dbeaver-bin
    direnv
    fd
    fira-code
    fontconfig
    fzf
    gcc
    git
    gnumake
    go
    htop-vim
    jq
    k9s
    lazygit
    nodejs
    ripgrep
    starship
    stow
    tldr
    tmux
    xclip
    yarn
    zsh
    zoxide
  ])
  ++ (with pkgsUnstable; [
    neovim
  ]);

  programs.home-manager.enable = true;
}
