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

nom='_fundisp.dat'
pic1='_pout_'$a'.png'
pic2='_dlout_'$a'.png'
tit1='P_out, A=0.'$a', L_i = '
tit2='Delta L_out, A=0.'$a', L_i = '
lmax=6.23
i=1
while [ $i -le $max ]; do
let j=$i+100
target=$j$nom
output1=$j$pic1
output2=$j$pic2
lin=$(echo "scale=4 ;($lmax)*($i-1)/$max" | bc)
echo $lin
titulo1=$tit1$lin
##el de arriba es pout, el de abajo dl out.
titulo2=$tit1$lin
gnuplot <<EOF
unset key
set pm3d map implicit
## PARA BLANCO Y NEGRO incluir la linea de abajo.
set palette rgbformulae 3,3,3
##set palette rgbformulae -7,4,30
set auto
set yr[0:6.283]
set xr[-6.962:-6.952]
set xl "q_ini"
set yl "theta_ini"
set title "$titulo1"
set term png large size 800,495
set out "$output1"
splot "$target" usi 1:2:3
set out
set title "$titulo2"
set term png large size 800,495
set out "$output2"
splot "$target" usi 1:2:4
set out
EOF


let i=$i+1
echo $i

done


 