#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones complejas en el plano.
#Usese seguido del nombre del archivo.

NameData=$1
Name=`basename $NameData .dat`
NameOut=$Name"-Flor.png"



gnuplot<<EOF
set contour
unset surface
set view map
set cntrparam levels discrete 0.0000
set table "ZerosCont.dat"
splot "$NameData" using 1:2:5
unset table
set size ratio -1
set xl "x_q"
set yl "x_p"
unset key
set cbr[-0.04:0.04]
set palette defined (0 "blue", 1 "black", 2 "red")
set term pngcairo enhanced size 800,800 font "/usr/share/fonts/freefont/FreeSerif.ttf,16"
set out "$NameOut"
plot "$NameData" usi 1:2:5 w image, "ZerosCont.dat"  w l ls 7 lc rgb "white"
set out
EOF


echo "Pronto."


