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
    comprovacions_ports_output="$ports_output $apache_status"
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
    comprovacions_servidor_output=$(ssh $user@$server "$(typeset -f); comprobaciones_servidor")
    comprovacions_ports_output=$(ssh $user@$server "$(typeset -f); comprova_ports")
}


# Funció per mostrar els resultats en format HTML
mostra_resultats_html() {
    # Aquí es pot utilitzar un Here-Doc per generar el codi HTML amb els resultats
    cat <<EOF
<html>
<head>
<title>Resultats de les comprovacions del servidor</title>
</head>
<body>
<h1>Resultats de les comprovacions del servidor</h1>
<p>Els ports oberts són: [Resultats de la comprovació]</p>
<p>Els serveis actius són: [Resultats de la comprovació]</p>
<p>El funcionament intern del servidor: [Resultats de la comprovació]</p>
</body>
</html>
EOF
}

# Funció per gestionar les trampes i netejar recursos abans de sortir
neteja_recursos() {
    echo "Netejant recursos..."
    # Aquí es pot afegir qualsevol neteja necessària abans de sortir del script
}

# Trap per capturar senyals de sortida i netejar recursos abans de sortir
trap neteja_recursos EXIT

# Executa les comprovacions
executa_comprovacions

# Mostra els resultats en format HTML
mostra_resultats_html

# Finalment, si és necessari, es pot afegir la crida al Cron per automatitzar aquest script.

