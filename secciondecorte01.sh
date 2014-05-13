#!/bin/bash
# Bash script para las secciones de corte eficaz.
# hacer varias con los distintos l:ini


echo Vamos a sacar varias secciones de corte
echo desde que tu me digas hasta que me digas.
echo cuantas?
read max
#echo Parte generica del nombre
#read nom
echo Symetrie breaking parameter solo despues del punto
read a

nom='_seczoom.dat'
pic='_seczoom_'$a'.eps'
tit='A=0.'$a', L_i = '
lmax=10.0
i=1


while [ $i -le $max ]; do
let j=$i+100
target=$j$nom
output=$j$pic
lin=$(echo "scale=4 ;($lmax)*($i-1)/12.0" | bc)
echo $lin
titulo=$tit$lin
gnuplot <<EOF
unset key
set auto
set pointsize 0.2
set xl "p_o"
set yl "dl"
set title "$titulo"
set term post eps monochrome font 22
set out "$output"
plot "$target" w points
set out
EOF

let i=$i+1
echo $i

done


