#!/bin/bash

zellij action go-to-tab-name "$(zellij action query-tab-names | fzf)"
