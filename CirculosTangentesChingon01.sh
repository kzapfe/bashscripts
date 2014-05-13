#!/bin/bash

#Para dibujar las condiciones iniciales de los problemas con circulos

Cuantos=5
Datos=$1
Radio=`tail -n1 $Datos | awk '{print $2}'`
Name=`basename $Datos .dat`
NameOut=$Name"-DibujoOsculante.png"



echo $Radio

gnuplot<<EOF
set term pngcairo lw 2 background rgb "gray20"  size 500,500
set style fill transparent solid  0.75
set size ratio -1
set xr[-0.5:0.5]
set yr[-0.5:0.5]
unset key
unset tics
set  out "$NameOut"
plot "$Datos" every ::::$Cuantos usi 1:2:($Radio) w circles lc rgb "dark-red", "$Datos" every ::::$Cuantos usi 3:4:($Radio) w circles lc rgb "dark-blue"
set out
EOF

#display $NameOut

