#!bin/bash
clear

# ---------------| Colores
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
WHITE='\033[0;37m'
NC='\033[0m'

echo -e "${PURPLE}W${GREEN}A${WHITE}I${PURPLE}T ${GREEN}A ${WHITE}S${PURPLE}E${GREEN}C${WHITE}O${PURPLE}N${GREEN}D${WHITE}!"
sleep 3
clear

echo -e "$PURPLE                  _________--$GREEN---_____"
echo -e "$PURPLE        _____------           $GREEN__      $GREEN----_"
echo -e "$PURPLE ___----             ___------$GREEN              \\"
echo -e "$PURPLE    ----________        ----$GREEN                 \\"
echo -e "$PURPLE                -----__    $GREEN|             _____)"
echo -e "$PURPLE                     __-                $GREEN/     \\"
echo -e "$PURPLE         _______-----    ___-$GREEN-          \\    /)\\"
echo -e "$PURPLE  ------_______      ---____            $GREEN\\__/  /"
echo -e "$PURPLE                -----__    $GREEN\\ --    _          /\\"
echo -e "$PURPLE                       --__-$GREEN-__     \\_____/   \\_/\\"
echo -e "$PURPLE                               $GREEN----|   /          |"
echo -e "$PURPLE       AutoOnion v01$WHITE -$PURPLE 2025       $GREEN|  |___________|"
echo -e "$PURPLE          Coded by n4ss4u         $GREEN|  | $WHITE((_(_)| )_)"
echo -e "$PURPLE            from AGORA            $GREEN|  \\_$WHITE((_(_)|/(_)"
echo -e "$PURPLE              with $WHITE♡              $GREEN\\             ("
echo -e "$PURPLE        TG: t.me/agoralatamc       $GREEN\\_____________)"
echo ""
echo ""

echo -e "$WHITE──────────────────────────────────────────────────────────────────────────────────────────┤"

systemctl restart apache2
systemctl restart tor

onion_url=$(head -n 1 /var/lib/tor/autoOnion/hostname)

# --------| Verificar que apache service esta corriendo
if systemctl is-active --quiet apache2; then
    echo -e "$PURPLE [$WHITE•$PURPLE] The Apache service is running$WHITE!"
    
else
    echo -e "$PURPLE [$WHITE•$PURPLE] The Apache service is not running$WHITE!"
fi

# --------| Verificar que tor service esta corriendo
if systemctl is-active --quiet tor; then
    echo -e "$PURPLE [$WHITE•$PURPLE] The Tor service is running$WHITE!"

else
    echo -e "$PURPLE [$WHITE•$PURPLE] The Tor service is not running$WHITE!"
fi

echo ""

echo -e "$PURPLE [$WHITE+$PURPLE] LOCAL ACCESS$WHITE: $GREEN http://localhost:8080"
echo -e "$PURPLE [$WHITE+$PURPLE] ONION ACCESS$WHITE: $GREEN http://$onion_url"

echo ""

echo -e "${WHITE}Closing this script will not stop the process from running\n(press ${PURPLE}ENTER${WHITE} to close). To stop the server from running,\nrun the next command as root:${PURPLE} systemctl stop apache2 && systemctl stop tor${NC}"

echo -e "$WHITE──────────────────────────────────────────────────────────────────────────────────────────┤"

read 

clear