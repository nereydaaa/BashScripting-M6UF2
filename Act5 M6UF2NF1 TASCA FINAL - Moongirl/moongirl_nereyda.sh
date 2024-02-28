#!/bin/bash


# Funció per instal·lar les eines necessàries sense comprovar si ja estan instal·lades
function instalar_eines() {
    echo "Començant la instal·lació de les eines necessàries..."

    # Instal·lar les eines necessàries sense comprovar si ja estan instal·lades
    sudo -S apt-get update
    sudo -S apt-get install -y nmap speedtest-cli linux-tools-common sysstat iftop smartmontools

    echo "Instal·lació d'eines completada."
}



# Funció per comprovar l'estat dels ports oberts
function comprova_ports() {
    echo "Comprovacions de ports oberts en curs..."

    # Utilitzem Nmap per comprovar els ports oberts
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
    sudo -S smartctl -a /dev/sda
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


# Funció per executar les comprovacions al servidor remot
function executar_comprovacions_remotes() {
    echo "Connectant al servidor remot..."

    # Sol·licitar a l'usuari els noms d'usuari i del servidor
    read -p "Introdueix el nom d'usuari: " user
    read -p "Introdueix el nom del servidor: " server

    # Comprovar si la clau SSH existeix
    if [ ! -f ~/.ssh/id_rsa ]; then
        echo "Creant una nova clau SSH..."
        ssh-keygen -t rsa -b 4096 -C "namoresr@ies-sabadell.cat"
        echo "Clau SSH creada correctament."
    fi

    # Assignar la comanda ssh a una variable
    ssh_command="ssh -i ~/.ssh/id_rsa $user@$server"

    # Comprovar i instal·lar les eines necessàries al servidor remot
    eines=$(ssh $user@$server "$(typeset -f); instalar_eines")

    # Utilitzar SSH per connectar-nos i executar les comprovacions
    servidor_output=$(ssh $user@$server "$(typeset -f); comprovacions_servidor")
    ports_output=$(ssh $user@$server "$(typeset -f); comprova_ports")
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
<p>$eines</p>
<h2>Resultats dels ports oberts:</h2>
<p>$ports_output</p>
<h2>Resultats de les comprovacions de maquinari i programari:</h2>
<p>$servidor_output</p>
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
