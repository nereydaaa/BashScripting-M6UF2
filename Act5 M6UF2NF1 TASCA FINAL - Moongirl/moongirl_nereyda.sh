#!/bin/bash


# Funció per comprovar l'estat dels ports oberts
function comprova_ports() {
    echo "Comprovant ports oberts amb Nmap..."
    
    # Comprobar si Nmap está instal·lat
    if ! command -v nmap &> /dev/null; then
        echo "Nmap no está instal·lat. Instal·lant..."
        
        # Instal·lar Nmap en Ubuntu
        sudo apt-get update
        sudo apt-get install -y nmap
    fi

    # Utilizar Nmap para comprobar los puertos abiertos
    nmap -p 1-1000 localhost

    # Guardar las salidas en variables
    ports_output="$ports_output $apache_status"
}


# Funció per realitzar les comprovacions de hardware i software
function comprovacions_servidor() {
    echo "<h2>Comprovacions de hardware i software en curs...</h2>"
    
    echo "<h2>Comprovació de la memòria lliure</h2>"
    echo "<pre>"
    free -h
    echo "</pre>"

    echo "<h2>Comprovació de l'espai en disc</h2>"
    echo "<pre>"
    df -h
    echo "</pre>"

    echo "<h2>Comprovació de l'ús de CPU</h2>"
    echo "<pre>"
    top -n 1 -b | head -n 10
    echo "</pre>"

    echo "<h2>Comprovació de la versió del sistema operatiu</h2>"
    echo "<pre>"
    uname -a
    echo "</pre>"

    echo "<h2>Comprovació dels serveis en funcionament</h2>"
    echo "<pre>"
    systemctl list-units --type=service
    echo "</pre>"

    echo "<h2>Comprovació de la temperatura del CPU</h2>"
    echo "<pre>"
    sensors
    echo "</pre>"

    echo "<h2>Comprovació de l'ús de la memòria swap</h2>"
    echo "<pre>"
    swapon --show
    echo "</pre>"

    echo "<h2>Comprovació de l'estat del disc SMART</h2>"
    echo "<pre>"
    sudo smartctl -a /dev/sda
    echo "</pre>"

    echo "<h2>Comprovació del tràfic de xarxa</h2>"
    echo "<pre>"
    iftop
    echo "</pre>"

    echo "<h2>Comprovació de la càrrega del sistema</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"

    echo "<h2>Versions de software</h2>"
    echo "<pre>"
    if command -v apache2 &> /dev/null; then
        apache2 -v
    else
        echo "Apache no està instal·lat."
    fi

    if command -v mysql &> /dev/null; then
        mysql --version
    else
        echo "MySQL no està instal·lat."
    fi

    if command -v php &> /dev/null; then
        php --version
    else
        echo "PHP no està instal·lat."
    fi
    echo "</pre>"
}


# Función para ejecutar las comprobaciones en el servidor remoto
function executar_comprovacions_remotes() {
    echo "Conectando al servidor remoto..."

    # Solicitar al usuario los nombres de usuario y del servidor
    read -p "Ingrese el nombre de usuario: " user
    read -p "Ingrese el nombre del servidor: " server

    # Utilizar SSH para conectarnos y ejecutar las comprobaciones
    servidor_output=$(ssh $user@$server "$(typeset -f); comprovacions_servidor")
    ports_output=$(ssh $user@$server "$(typeset -f); comprova_ports")
}


# Funció per mostrar els resultats en format HTML
function mostra_resultats_html() {
    cat <<HTML
<html>
<head>
<title>Resultats de les comprovacions del servidor</title>
</head>
<body>
<h1>Resultats de les comprovacions del servidor</h1>
<h2>Resultats dels ports oberts:</h2>
<p>$ports_output</p>
<h2>Resultats de les comprovacions de maquinari i programari:</h2>
<p>$comprovacions_servidor_output</p>
</body>
</html>
HTML
}


# Funció principal
function main() {
    # Executar les comprovacions en el servidor remot amb els arguments proporcionats
    executar_comprovacions_remotes

    # Mostrar els resultats en format HTML
    mostra_resultats_html
}


# Executar la funció principal
main
