#! /bin/bash
# renombrador para huevones.
# Ojala no se te haga un desmadre
i=0

while [ $i -lt 10 ] ; do

#let k=10*$i+1
v='0'$i'_pdispersion01.eps'
k='00'$i
n=$k'_pdsipersion01.eps'  
rename $v $n $v
echo $v
echo $n
let i=i+1

done