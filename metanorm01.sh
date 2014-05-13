#! /bin/bash
# Lets see how good you are at this
# la idea es la siguiente: usar la rutina de awk
# para obtener los máximos tiempos de dispersión
# de ahi dicidir los bloques por cada caso.
# Creo que es conveniente escribir todo en un archivo nuevo.
#this ting works, pero es un puto crudge de la fregada
# hay que ver porque tarda tanto
echo nombre del archivo a normalizar
#de momento no interactivo
nom1=dispersaccion.dat
#read nom1
echo nombre de salida
#read nom2
nom2=test.dat
j=1
# Esta linea nos da el numero de tiempos maximos en el archivo temporal
# Nota que feo crudge
./normalizador01.awk $nom1 > temp01.int
jmax=$(wc temp01.int | awk '{print $1}')
# aqui luego meteras toda la rutina de awk necesaria
while [ $j -le $jmax ]; do
# Esta linea nos va cateando el archivo temporal 
divisor=$(sed -n $(echo $j)p temp01.int)
# mientras no haya numero de lineas mayores a la de tiempos maximos
# estos quedan guardaditos en la variable divisor.
let j=j+1
done

echo Tus datos contenian $jmax bloques.
j=1
n=1
nmax=$(wc $nom1 | awk '{print $1}')
echo el archivo $nom1 a normalizar contiene $nmax lineas

# a ver a ver a ver.
while [ $n -le $nmax ]; do
   divisor=$(sed -n $(echo $j)p temp01.int)
   dividendo=$(sed -n $(echo $n)p $nom1 | awk '{print $3}')
   # This is frankly horrible
   # there should be a better way
   # El rollo de arriba te escoge la tercera columna del archivo de entrada
   # como divisor
   # el condicional de abajo verifica si es linea es vacia 
   # es decir, si es la que separa por bloques.
   if [ "x"`echo $dividendo` =  "x" ]; then
       let j=j+1
       echo "" >> $nom2
       echo $j
   else 
       division=$(echo "scale=6; $dividendo/$divisor" | bc )
       columna1=$(sed -n $(echo $n)p $nom1 | awk '{print $1}')
       columna2=$(sed -n $(echo $n)p $nom1 | awk '{print $2}')
       echo $columna1 $columna2 $division >> $nom2
   fi


let n=n+1
done

rm temp*.int