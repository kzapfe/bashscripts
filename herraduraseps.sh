#! /bin/bash

#Script para las herraduras del paper de dos grados abiertos
#Uso, se ponen los archivos y el valor de L cuadrado
herradura=$1
linea=$2
momcuad=$3
titulo="L cuad ="$momcuad
nombre=`basename $1 dat`tex
echo "haciendo $nombre"
echo $titulo


aguanta=' using 1:(-$2)'

gnuplot <<EOF
unset key
set xr[0.5:3]
set yr[-0.25:0.25]
set xl "rho"
set yl "momentum"
set title "$titulo"
set term epslatex color standalone
set out "$nombre"
set sty dat lines
plot "$herradura" lw 2, "$herradura" $aguanta lw 2, "$linea" lw 4
set out
EOF

sed -i 's/L cuad =/\$L^2=\$/g' $nombre
sed -i 's/rho/\$\\rho\$/g' $nombre
sed -i 's/momentum/\$\p_\\rho\$/g' $nombre

latex $nombre
nombredvi=`basename $nombre tex`dvi
nombreeps=`basename $nombre tex`eps
dvips -E $nombredvi -o $nombreeps
gv $nombreeps &
