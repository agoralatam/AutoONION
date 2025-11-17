#!bin/bash 
clear

# ---------------| Colores
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
WHITE='\033[0;37m'
NC='\033[0m'

CONFIG_FILE="autoOnion.conf"

echo -e "Servidor a utilizar"
echo -e "[01]- Apache"
echo -e "[02]- Nginx"
read -p "> " option_server_selected

case $option_server_selected in
    1)
        sed -i 's/^server:.*/server: Apache/' "$CONFIG_FILE"
        ;;
    01)
        sed -i 's/^server:.*/server: Apache/' "$CONFIG_FILE"
        ;;
    2)
        sed -i 's/^server:.*/server: Nginx/' "$CONFIG_FILE"
        ;;
    02)
        sed -i 's/^server:.*/server: Nginx/' "$CONFIG_FILE"
        ;;
esac


# # ---------------| Instalando Apache
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing Apache$WHITE..."
# apt install apache2 -y > /dev/null 2>&1
# systemctl reload apache2 > /dev/null 2>&1

# # ---------------| Instalando Tor
# apt install tor -y > /dev/null 2>&1

# # ---------------| Instalando MySQL Server
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing Mysql Server$WHITE..."
# apt install mysql-server -y > /dev/null 2>&1

# # ---------------| Instalando PHP8.3
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing PHP$WHITE..."
# apt install php8.3 -y > /dev/null 2>&1

# # ---------------| Instalando librerias necesarias para correr PHP en apache junto a MysqlServer
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing necessary libraries for PHP$WHITE..."
# apt install libapache2-mod-php8.3 php8.3-mysql php8.3-xml php8.3-gd php8.3-mbstring php8.3-bcmath php8.3-cli -y > /dev/null 2>&1

# # ---------------| Instalando paquetes necesario parala instalacion de Composer
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing curl, git, unzip$WHITE..."
# apt install curl git unzip -y > /dev/null 2>&1

# # ---------------| Descargando Composer
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Getting Composer$WHITE..."
# curl -sS https://getcomposer.org/installer -o composer-setup.php > /dev/null 2>&1

# # ---------------| Instalando Composer
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing Composer$WHITE..."
# php composer-setup.php --install-dir=/usr/local/bin --filename=composer > /dev/null 2>&1

# # ---------------| Instalando PhpMyAdmin
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Installing PhpMyAdmin$WHITE..."
# apt isntall phpmyadmin -y > /dev/null 2>&1

# # ---------------| Habilitando servicio de apache
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Enabling apache service$WHITE..."
# systemctl enable apache2 > /dev/null 2>&1

# # ---------------| Configurando puerto 8080 en apache
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Setting port 8080 in apache service$WHITE..."
# sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf 

# # ---------------| Habilitando servicio de tor
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Enabling tor service$WHITE..."
# systemctl enable tor > /dev/null 2>&1

# # ---------------| Configurando serivicio oculto
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Configuring hidden service$WHITE..."
# sed -i '/^HiddenServiceDir /d;/^HiddenServicePort /d' /etc/tor/torrc && \
# echo -e "\nHiddenServiceDir /var/lib/tor/autoOnion/\nHiddenServicePort 80 127.0.0.1:8080" | sudo tee -a /etc/tor/torrc > /dev/null
# rm -rf composer-setup.php

# # ---------------| Moviendo TestPage a /var/www/html
# echo -e "$PURPLE[$WHITE+$PURPLE]$GREEN Uploading test page$WHITE..."
# rm -rf /var/www/html/*
# cp ./welcomePage/index.html /var/www/html/

# echo -e ""
# echo -e "$WHITE───────────────────────────────"
# echo -e "$PURPLE[$WHITE!$PURPLE]$GREEN Installation and configuration complete, to start the onion service run$WHITE bash autoOnion.sh$NC"
