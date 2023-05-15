#!/bin/bash -eup

echo '* setup up dotfiles'

echo ' ** fetch git submodules'
git submodule init
git submodule update
git -C kickstart.nvim checkout jurica

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
ln -s "$(realpath kickstart.nvim)" ~/.config/nvim

echo ' ** setup scripts'
mkdir -p ~/bin
rm -f ~/bin/nvim_remote.sh
ln -s "$(realpath bin/nvim_remote.sh)" ~/bin/nvim_remote.sh
rm -f ~/bin/keymap.sh
ln -s "$(realpath bin/keymap.sh)" ~/bin/keymap.sh
rm -f ~/bin/switch_theme.sh
ln -s "$(realpath bin/switch_theme.sh)" ~/bin/switch_theme.sh

echo ' ** setup lazygit config'
rm -f ~/Library/Application\ Support/lazygit/config.yml
ln -s "$(realpath lazygit/config.yml)" ~/Library/Application\ Support/lazygit/config.yml

echo ' ** setup delta config'
mkdir -p ~/.config/delta
rm -f ~/.config/delta/themes.gitconfig
ln -s "$(realpath delta/themes.gitconfig)" ~/.config/delta/themes.gitconfig

echo '* finished setup of dotfiles'

cat << EOF
To finish setup:

## 1. Add:
------------------------------------------------
[include]
	path = ~/.config/delta/themes.gitconfig
------------------------------------------------
to ~/.gitconfig

## 2. Install Nerd Font: https://www.nerdfonts.com/font-downloads
 - brew tap homebrew/cask-fonts
 - brew install --cask font-jetbrains-mono-nerd-font
 - brew install --cask font-fira-mono-nerd-font

## 3. Setup karabiner:
 - check if there is already an existing config in ~/.config/krabiner
   - if so, integrate it to dotfiles
 - "ln -s ~/Dev/dotfiles/karabiner ~/.config/karabiner"

## 4. Install zsh-fzf-history
 - check https://github.com/joshskidmore/zsh-fzf-history-search for instructions
  - TL;DR: git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
EOF

