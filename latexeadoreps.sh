#! /bin/bash

tail1="dvi"
tail2="eps"
for i in *.tex ; do
    latex $i
    nombase=`basename $i tex`
    echo haciendo $nombase
    dvips -E $nombase$tail1 -o $nombase$tail2 
done