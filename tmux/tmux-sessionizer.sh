#!/usr/bin/env bash

session=$(find ~ ~/Sites ~/Development -mindepth 1 -maxdepth 1 -type d | fzf)
session_name=$(basename "$session" | tr . _)

if ! tmux has-session -t "$session_name" 2>/dev/null; then
    tmux new-session -d -s "$session_name" -c "$session"
fi

tmux switch-client -t "$session_name"
