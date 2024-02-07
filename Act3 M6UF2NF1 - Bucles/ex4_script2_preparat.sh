# Crea un script que comprovi si hi ha connexió amb la pàgina web de l'institut per Internet. Mentre no hi hagi connexió es mostrarà un missatge advertint 
# a l’usuari que no hi ha connexió a Internet i esperarà 5 segons per tornar a comprovar si hi ha connexió.
# Un cop ja hi hagi connexió, l’script obrirà el navegador Firefox (o el que tu prefereixis) amb la pàgina principal de l’Institut.
#!/bin/bash

# Bucle per comprobar la conexió a internet
while ! wget -q --spider http://www.ies-sabadell.cat; do
    echo "No hi ha conexió a Internet. Esperant 5 segons..."
    sleep 5
done

# Si hi ha conexió, obrir el navegador amb la pàgina de l'institut
firefox http://www.ies-sabadell.cat  
