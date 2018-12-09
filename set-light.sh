#!/bin/sh

if (( $1 < 50 )) ; then
	echo "The value you entered is too small, it will be set 50"
	echo 50 > /sys/class/backlight/intel_backlight/brightness
else
	echo $1 > /sys/class/backlight/intel_backlight/brightness
fi
