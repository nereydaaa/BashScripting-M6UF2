# Realitza un script que rebi un nombre enter per teclat i digui si és positiu o negatiu, comparant-ho amb zero.
#!/bin/bash

# Demanem el nombre a l'usuari
read -p "Introdueix un nombre enter: " num

# Comprovem si es positiu o negatiu i mostrem el resultat
if [num -gt 0]; then
  echo "El nombre és positiu."
elif [num -ls 0]; then
  echo "El nombre és negatiu."
else
  echo "El nombre és 0."
fi
