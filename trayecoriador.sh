#Un superherramatico
#! /bin/bash
echo Empecemos a graficar
echo version NO interactiva


plots=_tray.png
n=_tray.dat
nomb=etiquetas.dat


max=25
min=1

echo el archivo de los datos es $n, quedamos peneque,
#echo y vamos a tomar las etiquetas titulares de $nomb .
i=$min
k=0


while [ $i -le $max ] ; do
 let k=$i+100
 j=$k$plots
 m=$k$n
 echo Haciendo $j
gnuplot <<EOF
unset key
unset colorbox
set palette 
set xr[-9:9]
set yr[-6:6]
set zr[-5:5]
set cbr[1:4]
set hidden3d
set dat sty lines
set palette rgbformulae 3,11,6
set terminal png large size 647,400  xffffff x000000 x000000  xcc0030 x000066 xcc6600 x336633 x7680aa xee0006 xdda0dd x9500d3
set out "$j"
set xl "x"
set yl "y"
set yl "z"
splot  "$m" w l palette lw 2 
EOF
let i=$i+1

done


# Truco manuelesco hace esto irrelevante.
# Ojala no se te haga un desmadre

 echo y ahora, la pelicula

# mencoder "mf://*.png" -mf fps=6 -o tentadyn.avi -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=100



fortune -o