#!/bin/bash

light_cyan="\e[96m"
red="\e[31m"
reset="\e[39m"

day=$(date +"%A")
date=$(date +"%d/%m/%Y")
time=$(date +"%T")
echo -e "[i] ${light_cyan}Day:   ${red}$day${reset}"
echo -e "[i] ${light_cyan}Date:  ${red}$date${reset}"
echo -e "[i] ${light_cyan}Time:  ${red}$time${reset}"