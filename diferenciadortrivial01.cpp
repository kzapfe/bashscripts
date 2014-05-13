//Programa que saca la Distribucion acumulada de una lista.
// Ahora tambien con la nueva idea de guardar el maximo
// y la desviacion estandar.

//Version 2; 
//Sin armadillo, queremos archivos potencialmente enormes

#include <iostream>
#include <ctime>
#include <cstdlib>
#include <fstream>
#include <math.h>


using namespace std;

int main(){


  //Leemos el vector a histogramar
  ifstream entrada("diferenciable.dat");
 
 
  double media;
  double aux1, aux2;
  int auxinteger;

  while(entrada >>aux1){
    if(aux1>maximo) maximo=aux1;
    if(aux1<minimo) minimo=aux1;
    Normalizador++;
    media+=aux1;
  };




}
