#!/bin/sh

if [ -x "$(command -v xwallpaper)" ]; then
    xwallpaper --no-randr --stretch ~/.local/bin/wallpapers/Future/alien.jpg
else
  # Set background
  if [ -x "$(command -v feh)" ]; then
    feh --randomize --bg-fill ~/.local/bin/wallpapers/Future/*
  fi
fi
