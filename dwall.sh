#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x), GitGangGuy
## Mail    : adi1090x@gmail.com, -
## Github  : @adi1090x, @GitGangGuy
## Twitter : @adi1090x, -

## Dynamic Wallpaper : Set wallpapers according to current time.
## Created to work better with job schedulers (cron)

## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

## Wallpaper directory
DIR="/usr/share/dynamic-wallpaper/images"
HOUR=`date +%k`

## Wordsplit in ZSH
set -o shwordsplit 2>/dev/null

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Script Termination
exit_on_signal_SIGINT() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Prerequisite
Prerequisite() { 
    dependencies=(feh xrandr crontab xargs)
    for dependency in "${dependencies[@]}"; do
        type -p "$dependency" &>/dev/null || {
            echo -e ${RED}"[!] ERROR: Could not find ${GREEN}'${dependency}'${RED}, is it installed?" >&2
            { reset_color; exit 1; }
        }
    done
}

## Usage
usage() {
	clear
    cat <<- EOF
		${RED}╺┳┓╻ ╻┏┓╻┏━┓┏┳┓╻┏━╸   ${GREEN}╻ ╻┏━┓╻  ╻  ┏━┓┏━┓┏━┓┏━╸┏━┓
		${RED} ┃┃┗┳┛┃┗┫┣━┫┃┃┃┃┃     ${GREEN}┃╻┃┣━┫┃  ┃  ┣━┛┣━┫┣━┛┣╸ ┣┳┛
		${RED}╺┻┛ ╹ ╹ ╹╹ ╹╹ ╹╹┗━╸   ${GREEN}┗┻┛╹ ╹┗━╸┗━╸╹  ╹ ╹╹  ┗━╸╹┗╸
		${CYAN}[ I M P R O V E D ]${WHITE}
		
		A bash script to adapt your wallpaper to the time
		By Aditya Shakya (@adi1090x) and GitGangGuy
		
		Usage                            `basename $0` [ -h ] [ -p [ -b backend ] [ -a | -l ] ] [ -s style ] [ -o output ]

		Options:
		  -h                             Show this help message
		  -p                             Use pywal to set wallpaper
		    -b                           Pass a backend to pywal (optional)
		    -l                           Force light color scheme
		    -a                           Automatically set light/dark color scheme based on GNOME theme or daytime
		  -s                             Name of the style to apply
      -o                             Output wallpaper to file instead of setting it
	EOF

	styles=(`ls $DIR`)
	printf ${GREEN}"Available styles:  "
	printf -- ${ORANGE}'%s  ' "${styles[@]}"
	printf -- '\n\n'${WHITE}

    cat <<- EOF
		Examples:
		`basename $0` -s beach                   Set 'beach' style wallpaper
		`basename $0` -s beach -o ~/.wallpaper   Save 'beach' style wallpaper into file '~/.wallpaper'
		`basename $0` -p -s sahara               Set 'beach' style wallpaper, and refresh the pywal theme
		`basename $0` -p -b colorz -s sahara     " with 'colorz' backend
		`basename $0` -p -b colorz -s sahara -a    " with automatic light/dark mode
		`basename $0` -p -b colorz -s sahara -l    " with forced light mode
	EOF
}

## Set wallpaper in kde
set_kde() {
	qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
		var allDesktops = desktops();
		print (allDesktops);
		for (i=0;i<allDesktops.length;i++) {
			d = allDesktops[i];
			d.wallpaperPlugin = 'org.kde.image';
			d.currentConfigGroup = Array('Wallpaper',
										'org.kde.image',
										'General');
			d.writeConfig('Image', 'file://"$1"')
		}"
}

## Set wallpaper in cinnamon
set_cinnamon() {
	 gsettings set org.cinnamon.desktop.background picture-uri "file:///$1"
}

## Set wallpaper in GNOME
set_gnome() {
	gsettings set org.gnome.desktop.background picture-uri "file:///$1"
	gsettings set org.gnome.desktop.screensaver picture-uri "file:///$1"
}
## For XFCE only
if [[ "$OSTYPE" == "linux"* ]]; then
	SCREEN="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $1}' | tr -d \:)"
	MONITOR="$(xrandr --listactivemonitors | awk -F ' ' 'END {print $2}' | tr -d \*+)"
fi

## Choose wallpaper setter
case "$OSTYPE" in
	linux*)
			if [ -n "$SWAYSOCK" ]; then
				SETTER="eval ogurictl output '*' --image"
			elif [[ "$DESKTOP_SESSION" =~ ^(MATE|Mate|mate)$ ]]; then
				SETTER="gsettings set org.mate.background picture-filename"
			elif [[ "$DESKTOP_SESSION" =~ ^(Xfce Session|xfce session|XFCE|xfce|Xubuntu|xubuntu)$ ]]; then
				SETTER="xfconf-query --channel xfce4-desktop --property /backdrop/screen$SCREEN/monitor$MONITOR/workspace0/last-image --set"
			elif [[ "$DESKTOP_SESSION" =~ ^(LXDE|Lxde|lxde)$ ]]; then
				SETTER="pcmanfm --set-wallpaper"
			elif [[ "$DESKTOP_SESSION" =~ ^(cinnamon|Cinnamon)$ ]]; then
				SETTER=set_cinnamon
			elif [[ "$DESKTOP_SESSION" =~ ^(/usr/share/xsessions/plasma|NEON|Neon|neon|PLASMA|Plasma|plasma|KDE|Kde|kde)$ ]]; then
				SETTER=set_kde
			elif [[ "$DESKTOP_SESSION" =~ ^(PANTHEON|Pantheon|pantheon|GNOME|Gnome|gnome|Gnome-xorg|gnome-xorg|UBUNTU|Ubuntu|ubuntu|DEEPIN|Deepin|deepin|POP|Pop|pop)$ ]]; then
				SETTER=set_gnome
			else 
				SETTER="feh --bg-fill"
			fi
			;;
esac

## Get Image
get_img() {
	image="$DIR/$STYLE/$1"

	# get image format
	if [[ -f "${image}.png" ]]; then
		FORMAT="png"
	elif [[ -f "${image}.jpg" ]]; then
		FORMAT="jpg"
	else
		echo -e ${RED}"[!] Invalid image file, Exiting..."
		{ reset_color; exit 1; }
	fi
}

## Check valid pywal backend
pywal_backend() {
	backends=$(wal --backend | tail -n +2 | cut -d ' ' -f 3 | xargs)
	[[ "$backends" =~ (^| )"$1"($| ) ]] && return 0 || return 1
}

## Determine light/dark scheme based on GNOME night light or daytime
pywal_light() {
	[[ $WALSCHEME == 'light' ]] && return 0
	if [[ $WALSCHEME == 'auto' ]]; then
		[[ $DESKTOP_SESSION =~ ^(GNOME|Gnome|gnome|Gnome-xorg|gnome-xorg)$ && $(gsettings get org.gnome.desktop.interface gtk-theme) != *"dark"* ]] && return 0
		(( $HOUR > 6 && $HOUR < 18 )) && return 0
	fi
	return 1
}

## Set wallpaper with pywal
pywal_set() {
	get_img "$1"
	if ! pywal_backend "$2"; then
		echo -e ${RED}"[!] $2 is not a valid pywal backend. Check valid backends with `wal --backend`. Exiting..."
		{ reset_color; exit 1; }
	fi
	if [[ -x `command -v wal` ]]; then
		local walcmd=(wal --backend "$2" -i "$image.$FORMAT" -n)
		if pywal_light; then
			walcmd+=(-l)
		fi
		"${walcmd[@]}"
		set_wallpaper "$1"
	else
		echo -e ${RED}"[!] pywal is not installed on your system, exiting..."
		{ reset_color; exit 1; }
	fi
}

## Put wallpaper in $OUTPUT
file_set() {
	get_img "$1"
	if [[ -n $(echo "$OUTPUT" | grep -o "^[/~]") ]]
	then
		DIR=$(dirname $OUTPUT)
		if [[ -d $DIR ]]
		then
			cp "$image.$FORMAT" "$OUTPUT"
		else
			echo "[!] Directory $DIR does not exist, exiting..."
		fi
	else
		echo "[!] Output must be an absolute path, $OUTPUT isn't, exiting..."
	fi
}

## Wallpaper Setter
set_wallpaper() {
	cfile="$HOME/.cache/dwall_current"
	get_img "$1"

	# set wallpaper with setter
	if [[ -n "$FORMAT" ]]; then
		$SETTER "$image.$FORMAT"
	fi

	# make/update dwall cache file
	if [[ ! -f "$cfile" ]]; then
		touch "$cfile"
		echo "$image.$FORMAT" > "$cfile"
	else
		echo "$image.$FORMAT" > "$cfile"	
	fi
}

## Check valid style
check_style() {
	styles=(`ls $DIR`)
	for i in "${styles[@]}"; do
		if [[ "$i" == "$1" ]]; then
			echo -e ${BLUE}"[*] Using style : ${MAGENTA}$1"
			VALID='YES'
			{ reset_color; break; }
		else
			continue
		fi
	done

	if [[ -z "$VALID" ]]; then
		echo -e ${RED}"[!] Invalid style name : ${GREEN}$1${RED}, exiting..."
		{ reset_color; exit 1; }
	fi
}

## Main
main() {
	# get current hour
	num=$(($HOUR/1))
	# set wallpaper accordingly
	if [[ -n "$PYWAL" ]]; then
		_walbackend=${WALBACKEND:-wal}
		{ pywal_set "$num" "$_walbackend"; reset_color; exit 0; }
	elif [[ -n "$OUTPUT" ]]; then
		{ file_set "$num"; reset_color; exit 0; }
	else
		{ set_wallpaper "$num"; reset_color; exit 0; }
	fi
}

WALSCHEME='dark'
## Get Options
while getopts ":hplas:b:o:" opt; do
	case ${opt} in
		p)
			PYWAL=true
			;;
		o)
			OUTPUT=$OPTARG
      ;;
		b)
			WALBACKEND=$OPTARG
			;;
		s)
			STYLE=$OPTARG
			;;
		l)
			WALSCHEME='light'
			;;
		a)
			WALSCHEME='auto'
			;;
		h)
			{ usage; reset_color; exit 0; }
			;;
		\?)
			echo -e ${RED}"[!] Unknown option, run ${GREEN}`basename $0` -h"
			{ reset_color; exit 1; }
			;;
		:)
			echo -e ${RED}"[!] Invalid:$G -$OPTARG$R requires an argument."
			{ reset_color; exit 1; }
			;;
	esac
done

## Run
Prerequisite
if [[ "$STYLE" ]]; then
	check_style "$STYLE"
    main
else
	{ usage; reset_color; exit 1; }
fi
