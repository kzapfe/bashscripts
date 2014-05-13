#! /bin/bash
# a ver si esto jala
awk '{if (NF!=0)
 angmom=$4
    i=0
}
{if(NF==0) 
  print angmom > "temporal"
 }' mapeo.dat
 awk  '{if (i % 2 == 0) {print $0  >"temporal2.dat" }} {i++}'  temporal 
rm temporal

