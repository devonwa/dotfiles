{ config, pkgs, dotfilesEnv, ... }:

{
  #fonts.fontconfig.enable = true; #mac issue

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
    #pkgs.font-manager #broken webkit? mac issue only?
    pkgs.fzf
    pkgs.gcc # collisions with brew builds?
    pkgs.gnumake # collissions with brew builds? 
    pkgs.go-task
#    pkgs.google-chrome #mac issue
    #pkgs.helm #mac issue
    #pkgs.helmfile #mac issue
    pkgs.htop-vim
    pkgs.jq
    pkgs.k9s
    pkgs.killall
    # (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    pkgs.lazygit
    pkgs.neovim
    pkgs.neovide
    pkgs.nix-direnv
    pkgs.obsidian
    pkgs.ripgrep
    #pkgs.sxhkd # no mac
    pkgs.stow
    pkgs.thefuck
    pkgs.tldr
    pkgs.tmux
    pkgs.vscode
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

  programs.tmux = {
    enable = true;

    baseIndex = 1;
    prefix = "C-Space";

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
      #set-option -g default-shell /bin/zsh
      #set-option -g default-terminal "screen-256color"
      #set-option -sa terminal-overrides ',alacritty:RGB'
      
      # Pane colours
      # # set inactive/active window styles
      # set -g window-style 'fg=colour247,bg=colour236'
      # set -g window-active-style 'fg=colour252,bg=black'
      
      # # Pane border
      set -g pane-border-style bg=colour236
      set -g pane-border-style fg=colour238
      set -g pane-active-border-style bg=colour100
      set -g pane-active-border-style fg=colour100
      
      # Start windows and panes at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1
      
      # Movement
      set -g mouse on
      set-window-option -g mode-keys vi
      
      bind-key j send-prefix
      
      # reload config file (change file location to your the tmux.conf you want to use)
      bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded"
      
      bind-key -r 'C-h' select-pane -L
      bind-key -r 'C-S-h' split-window -hb
      bind-key -r 'C-j' select-pane -D
      bind-key -r 'C-S-j' split-window -v
      bind-key -r 'C-k' select-pane -U
      bind-key -r 'C-S-k' split-window -vb
      bind-key -r 'C-l' select-pane -R
      bind-key -r 'C-S-l' split-window -h
      bind-key -r 'C-\' select-pane -l
      
      bind-key -r 'C-1' select-window -t:1
      bind-key -r 'C-2' select-window -t:2
      bind-key -r 'C-3' select-window -t:3
      bind-key -r 'C-4' select-window -t:4
      bind-key -r 'C-5' select-window -t:5
      bind-key -r 'C-6' select-window -t:6
      bind-key -r 'C-7' select-window -t:7
      bind-key -r 'C-8' select-window -t:8
      bind-key -r 'C-9' select-window -t:9
      
      bind-key 'Tab' last-window
      bind-key 'C-Tab' last-window
      
      bind-key 'C-c' new-window 
      
      bind-key 'C-d' detach-client
      
      
      # Escape key remove lag
      set -sg escape-time 0
      
      ## Tmux Plugin Manager
      # List of plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      set -g @plugin 'sainnhe/tmux-fzf'
      
      set -g @continuum-boot 'on'
      set -g @continuum-boot-options 'alacritty'
      
      # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
      run '~/.tmux/plugins/tpm/tpm'
      
      # Overwrite tmux-resurrect keybind (must be after set plugin)
      bind-key 'C-s' choose-tree -Zs
    '';
  };
}

