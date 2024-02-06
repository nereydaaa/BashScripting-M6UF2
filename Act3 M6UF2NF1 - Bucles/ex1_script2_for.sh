# Realitza un script que rebi una cadena de nombres enters per teclat i compti quants són zero.
#!bin/bash

# Demana el nombre a l'usuari
read -p "Introdueix el nombre enter: " cadena

# Separa la cadena en nombre enters
nombres=($cadena)

# Inicialitzem un comptador de 0
cont=0

# Comptem els 0
for num in "${nombres[@]}"; do
    if [ "$num" -eq 0 ]; then
        cont=$((cont + 1))
    fi
done

# Mostrem el resultat
echo "Nombre total de 0: $cont"
