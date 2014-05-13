#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones complejas en el plano.
#Usese seguido del nombre del archivo.

NameData=$1
Name=`basename $NameData .dat`
NameTex=$Name"-Zeros.tex"


gnuplot<<EOF
#set dgrid3d 200,200
set contour
unset surface
set view map
set cntrparam levels discrete 0.0000
set table "ZerosReal.dat"
splot "$NameData" using 1:2:5
unset table

set xl "x"
set yl "y"
set palette defined (0 "#000044", 1 "#99FFFF", 2 "white", 3 "red", 4 "#550000")
set size ratio -1
#set xr[-2.5:2.5]
#set yr[-2.5:2.5]
set cbr[-.05:0.05]
unset key

set pointsize 0.4
set term cairolatex pdf standalone lw 2 color size 16cm,16cm solid
set out "$NameTex"
plot "$NameData" usi 1:2:5 palette lt 7
#, "ZerosReal.dat"  w l lt 7
set out
EOF


pdflatex $NameTex

echo "bem te-vi."


