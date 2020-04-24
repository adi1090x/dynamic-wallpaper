#!/bin/bash

## Author : Aditya Shakya (adi1090x)

# Colors
R='\033[1;31m'
B='\033[1;34m'
C='\033[0;36m'
G='\033[1;32m'
W='\033[1;37m'
Y='\033[1;33m'

# Path
DIR="$(pwd)"
case "$OSTYPE" in
       linux*) DES="/usr/share" ;; 
       *) DES="/usr/share" ;;
esac

case "$OSTYPE" in
       linux*) BIN="/usr/bin" ;; 
       *) BIN="/usr/bin" ;;
esac

case "$OSTYPE" in
       linux*) SUDO="sudo" ;; 
       *) SUDO="sudo" ;;
esac

echo
echo -e $Y" [*] Installing... "$C
echo
# delete old dir if already exist
if [[ -d $DES/dynamic-wallpaper ]]; then
    $SUDO rm -rf $DES/dynamic-wallpaper    
fi
$SUDO mkdir -p $DES/dynamic-wallpaper && $SUDO cp -r $DIR/images $DES/dynamic-wallpaper && $SUDO cp -r $DIR/dwall.sh $DES/dynamic-wallpaper
$SUDO chmod +x $DES/dynamic-wallpaper/dwall.sh
# delete executable if already exist
if [[ -f $BIN/dwall ]]; then
    $SUDO rm $BIN/dwall    
fi
$SUDO ln -s $DES/dynamic-wallpaper/dwall.sh $BIN/dwall
echo
echo -e $Y" [*] Installed. Execute 'dwall' to Run."$C
echo
