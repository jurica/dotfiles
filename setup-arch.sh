#!/bin/bash -eup

echo '* setup up dotfiles'

echo ' ** fetch git submodules'
git submodule init
git submodule update

echo ' ** setup zsh'
rm -f ~/.zshrc
ln -s "$(realpath zshrc-mbp)" ~/.zshrc
rm -f ~/.oh-my-zsh/themes/nord.zsh-theme
ln -s "$(realpath omzsh-theme-nord-extended/nord.zsh-theme)" ~/.oh-my-zsh/themes/

echo ' ** setup direnv'
mkdir -p ~/.config/direnv
rm -f ~/.config/direnv/direnv.toml
ln -s "$(realpath direnv/direnv.toml)" ~/.config/direnv/

echo ' ** setup zellij config'
mkdir -p ~/.config/zellij
rm -f ~/.config/zellij/config.kdl
ln -s "$(realpath zellij/config.kdl)" ~/.config/zellij/config.kdl

echo ' ** setup alacritty config'
mkdir -p ~/.config/alacritty
rm -f ~/.config/alacritty/alacritty.yml
rm -f ~/.config/alacritty/themes
ln -s "$(realpath alacritty/alacritty.yml)" ~/.config/alacritty/alacritty.yml
ln -s "$(realpath alacritty-theme/themes)" ~/.config/alacritty/themes

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
rm -f ~/.wezterm.lua
ln -s "$(realpath wezterm/wezterm.lua)" ~/.wezterm.lua

echo ' ** setup zsh-fzf-history-search'
rm -f ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
ln -s "$(realpath zsh-fzf-history-search)" ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

#echo ' ** setup warpd'
#rm -f ~/.config/warpd/config
#ln -s "$(realpath warpd/config)" ~/.config/warpd/config

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

