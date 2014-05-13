#!/bin/bash
# Bash script para las secciones de corte eficaz.
# hacer varias con los distintos l:ini
echo Vamos a sacar varias funciones de dispersion
echo A color, en pm3d, en png.
echo desde que tu me digas hasta que me digas.
echo cuantas?
read max
#echo Parte generica del nombre
#read nom
echo Symetrie breaking parameter solo despues del punto
read a

nom='_dispezomf02.dat'
pic='_pout_'$a'.png'
tit='P_out, A=0.'$a', L_i = '
lmax=10.0
i=1
while [ $i -le $max ]; do
let j=$i+1000
target=$j$nom
output=$j$pic
lin=$(echo "scale=4 ;($lmax)*($i-1)/$max" | bc)
echo $lin
titulo=$tit$lin
gnuplot <<EOF
unset key
set pm3d map implicit
## PARA BLANCO Y NEGRO incluir la linea de abajo.
##set palette rgbformulae 3,3,3
set palette rgbformulae -7,4,30
set auto
set yr[0:6.283]
set xr[-6.3:-6.25]
set xl "q_ini"
set yl "theta_ini"
set title "$titulo"
set term png large size 800,495
set out "$output"
splot "$target" usi 1:2:4
set out
EOF

let i=$i+1
echo $i

done


 