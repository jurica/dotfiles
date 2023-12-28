#!/bin/bash
set -Eeou pipefail

switch_theme() {
  TO_DARK=$1
  LIGHT=$2
  DARK=$3
  CONFIG=$4

  SEARCH=$DARK
  REPLACE=$LIGHT
  if [[ $TO_DARK = true ]];then
    SEARCH=$LIGHT
    REPLACE=$DARK
  fi
  sed -i '' "s/${SEARCH}/${REPLACE}/g" "$CONFIG"
}

if [[ $# != 1 ]]; then
  echo "ERROR: missing mode, please chode one: os, dark, light"
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "$(readlink -f "${BASH_SOURCE[0]}")" )" &> /dev/null && pwd )

TO_DARK=false
if [[ "$1" = "dark" ]]; then
  TO_DARK=true
  echo "Swichting to darkmode"
elif [[ "$1" = "light" ]]; then
  TO_DARK=false
  echo "Swichting to lightmode"
elif [[ "$1" = "os" ]]; then
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = "Dark" ]]; then
    TO_DARK=true
    echo "Switch to darkmode according to OS setting."
  else
    TO_DARK=false
    echo "Switching to lightmode according to OS settings."
  fi
else
  echo "ERROR: unknown mode '$1' given!"
  exit 1
fi

# lazygit replace rules
CONFIG="${SCRIPT_DIR}/../lazygit/config.yml"
LIGHT="--light"
DARK="--dark"
switch_theme "$TO_DARK" "$LIGHT" "$DARK" "$CONFIG"

# alacritty replace rules
CONFIG="${SCRIPT_DIR}/../alacritty/alacritty.yml"
LIGHT="\/nord_light.yaml"
DARK="\/nord.yaml"
switch_theme "$TO_DARK" "$LIGHT" "$DARK" "$CONFIG"

# zellij replace rules
CONFIG="${SCRIPT_DIR}/../zellij/config.kdl"
LIGHT="\"nord-light\""
DARK="\"nord\""
switch_theme "$TO_DARK" "$LIGHT" "$DARK" "$CONFIG"

# wezterm replace rules
CONFIG="${SCRIPT_DIR}/../wezterm/wezterm.lua"
LIGHT="config.color_scheme = 'nord-light'"
DARK="config.color_scheme = 'nord'"
switch_theme "$TO_DARK" "$LIGHT" "$DARK" "$CONFIG"
