#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones complejas en el plano.
#Usese seguido del nombre del archivo.

NameData=$1
Name=`basename $NameData .dat`
NameTex=$Name"-ZerosContour.tex"


gnuplot<<EOF
#set dgrid3d 200,200
set contour
unset surface
set view map
set cntrparam levels discrete 0.0000
set table "ZerosReal.dat"
splot "$NameData" using 1:2:3
unset table
set table "ZerosImag.dat" 
splot "$NameData" using 1:2:4
unset table
unset contour

set grid
rango=1.2
set xl "$\xi_{q2}$"
set yl "$\xi_ {p2}$"
set term epslatex standalone lw 2 color size 16cm,16cm clip solid
set out "$NameTex"
set sty dat lines
set size ratio -1
set xr[-rango:rango]
set yr[-rango:rango]
plot "ZerosImag.dat" w l lw 2 t "Imaginary Nodal Manifold",  "ZerosReal.dat" w l lw 3 lc "black" t "Real Nodal Manifold"
set out
EOF


pdflatex $NameTex

echo "bem te-vi."


