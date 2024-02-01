# Escriu un script que rebi la ruta d'un fitxer i indiqui els permisos que té (escriptura, lectura, execució).
#!/bin/bash

# Comprovem si s'ha introduït la ruta com argument
if [ $# -eq 0 ]; then
  echo "Error: No s'ha introduït ruta de fitxer."
  exit 1
fi

ruta=$1

# Comprovem si existeix
if [ ! -e "$ruta" ]; then
  echo "El fitxer no existeix."
fi

# Obté els permisos del fitxer
permisos=$(stat -c "%a" "$ruta_del_fitxer")
echo "$permisos"
