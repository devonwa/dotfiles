{
  pkgs,
  pkgsUnstable,
  ...
}:

{
  home.packages =
    (with pkgs; [
      _1password-gui
      anki-bin
      ansible
      bat
      cmatrix
      dbeaver-bin
      diff-so-fancy
      direnv
      fastfetch
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
      libreoffice
      nodejs
      ripgrep
      rustup
      starship
      stow
      tldr
      tmux
      usbutils
      viu
      xclip
      zsh
      zoxide
    ])
    ++ (with pkgsUnstable; [
      claude-code
      lazygit
      neovim
      neovide
      obsidian
      opencode
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
