# AGENTS.md

Personal dotfiles repo for Devon. It manages configuration across multiple
machines (NixOS desktop, NixOS laptop, WSL, and macOS) for both personal and
work use. Two mechanisms cooperate:

- **Nix** (flakes + home-manager + NixOS modules) installs packages and manages
  system/user state on Linux and WSL.
- **GNU Stow** symlinks application config files (dotfiles) from `dots/` into
  `$HOME`, with layers for OS-, host-, and personal/work-specific overrides.

## Commands (Makefile)

Run from the repo root.

| Target             | Command                                | Purpose |
| ------------------ | -------------------------------------- | ------- |
| `make nixos`       | `sudo nixos-rebuild switch --flake .`  | Rebuild the NixOS system (uses `hostname` to pick the config). |
| `make home-manager`| `home-manager switch --flake .`        | Apply the user (home-manager) package/config set. |
| `make dots`        | `bin/stow-dots`                        | Stow every package in `dots/` into `$HOME`, applying OS and personal/work overrides. |
| `make host`        | stow `hosts/$(hostname)/dots`          | Stow the current machine's host-specific dotfiles. |
| `make undots`      | `stow -D ... *` in `dots/`             | Remove all symlinks created from `dots/`. |
| `make setup`       | runs `setup-tmux`                      | App-specific post-install setup. |
| `make setup-tmux`  | `bin/install-tmux-plugins`             | Install/refresh TPM and tmux plugins. |

## Directory layout

- `flake.nix` - entry point. Defines `nixosConfigurations` (`nixos-desktop`,
  `nixos-laptop`) and `homeConfigurations` (`devn` for NixOS, `wsl` for WSL).
  Pins `nixpkgs` (stable 25.11) plus a `nixpkgsUnstable` input for select
  packages.
- `flake.lock` - pinned input revisions.
- `home.nix` - shared home-manager package list used by all home configs.
  Stable packages come from `pkgs`, bleeding-edge ones from `pkgsUnstable`.
- `system/` - shared system-level Nix modules, per platform:
  - `system/nixos/` - `configuration.nix` (NixOS system config imported by every
    host), `home.nix` (shared home-manager module, e.g. git identity),
    `wallpaper.png`.
  - `system/wsl/` - `home.nix` with WSL-only extra packages.
- `hosts/` - one directory per machine, holding hardware- and host-specific bits:
  - `hosts/<host>/configuration.nix` + `hardware-configuration.nix` - machine
    NixOS config (hostname, GPU drivers, etc.).
  - `hosts/<host>/dots/` - stow package for host-specific config (e.g.
    `.config/hypr/host.conf` monitor layout), applied with `make host`.
- `dots/` - the Stow packages. One subdirectory per app; inside, the file tree
  mirrors its location under `$HOME`. Example:
  `dots/nvim/.config/nvim/...` -> `~/.config/nvim/...`.
- `bin/` - helper scripts (see below). `$DOTFILES` (`~/dotfiles`) is exported in
  `.zshrc` so these are callable as shell functions.
- `env/` - **gitignored**, local-only. Holds machine-specific personal/work
  environment content (`env/work/`, `env/personal/notes`) that must never be
  committed.
- `README.md` - manual per-OS bootstrap notes (WSL shell setup, Mac apps).

## How Stow is used

`bin/stow-dots` (invoked by `make dots`) is the core of dotfile installation:

1. **Base stow.** Every package in `dots/` is symlinked into `$HOME` with
   `--no-folding` (each file is linked individually rather than whole
   directories). Before stowing, a dry run detects files "not owned by stow" and
   removes those conflicts so real config files can be replaced by symlinks.
2. **OS-specific merge.** Any `*.base` file under `~/.config` that has a matching
   `*.<os>.override` (`os` = `linux` or `macos`) is concatenated
   (`base` + `override`) into the final target file. Example:
   `dots/ghostty/.config/ghostty/config.base` +
   `config.linux.override` -> `~/.config/ghostty/config`.
3. **Personal/work overlays.** If `$HOME/personal/dots` or `$HOME/work/dots`
   exist, they are stowed on top with `--override='.*'` so they supersede the
   base dots. This is how the same repo produces different results on a personal
   vs. work machine. These overlay directories live outside this repo (see
   `env/`, which is gitignored).

Additional stow conventions:

- `.stow-local-ignore` inside a package excludes paths from stowing. Example:
  `dots/karabiner/.stow-local-ignore` ignores `karabiner.json` because Karabiner
  rewrites that file in place.
- Host-specific config is a separate stow step (`make host`) sourced from
  `hosts/$(hostname)/dots`, kept distinct from the shared `dots/`.

## How Nix is used

- The flake exposes both **NixOS system configs** and **home-manager user
  configs**, selected by machine.
- **System (NixOS):** `make nixos` builds `nixosConfigurations.<hostname>`. Each
  host composes `hosts/<host>/configuration.nix` +
  `hosts/<host>/hardware-configuration.nix` + the shared
  `system/nixos/configuration.nix`.
- **User (home-manager):** `make home-manager` builds a `homeConfigurations`
  entry. `devn` (NixOS) uses `system/nixos/home.nix` + `home.nix`; `wsl` uses
  `system/wsl/home.nix` + `home.nix`. Shared packages live in `home.nix`;
  platform-only packages live in the platform's `home.nix`.
- Packages are split between the stable `pkgs` and `pkgsUnstable` inputs;
  `allowUnfree` is enabled.
- On macOS, Nix/home-manager is not the primary path; config there is delivered
  purely via Stow plus manually installed apps (see `README.md`).

## Multi-machine, personal vs. work model

- **Per-machine:** hardware and host settings are isolated in `hosts/`; the flake
  builds the right config from the machine's `hostname`.
- **Per-platform:** Linux/NixOS vs. WSL vs. macOS differences are handled by
  platform-specific Nix modules and by `.base`/`.<os>.override` stow merging.
- **Personal vs. work:** driven by content that stays out of git:
  - `env/` (gitignored) and `$HOME/.config/env`, which `.zshrc` sources at
    startup (`~/.config/env` is expected to exist per environment).
  - `$HOME/personal/dots` / `$HOME/work/dots` overlays that stow on top of the
    shared `dots/` to supersede specific files.

## Conventions

- Do not commit anything under `env/` or other machine-local secrets/state
  (`lazygit/state.yml`, `lazy-lock.json`, etc. are already gitignored).
- When adding a new app config, create a `dots/<app>/` package whose internal
  paths mirror `$HOME`, then run `make dots`.
- Use `.base` + `.<os>.override` when a single config needs OS-specific tails;
  use a `dots/<app>/.stow-local-ignore` for files an app manages itself.
- Keep host-only settings in `hosts/<host>/`, shared settings in `system/` and
  `home.nix`.
