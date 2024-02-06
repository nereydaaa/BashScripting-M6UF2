# Escriu un script que demani la ruta d’un directori per teclat i ens digui quins permisos té, quants arxius i quantes carpetes hi 
# ha a dins i quins són els noms dels arxius i de les carpetes.
#!/bin/bash

ruta_correcta=false
until [ "$ruta_correcta" = true ]; do
    # Solicitar a l'usuari la ruta del directori
    read -p "Introdueix la ruta del directori: " directori

    # Verificar si el directori existeix
    if [ -d "$directori" ]; then
        ruta_correcta=true
    else
        echo "La ruta \"$directori\" no es correcta."
    fi
done

# Obtenir els permisos del directori
permis=$(stat -c "%A" "$directori")
echo "Permissos del directori \"$directori\": $permis"

# Comptar el nombre d'arxius i directoris dins de la ruta
num_arxius=$(find "$directori" -maxdepth 1 -type f | wc -l)
num_carpetes=$(find "$directori" -maxdepth 1 -type d | wc -l)

echo "Nombre d'arxius en \"$directori\": $num_arxius"
echo "Nombre de carpetes en \"$directori\": $num_carpetes"

# Mostrar el nom dels arxius i carpetes de la ruta
echo "Nom d'arxius:"
find "$directori" -maxdepth 1 -type f -printf "%f\n"

echo "Nom de carpetes:"
find "$directori" -maxdepth 1 -type d -printf "%f\n"
