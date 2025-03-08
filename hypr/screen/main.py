#!/usr/bin/python3

import tkinter as tk
from tkinter import PhotoImage
import subprocess

def take_screenshot(mode):
    user = subprocess.run("whoami", text=True, capture_output=True).stdout.strip()
    path = f"/home/{user}/Images/Captures_ecran/"
    subprocess.run(["hyprshot", "-m", mode, "-o", path])

root = tk.Tk()
root.title("Screenshot Tool")
root.geometry("200x75")
root.configure(bg="#2E3440")

absolute_path = "~/.config/hypr/screen/"

icons = {
    "output": absolute_path+"output.png",
    "region": absolute_path+"region.png",
    "window": absolute_path+"window.png",
    "close": absolute_path+"close.png"
}

def close_app():
    root.destroy()

frame = tk.Frame(root, bg="#2E3440")
frame.pack()

for mode, icon in icons.items():
    img = PhotoImage(file=icon)
    command = close_app if mode == "close" else lambda m=mode: take_screenshot(m)
    btn = tk.Button(frame, image=img, command=command, borderwidth=0, bg="white")
    btn.image = img
    btn.pack(side=tk.LEFT, padx=5, pady=5)

root.mainloop()

