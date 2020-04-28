#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

case "$OSTYPE" in
	linux*) DIR="$(pwd)" ;;
	*) DIR="$(pwd)" ;;
esac

case "$OSTYPE" in
	linux*) TIME="$(date +%k)" ;;
	*) TIME="$(date +%k)" ;;
esac

## For XFCE
if [ "$OSTYPE" == "linux"* ]; then
    SCREEN="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $1}' | tr -d \:)"
    MONITOR="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $2}' | tr -d \*+)"
fi

case "$OSTYPE" in
	linux*) if [ -n "$SWAYSOCK" ]; then SETTER="eval ogurictl output '*' --image";
	elif [[ "$DESKTOP_SESSION" =~ ^(MATE|Mate|mate)$ ]]; then SETTER="gsettings set org.mate.background picture-filename";
	elif [[ "$DESKTOP_SESSION" =~ ^(Xfce Session|xfce session|XFCE|xfce|Xubuntu|xubuntu)$ ]]; then SETTER="xfconf-query --channel xfce4-desktop --property /backdrop/screen$SCREEN/monitor$MONITOR/workspace0/last-image --set";
	elif [[ "$DESKTOP_SESSION" =~ ^(LXDE|Lxde|lxde)$ ]]; then SETTER="pcmanfm --set-wallpaper";
	elif [[ "$DESKTOP_SESSION" =~ ^(PANTHEON|Pantheon|pantheon|GNOME|Gnome|gnome|UBUNTU|Ubuntu|ubuntu|DEEPIN|Deepin|deepin)$ ]]; then SETTER="gsettings set org.gnome.desktop.background picture-uri";
	else SETTER="feh --bg-scale"; fi ;;
	*) if [ -n "$SWAYSOCK" ]; then SETTER="eval ogurictl output '*' --image";
	elif [[ "$DESKTOP_SESSION" =~ ^(MATE|Mate|mate)$ ]]; then SETTER="gsettings set org.mate.background picture-filename";
	elif [[ "$DESKTOP_SESSION" =~ ^(Xfce Session|xfce session|XFCE|xfce|Xubuntu|xubuntu)$ ]]; then SETTER="xfconf-query --channel xfce4-desktop --property /backdrop/screen$SCREEN/monitor$MONITOR/workspace0/last-image --set";
	elif [[ "$DESKTOP_SESSION" =~ ^(LXDE|Lxde|lxde)$ ]]; then SETTER="pcmanfm --set-wallpaper";
	elif [[ "$DESKTOP_SESSION" =~ ^(PANTHEON|Pantheon|pantheon|GNOME|Gnome|gnome|UBUNTU|Ubuntu|ubuntu|DEEPIN|Deepin|deepin)$ ]]; then SETTER="gsettings set org.gnome.desktop.background picture-uri";
	else SETTER="feh --bg-scale"; fi ;;
esac

STYLE=

set_wallpaper() {
  image="$DIR/images/$STYLE/$1"
  if [ $FORMAT ]; then
    $SETTER "$image.$FORMAT"
    return;
  fi
  errormessage=$($SETTER "$image.png" 2>&1)
  if [ ! -z "$errormessage" ]; then
    errormessage=$($SETTER "$image.jpg" 2>&1)
    if [ ! -z "$errormessage" ]; then
      echo "Image $TIME.jpg/.png Not Available, Exiting..."; exit 1;
    fi
    FORMAT="jpg"
  else
    FORMAT="png"
  fi
}

main() {
  num=$(echo "scale=2; $TIME/24*$NUMBER" | bc | awk '{print int($1+0.5)}')
  set_wallpaper $num && sleep 60
  echo "Running..."
}

usage() {
available_styles=($(ls $DIR/images))
echo -n "
Dynamic Wallpaper V1.0 - (C) Aditya Shakya - @adi1090x
Simple script to show a dynamic wallpaper based on time.

-s=, --style=	Theme/Style name
-h, --help	Print this help screen

Example: dwall -s=firewatch

Styles folder: $DIR/images/

"
printf "Available Styles: "
printf -- '%s  ' "${available_styles[@]}"
printf -- '\n\n'
}

init() {
    while true; do
        main && exec $DIR/test.sh -s=$STYLE
    done
}

for i in "$@"
do
case $i in
    -s=*|--style=*)
    STYLE="${i#*=}"
    ;;
    -h|--help)
    usage
    ;;
    *)
    echo -n "Unknown option: $i"
    usage
    ;;
esac
done

if [ -z "$NUMBER" ]; then
    NUMBER=$(ls $DIR/images/$STYLE -1 | wc -l)
fi

if [ "$STYLE" ]; then
    init
else
    usage
fi
