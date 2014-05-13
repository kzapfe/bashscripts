//Programa que histograma un vector
// Ahora tambien con la nueva idea de guardar el maximo
// y la dispersion estandar.

#include <armadillo>
#include <iostream>
#include <ctime>
#include <cstdlib>


using namespace arma;
using namespace std;

int main(){

  //Leemos el vector a histogramar
  colvec VectorEntrada;
  VectorEntrada.load("histogramable.dat", raw_ascii); 
  double maximo, minimo;

  ofstream statistics;
  statistics.open("estadistica.dat");
  
  const int cajas=99;
  mat HistogramaMatricial=zeros<mat>(cajas,2);
  int indice;
  int histograma[cajas]={0};
  int norma;

  maximo=max(VectorEntrada);
  minimo=min(VectorEntrada);
  norma=VectorEntrada.n_rows;

  for(int j=0 ; j<norma ; j++){
    indice=floor(cajas*(VectorEntrada(j)-minimo)/(maximo-minimo));
    histograma[indice]++;
  };
  
  //llenamos la matriz de las estadisticas
  double media, dispersion, masprobable=0.0;
  int probmax=0;

  for(int j=0; j<cajas;j++){
    double centro;
    
    centro=minimo+j*(maximo-minimo)/(double)cajas;
    HistogramaMatricial(j,0)=centro;
    HistogramaMatricial(j,1)=histograma[j];
    if(probmax<histograma[j])
      {probmax=histograma[j];
	masprobable=centro;
      };

    cout<<centro<<"\t"<<histograma[j]/norma<<endl;
  

  };

  //calculamos los valores interesantes.  
    

  statistics<<"Y ahora va la estadistica " <<endl;

 
  media=mean(VectorEntrada);  
  dispersion=stddev(VectorEntrada);

 
  //Los guardamos bonito
  
  statistics<<"Media"<<"\t"<<media<<endl;
  statistics<<"Dispersion"<<"\t"<<dispersion<<endl;
  statistics<<"Mayor"<<"\t"<<masprobable<<endl;
  statistics<<"Altura"<<"\t"<<probmax<<endl;
  statistics<<minimo<<endl;
  statistics<<maximo<<endl;
  
  statistics.close();
 
  return 0;
}
