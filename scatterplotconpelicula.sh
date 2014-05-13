#Un superherramatico
#! /bin/bash
echo Empecemos a graficar
echo version no interactiva
plots="_scattertime.png"
echo Nombre de los dibujos para faciliar 
 n=scatteringtime01.dat
echo el archivo de los datos es $n 
max=600
min=0
echo Vamos a graficar del bloque $min al $max
nomb=etiquetas02.log
echo y vamos a tomar las etiquetas titulares de $nomb .
i=$min
k=0
while [ $i -le $max ] ; do
 let k=$i+1
 nombre=$(sed -n $(echo $k)p $nomb)
 j=$i'_scatetime01.png'
 echo Haciendo $j
gnuplot <<EOF
unset key
set auto 
set yr[10:100]
set dat sty lin
set grid linewidth 3
set terminal png large size 1024,800  x000000 x0670aa xafaf0f  xff1011 xffa500 x66cdaa xcdb5cd xadd8e6 x0000ff xdda0dd x9500d3
set title "$nombre"
set out "$j"
set xl "q inicial"
set yl "tiempo escape" 
plot "$n"  index $i
EOF
let i=$i+1

done


# renombrador para huevones.
# Ojala no se te haga un desmadre
i=0

while [ $i -lt 10 ] ; do

v=$i'_scatetime01.png'
k='00'$i
n=$k'_scatetime01.png'  
rename $v $n $v
echo $v
echo $n
let i=i+1

done

i=10

while [ $i -lt 100 ] ; do

v=$i'_scatetime01.png'
k='0'$i
n=$k'_scatetime01.png'  
rename $v $n $v
echo $v
echo $n
let i=i+1

done
 echo y ahora, la pelicula

mencoder "mf://*.png" -mf fps=12 -o prueba.avi -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=800



fortune -a