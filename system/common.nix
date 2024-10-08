{ config, pkgs, pkgs-unstable, system, env, ... }:

{
  home.packages = [
    pkgs.alacritty
    pkgs.ansible
    pkgs.bat
    pkgs.cmatrix
    pkgs.dbeaver
    pkgs.docker
    pkgs.fd
    pkgs.fira-code
    pkgs.fontconfig
    pkgs.fzf
    pkgs.gcc
    pkgs.gnumake # collissions with brew builds? 
    pkgs.go
    pkgs.go-task
    pkgs.htop-vim
    pkgs.jq
    pkgs.k9s
    pkgs.killall
    pkgs.lazygit
    pkgs-unstable.neovim
    pkgs.nix-direnv
    pkgs.nodejs
    pkgs.obsidian
    pkgs.ripgrep
    pkgs.stow
    pkgs.thefuck
    pkgs.tldr
    pkgs.tmux
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
      export DOTFILES_SYSTEM=${system};
      export DOTFILES_ENV=${env};
      export NIXPKGS_ALLOW_UNFREE=1;
      . $HOME/dotfiles/env/${env}/env
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
    includes = [ { path = "~/dotfiles/env/${env}/.gitconfig"; } ];
  };

  programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
}

