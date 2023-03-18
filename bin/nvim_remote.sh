#!/bin/bash

if [[ -z $1 ]]; then
    echo "ERROR: no file or folder given"
    exit 1
fi

/opt/homebrew/bin/nvim --server /tmp/nvim.pipe --remote $(realpath $1)
