#!/bin/bash

# see https://hidutil-generator.netlify.app

# right_command -> right_option
keymap_keychron=$(cat <<EOF
{"UserKeyMapping":[
    {
        "HIDKeyboardModifierMappingSrc": 0x7000000E7,
        "HIDKeyboardModifierMappingDst": 0x7000000E6
    }
]}
EOF
)

# fn -> left_control
# right_option -> fn
# right_command -> right_option
keymap_mbp=$(cat <<EOF
{"UserKeyMapping":[
    {
      "HIDKeyboardModifierMappingSrc": 0xFF00000003,
      "HIDKeyboardModifierMappingDst": 0x7000000E0
    },
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E6,
      "HIDKeyboardModifierMappingDst": 0xFF00000003
    },
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E7,
      "HIDKeyboardModifierMappingDst": 0x7000000E6
    }
]}
EOF
)

keymap_default=$(cat <<EOF
{"UserKeyMapping":[
]}
EOF
)

keymap=$(
  case "$1" in
    ("mbp") echo "$keymap_mbp" ;;
    ("keychron") echo "$keymap_keychron" ;;
    (*) echo "$keymap_default" ;;
  esac
)

hidutil property --set "$keymap"

