# Devon's Dotfiles

## Systems

### WSL
- Remove Windows Terminal shortcut for Ctrl+Tab
- Create .zprofile and include nix call from .profile and `. "$HOME/.zshrc"`
- Change default shell to zsh
```sh
ln -s /home/devn/.nix-profile/bin/zsh /usr/bin/zsh
chsh -s /usr/bin/zsh
```

