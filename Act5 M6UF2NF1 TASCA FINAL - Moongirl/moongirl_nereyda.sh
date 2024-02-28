#!/bin/bash


# Funció per instal·lar les eines necessàries si no estan instal·lades
function instalar_eines() {
    echo "Comprovant la instal·lació de les eines necessàries..."

    # Llista d'eines a verificar i instal·lar si és necessari
    eines=("sudo" "nmap" "speedtest-cli" "linux-tools-common" "sysstat" "iftop" "smartmontools")

    # Verificar cada eina i, si no està instal·lada, instal·lar-la
    for eina in "${eines[@]}"; do
        if ! command -v "$eina" &> /dev/null; then
            echo "$eina no està instal·lada. Instal·lant..."
            if [ "$eina" == "linux-tools-common" ]; then
                sudo apt-get install -y linux-tools-common
            else
                sudo apt-get install -y "$eina"
            fi
        else
            echo "$eina ja està instal·lada."
        fi
    done

    echo "Instal·lació d'eines completada."
}


# Funció per comprovar l'estat dels ports oberts
function comprova_ports() {
    echo "Comprovant ports oberts amb Nmap..."

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


# Funció per comprovar l'estat de la connexió de xarxa, la velocitat i la disponibilitat dels recursos de xarxa
function comprova_xarxa() {
    echo "<h2>Comprovació de recursos de xarxa en curs...</h2>"
    
    echo "<h2>Comprovació de l'estat de la connexió de xarxa</h2>"
    echo "<pre>"
    ip a
    echo "</pre>"

    echo "<h2>Comprovació de la velocitat de la connexió de xarxa</h2>"
    echo "<pre>"
    speedtest-cli
    echo "</pre>"

    echo "<h2>Comprovació de la disponibilitat dels recursos de xarxa</h2>"
    echo "<pre>"
    ping -c 5 google.com
    echo "</pre>"
}


# Funció per realitzar comprovacions de rendiment
function comprova_rendiment() {
    echo "<h2>Comprovació de rendiment en curs...</h2>"
    
    echo "<h2>Executant proves de rendiment...</h2>"
    echo "<pre>"

    # Mostrar estadísticas de uso de memoria, CPU y E/S
    echo "<h3>Estadísticas de uso de memoria, CPU y E/S:</h3>"
    vmstat 1

    # Mostrar estadísticas de E/S del sistema
    echo "<h3>Estadísticas de E/S del sistema:</h3>"
    iostat -x 1

    # Mostrar estadísticas del sistema en tiempo real
    echo "<h3>Estadísticas del sistema en tiempo real:</h3>"
    sar -n DEV 1

    # Realizar pruebas de rendimiento con herramientas como Perf
    echo "<h3>Pruebas de rendimiento con Perf:</h3>"
    perf stat -a sleep 5
    
    echo "</pre>"
}


# Función para ejecutar las comprobaciones en el servidor remoto
function executar_comprovacions_remotes() {
    echo "Conectando al servidor remoto..."

    # Solicitar al usuario los nombres de usuario y del servidor
    read -p "Ingrese el nombre de usuario: " user
    read -p "Ingrese el nombre del servidor: " server

    # Comprovar i instal·lar les eines necessàries
    instalar_eines

    # Utilizar SSH para conectarnos y ejecutar las comprobaciones
    servidor_output=$(ssh $user@$server "$(typeset -f); comprovacions_servidor")
    ports_output=$(ssh $user@$server "$(typeset -f); comprova_ports")
    xarxa_output=$(ssh $user@$server "$(typeset -f); comprova_xarxa")
    rendiment_output=$(ssh $user@$server "$(typeset -f); comprova_rendiment")
}


# Funció per mostrar els resultats en format HTML
function mostra_resultats_html() {
    cat <<HTML > html_resultats.html
<html>
<head>
<title>Resultats de les comprovacions del servidor</title>
</head>
<body>
<h1>Resultats de les comprovacions del servidor</h1>
<h2>Resultats dels ports oberts:</h2>
<p>$ports_output</p>
<h2>Resultats de les comprovacions de maquinari i programari:</h2>
<p>$servidor_output</p>
<h2>Resultats de les comprovacions de la xarxa:</h2>
<p>$xarxa_output</p>
<h2>Resultats de les comprovacions de rendiment:</h2>
<p>$rendiment_output</p>
</body>
</html>
HTML
    # Mostra els resultats del documents HTML creat
    cat html_resultats.html
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
