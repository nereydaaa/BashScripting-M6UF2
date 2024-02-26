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
    comprovacions_ports="$ports_output $apache_status"
}

# Funció per comprovar l'estat dels serveis actius
comprova_serveis() {
    echo "Comprovant serveis actius..."
    # Aquí es pot utilitzar la comanda systemctl o la que correspongui per comprovar l'estat dels serveis
}

# Funció per comprovar el funcionament intern del servidor
comprova_funcionament() {
    echo "Comprovant el funcionament intern del servidor..."
    # Aquí es poden afegir altres comprovacions com ara l'estat del disc dur, la memòria, etc.
}

# Funció per instal·lar dependències necessàries en el servidor
instal·la_dependències() {
    echo "Instal·lant dependències necessàries..."
    # Aquí es poden afegir les ordres per instal·lar les dependències com l'eina NMAP
}

# Funció principal que executa totes les comprovacions
executa_comprovacions() {
    comprova_ports
    comprova_serveis
    comprova_funcionament
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

