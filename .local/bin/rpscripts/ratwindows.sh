#!/bin/sh

( printf "ratmenu";
  ratpoison -c "windows %l %n %t" | sort -nr | while read w x z; do
    a=$(printf "%3q" $x); b="ratpoison -c \"select $x\"";
    printf " %q\\ %q %q"  "$a" "$z" "$b";
  done; echo \;) | sh
