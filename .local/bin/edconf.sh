#!/bin/bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("alias
zsh
ratpoison
profile
vifm
dzen
xprofile
quit")

choice=$(echo -e "${options[@]}" | rofi -dmenu -i -no-custom -p 'Konfigfájlok szerkesztése: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alias)
		choice="$HOME/.config/aliasrc"
	;;
	zsh)
		choice="$HOME/.config/zsh/.zshrc"
	;;
	ratpoison)
		choice="$HOME/.ratpoisonrc"
	;;
	profile)
		choice="$HOME/.profile"
	;;
	vifm)
		choice="$HOME/.config/vifm/vifmrc"
	;;
	dzen)
		choice="$HOME/.local/bin/rpscripts/bar.sh"
	;;
	xprofile)
		choice="$HOME/.xprofile"
	;;
	*)
		exit 1
	;;
esac
subl -c "$choice"
