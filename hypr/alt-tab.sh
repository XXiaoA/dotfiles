#!/bin/bash

current_window_info=$(hyprctl activewindow -j)
current_address=$(echo "$current_window_info" | jq -r '.address')
current_monitor=$(echo "$current_window_info" | jq -r '.monitor')

if [[ -z "$current_monitor" || "$current_monitor" == "null" ]]; then
    current_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .id')
fi

target_address=$(hyprctl clients -j | jq -r \
    --arg mon "$current_monitor" \
    --arg curr "$current_address" '
    [ .[] | select(.monitor == ($mon | tonumber) and .mapped == true and .address != $curr) ]
    | sort_by(.focusHistoryID)
    | .[0].address
')

if [[ -n "$target_address" && "$target_address" != "null" ]]; then
    hyprctl dispatch focuswindow "address:$target_address"
fi
