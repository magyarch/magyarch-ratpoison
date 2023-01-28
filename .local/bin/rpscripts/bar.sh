#!/bin/bash

trap 'update' 5

FG="#c3cdc8"
BG="#282a36"
WHITE="^fg(#c3cdc8)^bg()"
GREEN="^fg(#2e8b57)^bg()"
YELLOW="^fg(#F4F99D)^bg()"
RED="^fg(#FF6E67)^bg()"
WHITE="^fg(#E6E6E6)^bg()"
PINK="^fg(#FF92D0)^bg()"
BLUE="^fg(#477d8f)^bg()"
MAGENTA="^fg(#CAA9FA)^bg()"
DRACULA="^fg(#bd93f9)^bg()"

CLEAN="^fg()^bg()"


mhdd(){
    mhdd="$(df -h "/home" | awk ' /[0-9]/ {print $3 "/" $2}')"
    mhdd2="$(df -h "/mnt/" | awk ' /[0-9]/ {print $3 "/" $2}')"
    echo " $mhdd  $mhdd2"
}


xwin(){
  xwindow=$(echo "Active Window: $GREEN`echo $(xdotool getwindowfocus getwindowclassname)`$CLEAN")
  echo -e "$xwindow"

}

wtr(){
  weat=$(curl 'wttr.in?format=%c')
  weat1=$(curl 'wttr.in?format=%t')
  weat2=$(curl 'wttr.in?format=%p')
  echo -e "  $weat1"
}

temp(){
  temp="$(sensors | awk '/^Tctl:/ {print $2}')"
  #temp="$(sensors | awk '/Core 0/ {print $3}')"
  echo -e "ﴦ $temp"
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e " $mem"

}

vol() {
	vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
    icon="🔊"
elif [ "$vol" -gt "30" ]; then
    icon="🔉"
elif [ "$vol" -gt "0" ]; then
    icon="🔈"
else
        echo 🔇 && exit
fi

echo " $vol%"

}

kernel() {
    kernel="$(uname -r)"
    echo "  $kernel"
}

## BATTERY
bat() {
batstat="$(cat /sys/class/power_supply/BAT0/status)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $batstat = 'Charging' ]; then
    batstat="^"
    elif [ $batstat = 'Discharging' ]; then
    batstat="v"
    elif [[ $battery -ge 5 ]] && [[ $battery -le 19 ]]; then
    batstat=""
    elif [[ $battery -ge 20 ]] && [[ $battery -le 39 ]]; then
    batstat=""
    elif [[ $battery -ge 40 ]] && [[ $battery -le 59 ]]; then
    batstat=""
    elif [[ $battery -ge 60 ]] && [[ $battery -le 79 ]]; then
    batstat=""
    elif [[ $battery -ge 80 ]] && [[ $battery -le 95 ]]; then
    batstat=""
    elif [[ $battery -ge 96 ]] && [[ $battery -le 100 ]]; then
    batstat=""
fi

echo "$batstat  $battery %"

}

network() {
wifi="$(ip a | grep wlo1 | grep inet | wc -l)"

if [ $wifi = 1 ]; then
    echo "ok"
else
    echo "ng"
fi

}

dte(){
  dte="$(date +"%Y.%m.%d")"
  echo -e "$dte"
}

dte2(){
  dte2="$(date +"%H:%M")"
  echo -e "$dte2"
}

work(){
  #workspaces=`exec rpws current`
  workspaces=`ratpoison -c "groups"`
        echo "$workspaces" |
while read name; do
    if [[ "$name" =~ "*" ]]
    then
        selected=`echo $name | cut -c 3-`
        echo -n "^fg(#c3cdc8)^bg(#bd93f9) $selected $CLEAN"
    else
        notselected=`echo $name | cut -c 3-`
        echo -n " $notselected "
    fi

done

}

SLEEP_SEC=0.5

#loops forever outputting a line every SLEEP_SEC secs
while true; do
echo "$(work)$CLEAN | $GREEN$(xwin)$CLEAN | Info: $DRACULA$(temp)$CLEAN | Ram: $YELLOW$(mem)$CLEAN | M.2: $BLUE$(mhdd)$CLEAN | Wtr: $GREEN$(wtr)$CLEAN | Date: $DRACULA$(dte) $(dte2)$CLEAN | Volume: $PINK$(vol)$CLEAN"
sleep $SLEEP_SEC
done | dzen2 -w '1920' -ta c -h '23' -y 1 -fn "JetBrains Mono Nerd Font:size=10:antialias=true" -fg "#c3cdc8" -bg "#282a36"

