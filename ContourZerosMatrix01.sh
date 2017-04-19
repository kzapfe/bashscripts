#!/bin/bash

#Contornos de las lineas Nodales  para datos de funciones reales en el plano
#Usese seguido del nombre del archivo.
#para datos en Matrix Data. Estoy abusando de que ya se que son los ejes aqui.

NameData=$1
Name=`basename $NameData .dat`
NameTex=$Name".png"
Using='(f($1)):(h($2)):3 matrix'


gnuplot<<EOF
#set dgrid3d 200,200
f(x)=-5.+10.*x/1002
h(x)=-1.+10.*x/1002
#set contour
#unset surface
#set view map
#set cntrparam levels discrete 0.0000
#set table "Zeros.dat"
#splot "$NameData" using $Using
#unset table

set xl "q_x"
set yl "q_y"
set palette defined (0 "#000044", 1 "#99FFFF", 2 "white", 3 "red", 4 "#550000")
set size ratio -1
set xr[-5:5]
set yr[-1:9]
set cbr[-.15:0.15]
unset key

set pointsize 0.4
set term pngcairo enhanced solid lw 1 size 900,900
set out "$NameTex"
plot "$NameData" usi $Using w image #,  "Zeros.dat"  w l lt 7 lw 0.5
set out
EOF


echo "Morte!"


