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
    obsidian
    ripgrep
    starship
    stow
    tldr
    tmux
    xclip
    yarn
    zsh
    zoxide
    _1password-gui
  ])
  ++ (with pkgsUnstable; [
    neovim
    neovide
    vscode
    zed-editor

    # LSPs
    gopls
    lua-language-server
    nil
    pyright

    # Formatters
    stylua
  ]);

  programs.home-manager.enable = true;
}
