#!/bin/bash

## programa que checa que histogramador01.cpp este en regla y despues
## hace un histograma bonito en gnuplot.

if [ -z $1 ]
then
    echo "Voy a usar el archivo acumulable.dat por default"
else 
    cp $1 acumulable.dat
fi


if [ -z $2 ]
then
    echo "Voy a usar el nombre de tu archivo con diversas terminaciones  por default"
    Auxiliar=$(basename $1 .dat)    
else
    OutName=$2
fi

# make -f /home/karel/bashscripts/makefile histogramatic.x

NameDatPA=$Auxiliar"_probas.dat"
Nameestadistica=$Auxiliar"_estadistica.txt"
Nametex=$Auxiliar"-plot.tex"

#Namepdf=$Auxiliar"-plot.pdf"

#asegurate que no hay blank lines
#sed -i '/^$/d' acumulable.dat
#take toooo long, better be carefull with the data

##El sin armadillo es mejor
acumulador01.x 
mv probabilidades.dat $NameDatPA
mv estadistica.dat $Nameestadistica

# de momento sinplots
#gnuplot<<EOF

#set xlabel "time"
#set ylabel "P(t)"
#set xr [-0.001:]
#set auto
#set log y
#set grid
#unset key
#set term cairolatex pdf standalone size 16.18cm, 10cm color crop lw 3
#set out "$Nametex"
#set sty dat lines
#plot "$NameDat" usi 1:2 lw 3
#set out
#EOF
 
#pdflatex $Nametex

#mupdf $Namepdf &

echo "Fat bastard"
