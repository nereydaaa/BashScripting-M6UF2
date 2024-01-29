# Realitza un script que rebi diversos arguments per, a continuació, mostrar (i explicar) la diferència entre utilitzar $* i $@.

#!/bin/bash

echo "Utilitzant \$* obtenim aquest resultat"
echo "$*"
echo "Tots els arguments es mostren com una única cadena."
echo "-----------------------------"

echo "Utilitzant \$@ obtenim aquest resultat"
echo "$@"
echo "Tots els arguments es mostren com una una llista de paraules."
echo "-----------------------------"
