#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones complejas en el plano.
#Usese seguido del nombre del archivo.
#Version 2: no tiene funciones de Besel para comparar

NameData=$1
Name=`basename $NameData .dat`
NameTex=$Name"-Zeros.tex"
UsandoReal="1:2:7"
UsandoImag="1:2:8"

gnuplot<<EOF
set contour
unset surface
set view map
set cntrparam levels discrete 0.0000
set table "ZerosReal.dat"
splot "$NameData" using $UsandoReal
set table "ZerosImag.dat"
splot "$NameData" using $UsandoImag
unset table


set xl "mu-q"
set yl "mu-p"
set size ratio -1
set xr[-0.2:0.2]
set yr[-0.2:0.2]


set term cairolatex pdf standalone lw 2 color size 16cm,16cm solid
set out "$NameTex"
plot  "ZerosReal.dat"  w l lt 7 lw 2 title "Real", "ZerosImag.dat"  w l lt 1 lw 2 title "Imaginary"
set out


EOF


pdflatex $NameTex

echo "bem te-vi."


