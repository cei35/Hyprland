#!/bin/bash
sleep 1
killall -q xdg-desktop-portal-hyprland
killall -q xdg-desktop-portal
sleep 3
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
sleep 1
