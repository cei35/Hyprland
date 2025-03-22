#!/bin/bash

yay -S --noconfirm hyprland foot waybar bemenu bemenu-wayland swaybg swaylock-clock mako thunar ttf-jetbrains-mono-nerd noto-fonts-emoji polkit-gnome pulseaudio pamixer brightnessctl gvfs xdg-desktop-portal-hyprland sddm sddm-sugar-dark wlroots firefox thunar-archive-plugin

path="$HOME/.config/"

mkdir -p "$path"

cp -r foot/ $path
cp -r hypr/ $path
cp -r swaylock/ $path
cp -r waybar/ $path
cp -r mako/ $path

cp lock.jpg $path
cp back.jpg $path

echo '
if [ "$(tty)" = "/dev/tty1" ]; then
    exec hyprland
fi
' >> ~/.bash_profile

sudo systemctl enable sddm

echo "Installation complete. Now reboot your system."
