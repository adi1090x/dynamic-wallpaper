---
title: dynamic-wallpaper
created: '2020-04-24T12:19:48.306Z'
modified: '2020-04-24T12:36:29.142Z'
---

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

+ Install *hsetroot*, *xrandr(for xfce only)*  
```
# On Archlinux
sudo pacman -Sy xorg-xrandr hsetroot

# On Ubuntu or Debian
sudo apt-get install x11-xserver-utils hsetroot
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

Dynamic Wallpaper V1.0
Developed By - Aditya Shakya (@adi1090x)

Available options:
-bitday		-firewatch
```

### Features

+ (Currently) 2 different types of wallpaper set.
+ (Currently) Change according to time, throughout the day.
+ Tested on - **WM:** *Openbox*, *i3wm*, *Fluxbox*, *Fvwm*, *Swaywm* & **DE:** *Pantheon*, *Gnome(ubuntu)*, *Deepin*, *Cinnamon*, *XFCE*, *LXDE*, *MATE*.

### Previews

|Bit day|Firewatch|
|--|--|
|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/bitday.gif)|![img](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/firewatch.gif)|

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
