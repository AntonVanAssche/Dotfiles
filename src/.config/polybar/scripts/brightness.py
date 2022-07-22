#!/usr/bin/env python3

import math

CURRENT_BRIGHTNESS_FILE = "/sys/class/backlight/intel_backlight/brightness"
MAX_BRIGHTNESS_FILE = "/sys/class/backlight/intel_backlight/max_brightness" 
ICONS = {
        0:"",
        1:"",
        2:"",
        3:"",
        4:"",
        5:"",
        6:"",
        7:"",
        8:"",
        9:""
        }
with open(CURRENT_BRIGHTNESS_FILE) as fc:
   CURRENT_BRIGHTNESS = int(fc.read())

with open(MAX_BRIGHTNESS_FILE) as fm:
   MAX_BRIGHTNESS = int(fm.read())

PERCENTAGE = (CURRENT_BRIGHTNESS / MAX_BRIGHTNESS) * 100
FORMATED_PERCENTAGE = "{:.0f}".format(PERCENTAGE)

if PERCENTAGE < 10:
    ICON = ICONS.get(0)
elif PERCENTAGE < 20:
    ICON = ICONS.get(1)
elif PERCENTAGE < 30:
    ICON = ICONS.get(2)
elif PERCENTAGE < 40:
    ICON = ICONS.get(3)
elif PERCENTAGE < 50:
    ICON = ICONS.get(4)
elif PERCENTAGE < 60:
    ICON = ICONS.get(5)
elif PERCENTAGE < 70:
    ICON = ICONS.get(6)
elif PERCENTAGE < 80:
    ICON = ICONS.get(7)
elif PERCENTAGE < 90:
    ICON = ICONS.get(8)
else:
    ICON = ICONS.get(9)

print(ICON + "  " + FORMATED_PERCENTAGE +"%")

