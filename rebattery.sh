#!/bin/sh

RED='\033[1m\033[31m'
GREEN='\033[1m\033[32m'
RES='\033[0m'

info=$(cat /sys/class/power_supply/BAT1/capacity)

if (( $info >= 60 )) ; then
    echo -e "${GREEN}Remaining battery: ${info}%${RES}"
else
    echo -e "${RED}Remaining battery: ${info}%${RES}"
fi
