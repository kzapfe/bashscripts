#!/bin/bash

## programa que checa que histogramador01.cpp este en regla y despues
## hace un histograma bonito en gnuplot.

if [ -z $1 ]
then
    echo "Voy a usar el archivo histogramable.dat por default"
else 
    cp $1 histogramable.dat
fi


if [ -z $2 ]
then
    echo "Voy a usar el nombre de tu archivo + Histograma  por default"
    Auxiliar=$(basename $1 .dat)    
    OutName=$Auxiliar"-Histograma"
else
    OutName=$2
fi

# make -f /home/karel/bashscripts/makefile histogramatic.x

NameDat=$OutName".dat"
Nametex=$OutName".tex"
Namepdf=$OutName".pdf"
Nameestadistica=$OutName"_estadistica.txt"

##El sin armadillo es mejor
histo02.x > $NameDat 
mv estadistica.dat $Nameestadistica

#gnuplot<<EOF

#set xlabel "Time between events"
#set ylabel "Ocurrences"
#set xr [-0.001:]
#set auto
#set log y
#unset key
#set term epslatex standalone size 16.18cm, 10cm color clip
#set out "$Nametex"
#plot "$NameDat" w boxes lw 3
#set out
#EOF
 

#pdflatex $Nametex

#mupdf $Namepdf &

echo "Fat bastard"
