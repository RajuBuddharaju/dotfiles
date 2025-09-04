#!/usr/bin/env bash
# Toggle between Colemak-DH-Ortho and default US QWERTY

# Get current layout and variant
current_layout=$(setxkbmap -query | awk '/layout:/ {print $2}')
current_variant=$(setxkbmap -query | awk '/variant:/ {print $2}')

if [[ "$current_layout" == "us" && "$current_variant" == "colemak_dh_ortho" ]]; then
    echo "Switching to US QWERTY..."
    setxkbmap us
else
    echo "Switching to US Colemak-DH-Ortho..."
    setxkbmap us -variant colemak_dh_ortho
fi

