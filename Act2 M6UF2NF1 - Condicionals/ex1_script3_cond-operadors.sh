# Realitza un script que rebi un nombre enter per teclat i digui si és zero.
#!/bin/bash

# Demanem el nombre a l'usuari
read -p "Introdueix un nombre enter: " num

# Comprovem si es positiu o negatiu i mostrem el resultat
if [ $num -eq 0 ]; then
  echo "El nombre és 0."
else
  echo "El nombre no és 0."
fi
