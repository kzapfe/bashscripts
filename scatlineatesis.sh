#Un superherramatico
#! /bin/bash
echo Empecemos a graficar
infile="_fundisp.dat"
outfile="_pouta000.png"
min=1
max=900
echo Vamos a graficar del bloque $min al $max
nomb="L_in="
i=$min
k=0

##Primero en blanco y negro.

while [ $i -lt $max ] ; do
 let k=$i+1000
 ##nombre=$(sed -n $(echo $k)p $nomb)
 nombre=$nomb$(echo "scale=6; 6.2831*$i/$max"|bc -q)

 impu=$k$infile
 j=$k$outfile
 echo Haciendo $j

gnuplot <<EOF

unset key
set auto
set xr[-6.962:-6.952]
set dat sty lin
set pointsize 1.4
set terminal png  size 800,600 font "/usr/share/fonts/freefont-ttf/FreeSerif.ttf" 16
set out "$j"
set xl "q in"
set yl "p out"
set title "$nombre" 
plot "$impu"  using 1:3 lw 1
EOF

let i=$i+1

done

