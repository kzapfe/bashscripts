#! /bin/bash
# script auxiliar para el filtradatos de oli
# escrito en fucktran, llamado filtraolivier.f90

echo Use at your own risk
echo modus usae:
echo Escribe despues del guion el nombre del archivo original
echo y despues a donde lo quieres mandar.
datain=$1
dataout=$2

cp $datain 'echala.in'
/home/karel/doktorkarel/bashscripts/filtraoli.x
cp 'echala.out' $2
rm echala.*

