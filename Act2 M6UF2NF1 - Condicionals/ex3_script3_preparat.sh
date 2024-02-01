# Realitza un script que rebi la ruta d'un directori a comprimir i el nom de l’arxiu tarball resultant (el que vulgueu).
#!/bin/bash

# Demanem la ruta
read -p "Ruta del directori a comprimir: " ruta

# Verifica si el directorio existe
if [ ! -d "$ruta" ]; then
    echo "El directori no existeix."
    exit 1
fi

# Demanem el nom de l'arxiu
read -p "Nom del tarball resultant: " nom

# Comprimim 
tar -cvzf "$nom" "$ruta"

echo "S'ha comprimit amb exit. S'ha creat el tarball $nom"
