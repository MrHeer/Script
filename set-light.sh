#!/bin/sh

MAX_VALUE=$(cat /sys/class/backlight/intel_backlight/max_brightness)

if (( $1 < 50 )) ; then
	echo "The value you entered is too small, it will be set 50"
	echo 50 > /sys/class/backlight/intel_backlight/brightness
elif (( $1 > $MAX_VALUE )) ; then
	echo "The value you entered is too big, it will be set $MAX_VALUE"
	echo $MAX_VALUE > /sys/class/backlight/intel_backlight/brightness
else
	echo $1 > /sys/class/backlight/intel_backlight/brightness
fi
