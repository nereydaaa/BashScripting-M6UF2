# Realitza un script que comprovi si el nombre de valors (o paràmetres) introduït és igual a 3. En el cas que no sigui així, ha de mostrar per pantalla un missatge d'error.
#!/bin/bash

# Verifica si el nombre de parametres és igual a 3
if [ "$#" -eq 3 ]; then
    echo "Nombre de paràmetres correcte."
    # Tu código aquí
else
    echo "Error: Se esperaban 3 paràmetres."
fi
