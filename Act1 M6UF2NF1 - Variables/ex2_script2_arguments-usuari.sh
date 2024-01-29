# Realitza un script que mostri un a un (un per línia) - no cal validar-los - els arguments que has introduït i 
# quants s’han introduït. Pot rebre tants arguments com TU vulguis.

#!/bin/bash

echo "S'han introduit $# arguments, que són els següents:"

for arg in "$@"; do
  echo "$arg"
done
  
