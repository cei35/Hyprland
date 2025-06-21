#!/bin/bash

# This script minimizes the current window to a specific workspace.
# This script is in alpha and is not yet fully functional. Like all parts of taskbar.

minimize="special:minimized"

info=$(hyprctl activewindow -j)
addr=$(echo "$info" | jq -r ".address")
w_ws=$(echo "$info" | jq -r ".workspace.id")

current=$(echo "$info" | jq -r ".id")

if [[ "$w_ws" == "$minimize" || "$w_ws" == "special" ]]; then
    hyprctl dispatch movetoworkspacesilent "$current,address:$addr"
    hyprctl dispatch focuswindow address:$addr
else
    hyprctl dispatch movetoworkspacesilent "$minimize;adress:$addr"
fi



