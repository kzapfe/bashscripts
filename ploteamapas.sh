#!/bin/bash

## Script para hacer un gif animado de varios pngs con gnuplot
## a partir de datos del espacio fase.
##Checa como hacer una mamadota del label con un valor numerico. 

cuenta=0
maximo=76

while [ $cuenta -lt $maximo ]; do
    let k=1000+$cuenta
    datos=$k"_chirikov.dat"
    echo ploteamos: $datos
    nombregeneral=`basename $datos .dat`
    NamePng=$nombregeneral"-plot.png"
    gnuplot<<EOF
    set sty dat points
    set pointsize 0.25 
    kapa=5.0/($maximo)*($cuenta) 
    set term pngcairo size 650,410 enhanced crop
    unset colorbox
    unset key
    set xl "Angulo"
    set yl "Momento"
    set xr[0:2*pi]
    set yr[-1.1:1.1] 
    set label gprintf("k=%1.3f",kapa) at 0.2, 1.0 front
    set out "$NamePng"
    plot "$datos" usi 1:2:3 ls 20 palette 
    set out
EOF

    let cuenta=$cuenta+1
    
done


convert -delay 20 *-plot.png animation.gif
