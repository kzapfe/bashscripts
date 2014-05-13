#! /bin/bash
# Usere el programa eps2png para obtener png a partir de eps
# que pueden ser relativamente pesados a algo muy ligero
# Por ejemplo, para mandar a arXiv tus graficas.

echo use at your own risk.

res=100

#nomfinale=`basename $1 eps`png

for i in *.eps ; do
    eps2png -resolution $res -antialias 1 $i
    echo haciendo el $i
done

head=""

for i in *.png ; do
    nomfinale=$head`basename $i png`eps
    echo y ahora de regreso con $nomfinale
    convert -quality 100 $i $nomfinale
done

echo Done, dont blame me.