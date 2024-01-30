# Crea un script que demani a l’usuari que introdueixi un nom d’usuari i una contrasenya per, a continuació, mostrar-ho tot en una sola línia.
# Quan l’usuari introdueixi la seva contrasenya, aquesta no ha d’aparèixer.

#!/bin/bash

# Demanem les dades a l'usuari
read -p "Introdueix el nom d'usuari: " username
read -s -p "Introdueix la contrasenya: " password

# Mostrem la informació per pantalla
echo -e "\nUsuari: $username , Contrasenya: [oculta]"
