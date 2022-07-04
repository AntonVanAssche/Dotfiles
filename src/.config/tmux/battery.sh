#!/bin/bash

batDir="/sys/class/power_supply/BAT0"
capacityFile="${batDir}/capacity"
statusFile="${batDir}/status"

[[ -f ${capacityFile} ]] && read -r capacity < "${capacityFile}"
[[ -f ${statusFile} ]] && read -r status   < "${statusFile}"

if [[ ${status} == "Discharging" ]]; then
   printf '🔋 %d%%' "${capacity}"
else
   printf '🔌 %d%%' "${capacity}"
fi
