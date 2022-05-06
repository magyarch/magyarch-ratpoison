#!/bin/sh

declare options=("layout1
layout2
layout3
layout4
layout5
layout6
Quit")

choice=$(echo -e "${options[@]}" | dmenu -i -fn 'JetBrains Mono Nerd Font-12' -p 'Choose Layout: ' -nb '#1a1a1a' -sb '#2e8b57')

case "$choice" in
    quit)
        echo "program terminated." && exit 1
    ;;
    layout1)
	    choice="$(ratpoison -c "echo Layout 1" -c "select -" -c "only" -c "next")"
    ;;
    layout2)
	    choice="$(ratpoison -c "echo Layout 2" -c "select -" -c "only" -c "hsplit" -c "next")"
    ;;
    layout3)
	    choice="$(ratpoison -c "echo Layout 3" -c "select -" -c "only" -c "hsplit" -c "next" -c "focusright" -c "next" -c "vsplit" -c "next")"
    ;;
    layout4)
	    choice="$(ratpoison -c "echo Layout 4" -c "select -" -c "only" -c "vsplit" -c "next")"
    ;;
    layout5)
	    choice="$(ratpoison -c "echo Layout 5" -c "select -" -c "only" -c "hsplit" -c next -c "vsplit" -c next -c "focusright" -c next -c "vsplit" -c "next")"
    ;;
    layout6)
	    choice="$(ratpoison -c "echo Layout CenteredMaster" -c "hsplit 1/4" -c "focusright" -c next -c "hsplit 1/2" -c next -c "resize 385 0")"
esac

"$choice"

