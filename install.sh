#!bin/bash 
clear

# ---------------| Colores
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
WHITE='\033[0;37m'
NC='\033[0m'

CONFIG_FILE="autoOnion.conf"

# ---------------| Instalando el servicio de Tor
apt install tor -y > /dev/null 2>&1
echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing Tor service$WHITE..."
sleep 2
echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Tor service is installed"

# ---------------| Preguntar al usuario que servidor usar (Apache - Nginx)
echo -e "$PURPLE[$WHITE-$PURPLE]$GREEN Select the server to use (1) Apache / (2) Nginx"
read -p "> " option_server_selected

case $option_server_selected in
    1|01)
        # ---------------| Instalando e iniciando Apache
        sed -i 's/^server:.*/server: apache/' "$CONFIG_FILE"
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing Apache$WHITE..."
        apt install apache2 -y > /dev/null 2>&1
        systemctl reload apache2 > /dev/null 2>&1
        sleep 2
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Apache is installed"
        # ---------------| Habilitando servicio de Apache
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Enabling apache service$WHITE..."
        systemctl enable apache2 > /dev/null 2>&1
        sleep 2
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Apache is enabled"
        # ---------------| Configurando puerto 8080 en apache
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Setting port 8080 in apache service$WHITE..."
        sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf
        systemctl restart apache2 > /dev/null 2>&1 
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Apache is up!"
        ;;
    2|02)
        # ---------------| Instalando e iniciando Nginx
        sed -i 's/^server:.*/server: nginx/' "$CONFIG_FILE"
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing Nginx$WHITE..."
        apt install nginx -y > /dev/null 2>&1
        systemctl reload nginx > /dev/null 2>&1
        sleep 2
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Nginx is installed"
        # ---------------| Habilitando servicio de Nginx
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Enabling Nginx service$WHITE..."
        systemctl enable nginx > /dev/null 2>&1
        sleep 2
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Nginx is enabled"
        # ---------------| Configurando puerto 8080 en nginx
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Setting port 8080 in Nginx service$WHITE..."
        sed -i 's/listen 80 default_server;/listen 8080 default_server;/g' /etc/nginx/sites-available/default
        sed -i 's/listen \[::\]:80 default_server;/listen [::]:8080 default_server;/g' /etc/nginx/sites-available/default
        systemctl restart nginx
        echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Nginx is up!"
        ;;
esac

# ---------------| Habilitando servicio de tor
echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Enabling Tor service$WHITE..."
systemctl enable tor > /dev/null 2>&1
sleep 2
echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Tor is enabled"

# ---------------| Configurando e iniciando serivicio Tor
echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Configuring hidden service$WHITE..."
sed -i '/^HiddenServiceDir /d;/^HiddenServicePort /d' /etc/tor/torrc && \
echo -e "\nHiddenServiceDir /var/lib/tor/autoOnion/\nHiddenServicePort 80 127.0.0.1:8080" | sudo tee -a /etc/tor/torrc > /dev/null
echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Hidden service is configured"

# ---------------| Moviendo TestPage a /var/www/html
echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Uploading test page$WHITE..."
rm -rf /var/www/html/*
cp ./welcomePage/index.html /var/www/html/

sleep 2

echo -e ""
echo -e "$WHITE───────────────────────────────"
echo -e "$PURPLE[$WHITE!$PURPLE]$GREEN Installation and configuration complete.$NC"
echo -e "$GREENTo start the onion service using the CLI, run: $WHITE bash autoOnion.sh$NC"
echo -e "$GREENTo start the onion service using the GUI, run: $WHITE bash autoOnion_gui.sh$NC"
