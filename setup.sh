#!/bin/bash -eup

echo '* setup up dotfiles'

echo ' ** fetch git submodules'
git submodule init
git submodule update

echo ' ** setup nvim config'
rm -f ~/.config/nvim
ln -s "$(realpath nvim)" ~/.config/nvim

echo ' ** setup nushell'
rm -f ~/Library/Application\ Support/nushell/config.nu
ln -s "$(realpath nushell/config.nu)" ~/Library/Application\ Support/nushell/config.nu
rm -f ~/Library/Application\ Support/nushell/env.nu
ln -s "$(realpath nushell/env_macos.nu)" ~/Library/Application\ Support/nushell/env.nu
rm -f ~/Library/Application\ Support/nushell/dragon-light.nu
ln -s "$(realpath nushell/dragon-light.nu)" ~/Library/Application\ Support/nushell/dragon-light.nu
rm -f ~/Library/Application\ Support/nushell/custom-completions
ln -s "$(realpath nu_scripts/custom-completions)" ~/Library/Application\ Support/nushell/custom-completions

echo ' ** setup lazygit config'
rm -f ~/Library/Application\ Support/lazygit/config.yml
ln -s "$(realpath lazygit/config.yml)" ~/Library/Application\ Support/lazygit/config.yml

echo ' ** setup delta config'
mkdir -p ~/.config/delta
rm -f ~/.config/delta/themes.gitconfig
ln -s "$(realpath delta/themes.gitconfig)" ~/.config/delta/themes.gitconfig

echo ' ** setup wezterm'
rm -f ~/.config/wezterm
ln -s "$(realpath wezterm)" ~/.config/wezterm

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

