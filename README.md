# dotfiles

Personal dotfiles for **macOS**, **Linux**, and **Windows**, managed with
[chezmoi](https://www.chezmoi.io).

## What's managed

| Tool | Notes |
|---|---|
| [Neovim](nvim/) | Lazy.nvim-based setup with ~30 plugins in `nvim/lua/plugins/`, custom colorschemes (`dragon`, `nord`, `cockatoo`, `nano`), and sensible defaults (`init.lua`) |
| [Nushell](https://www.nushell.sh) | `env.nu`, `config.nu`, and a custom `dragon-light` prompt theme; [nu_scripts](https://github.com/nushell/nu_scripts) pulled in as an external |
| [Alacritty](https://alacritty.org) | TOML config with a `dragon_light` theme, per-host font sizes |
| [WezTerm](https://wezfurlong.org/wezterm/) | GPU-accelerated terminal config with nord / dragon-light themes |
| herdr | Terminal session manager config with a custom `dragon-light` theme |
| [lazygit](https://github.com/jesseduffield/lazygit) | Config per OS |
| [starship](https://starship.rs) | Prompt with host-specific tweaks |
| git | `gitconfig` with [delta](https://github.com/dandavison/delta) as pager/diff tool |
| Claude Code | Custom `keybindings.json` |

### Symlink strategy for Neovim

On every OS, `~/.config/nvim` (or its Windows equivalent) is a **symlink**
into the chezmoi source directory (`symlink_nvim.tmpl`), so editing the config
in the repo immediately affects Neovim — no re-apply needed.

## How it works

Shared config lives in `.chezmoitemplates/` (nushell, alacritty, herdr,
lazygit). The per-OS source files (e.g. `private_dot_config/nushell/env.nu.tmpl`,
`AppData/Roaming/nushell/env.nu.tmpl`) are thin wrappers:

```tmpl
{{- template "nushell/env.nu" . -}}
```

This renders one template into the correct location for each platform, with
hostname-based conditionals sprinkled in (e.g. `archtop`, `win11`, `SAB-C-000D0`).

- `.chezmoiignore` excludes platform-specific files from the wrong OS (e.g.
  `AppData/` on non-Windows, `Library/` on non-macOS).
- `.chezmoiexternal.toml` declares the `nu_scripts` git repo as an external
  with a weekly refresh period.

## Also in this repo (not deployed)

These directories live here for versioning but are excluded via `.chezmoiignore`:

- `qmk/` — keyboard firmware layouts (Keychron Q11, 3w6, plaid-c) with
  [keymap visualizations](https://github.com/yskoq/keymap-drawer)
- `kzones/` — KDE KWin tiling layout and shortcuts
- `btt/` — BetterTouchTool presets
- `vivid/` — LS_COLORS theme
- `bin/` — utility scripts (e.g. macOS `hidutil` key remapping for Keychron/MacBook)

## Usage

```sh
# apply dotfiles to the current machine
chezmoi apply

# edit a file and apply immediately
chezmoi edit --apply <file>

# pull and apply in one go
chezmoi update
```

Initialize on a new machine:

```sh
chezmoi init --apply git@github.com:jurica/dotfiles.git
```
