#!/bin/bash -eup

echo '* setup up dotfiles'

echo ' ** fetch git submodules'
git submodule init
git submodule update

echo ' ** setup zellij config'
mkdir -p ~/.config/zellij
ln -s -f $(realpath zellij/config.kdl) ~/.config/zellij/config.kdl

echo ' ** setup alacritty config'
mkdir -p ~/.config/alacritty
ln -s -f $(realpath alacritty/alacritty.yml) ~/.config/alacritty/alacritty.yml
ln -s -f $(realpath alacritty-theme/themes) ~/.config/alacritty/themes

echo ' ** setup nvim config'
git -C kickstart.nvim checkout jurica
ln -s -f $(realpath kickstart.nvim) ~/.config/nvim

echo '* finished setup of dotfiles'

