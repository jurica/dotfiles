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

echo ' ** setup kitty config'
mkdir -p ~/.config/kitty
rm -f ~/.config/kitty/kitty.conf
rm -f ~/.config/kitty/nord.conf
rm -f ~/.config/kitty/nord-light.conf
ln -s $(realpath kitty/kitty.conf) ~/.config/kitty/kitty.conf
ln -s $(realpath nord-kitty/nord.conf) ~/.config/kitty/nord.conf
ln -s $(realpath nord-kitty/nord-light.conf) ~/.config/kitty/nord-light.conf

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

echo '* finished setup of dotfiles'

cat << EOF
To finish setup add:
------------------------------------------------
[include]
	path = ~/.config/delta/themes.gitconfig
------------------------------------------------
to ~/.gitconfig

Install Nerd Font: https://www.nerdfonts.com/font-downloads
 - brew tap homebrew/cask-fonts
 - brew install --cask font-jetbrains-mono-nerd-font
EOF

