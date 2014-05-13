#!/bin/bash
# Atenuador del brillo de pantalla

if [ -z ""] ; then
    echo "3000" > /sys/class/backlight/intel_backlight/brightness
else
    Brillo=$1
    echo $Brillo > /sys/class/backlight/intel_backlight/brightness
fi

echo "Espero que te guste."
