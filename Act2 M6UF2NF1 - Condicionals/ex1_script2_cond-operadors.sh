# Fes un script que rebi un nombre enter per teclat i digui si és negatiu.
#!/bin/bash

# Demanem el nombre a l'usuari
read -p "Introdueix un nombre enter: " num

# Comprovem si es positiu o negatiu i mostrem el resultat
if [ $num -lt 0 ]; then
  echo "El nombre és negatiu."
else
  echo "El nombre no és negatiu."
fi
