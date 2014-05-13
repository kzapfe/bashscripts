# un superpoincareador
#! /bin/bash
echo Holla idiotas, vamos ha hacer muchso dibujitos
#echo Por favor, nombre del archivo de los tentaculos
#read m
#echo nombre del archivo de las lineas
#read n
#echo nombre del archivo de los titulos
#read tit
#echo Cuantos bloques tiene el archivo
#read imax
m='tentaculos01.dat'
n='pequelinea01.dat'

# Esta linea se usa cuando usas la pequenna linea
#linea='pequenalinea02.dat'

tit='etiquetas01.log'
imax=0
aguanta=' using 1:(-$3)'
lavara=' using  (-$1):3'
unrato=' using  (-$1):(-$3)'
i=0
#Estas etiquetas se quedan afuera de momento.
#set label "$titel"  at 0.0,2 center
# set tit "tmax=10'

while [ $i -le  $imax ]; do
let chumpa=$i+101
let chum=$i+1
j=$chumpa'_tenta.tex'
titel=$(sed -n $(echo $chum)p $tit)

#Vamos a poner colores RGB hexadecimales
# Azul chingon: 0000CD
# Verde oscuro: 006400
# Naranja mandarina: EE7600
# Sepia Dorado: EEAD0E
#Verde banno:  00FF7F
# A ver que tal queda.

gnuplot <<EOF
unset key
set sty dat points
set pointsize 0.1
set grid
set xr[-10.1:10.1]
set yr[-7:7]
set title "$titel"
set terminal epslatex standalone
set out "$j"
set xl "q"
set yl "p"
set label "C" at -0.01,5
set label "T-12C" at -7.05,1.75
plot  "$m" index $i using 1:3, "$m" $aguanta index $i lt rgb "#0000CD",  "$m" $lavara index $i lt rgb "#006400",  "$m" $unrato index $i lt rgb "#EE7600", "$n" using 1:3 index $i lt rgb "#00FF7F" pointsize 0.5
set out

EOF

let i=i+1
echo vamos en el $i  
 
done



##, 

#
#