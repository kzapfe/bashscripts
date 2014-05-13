#!/bin/bash
## Toma cinco fotos y las guarda en un directorio apropiado
## De momento sobreescribe, asi que luego lo corriges.
cd ~/Fotos/WebCamSnapshots
mplayer -vo png -frames 5 tv://
rm *01.png
display *04.png &

 
