#!/bin/bash

nvim --server /tmp/nvim.pipe --remote $(realpath $1)
