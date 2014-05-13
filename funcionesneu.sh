#! /bin/bash

#Script para las funciones unidimensionales del paper de dos abiertos
#Uso, se ponen los archivos y el valor de L cuadrado

herradura=$1
momcuad=$2
titulo="L cuad ="$momcuad
nombre=`basename $1 dat`tex
echo "haciendo $nombre"
echo $titulo




gnuplot <<EOF
unset key
set auto
set xl "rhoini"
set yl "Deflection Angle"
set yr[-3.1415:3.1415]
set title "$titulo"
set term epslatex color standalone
set out "$nombre"
set sty dat lines
plot "$herradura" usi 1:3 lw 2
set out
EOF

sed -i 's/L cuad =/\$L^2=\$/g' $nombre
sed -i 's/rhoini/\$\\rho_\{in\}\$/g' $nombre


latex $nombre
nombredvi=`basename $nombre tex`dvi
nombreeps=`basename $nombre tex`eps
dvips -E $nombredvi -o $nombreeps
gv $nombreeps &
