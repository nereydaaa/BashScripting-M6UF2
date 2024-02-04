# Realitza un script que tregui els comentaris (aquells que comencen per # i arriben fins al final de la línia) de l’arxiu. 
# Un cop els comentaris ja estiguin eliminats, demana si una paraula/frase existeix dins d’un arxiu. 
# I un cop feta aquesta comprovació, demana que s’afegeixi una frase al final de l’arxiu (és obligatori que s’introdueixi). 

#!/bin/bash

# Comprovem si s'ha pasat la ruta
if [ $# -eq 0 ]; then
    echo "Error: No s'ha introduït ruta."
    exit 1
fi

arxiu=$1

# Elimina els comentaris de l'ariu
for linea in $(cat "$arxiu"); do
    if [[ ! "$linea" =~ ^\# ]]; then
        echo "$linea" >> temp_file
    fi
done

mv temp_file "$arxiu"

# Pregunta a l'usuari la paraula o frase a buscar dins l'ariu
read -p "Paraula/Frase per buscar a l'ariu: " paraula

# Verifica si apareix
existeix=false
for linea in $(cat "$arxiu"); do
    if [[ "$linea" == *"$paraula"* ]]; then
        existeix=true
        break
    fi
done

if [ "$existe" = true ]; then
    echo "La palabra/frase '$paraula' existeix a l'arxiu."
else
    echo "La palabra/frase '$paraula' no existeix a l'arxiu."
fi

# Demana a l'usuari la frase nova
read -p "Nova frase per introduïr a l'arxiu: " frase

# Agrega la nova frase
echo "$frase" >> "$arxiu"

echo "S'ha afegit la nova frase a l'arxiu."
