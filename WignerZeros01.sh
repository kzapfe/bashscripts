#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones complejas en el plano.
#Usese seguido del nombre del archivo.

NameData=$1
Name=`basename $NameData .dat`
NameOut=$Name"-ZerosContour.png"


gnuplot<<EOF

set contour
unset surface
set view map
set cntrparam levels discrete 0.0000
set table "ZerosWigner.dat"
splot "$NameData" using 1:2:5
unset table
unset contour
unset key
set term  pngcairo size 600,600 enhanced crop
set out "$NameOut"
set size ratio -1
set palette  defined (0 "#66ffee", 1 "#0000FF", 2 "white", 3 "#FF0000", 4 "#FFbbFF")
set cbr[-0.3:0.3]
plot "$NameData"  usi 1:2:5 ls 7 lw 2 palette, "ZerosWigner.dat" w l ls 7 
set out
EOF

display $NameOut

echo "ListongasRorongas"


