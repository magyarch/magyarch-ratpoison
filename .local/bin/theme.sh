#!/bin/sh

SRL="$(echo -e "Light\nDark\nCancel" | dmenu -i -c -g 1 -l 3 -nb '#1a1a1a' -sb '#2e8b57' -fn 'JetBrains Mono Nerd Font-12' -p  'Choose theme:')"

case $SRL in
    Light)
        sdorfehs -c "set padding 0 22 0 1" -c "set barpadding 6 2" -c "set gap 0" -c "set bgcolor #e6e6e6" -c "set fgcolor #000000" -c "set bwcolor #000000" -c "set fwcolor #e6e6e6" && 
        pkill dzen2; myBar2  
        ;;
    Dark)
        pkill dzen2; sdorfehs -c "restart"
        ;;
    *)
        ;;
esac