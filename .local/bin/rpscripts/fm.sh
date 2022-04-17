#!/bin/bash

declare options=("Nemo
Thunar
Quit")

choice=$(echo -e "${options[@]}" | dmenu -c -g 1 -l 10 -i -fn 'Roboto Mono' -p 'Open File Cabinet: ' -nb '#3b3b3b' -nf '#71988a' -sb '#000000' -sf '#71988a')
#choice=$(echo -e "${options[@]}" | rofi -dmenu -p 'Open File Cabinet: ')

case "$choice" in
    quit)
        echo "program terminated." && exit 1
    ;;
    Nemo)
        choice="nemo"
    ;;
    Thunar)
        choice="thunar"
    ;;
esac
"$choice"

