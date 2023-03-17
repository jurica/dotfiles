#!/bin/bash -eup

echo '* setup up dotfiles'

echo ' ** fetch git submodules'
git submodule init
git submodule update
git -C kickstart.nvim checkout jurica

echo ' ** setup zellij config'
mkdir -p ~/.config/zellij
rm -f ~/.config/zellij/config.kdl
ln -s $(realpath zellij/config.kdl) ~/.config/zellij/config.kdl

echo ' ** setup alacritty config'
mkdir -p ~/.config/alacritty
rm -f ~/.config/alacritty/alacritty.yml
rm -f ~/.config/alacritty/themes
ln -s $(realpath alacritty/alacritty.yml) ~/.config/alacritty/alacritty.yml
ln -s $(realpath alacritty-theme/themes) ~/.config/alacritty/themes

echo ' ** setup nvim config'
rm -f ~/.config/nvim
ln -s $(realpath kickstart.nvim) ~/.config/nvim

echo '* finished setup of dotfiles'

