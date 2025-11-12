{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:

{
  home.packages =
    (with pkgs; [
      ansible
      bat
      cmatrix
      dbeaver-bin
      diff-so-fancy
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
      nodejs
      ripgrep
      starship
      stow
      tldr
      tmux
      xclip
      zsh
      zoxide
      _1password-gui
    ])
    ++ (with pkgsUnstable; [
      claude-code
      lazygit
      neovim
      neovide
      obsidian
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
