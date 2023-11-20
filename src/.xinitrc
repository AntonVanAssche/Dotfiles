#!/bin/bash

systemctl --user import-environment DISPLAY

setxkbmap -option "caps:swapescape"

exec bspwm

