#!/bin/sh

declare options=("Nemo
Pcmanfm
Quit")

choice=$(echo -e "${options[@]}" | dmenu -i -fn 'JetBrains Mono Nerd Font-12' -p 'Open File Cabinet: ' -nb '#3b3b3b' -nf '#71988a' -sb '#000000' -sf '#71988a')
#choice=$(echo -e "${options[@]}" | rofi -dmenu -p 'Open File: ')

case "$choice" in
    quit)
        echo "program terminated." && exit 1
    ;;
    Nemo)
        choice="nemo"
    ;;
    Pcmanfm)
        choice="pcmanfm"
    ;;
esac

"$choice"

