#!/usr/bin/env bash

languages=$(
    echo "php rust javascript laravel html lua ruby rails" | tr " " "\n"
)
core_utils=$(
    echo "ssh find sed git awk curl" | tr " " "\n"
)
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Input query: " query

if echo "$languages" | grep -qs $selected; then
    tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -r"
else
    tmux split-window -h bash -c "curl cht.sh/$selected~$query | less -r"
fi
