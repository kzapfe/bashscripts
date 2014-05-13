#! /bin/bash
# Ajusta constantes de difusion para los archivos
# Del billar de cruces cilindricas
# Usando gnuplot

#el primer argumento es el archivo de datos.
datos=$1
#el segundo el archivo de difusion.
aspect=$(head -1 $datos)
#Nombre de salida
outname=`basename $datos dat`png
echo Haciendo $outname
gnuplot <<EOF
set term png
set style data line 
set xr[400:5500]
set syle line 2 lw 4
set xlabel "tiempo Birkhoff"
set ylabel "x cuadrado promedio"
set grid linewidth 2
f(x)=a*x
fit f(x) "$1" usi 1:4 every ::400 via a
set label "x^2=%g t",a at 3000,45000
set title "$aspect"
set out "$outname"
plot "$1" using 1:4, f(x) 
set print "fitdata.dat" append
print a

EOF

