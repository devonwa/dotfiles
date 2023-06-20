{ config, pkgs, dotfilesEnv, ... }:

{
  #fonts.fontconfig.enable = true; #mac issue

  home.packages = [
    pkgs.alacritty
    pkgs.ansible
    pkgs.bat
    pkgs.cmatrix
    pkgs.dbeaver
    pkgs.fd
    pkgs.fira-code
    pkgs.fontconfig
#    pkgs.font-manager #broken webkit? mac issue only?
    pkgs.fzf
    pkgs.gcc
    pkgs.gnumake
    #pkgs.google-chrome #mac issue
    #pkgs.helm #mac issue
    #pkgs.helmfile #mac issue
    pkgs.jq
    pkgs.k9s
    # (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    pkgs.lazygit
    # pkgs.logseq
    pkgs.neovim
    pkgs.neovide
    pkgs.ripgrep
    pkgs.stow
    pkgs.tldr
    pkgs.tmux
    pkgs.vscode
 #   pkgs.wezterm #failed build on mac
    pkgs.xclip
    pkgs.yarn
    pkgs.zoxide
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" ];
      theme = "macovsky";
    };
    initExtra = ''
      export DOTFILES_ENV=${dotfilesEnv};
      export NIXPKGS_ALLOW_UNFREE=1;
      . $HOME/dotfiles/env/${dotfilesEnv}/env
    '';
  };

  programs.git = {
    enable = true;
    userName = "Devon Walker";
    aliases = {
	  logline = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
	  recentb = ''!r() { refbranch=$1 count=$2; git for-each-ref --sort=-committerdate refs/heads --format='%(refname:short)|%(HEAD)%(color:yellow)%(refname:short)|%(color:bold green)%(committerdate:relative)|%(color:blue)%(subject)|%(color:magenta)%(authorname)%(color:reset)' --color=always --count=''${count:-20} | while read line; do branch=$(echo \"$line\" | awk 'BEGIN { FS = \"|\" }; { print $1 }' | tr -d '*'); ahead=$(git rev-list --count \"''${refbranch:-origin/master}..''${branch}\"); behind=$(git rev-list --count \"''${branch}..''${refbranch:-origin/master}\"); colorline=$(echo \"$line\" | sed 's/^[^|]*|//'); echo \"$ahead|$behind|$colorline\" | awk -F'|' -vOFS='|' '{$5=substr($5,1,70)}1' ; done | ( echo \"ahead|behind||branch|lastcommit|message|author\\n\" && cat) | column -ts'|';}; r'';
    };
    diff-so-fancy.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
    includes = [ { path = "~/dotfiles/env/${dotfilesEnv}/.gitconfig"; } ];
  };
}

