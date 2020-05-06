# dynamic-wallpaper

<p align="left">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-blueviolet?style=flat-square">
  <img src="https://img.shields.io/github/license/adi1090x/dynamic-wallpaper?style=flat-square">
  <img src="https://img.shields.io/github/stars/adi1090x/dynamic-wallpaper?color=red&style=flat-square">
  <img src="https://img.shields.io/github/forks/adi1090x/dynamic-wallpaper?style=flat-square">
  <img src="https://img.shields.io/github/issues/adi1090x/dynamic-wallpaper?style=flat-square">
</p>

<p align="left">
<a href="https://www.buymeacoffee.com/adi1090x"><img src="https://raw.githubusercontent.com/adi1090x/files/master/other/bmac.png" alt="Buy Me A Coffee"></a>
<a href="https://ko-fi.com/adi1090x"><img src="https://raw.githubusercontent.com/adi1090x/files/master/other/kofi.png" alt="Support me on ko-fi"></a>
</p>

Simple `bash` script to set a **Dynamic Wallpaper** according to certain conditions (currently `TIME`).

![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/firewatch.gif) <br />

### How to install
Follow the steps below (You can run `test.sh` to test it before installing it on your system) -

+ Install *feh*, *xrandr(for xfce only)*  
```bash
# On Archlinux
sudo pacman -Sy xorg-xrandr feh

# On Ubuntu or Debian
sudo apt-get install x11-xserver-utils feh
```

+ *For swaywm support users must install [oguri](https://github.com/vilhalmer/oguri). The `oguri` daemon must be started for the script to work. `Oguri` can be installed on Arch linux via [AUR](https://aur.archlinux.org/packages/oguri-git/).*

+ Clone this repository and...
```bash
cd $HOME
git clone https://github.com/adi1090x/dynamic-wallpaper.git
cd dynamic-wallpaper
chmod +x install.sh
./install.sh
```

+ Run the program and choose an option
```bash
$ dwall

Dynamic Wallpaper V1.0
Simple program to set a dynamic desktop background based on current time.
Developed By - Aditya Shakya (@adi1090x)

usage: ./test.sh [-s] style [-o] style [-h]

-s  style     name of theme/style.
-o  style     Run once and exit, useful for schedulers (cron).
-h  help      show this usage/help message.

Styles Dir: /home/aditya/adi1090x/dynamic-wallpaper/images

Available styles/themes:  bitday  exodus  firewatch  firewatch2  firewatch3  forest  home
maldives  mall  mojave  moon  room  seoul  street  street2  surface  tokyostreet  
```

### Features

+ Dynamic style selection.
+ User can add their own wallpapers.
+ 17[+](https://github.com/adi1090x/files/tree/master/dynamic-wallpaper/wallpapers) different types of wallpaper set (HD, UHD).
+ (Currently) Change according to time, throughout the day.
+ Tested on - **WM:** *Openbox*, *i3wm*, *bspwm*, *awesomewm*, *Fluxbox*, *Fvwm*, *Swaywm* & **DE:** *KDE(neon)*, *Pantheon*, *Gnome(ubuntu, pop_os)*, *Deepin*, *Cinnamon*, *XFCE*, *LXDE*, *MATE*.

### How to add own wallpapers

+ Download a wallpaper set you like.
+ Make a dir in `/usr/share/dynamic-wallpaper/images`
+ Rename your images(must be **jpg/png**) to `0-23`. If you don't have enough images, symlink them.
+ Run the program and apply it.

**More Wallpapers :** To not make repo big in size, I've put large wallpapers set to another place & also not everyone wants all the wallpapers. You can download these wallpapers set from here - 
<p align="center">
  <a href="https://github.com/adi1090x/files/tree/master/dynamic-wallpaper/wallpapers"><img alt="undefined" src="https://img.shields.io/badge/Download-Here-blue?style=for-the-badge&logo=github"></a>
</p>

***Sets*** : catalina, london, mojaveHD, mountfuji, surface

### Previews

|Bit Day|Exodus|Firewatch|Firewatch Alt|
|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/bitday.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/exodus.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/firewatch.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/firewatch3.gif)|

|Forest|Home|Maldives|Mall|
|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/forest.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/home.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/maldives.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/mall.gif)|

|Mojave|Moon|Room|Seoul|
|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/mojave.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/moon.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/room.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/seoul.gif)|

|Street|Street Alt|Surface|Tokyo Streets|
|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/street.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/street2.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/surface.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/tokyostreet.gif)|

### Common Issues

1. **Wallpaper not changing** : If your wallpaper is not changing, then open an issue and show me the output of `echo $DESKTOP_SESSION`.

2. **Not working on XFCE** : If this script is not working on xfce, then open the terminal and run `xfconf-query -c xfce4-desktop -m` and change the wallpaper (any) via *xfce4-settings-manager*. <br />
In terminal, *xfconf-query* will print lines starting with `set:`, which show which properties have been changed, check `screen` & `monitor` values and modify the script accordingly.
```bash
53   ## For XFCE
54   if [[ "$OSTYPE" == "linux"* ]]; then
55   	 SCREEN="0"
56       MONITOR="1"
57   fi

```

3. **Autostart** : If you want to autostart the script with desktop, you can add it to your WM autostart file & if doesn't work for you, you can create a `desktop file` in `$HOME/.config/autostart` dir.
```bash
$ cd $HOME/.config/autostart && touch dwall.desktop

# Add this to dwall.desktop file

[Desktop Entry]
Name=Dynamic Wallpaper
Comment=Simple script, shows a Dynamic Wallpaper based on TIME.
Exec=/usr/bin/dwall -s firewatch &
Type=Application
Icon=wallpaper
Categories=Accessories;
```

4. **Cronjob** : If you want to run it with cron, you may need to define these environment variables, 

+ SHELL
+ DISPLAY
+ DESKTOP_SESSION
+ XDG_RUNTIME_DIR
+ XDG_DATA_DIRS
+ DBUS_SESSION_BUS_ADDRESS

> You can find what values your environment has by typing `env` in your terminal or check each variable via `echo $VARIABLE_NAME`.

### Support This Project
<p align="left">
<a href="https://www.paypal.me/adi1090x" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/paypal-adi1090x-blue?style=for-the-badge&logo=paypal"></a>
<a href="https://www.buymeacoffee.com/adi1090x" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/BuyMeAcoffee-adi1090x-orange?style=for-the-badge&logo=buy-me-a-coffee"></a>  
<a href="https://ko-fi.com/adi1090x" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/KoFi-adi1090x-red?style=for-the-badge&logo=ko-fi"></a>  
</p>

### FYI

+ In KDE, it changes the wallpaper in all the Activities.
+ If you can improve it, you're welcome.
+ You can add ***dwall -s style &*** to your wm autostart file to set it as wallpaper after login.
+ Have Fun!
