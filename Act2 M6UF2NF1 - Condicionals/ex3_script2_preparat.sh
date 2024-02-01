# Crea un script que rebi la ruta d'un fitxer i indiqui si és un directori o fitxer i, en el cas que sigui un arxiu, exposa quina és la seva extensió.
#!/bin/bash

# Comprovem si s'ha introduït la ruta com argument
if [ $# -eq 0 ]; then
  echo "Error: No s'ha introduït ruta."
  exit 1
fi

ruta=$1

# Busquem la ruta
if [ -e "$ruta" ]; then
  # Comprovem si es directori o fitxer
  if [ -d "$ruta" ]; then
    echo "És un directori."
  elif [ -f "$ruta" ]; then
    echo "És un fitxer."
    # Obtenim la extensió del fitxer.
    nom=$(basename "$ruta")
    ext="${nom##*.}"
    if [ "$ext" != "$nom" ]; then
      echo "La extensió del fitxer és: $ext"
    else
      echo "El fitxer no te extensió."
    fi
  else
    echo "No és ni un fitxer ni un directori."
  fi
else
  echo "La ruta no existeix."
fi
