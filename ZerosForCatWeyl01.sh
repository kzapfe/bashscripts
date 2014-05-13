#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones complejas en el plano.
#Usese seguido del nombre del archivo.

NameData=$1
Name=`basename $NameData .dat`
NameTex=$Name"-ZerosReal-Bessel.tex"


gnuplot<<EOF
#set dgrid3d 200,200
set contour
unset surface
set view map
set cntrparam levels discrete 0.0000
set table "ZerosReal.dat"
splot "$NameData" using 1:2:7
unset table

hbar=0.05
energ=100.

radio=(5.5*hbar)/sqrt(2.*energ)
set xr[-radio:radio]
set yr[-radio:radio]

BeselEnergy(x,y)=besj0(sqrt(x*x+y*y)*sqrt(2.0*energ)/hbar)
set isosamples 200
set table "ZerosBesel.dat"
splot BeselEnergy(x,y)
unset table

set xl "x"
set yl "y"
set palette defined (0 "#000044", 1 "#99FFFF", 2 "white", 3 "red", 4 "#550000")
set size ratio -1
set xr[-radio:radio]
set yr[-radio:radio]
set cbr[-2*pi:2*pi]
#set cbr[-1:1]
unset key

set term cairolatex pdf standalone lw 2 color size 16cm,16cm solid
set out "$NameTex"
plot "$NameData" usi 1:2:7 palette lt 7, "ZerosReal.dat"  w l lt 7 lw 2, "ZerosBesel.dat" w l lt 2 lw 2
set out
EOF


pdflatex $NameTex

echo "bem te-vi."


