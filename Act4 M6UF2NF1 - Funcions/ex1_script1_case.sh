# Realitza un script que entri en un bucle i que no en surti fins que l’usuari triï si està segur de continuar 
# avançant en l’espiral d’emocions, alegries i èxits en les que es troba (si continua pots fer que s’obri l’enllaç adjunt). 
#!/bin/bash

continuar=true

while continuar; do
    # Demanar confirmació a l'usuario
    read -p "Estàs segur de continuar avançant en l’espiral d’emocions, alegries i èxits? (s/n): " resposta

    # Verificar la respuesta del usuario
    case $resposta in
        [Ss]* ) xdg-open 'https://www.youtube.com/watch?v=jaLDoWqIq2M'; continuar=false;;
            break ;;
        [Nn]* ) continuar=false;;
            echo "Has decidit no continuar. Fins aviat!"
            exit ;;
        * ) 
            echo "Si us plau, respon 's' o 'n'." ;;
    esac
done

