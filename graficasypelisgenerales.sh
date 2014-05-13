#Un superherramatico
#! /bin/bash
echo Empecemos a graficar
echo version interactiva
echo nombre para los dibujos. 
read plots
echo Nombre de los datos
read n
echo cuantos bloques?, ya sabes, el cero no cuenta
read max
min=0
echo Vamos a graficar del bloque $min al $max
#echo Nombre del archivo de las etiquetas
#read nomb
echo que diablos es tu variable dependiente?
read nomy
echo el archivo de los datos es $n, quedamos peneque,
#echo y vamos a tomar las etiquetas titulares de $nomb .
i=$min
k=0
aguanta=' using 1:(-$2)'
lavara=' using  (-$1):2'
unrato=' using  (-$1):(-$2)'

while [ $i -le $max ] ; do
 let k=$i+1000
# nombre=$(sed -n $(echo $k)p $nomb)
 j=$k$plots
 echo Haciendo $j
gnuplot <<EOF
unset key
set xr[-6:6]
set yr[-8:8]
set pointsize 0.5
set dat sty points
set grid linewidth 3
set terminal png large size 1024,800  xc5b180 x06000a x060a00  x0a0006 xffa500 x66cdaa xcdb5cd xadd8e6 x0000ff xdda0dd x9500d3
set title "t= $i"
set out "$j"
set xl "q"
set yl "$nomy" 
plot "$n"  index $i pointsize 0.75, "$n", "$n" "$aguanta", "$n" "$lavara", "$n" "$unrato"
EOF

let i=$i+1

done


# Truco manuelesco hace esto irrelevante.
# Ojala no se te haga un desmadre

 echo y ahora, la pelicula

mencoder "mf://*.png" -mf fps=3 -o prueba.avi -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=800

fortune -a

