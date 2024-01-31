# Escriu un script que rebi la ruta d'un fitxer i indiqui si existeix.
#!/bin/bash

# Comprovem si s'ha introduït la ruta com argument
if [ $# -eq 0 ]; then
  echo "Error: No s'ha introduït ruta de fitxer."
  exit 1
fi

ruta=$1

if [ -e "$ruta" ]; then
  echo "El fitxer existeix."
else
  echo "El fitxer no existeix."
fi
