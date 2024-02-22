# L’ús del Heredoc és una de les formes més convenients i fàcils d'executar múltiples comandes en un sistema remot a través de SSH. 
# Realitza un script que demostri aquesta afirmació. 
#!/bin/bash

# Variables
host="dir_ip"
usuario="usu"

# Utilitzar SSH juntament amb Heredoc per a l'execució de múltiples comandes
ssh -tt ${usuario}@${host} << EOF
    echo "Aquesta és la primera comanda executada en el sistema remot"
    ls -l
    pwd
    echo "Aquesta és l'última comanda executada en el sistema remot"
EOF
