//Programa que saca la Distribucion acumulada de una lista.
// Ahora tambien con la nueva idea de guardar el maximo
// y la desviacion estandar.

//Version 2; 
//Sin armadillo, queremos archivos potencialmente enormes
//Okeydokey burrito, no necesitas dos archivos de salida

#include <iostream>
#include <ctime>
#include <cstdlib>
#include <fstream>
#include <math.h>


using namespace std;

int main(){

  //Leemos el archivo del que queremos sacar P(x) (Proba acumulada)
  ifstream entrada("acumulable.dat");

  double maximo=-99999999, minimo=99999999;
  
  int Normalizador=0;
  double media;
  double aux1, aux2;
  int auxinteger;
  string encabezado, dumy;
  double deltax;

  /*los primeros dos renglones de 
    los archivos deberian ser
    encabezados con info global*/
  entrada>>encabezado;
  entrada>>dumy;
  
  while(entrada >>aux1){
    if(aux1>maximo) maximo=aux1;
    if(aux1<minimo) minimo=aux1;
    Normalizador++;
    media+=aux1;
  };
  
  entrada.close();
  media=media/Normalizador;

  
  //Bajamos el maximo a algo para plotear
  double verdaderomaximo=maximo;
  if(maximo>0.8)maximo=0.8;

  //veamos si funciona asi de baboso
  entrada.open("acumulable.dat");

   const int cajas=500; 
   int  Histocuenta[cajas]={0};
  // //llenamos la matriz de las estadisticas
   double  dispersion=0.0;
   int indice;
   
   /***********************/
   ofstream probabilidades;
   probabilidades.open("probabilidades.dat");
   

  /*los primeros dos renglones de 
    los archivos deberian ser
    encabezados con info global*/
   entrada>>encabezado;
   entrada>>dumy;
      
   
   while(entrada >>aux1){
   
     dispersion+=aux1*aux1;
     
     //Si quieres poner un falso maximo para plotear mejor
     //tendras que hacer mas robusta la operacion indice.
     indice=cajas-1;
     if(aux1<maximo) indice=(int)((aux1-minimo)/(maximo-minimo)*cajas);
     if(indice<cajas) Histocuenta[indice]++;    
   
   };

   dispersion=(dispersion-media*media)/Normalizador;
   dispersion=sqrt(dispersion);

   probabilidades<<encabezado<<endl;
   probabilidades<<endl;   

   
   //Al parecer solo tienes que agregar dos lineas para cambiar
   //de histogramador a Prob acumulada: esta
   auxinteger=0;
   deltax=(maximo-minimo)/(double)cajas;
   for(int j=0; j<cajas;j++){
     double centro;
     //Y esta: cambiar = por +=
     auxinteger+=(double)Histocuenta[j];
     //aqui viene P(x)
     aux1=(double)auxinteger/Normalizador;
     aux2=(double)Histocuenta[j]/Normalizador/deltax;
     centro=minimo+(j+0.500)*deltax;            
     probabilidades<<centro<<"\t"<<aux1<<"\t"<<aux2<<endl;

   };

   probabilidades.close();

   /***********************/
   ofstream statistics;
   statistics.open("estadistica.dat");

   //calculamos los valores interesantes.  
    

   statistics<<"Y ahora va la estadistica " <<endl;
   statistics<<encabezado<<endl;
  
   // //Los guardamos bonito
   
   statistics<<"Contamos tantos datos "<<Normalizador<<endl;
   statistics<<"Media"<<"\t"<<media<<endl;
   statistics<<"Dispersion"<<"\t"<<dispersion<<endl;
   // statistics<<"Mayor"<<"\t"<<masprobable<<endl;
   // statistics<<"Altura"<<"\t"<<probmax<<endl;
   statistics<<minimo<<endl;
   statistics<<verdaderomaximo<<endl;    
   statistics.close();
 
  return 0;
  
}
