# L’ús del Heredoc és una de les formes més convenients i fàcils d'executar múltiples comandes en un sistema remot a través de SSH. 
# Realitza un script que demostri aquesta afirmació. 
#!/bin/bash

# Variables
host="tu_direccion_ip"
usuario="tu_usuario"

# Comandos remotos a ejecutar
comandos_remotos=$(cat <<'ENDSSH'
echo "Executant comandes al sistema remot:"
echo "-------------------------------------"
echo "Directori actual:"
pwd
echo "Fitxers en el directori actual:"
ls
echo "Informació sobre la memòria disponible:"
free -h
ENDSSH
)

# Ejecutar comandos remotos a través de SSH
ssh "$usuario@$host" "$comandos_remotos"
