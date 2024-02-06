# Realitza un script que llegeixi paraules i les guardi en un arxiu fins que s’escrigui “:>”. 
# No oblidis que has de comprovar que hi ha un arxiu on emmagatzemar les paraules.
#!bin/bash

# Comprovem si s'ha pasat la ruta
if [ $# -eq 0 ]; then
    echo "Error: No s'ha introduït ruta."
    exit 1
fi

arxiu=$1

# Comproba si l'arxiu exiteix
if [ -e "$arxiu" ]; then
    echo "L'arxiu ja existeix. S'afegiran les paraules a l'arxiu existent."
else
    echo "L'arxiu no existeix. Es crearà un nou arxiu per guardar les paraules."
fi

# Demana a l'usuaei introduïr les paraules i les guarda a l'arxiu
while true; do
    read -p "Introdueix una parauls (escriu ':>' per finalitzar): " paraula
    if [ "$paraula" = ":>" ]; then
        echo "Fin del programa."
        break
    else
        echo "$paraula" >> "$arxiu"
    fi
done
