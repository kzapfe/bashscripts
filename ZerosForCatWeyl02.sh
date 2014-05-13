#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones complejas en el plano.
#Usese seguido del nombre del archivo.
#Version 2: no tiene funciones de Besel para comparar

NameData=$1
Name=`basename $NameData .dat`
NameTex=$Name"-ZerosReal-Bessel.tex"
UsandoReal="1:2:7"
UsandoImag="1:2:8"

gnuplot<<EOF
#set dgrid3d 200,200
set contour
unset surface
set view map
set cntrparam levels discrete 0.0000
set table "ZerosReal.dat"
splot "$NameData" using $UsandoReal
set table "ZerosImag.dat"
UsandoImag="1:2:8"
unset table


set xl "mu-q"
set yl "mu-p"
set palette defined (0 "#000044", 1 "#99FFFF", 2 "white", 3 "red", 4 "#550000")
set size ratio -1
set xr[-0.2:0.2]
set yr[-0.2:0.2]
set cbr[-2*pi:2*pi]
#set cbr[-1:1]
unset key

set term cairolatex pdf standalone lw 2 color size 16cm,16cm solid
set out "$NameTex"
plot "$NameData" usi $UsandoReal palette lt 7, "ZerosReal.dat"  w l lt 7 lw 2
set out




EOF


pdflatex $NameTex

echo "bem te-vi."


