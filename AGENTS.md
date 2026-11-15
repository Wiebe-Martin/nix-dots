# AGENTS.md — nix-dots

Personal NixOS + home-manager flake. The flake exposes three `x86_64-linux` NixOS configurations; home-manager runs as a NixOS module for user `martin`. There are no repository-level tests, CI, standalone `homeConfigurations`, or formatter/check outputs in `flake.nix`.

## Hosts and imports

| Flake configuration | Directory | Current setup |
| --- | --- | --- |
| `thinkpadt14` | `hosts/thinkpadT14/` | Laptop; systemd-boot; Hyprland and Mango enabled; DMS shell. The Noctalia home-manager import is commented out. |
| `eva02` | `hosts/eva02/` | Desktop; Secure Boot via Lanzaboote; Hyprland with DMS. Additional mounts are in `drives.nix`. |
| `wsl` | `hosts/wsl/` | NixOS-WSL; TUI apps; default user `martin`; no desktop compositor or display manager. |

The laptop's flake name and hostname are lowercase `thinkpadt14`, but its directory is `thinkpadT14`. Hyprland overrides use the lowercase hostname.

`hosts/workbox/` and DWM-related modules/sources remain in the repository, but `workbox` is not exposed by `flake.nix`. Do not assume every directory or application module is active; follow the imports from the flake.

- The two desktop hosts import `hosts/common.nix` for shared system settings, including `nh`, Nix features, packages, Bluetooth, graphics, firewall, users, and Ly. They import locale and other reusable modules separately.
- WSL deliberately does not import `hosts/common.nix`. Its configuration imports NixOS-WSL, Zsh, and locale modules, and defines its own `nh`, user, and Nix settings. It has no `hardware-configuration.nix`.
- All three hosts import the minimal `home/common.nix`: Stylix, username, home state version, `EDITOR`, `XDG_CONFIG_HOME`, and home-manager enablement. App imports and package lists belong in each host's `home.nix`; repetition across hosts is intentional.
- Each flake host also imports `home/options.nix` and its host's `options.nix` into home-manager. `my.host.isLaptop` defaults to false and is true on `thinkpadt14`; DMS uses it for battery and DankScale bar widgets.
- System and home state versions are `25.11`. They are compatibility settings, not the nixpkgs release; do not bump them as part of an input update.

## Rebuild and switch

`nh` uses `~/nix-dots` as its flake path, configured in `hosts/common.nix` and separately in `hosts/wsl/configuration.nix`.

Prefer the maintenance script for normal desktop switches:

```bash
scripts/nixos-maintain                    # switch with current lock file
scripts/nixos-maintain --upgrade          # update inputs, then switch
scripts/nixos-maintain --upgrade --clean  # also clean after switching
scripts/nixos-maintain --clean-only       # cleanup without rebuilding or Git checks
scripts/nixos-maintain --nixos-rebuild -H wsl  # use native nixos-rebuild on WSL
```

Read `scripts/nixos-maintain` before changing its behavior:

1. It uses `NH_FLAKE` when set, otherwise the repository containing the script.
2. It requires the `main` branch, fetches `origin/main`, and requires local `HEAD` to equal `origin/main` exactly. It refuses when local is ahead, behind, or diverged.
3. It lists new nonignored files and asks before registering them with `git add -N`. This makes them visible to Nix without staging their contents, committing, or pushing. Declining cancels the switch; intent-to-add entries remain local even if the rebuild fails.
4. It runs `nh os switch` with an explicit repository path. `--upgrade` adds `--update`; `-H`/`--hostname` selects the flake host. With `--nixos-rebuild`, it instead runs native `nixos-rebuild switch --flake <repo>[#<host>]` with privilege elevation; `--upgrade` runs `nix flake update` first as the invoking user. Options can be combined in any order; unknown arguments are rejected.
5. After a successful switch, it shows all tracked changes (including pre-existing edits) and asks whether the configuration is working and should be committed/pushed. If accepted, it runs `git add -u`, commits with `nixos: switch <timestamp>`, and pushes to `origin/main`. Intent-to-add files are included; new untracked build artifacts are excluded. A failed switch never commits, pushes, or cleans up.
6. `--clean` runs native Nix garbage collection for user and system profiles after a successful switch and the optional publishing step. It deletes generations older than 30 days; those generations are no longer available for rollback. This does not change the separate automatic nh cleanup policy (`--keep-since 4d --keep 3`). `--clean-only` bypasses repository resolution and Git entirely, and cannot be combined with upgrade, backend, or host selection options.

For an intentional switch without that remote check, or to select WSL explicitly:

```bash
nh os switch
nh os switch --update
nh os switch -H wsl
nh os switch -H wsl --update
```

WSL does not set `networking.hostName`; use `-H wsl` because its runtime hostname need not match the flake configuration name. With the maintenance script, use `scripts/nixos-maintain --nixos-rebuild -H wsl` to avoid nh. A switch activates the system; use evaluation checks below when only validating changes.

## Validation and formatting

```bash
nix flake check --no-update-lock-file
nix flake show --no-update-lock-file
```

`flake check` validates the flake outputs and evaluates all three NixOS configurations. It does not replace building or activating the target system. There are no custom test derivations in this flake.

New files referenced by the flake must be added to Git before evaluation; Git-backed flakes omit untracked files. `git add -N -- <file>` is sufficient to make a new file visible without committing it. The maintenance script offers to do this before switching.

No formatter output is declared, so `nix fmt` is unavailable. `nixfmt` is installed through the Nixvim module. Format only the Nix files you change and preserve the surrounding indentation (existing files use both two and four spaces):

```bash
nixfmt path/to/changed.nix
# For a file using four-space indentation:
nixfmt --indent=4 path/to/changed.nix
git diff --check
```

Avoid formatting the entire repository for an unrelated change; it includes vendored source trees.

## Code layout

| Path | Purpose |
| --- | --- |
| `flake.nix`, `flake.lock` | Host outputs, external inputs, and pinned revisions. |
| `hosts/<host>/configuration.nix` | Host system imports and settings. |
| `hosts/<host>/home.nix` | Host app imports, packages, and user settings. |
| `hosts/<host>/options.nix` | Values for custom home-manager host options. |
| `hosts/common.nix` | Shared desktop NixOS configuration. |
| `home/common.nix`, `home/options.nix` | Minimal shared home-manager base and custom option declarations. |
| `home/applications/<app>/` | App modules and, for some apps, live config directories. |
| `home/applications/nixvim/` | `nvim.nix` imports the flake module; `nixvim.nix` assembles `core/` and `plugins/`. The host-selected theme supplies the active colorscheme; the `colorshemes/gruvbox.nix` import is commented out. |
| `home/themes/stylix.nix`, `home/themes/theme/` | Shared Stylix defaults and selectable theme modules. |
| `modules/<category>/` | Reusable NixOS modules, enabled through host imports. |
| `scripts/` | `nixos-maintain`, `tmux-sessionizer`, and `herdr-sessionizer`; exposed through `~/.local/bin` by the Zsh module. |
| `walls/` | Wallpapers and the Ly animation `blackhole-smooth-240x67.dur`. |

## Live config and generated files

These modules use `mkOutOfStoreSymlink`, so edits to the source configs are available without a rebuild (an app reload/restart may still be needed):

| Repository source | Runtime path |
| --- | --- |
| `home/applications/hyprland/config/` | `~/.config/hypr` |
| `home/applications/mango/config/` | `~/.config/mango` |
| `home/applications/qutebrowser/config/` | `~/.config/qutebrowser` |
| `home/applications/tmux-sessionizer/config/` | `~/.config/tmux-sessionizer` |
| `home/applications/herdr/config.toml` | `~/.config/herdr/config.toml` |

Herdr intentionally links only its config file. Logs and session state written elsewhere in `~/.config/herdr` must stay outside the repository.

The Zsh module uses a regular Nix source for `home.file.".local/bin"`, not an out-of-store link. Changes to scripts need a rebuild to update their installed copies; run `scripts/<name>` directly to try repository changes. Zsh binds Ctrl-F to `tmux-sessionizer` and Ctrl-H to `herdr-sessionizer`. The Herdr picker uses tmux-sessionizer search paths by default, with optional overrides in `~/.config/herdr-sessionizer/herdr-sessionizer.conf`.

Most other app settings (Kitty, Zsh, tmux, Nixvim, Git, Firefox, DMS, OpenCode, etc.) are Nix-managed and need a rebuild. OpenCode's module uses `programs.opencode.cli` for terminal client settings.

### Hyprland and Mango

Hyprland uses Lua with a custom `hl` global, not standard Hyprland `.conf` syntax. Start at `home/applications/hyprland/config/hyprland.lua`; it requires modules in `hyprland/`. `hl.meta.lua` contains API annotations.

`home/applications/hyprland/hyprland.nix` uses the NixOS hostname to link `overrides/<hostname>/monitor.lua` and `workspaces.lua` into the live `config/hyprland/` directory. It also generates `colors.lua` from Stylix; `appearance.lua` requires it. Those three destination files are gitignored. Edit the override sources or Nix generator instead of the generated destinations.

Mango uses `.conf` files under `home/applications/mango/config/`, assembled by `config.conf`. Both compositors use `DESKTOP_SHELL_COMMAND`, `APP_LAUNCHER`, `LOCK_SCREEN`, and `POWER_MENU`, supplied by the selected shell module. DMS is currently selected on both desktop hosts; the Noctalia module remains available as an alternative.

Files under Hyprland's `config/dms/` and Mango's `config/dms/` include shell-managed settings. Respect their managed-file headers; the shell may overwrite manual edits.

### Themes and browsers

All three active hosts select `home/themes/theme/gruvbox.nix` (Gruvbox Material Dark Hard). Shared Stylix defaults live in `home/themes/stylix.nix`; its Nixvim and tmux targets are disabled, and the theme module configures Nixvim's colorscheme explicitly. DMS's Matugen app/compositor template options are disabled in its Nix module.

Firefox uses Stylix's Firefox Color integration on profile `default`. Its module explicitly keeps `configPath = ".mozilla/firefox"` and adopts profile directory `pvwqj0j4.default`. Preserve that path unless intentionally migrating profiles; extension policy allows Firefox Color alongside uBlock Origin.

Qutebrowser's `config.py` imports the repository's `theme.py` and calls `theme.setup(c)`. That theme file is currently tracked and contains explicit colors, despite an entry in the root `.gitignore`; the Qutebrowser Nix module does not generate it. Do not assume it follows Stylix automatically.

## Flake inputs and updates

Inputs are `nixpkgs` (`nixos-unstable`), `home-manager`, `nixvim`, `dms` (`stable`), `dms-plugin-registry`, `noctalia`, `stylix`, `lanzaboote` (`v1.1.0`), and `nixos-wsl` (`main`). `kimi-code` is no longer an input. Noctalia remains an input even though no active host imports its module.

To update one input without updating the others:

```bash
nix flake update <input-name>
nix flake check --no-update-lock-file
```

Review `flake.lock`, then use the appropriate switch command when activation is intended. `nix flake update` with no input name and `nh os switch --update` update all inputs.

## Backup behavior and boundaries

- Home-manager sets `backupFileExtension = "backup"` on all three hosts; existing conflicting files may be moved to `<path>.backup` during activation.
- Do not edit generated `hardware-configuration.nix` files.
- Do not commit secrets, private keys, or age-encrypted files.
- Keep runtime logs, sessions, caches, and generated host links out of Git. `result`, `result-*`, `*.backup`, Python bytecode, and `*.logs` are ignored.
- Many live links and the Ly animation path assume the checkout is at `~/nix-dots` (Ly uses `/home/martin/nix-dots` explicitly). Changing the checkout location requires updating those paths too.
