# Realitza un script que, inicialment, obtingui els noms de comptes d’usuari del sistema que continguin alguna lletra majúscula. A continuació, 
# fes que es demani un nom d’usuari. Mentre el nom introduït no sigui vàlid, mostra un missatge d’error. Un cop el nom introduït sigui vàlid (existent), 
# mostra TOTA la informació disponible relacionada amb aquest compte d’usuari del sistema.
#!/bin/bash

# Obtenir els usuaris amb majúscules
usu_majus=$(grep -Eo '[A-Z][a-z]*' /etc/passwd | sort -u)

# Verificar si hi han usuaris amb majúscules
if [ -z "$usu_majus" ]; then
    echo "No s'han trobat usuaris amb majúscules als seus noms."
    exit 1
fi

# Pedir al usuario que ingrese un nombre de usuario
read -p "Introdueix el nom d'usuari: " nom

# Verificar si el nombre de usuario ingresado es válido
while ! echo "$usu_majus" | grep -q "$nom"; do
    echo "Error: El nombre de usuario '$nom' no es válido."
    read -p "Introduce un nombre de usuario válido: " nom
done

# Mostrar toda la información relacionada con el nombre de usuario
echo "Información del usuario $usu_majus:"
grep "^$usu_majus:" /etc/passwd
