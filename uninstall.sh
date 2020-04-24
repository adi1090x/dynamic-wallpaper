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
echo -e $Y" [*] Uninstalling... "$C
echo
# delete old dir if it exists
if [[ -d $DES/dynamic-wallpaper ]]; then
    $SUDO rm -rf $DES/dynamic-wallpaper    
fi
# delete executable if it exists
if [[ -L $BIN/dwall ]]; then
    $SUDO rm $BIN/dwall    
fi
echo
echo -e $Y" [*] Uninstalled."$C
echo
