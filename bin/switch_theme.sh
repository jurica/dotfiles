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

activate_wezterm_theme() {
  local new_theme="$1"
  local CONFIG=$2
  local sed_command="s/config\.color_scheme = '([^']+)'/config.color_scheme = '$new_theme'/"

  sed -E -i '' "$sed_command" "$CONFIG"
}

if [[ $# != 1 ]]; then
  echo "ERROR: missing theme name"
  exit 1
fi

TO_DARK=true
if [[ $1 == *"light"* ]]; then
  TO_DARK=false
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "$(readlink -f "${BASH_SOURCE[0]}")" )" &> /dev/null && pwd )

activate_wezterm_theme "$1" "${SCRIPT_DIR}/../wezterm/wezterm.lua"

# lazygit replace rules
CONFIG="${SCRIPT_DIR}/../lazygit/config.yml"
LIGHT="--light"
DARK="--dark"
switch_theme "$TO_DARK" "$LIGHT" "$DARK" "$CONFIG"

echo "switched to theme: $1"
