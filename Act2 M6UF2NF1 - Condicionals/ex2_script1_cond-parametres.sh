# Escriu un script que comprovi si el nombre de paràmetres introduït és igual a 3. 
# En el cas que no sigui així, ha de mostrar per pantalla un missatge d'error.

#!/bin/bash

# Comrpovem que el nombre de paràmetres es igual a 3

if [ $# -eq 3 ]; then
  echo "Número de paràmetres és 3."
else
  echo "Error: número de paràmetres incorrecte."
fi
