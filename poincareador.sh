#Un superherramatico
#! /bin/bash
echo Empecemos a graficar
echo version NO interactiva
#echo nombre para los dibujos. 
#read plots
#echo Nombre de los datos
#read n
#echo cuantos bloques?, ya sabes, el cero no cuenta
#read max
plots=_lobulo.png
n=_rayotas.dat
nomb="L_in="
#el segundo es el marco de fondo
max=90
min=1
echo Vamos a graficar del bloque $min al $max
#echo Nombre del archivo de las etiquetas
#read nomb
#echo que diablos es tu variable dependiente?
#read nomy
nomy=p
echo el archivo de los datos es $n, quedamos peneque,
#echo y vamos a tomar las etiquetas titulares de $nomb .
i=$min
k=0
aguanta=' using 1:(-$3)'
lavara=' using  (-$1):3'
unrato=' using  (-$1):(-$3)'

while [ $i -le $max ] ; do
 let k=$i+100
 nombre=$nomb$(echo "scale=6; 6.23*$i/90"|bc -q)
 j=$k$plots
 m=$k$n
 echo $nombre
 echo Haciendo $j
gnuplot <<EOF
unset key
set xr[-3:3]
set yr[-3:3]
set pointsize 0.2
set dat sty points
set grid linewidth 3
set terminal png large size 1600,900  xffffff x000000 x000000  xcc0030 x000066 xcc6600 x336633 x7680aa xee0006 xdda0dd x9500d3
set title "$nombre"
set out "$j"
set xl "q"
set yl "$nomy" 
plot  "$m" using 1:3, "$m" $aguanta , "$m" $lavara, "$m" $unrato
EOF
let i=$i+1

done


# Truco manuelesco hace esto irrelevante.
# Ojala no se te haga un desmadre

 echo y ahora, la pelicula

mencoder "mf://*.png" -mf fps=6 -o tentadyn.avi -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=100



fortune -a