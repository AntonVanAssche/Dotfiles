#!/usr/bin/env pyhton 3

CURRENT_BRIGHTNESS_FILE = "/sys/class/backlight/intel_backlight/brightness"
MAX_BRIGHTNESS_FILE = "/sys/class/backlight/intel_backlight/max_brightness" 

with open(CURRENT_BRIGHTNESS_FILE) as fc:
   CURRENT_BRIGHTNESS = int(fc.read())

with open(MAX_BRIGHTNESS_FILE) as fm:
   MAX_BRIGHTNESS = int(fm.read())

PERCENTAGE = (CURRENT_BRIGHTNESS / MAX_BRIGHTNESS) * 100
FORMATED_PERCENTAGE = "{:.2f}".format(PERCENTAGE)

if PERCENTAGE < 25:
    ICON = ""
else:
    ICON = ""

print(ICON + "  " + FORMATED_PERCENTAGE +"%")

