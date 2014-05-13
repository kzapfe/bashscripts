#Un superherramatico
#! /bin/bash
echo Empecemos a graficar
echo version  interactiva en eps
echo Nombre del archivo 1
read  n1
#echo Nombre del archivo 2
#read  n2
#echo Bloques porfa
#read max
#echo etiquetas porfa
#read nomb
#echo el archivo de los datos es $n1 y $n2 
min=1
max=90
echo Vamos a graficar del bloque $min al $max

i=$min
k=0

##Primero en blanco y negro.

while [ $i -le $max ] ; do
 let k=$i+1
 ##nombre=$(sed -n $(echo $k)p $nomb)
nombre=$nomb$(echo "scale=6; 6.23*$i/39"|bc -q)

 j=$i'_pout01.eps'
 echo Haciendo $j

gnuplot <<EOF

unset key
set auto
set xr[-6.962:-6.912]
set dat sty lin
set pointsize 1.4
set terminal postscript enh eps monochrome rounded blacktext font 18
set out "$j"
set xl "qin"
set yl "pout" 
plot "$n1"  index $i using 1:3 lw 2
EOF

let i=$i+1

done

