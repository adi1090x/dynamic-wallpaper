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
```
# On Archlinux
sudo pacman -Sy xorg-xrandr feh

# On Ubuntu or Debian
sudo apt-get install x11-xserver-utils feh
```

+ *For swaywm support users must install [oguri](https://github.com/vilhalmer/oguri). The `oguri` daemon must be started for the script to work. `Oguri` can be installed on Arch linux via [AUR](https://aur.archlinux.org/packages/oguri-git/).*

+ Clone this repository and...
```
cd $HOME
git clone https://github.com/adi1090x/dynamic-wallpaper.git
cd dynamic-wallpaper
chmod +x install.sh
./install.sh
```

+ Run the program and choose an option
```
$ dwall

Dynamic Wallpaper V1.0 - (C) Aditya Shakya - @adi1090x
Simple script to show a dynamic wallpaper based on time.

-s=, --style=	Theme/Style name
-h, --help	Print this help screen

Example: dwall -s=firewatch

Styles folder: /usr/share/dynamic-wallpaper/images/

Available Styles: animecity  bitday  exodus  firewatch  firewatch2  forest  maldives  mojave  moon  seoul  
```

### Features

+ Dynamic style selection.
+ User can add their own wallpapers.
+ 10 different types of wallpaper set (HD, UHD).
+ (Currently) Change according to time, throughout the day.
+ Tested on - **WM:** *Openbox*, *i3wm*, *bspwm*, *Fluxbox*, *Fvwm*, *Swaywm* & **DE:** *Pantheon*, *Gnome(ubuntu, pop)*, *Deepin*, *Cinnamon*, *XFCE*, *LXDE*, *MATE*.

### How to add own wallpapers

+ Download a wallpaper set you like.
+ Make a dir in `/usr/share/dynamic-wallpaper/images`
+ Rename your images(must be **jpg/png**) to `0-24`. If you don't have enough images, symlink them.
+ Run the program and apply it.

### Previews

|Bit day|Firewatch|Anime City|Exodus|Forest|
|--|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/bitday.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/firewatch.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/animecity.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/exodus.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/forest.gif)|

|Mojave|Maldives|Seoul|Moon|Firewatch Alt|
|--|--|--|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/mojave.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/maldives.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/seoul.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/moon.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/firewatch3.gif)|

### Support This Project
<p align="left">
<a href="https://www.paypal.me/adi1090x" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/paypal-adi1090x-blue?style=for-the-badge&logo=paypal"></a>
<a href="https://www.buymeacoffee.com/adi1090x" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/BuyMeAcoffee-adi1090x-orange?style=for-the-badge&logo=buy-me-a-coffee"></a>  
<a href="https://ko-fi.com/adi1090x" target="_blank"><img alt="undefined" src="https://img.shields.io/badge/KoFi-adi1090x-red?style=for-the-badge&logo=ko-fi"></a>  
</p>

### FYI

+ Currently, KDE is not supported.
+ If you can improve it, you're welcome.
+ You can add ***dwall -option &*** to your wm autostart file to set it as wallpaper after login.
+ Have Fun!
