# Realitza un script que comprovi si el nombre de valors (o paràmetres) introduït és igual a 3. En el cas que no sigui així, ha de mostrar per pantalla un missatge d'error.
#!/bin/bash

# Verifica si el nombre de parametres és igual a 3
until [ $# -eq 3 ]; do
    echo "Error: No s'han introduït exactament 3 paràmetres."
    read -p "Introdueix exactament 3 paràmetres: " -a parametres  # Solicitar a l'usuari que torni a introduir els valors
    set -- ${parametres[@]}  # Estableix els nous valors
done

# Si s'han introduït correctament els paràmetres, continuem amb el programa
echo "S'han proporcionat correctamnet 3 paràmetres."
