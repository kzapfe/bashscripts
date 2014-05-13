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
plots=_herradura.tex
n=_herdisp.dat
#m=pequelinea01.dat
#el segundo es el marco de fondo
max=24
min=1
echo Vamos a graficar del bloque $min al $max
#echo Nombre del archivo de las etiquetas
#read nomb
#echo que diablos es tu variable dependiente?
#read nomy

echo el archivo de los datos es $n, quedamos peneque,
#echo y vamos a tomar las etiquetas titulares de $nomb .
i=$min
k=0
aguanta='using 1:(-$3)'
lavara='using (-$1):3'
unrato='using (-$1):(-$3)'

while [ $i -le $max ] ; do
 let k=$i+100
# nombre=$(sed -n $(echo $k)p $nomb)
 outfile=$k$plots
 infile=$k$n
 echo Haciendo $infile a $outfile
gnuplot <<EOF
unset key
set xr[-8:8]
set yr[-8:8]
set pointsize 0.2
set dat sty lines
set terminal epslatex standalone
set out "$outfile"
set xl "q"
set yl "p" 
plot "$infile" using 1:3, "$infile" $aguanta, "$infile" $lavara, "$infile" $unrato
set out

EOF
let i=$i+1
done


# Aqui redefino todo para graficar las comprimidas.

let i=$min
plots=_herracomp.tex
k=0
aguanta=' using 2:(-$3)'
lavara=' using  (-$2):3'
unrato=' using  (-$2):(-$3)'


while [ $i -le $max ] ; do
 let k=$i+100
# nombre=$(sed -n $(echo $k)p $nomb)
 outfile=$k$plots
 infile=$k$n
 echo Haciendo $infile a $outfile
gnuplot <<EOF
unset key
set xr[-1.5:1.5]
set yr[-8:8]
set pointsize 0.2
set dat sty lines
set terminal epslatex standalone
set out "$outfile"
set xl "atanq"
set yl "p" 
plot "$infile" using 2:3, "$infile" $aguanta, "$infile" $lavara, "$infile" $unrato
set out

EOF
let i=$i+1
done


fortune -a