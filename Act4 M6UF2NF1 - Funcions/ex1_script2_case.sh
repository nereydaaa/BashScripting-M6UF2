# Realitza un script al que se li passarà un nom d’usuari que, amb l’inici de la seva execució, comprovi si s’ha passat un nom d’usuari per paràmetres i que, 
# a continuació, ofereix tres opcions: Ofereix comprovar si  amb drets d’administrador, si l’usuari existeix i si la ruta del directori personal és vàlida 
# (o existeix). No cal que definir funcions.
#!/bin/bash

# Comprobar si s'ha proporcionat un nom d'usuari
if [ $# -eq 0 ]; then
    echo "Error: No se ha proporcionat nom d'usuari."
    exit 1
fi

# Guarda el nom d'usuari passat com a paràmetre en una variable
usuario=$1

# Crea una variable semàforo per controlar el bucle
sem=0

# Inicia un bucle infinit que es mantindrà fins que SEMAFORO sigui 1
while [ $SEMAFORO -eq 0 ]; do
    # Mostrar opciones a l'usuari
    echo "Selecciona una opció:"
    echo "1. Comprovar si l'usuari tiene privilegis d'administrador"
    echo "2. Comprovar si l'usuari existeix"
    echo "3. Comprovar si la ruta del directori personal de l'usuari és vàlida"
    echo "4. Sortir"
    
    # Llegir l'opción de l'usuari
    read -p "Opció: " opcion
    
    # Evaluar l'opció seleccionada
    case $opcion in
        1)
            # Comprovar si l'usuari te privilegis d'administrador
            if id -nG "$usuario" | grep -qw "sudo"; then
                echo "L'usuari $usuario te privilegis d'administrador."
            else
                echo "L'usuari $usuario no te privilegis d'administrador."
            fi
            ;;
        2)
            # Comprovar si l'usuari existeix
            if id -u "$usuario" >/dev/null 2>&1; then
                echo "L'usuari $usuario existeix."
            else
                echo "L'usuari $usuario no existeix."
            fi
            ;;
        3)
            # Comprovar si la ruta del directori personal de l'usuari és vàlida
            if [ -d "/home/$usuario" ]; then
                echo "La ruta del directori personal de l'usuario $usuario és vàlida: $home_dir"
            else
                echo "La ruta del directori personal de l'usuario $usuario no és vàlida o no existeix."
            fi
            ;;
        4)
            # Canvia el valor de la variable semàforo a 1 per sortir del bucle
            echo "Sortint..."
            SEMAFORO=1
            ;;
        *)
            echo "Opció no vàlida."
            ;;
    esac
done
