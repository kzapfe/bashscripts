# un superpoincareador
#! /bin/bash
echo Holla idiotas, vamos ha hacer muchso dibujitos
#echo Por favor, nombre del archivo de los tentaculos
#read m
#echo nombre del archivo de los adornos
#read n
#echo nombre del archivo de los titulos
#read tit
#echo Cuantos bloques tiene el archivo
#read imax
m='tentaculos01.dat'

# Esta linea se usa cuando usas la pequenna linea
#linea='pequenalinea02.dat'

# tit='etiquetas01.log'
imax=12
aguanta=' using 1:(-$2)'
lavara=' using  (-$1):2'
unrato=' using  (-$1):(-$2)'
 i=0
#Estas etiquetas se quedan afuera de momento.
#set label "$titel"  at 0.0,2 center
# set tit "tmax=10'

while [ $i -lt  $imax ]; do
let chumpa=$i+1
j=$i'_tenttemp.png'
#titel=$(sed -n $(echo $chumpa)p $tit)

gnuplot <<EOF
unset key
set sty dat points
set pointsize 0.3
set grid
set xr[-6:6]
set yr[-5:5]
set terminal png large size 1024,800 xfffcc1 x010100 x010100 xcc0009 x16001d x448800 x335555 x090733
set out "$j"
set xl "q"
set yl "p"
plot  "$m" index $i 
EOF

let i=i+1
echo vamos en el $i  
 
done

gqview &

#, "$m" $aguanta index $i,  "$m" $lavara index $i,  "$m" $unrato index $i, "$linea" index $i