# Escriu un script que rebi la ruta d'un fitxer i indiqui els permisos que té (escriptura, lectura, execució).
#!/bin/bash

# Comprovem si s'ha introduït la ruta com argument
if [ $# -eq 0 ]; then
  echo "Error: No s'ha introduït ruta de fitxer."
  exit 1
fi

ruta=$1

# Comprovem si existeix
if [ -e "$ruta" ]; then
  # Mostrem el permisos del fitxer.

  if [ -r "$ruta" ]; then
        echo "Lectura: Sí"
  else
        echo "Lectura: No"
  fi

  if [ -w "$ruta" ]; then
        echo "Escritura: Sí"
  else
        echo "Escritura: No"
  fi

  if [ -x "$ruta" ]; then
        echo "Execusió: Sí"
  else
        echo "Execusió: No"
  fi
  
else
  echo "El fitxer no existeix."
fi


