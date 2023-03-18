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
mkdir -p ~/bin
rm -f ~/bin/nvim_remote.sh
ln -s $(realpath bin/nvim_remote.sh) ~/bin/nvim_remote.sh

echo ' ** setup lazygit config'
rm -f ~/Library/Application\ Support/lazygit/config.yml
ln -s $(realpath lazygit/config.yml) ~/Library/Application\ Support/lazygit/config.yml

echo ' ** setup delta config'
mkdir -p ~/.config/delta
rm -f ~/.config/delta/themes.gitconfig
ln -s $(realpath delta/themes.gitconfig) ~/.config/delta/themes.gitconfig
cat << EOF
Add:
[include]
	path = ~/.config/delta/themes.gitconfig
to ~/.gitconfig
EOF

echo '* finished setup of dotfiles'

