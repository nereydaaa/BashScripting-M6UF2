# Realitza un script que rebi una cadena de nombres enters per teclat i compti quants són zero.
#!bin/bash

# Demana el nombre a l'usuari
read -p "Introdueix el nombre enter: " cadena

# Inicialitzem un comptador de 0
cont=0

# Comptem els 0
for (( i=0; i<${#cadena}; i++ )); do
    if [ "${cadena:i:1}" -eq 0 ]; then
        cont=$((cont + 1))
    fi
done

# Mostrem el resultat
echo "Nombre total de 0: $cont"
