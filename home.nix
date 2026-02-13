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
      lazygit
      libreoffice
      nodejs
      ripgrep
      rustup
      starship
      stow
      tldr
      tmux
      usbutils
      uv
      viu
      xclip
      zsh
      zoxide
    ])
    ++ (with pkgsUnstable; [
      bluetui
      claude-code
      neovim
      neovide
      obsidian
      opencode
      spotify
      vscode
      zed-editor

      # screenshot
      grim
      slurp
      swappy

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
