#!/bin/sh

SRL="$(echo -e "Logout\nReboot\nShutdown\nCancel" | dmenu -i -c -g 1 -l 10 -nb '#1a1a1a' -sb '#2e8b57' -fn 'JetBrains Mono Nerd Font-12' -p  'LOGOUT MENU:')"

case $SRL in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        ratpoison -c quit
        ;;
    *)
        ;;
esac
