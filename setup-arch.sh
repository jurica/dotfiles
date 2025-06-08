#!/bin/bash -eup

echo '* setup up dotfiles'

echo ' ** fetch git submodules'
git submodule init
git submodule update

echo ' ** setup zsh'
rm -f ~/.zshrc
ln -s "$(realpath zshrc-arch)" ~/.zshrc
rm -f ~/.oh-my-zsh/themes/nord.zsh-theme

echo ' ** setup direnv'
mkdir -p ~/.config/direnv
rm -f ~/.config/direnv/direnv.toml
ln -s "$(realpath direnv/direnv.toml)" ~/.config/direnv/

echo ' ** setup nvim config'
rm -f ~/.config/nvim
ln -s "$(realpath nvim)" ~/.config/nvim

echo ' ** setup scripts'
mkdir -p ~/bin
rm -f ~/bin/switch_theme.sh
ln -s "$(realpath bin/switch_theme.sh)" ~/bin/switch_theme.sh

echo ' ** setup lazygit config'
rm -f ~/.config/lazygit/config.yml
ln -s "$(realpath lazygit/config.yml)" ~/.config/lazygit/config.yml

echo ' ** setup delta config'
mkdir -p ~/.config/delta
rm -f ~/.config/delta/themes.gitconfig
ln -s "$(realpath delta/themes.gitconfig)" ~/.config/delta/themes.gitconfig

echo ' ** setup wezterm'
rm -f ~/.config/wezterm
ln -s "$(realpath wezterm)" ~/.config/wezterm

echo ' ** setup nushell'
rm -f ~/.config/nushell/config.nu
ln -s "$(realpath nushell/config.nu)" ~/.config/nushell/config.nu
rm -f ~/.config/nushell/env.nu
ln -s "$(realpath nushell/env.nu)" ~/.config/nushell/env.nu
rm -f ~/.config/nushell/dragon-light.nu
ln -s "$(realpath nushell/dragon-light.nu)" ~/.config/nushell/dragon-light.nu
rm -f ~/.config/nushell/custom-completions
ln -s "$(realpath nu_scripts/custom-completions)" ~/.config/nushell/custom-completions

echo ' ** setup starship'
rm -f ~/.config/starship.toml
ln -s "$(realpath starship/starship.toml)" ~/.config/starship.toml

echo ' ** setup fuzzel'
rm -f ~/.config/fuzzel
ln -s "$(realpath fuzzel)" ~/.config/fuzzel

echo ' ** setup sway'
rm -f ~/.config/sway
ln -s "$(realpath sway)" ~/.config/sway

echo ' ** setup waybar'
rm -f ~/.config/waybar
ln -s "$(realpath waybar)" ~/.config/waybar

echo ' ** setup wl-kbptr'
rm -f ~/.config/wl-kbptr
ln -s "$(realpath wl-kbptr)" ~/.config/wl-kbptr

echo ' ** setup yazi'
rm -f ~/.config/yazi/package.toml
rm -f ~/.config/yazi/theme.toml
ln -s "$(realpath yazi/package.toml)" ~/.config/yazi/package.toml
ln -s "$(realpath yazi/theme.toml)" ~/.config/yazi/theme.toml
ya pkg upgrade

echo '* finished setup of dotfiles'

cat << EOF
To finish setup:

## 1. Add:
------------------------------------------------
[include]
	path = ~/.config/delta/themes.gitconfig
------------------------------------------------
to ~/.gitconfig
EOF

