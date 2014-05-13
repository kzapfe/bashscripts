#Un superherramatico
#! /bin/bash
echo Empecemos a graficar
echo version semi interactiva
n=$1
echo Vamos a plotear lo que hayas puesto detras de mi nombre
echo el archivo de los datos es $n 
echo El segundo argumento que me diste es el valor del A detras 
echo del punto
echo A= 0.$2
max=40
min=1
echo Vamos a graficar del bloque $min al $max
lmax=6.23
i=$min
k=0
pic1='_pout'$2'.png'
pic2='_DeltaL'$2'.png'

while [ $i -le $max ] ; do
 let k=$i+100
 lin=$(echo "scale=4 ;($lmax)*($i-1)/40.0" | bc)
 echo Esto es lin, $lin
 nombre1=$k$pic1
 nombre2=$k$pic2
 ploteable=$k$n
 titulo='A=0.'$2', L_in='$lin
 echo Haciendo $nombre
gnuplot <<EOF
set pm3d map implicit
# set palette rgbformulae 3,3,3
unset key
set auto
# set xr[-6.962:-6.912]
# set cbr[-8:8]
set yr[0:6.283]
set terminal png size 820,650 font "/usr/share/fonts/freefont-ttf/FreeSerif.ttf" 12
set title "$titulo"
set out "$nombre1"
set xl "q_in"
set yl "theta_in" 
splot "$ploteable" usi 1:2:3  
set out
set out "$nombre2"
splot "$ploteable" usi 1:2:4
set out
EOF
let i=$i+1

done