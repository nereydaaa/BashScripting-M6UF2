# Fes un script que compti quants cops s’han establert connexions d’un determinat protocol a partir d’un 
# arxiu TXT/CSV de captures del programari Wireshark passat per paràmetres.
#!/bin/bash

# Comprovem si s'ha pasat la ruta
if [ $# -eq 0 ]; then
    echo "Error: No s'ha introduït ruta."
    exit 1
fi

captures=$1
protocol="TCP"

#Comptem les línies
quant=$(grep -i "$protocol" "$captures" | wc -l)

# Mostrem el resultat
echo "$quant"
