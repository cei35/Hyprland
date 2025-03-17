#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"
RULES="windowrule = float, (.*)\nwindowrulev2 = float, class:.*"

if grep -q "windowrule *= *float" "$CONFIG_FILE"; then #Tiling Mode
    sed -i '/windowrule = float, (.*)/d' "$CONFIG_FILE"
    sed -i '/windowrulev2 = float, class:.*/d' "$CONFIG_FILE"

    grep -qxF "windowrulev2 = float, class:^(Tk)$" "$CONFIG_FILE" || echo "windowrulev2 = float, class:^(Tk)$" >> "$CONFIG_FILE"
    notify-send "Hyprland" "Tiling Mode"

    hyprctl clients | grep 'Window' | awk '{print $2}' | xargs -I{} hyprctl dispatch togglefloating {}
else #Floating Mode
    echo -e "\n$RULES" >> "$CONFIG_FILE"
    notify-send "Hyprland" "Floating mode"

    hyprctl clients | grep 'Window' | awk '{print $2}' | xargs -I{} hyprctl dispatch togglefloating {}
fi

hyprctl reload
