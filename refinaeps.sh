#!/bin/bash
## Para convertir, con latex, algun archivo eps a otro pdf
## pasandolo por psfrag
## usa el archivo refinadoreps.tex
## que puedes editar al caso

lsource=/home/karel/doktorkarel/bashscripts/refinadoreps.tex
echo  Use at your own risk
echo ESTO ESCRIBE SOBRE TU EPS ORIGINAL
echo Porfa, que imagen en eps sera el primer argumento
echo $1
image=$1
temp=./temp.eps
nomfinale=test01.eps

cp -v $image $temp

latex $lsource 
echo `basename $lsource tex`
dvips -E `basename $lsource tex`dvi -o $image
echo he terminado de procesar la imagen
echo ahora procedo a limpiar.
echo y ahora la fase final
epstopdf $image
##mv $nomfinale .
rm $temp
