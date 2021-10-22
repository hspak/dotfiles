#!/bin/bash

[[ ! -f /proc/acpi/button/lid/LID/state ]] && exit 0

if grep -q open /proc/acpi/button/lid/LID/state; then
    swaymsg output eDP-1 enable
else
    swaymsg output eDP-1 disable
fi

