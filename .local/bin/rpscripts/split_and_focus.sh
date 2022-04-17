#!/bin/bash
[[ $1 == "horiz" ]] && DIR="hsplit"
[[ $1 == "vert" ]] && DIR="vsplit"
CUR_FRAMES=$($HOME/.local/bin/rpscripts/list_frames.sh)
ratpoison -c "$DIR"
NEW_FRAMES=$($HOME/.local/bin/rpscripts/list_frames.sh)
NEW_FRAME=$($HOME/.local/bin/rpscripts/frame_diff.sh "$CUR_FRAMES" "$NEW_FRAMES")
ratpoison -c "fselect $NEW_FRAME"
ratpoison -c "exec $2"
