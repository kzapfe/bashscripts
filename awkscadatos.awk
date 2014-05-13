#Busca ciertos datos en un archivo con etiquetas y los imprime lado a lado
#!/bin/gawk  
#BEGIN {FS="\t"} #Set the Field separator
{
    if($1=="radio"){   
       rho = $2; 
    }   
    if($1=="Contamos"){
	num=$4;
	
    }     
    if($1=="Media"){
	promedio=$2;

    }     
    if($1=="Dispersion"){
	disp=$2;
	
    }     
   


	
} 
END{
    print rho"\t"promedio"\t"disp"\t"num;
}
  
