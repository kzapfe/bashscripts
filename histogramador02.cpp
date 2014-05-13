//Programa que histograma un vector
// Ahora tambien con la nueva idea de guardar el maximo
// y la dispersion estandar.

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
  ifstream entrada("histogramable.dat");
  double maximo=-999999, minimo=999999;
  
  int Normalizador=0;
  double media;
  double aux1, aux2;


  while(entrada >>aux1){
    if(aux1>maximo) maximo=aux1;
    if(aux1<minimo) minimo=aux1;
    Normalizador++;
    media+=aux1;
  };
  
  entrada.close();
  media=media/Normalizador;

  
  //veamos si funciona asi de baboso
  entrada.open("histogramable.dat");

   const int cajas=100; 
   int  Histocuenta[cajas]={0};
  // //llenamos la matriz de las estadisticas
   double  dispersion=0.0;
   int indice;

   while(entrada >>aux1){

     dispersion+=aux1*aux1;
     indice=(int)((aux1-minimo)/(maximo-minimo)*cajas);
     Histocuenta[indice]++;  
  
   };

   dispersion=(dispersion-media*media)/Normalizador;
   dispersion=sqrt(dispersion);

   for(int j=0; j<cajas;j++){
     double centro;
     aux2=(double)Histocuenta[j]/Normalizador;

     centro=minimo+(j+0.500)*(maximo-minimo)/(double)cajas;
     cout<<centro<<"\t"<<aux2<<endl;
  

   };

   ofstream statistics;
   statistics.open("estadistica.dat");

   //calculamos los valores interesantes.  
    

   statistics<<"Y ahora va la estadistica " <<endl;

     
  // //Los guardamos bonito
   
   statistics<<"Media"<<"\t"<<media<<endl;
   statistics<<"Dispersion"<<"\t"<<dispersion<<endl;
  // statistics<<"Mayor"<<"\t"<<masprobable<<endl;
  // statistics<<"Altura"<<"\t"<<probmax<<endl;
    statistics<<minimo<<endl;
    statistics<<maximo<<endl;
  
    statistics.close();
 
  return 0;
}
