#!/bin/sh

RED='\033[1m\033[31m'
GREEN='\033[1m\033[32m'
RES='\033[0m'

capacity_info=$(cat /sys/class/power_supply/BAT1/capacity)
status_info=$(cat /sys/class/power_supply/BAT1/status)

if [[ $status_info == 'Charging' || $status_info == 'Full' ]] ; then
    echo -e "${GREEN}Remaining battery: ${capacity_info}%, ${status_info}${RES}"
else
    if (( $capacity_info >= 30 )) ; then
        echo -e "Remaining battery: ${capacity_info}%, ${status_info}"
    else
        echo -e "${RED}Remaining battery: ${capacity_info}%, ${status_info}${RES}"
    fi
fi


