#!/bin/bash -eup

session_name="$(zellij ls | fzf)"
zellij a "$session_name"
