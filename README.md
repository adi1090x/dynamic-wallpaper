<!-- Dynamic Wallpaper -->

<p align="center">
  <img src="https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/logo.png">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/github/license/adi1090x/dynamic-wallpaper?style=for-the-badge">
  <img src="https://img.shields.io/github/stars/adi1090x/dynamic-wallpaper?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/adi1090x/dynamic-wallpaper?color=violet&style=for-the-badge">
  <img src="https://img.shields.io/github/forks/adi1090x/dynamic-wallpaper?color=teal&style=for-the-badge">
</p>

<p align="center">
  <a href="https://www.buymeacoffee.com/adi1090x" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/1.png"></a>
  <a href="https://ko-fi.com/adi1090x" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/2.png"></a>
  <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=U3VK2SSVQWAPN" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/3.png"></a>
  <a href="https://www.patreon.com/adi1090x" target="_blank"><img alt="undefined" width="48px" src="https://raw.githubusercontent.com/adi1090x/files/master/other/4.png"></a>
</p>

<p align="center">A simple <code>bash</code> script to set wallpapers according to current time, using <b>cron job scheduler</b>.</p>

![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/main.gif) <br />

### Overview

+ 25+[(more)](https://github.com/adi1090x/files/tree/master/dynamic-wallpaper/wallpapers) different types of wallpaper set (HD/UHD/4K/5K).
+ Added `pywal` support.
+ Users can add their own wallpapers.
+ With `Cron`, Wallpaper changes according to time, throughout the day.
+ Tested on :
  - **`Window Managers`** : `Openbox`, `i3wm`, `bspwm`, `awesomewm`, `Fluxbox`, `Fvwm`, `Swaywm`
  - **`Desktop Environments`** : `KDE`, `Pantheon`, `Gnome`, `Deepin`, `Cinnamon`, `XFCE`, `LXDE`, `MATE`

### Dependencies

Install Following programs on your system before using `dwall` -

- **`feh`** : To set wallpapers on WMs
- **`cron`** : To set a job for dwall
- **`xrandr`** : Only if you're using XFCE desktop
- **`pywal`** : for pywal support (optional)

Install `feh`, `cron` and `xrandr` -
```bash
# On Archlinux
$ sudo pacman -Sy xorg-xrandr feh cronie

# On Ubuntu or Debian
$ sudo apt-get install x11-xserver-utils feh cron
```

> For swaywm support users must install [oguri](https://github.com/vilhalmer/oguri). The `oguri` daemon must be started for the script to work. `Oguri` can be installed on Arch linux via [AUR](https://aur.archlinux.org/packages/oguri-git/).

### Installation

Follow the step below to install `dwall` on your system -
> You can run `test.sh` to test it before installing it on your system.

+ Clone this repository -
```
$ git clone https://github.com/adi1090x/dynamic-wallpaper.git
```

+ Change to cloned directory and run `install.sh` -
```
$ cd dynamic-wallpaper
$ chmod +x install.sh
$ ./install.sh
```

### Run the program

+ Open the terminal and execute `dwall` -
```
$ dwall

╺┳┓╻ ╻┏┓╻┏━┓┏┳┓╻┏━╸   ╻ ╻┏━┓╻  ╻  ┏━┓┏━┓┏━┓┏━╸┏━┓
 ┃┃┗┳┛┃┗┫┣━┫┃┃┃┃┃     ┃╻┃┣━┫┃  ┃  ┣━┛┣━┫┣━┛┣╸ ┣┳┛
╺┻┛ ╹ ╹ ╹╹ ╹╹ ╹╹┗━╸   ┗┻┛╹ ╹┗━╸┗━╸╹  ╹ ╹╹  ┗━╸╹┗╸

Dwall V2.0   : Set wallpapers according to current time.
Developed By : Aditya Shakya (@adi1090x)

Usage : test.sh [-h] [-p] [-s style]

Options:
   -h	  Show this help message
   -p	  Use pywal to set wallpaper
   -s	  Name of the style to apply
   
Available styles:  aurora  beach  bitday  chihuahuan  cliffs  colony  desert  earth  exodus
factory  firewatch  forest  gradient  home  island  lake  lakeside  market  mojave  moon
mountains  room  sahara  street  tokyo  

Examples: 
test.sh -s beach       Set wallpaper from 'beach' style
test.sh -p -s sahara   Set wallpaper from 'sahara' style using pywal
```

+ Select the style you like and run -
```
$ dwall -s firewatch
[*] Using style : firewatch
```

### Setup cron job

This program is specifically created to use with a time-based job scheduler such as **cron** or **systemd/Timers**. So, After installing this program you need to set up a cron job using `crontab` on your system. Follow the step below to set a job for this program - 
> I'm using `cronie` on Arch Linux here.

- After installing `cron`, enable and start the cron service -
```bash
# On Arch Linux
$ sudo systemctl enable cronie.service --now
```

- Make sure the service is enabled and running -
```
$ systemctl status cronie.service
● cronie.service - Periodic Command Scheduler
     Loaded: loaded (/usr/lib/systemd/system/cronie.service; enabled; vendor preset: disabled)
     Active: active (running) since Sat 2020-12-26 14:39:31 IST; 5h 22min ago
   Main PID: 779 (crond)
```

- Cron does not run under the Xorg server therefore it cannot know the environmental variable necessary to be able to start an Xorg server application so they will have to be defined. Find out the values of following environment variables - `SHELL, DISPLAY, DESKTOP_SESSION, DBUS_SESSION_BUS_ADDRESS, XDG_RUNTIME_DIR`
```
$ echo "$SHELL | $DISPLAY | $DESKTOP_SESSION | $DBUS_SESSION_BUS_ADDRESS | $XDG_RUNTIME_DIR"

/usr/bin/zsh | :0 | Openbox | unix:path=/run/user/1000/bus | /run/user/1000
```

- Now, Create an hourly cron job for **dwall** using `crontab` -
```bash
# export editor for crontab
$ export EDITOR=vim

# Edit your crontab and add a job
$ crontab -e

# Add this line replacing the values of env variable and style with yours
0 * * * * env DISPLAY=:0 DESKTOP_SESSION=Openbox DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/dwall -s firewatch

# check if job is created on your crontab
$ crontab -l
0 * * * * env DISPLAY=:0 DESKTOP_SESSION=Openbox DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/dwall -s firewatch
```

- That's it, **dwall** added to your crontab and will change the wallpaper every hour. If you want to change the wallpaper style, just remove previous job and add new with another style.
```bash
# delete previous job
$ crontab -r

# Add new job with different style
$ crontab -e
0 * * * * env DISPLAY=:0 DESKTOP_SESSION=Openbox DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/dwall -s bitday
```

### How to add own wallpapers

+ Download a wallpaper set you like.
+ Rename the wallpapers (must be **jpg/png**) to `0-23`. If you don't have enough images, symlink them.
+ Make a directory in `/usr/share/dynamic-wallpaper/images` and copy your wallpapers in that. 
+ Run the program, select the style and apply it.

**`Tips`**
- You can use `dwall` to change between your favorite wallpapers every hour.
- You can use `dwall` as picture slide, which can set your favorite photos as wallpaper every hour or every 15 minutes. Just create an appropriate cron job.

### Use HEIC Images

You may also want to use wallpapers from [Dynamic Wallpaper Club](https://dynamicwallpaper.club/). To do so, you need to convert `.heic` image file to either png or jpg format. Download a `.heic` wallpaper file you like and follow the steps below to convert images.

- First install `heif-convert` on your system - 
```bash
# On Archlinux
$ sudo pacman -Sy libheif

# On Ubuntu or Debian
$ sudo apt-get install libheif-examples

```

- Move you `.heic` file in a directory and run following command to convert images - 
```bash
# change to directory
$ cd Downloads/heic_images

# convert to jpg images
$ for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done
```

- Now, you have the images, just follow the [above](https://github.com/adi1090x/dynamic-wallpaper#How-to-add-own-wallpapers) steps to use these wallpapers with `dwall`.

**More Wallpapers :** I've also created a few more wallpaper sets, which are not added to this repository because of their big size. You can download these wallpapers set from here - 
<p align="center">
  <a href="https://github.com/adi1090x/files/tree/master/dynamic-wallpaper/wallpapers"><img alt="undefined" src="https://img.shields.io/badge/Download-Here-blue?style=for-the-badge&logo=github"></a>
</p>

**`Available Sets`** : `Catalina`, `London`, `Maldives`, `Mojave HD`, `Mount Fuji`, `Seoul`, and more...

### Previews

|Aurora|Beach|Bitday|Chihuahuan|
|--|--|--|--|
|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/aurora.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/beach.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/bitday.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/chihuahuan.gif)|

|Cliffs|Colony|Desert|Earth|
|--|--|--|--|
|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/cliffs.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/colony.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/desert.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/earth.gif)|

|Exodus|Factory|Forest|Gradient|
|--|--|--|--|
|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/exodus.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/factory.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/forest.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/gradient.gif)|

|Home|Island|Lake|Lakeside|
|--|--|--|--|
|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/home.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/island.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/lake.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/lakeside.gif)|

|Market|Mojave|Moon|Mountains|
|--|--|--|--|
|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/market.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/mojave.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/moon.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/mountains.gif)|

|Room|Sahara|Street|Tokyo|
|--|--|--|--|
|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/room.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/sahara.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/street.gif)|![gif](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/tokyo.gif)|

### Common Issues

**1. Wallpaper not changing** : If your wallpaper is not changing, then open an issue and show me the output of `echo $DESKTOP_SESSION`.

**2. Not working on XFCE** : If this script is not working on xfce, then open the terminal and run `xfconf-query -c xfce4-desktop -m` and change the wallpaper (any) via *xfce4-settings-manager*. <br />
In the terminal, *xfconf-query* will print lines starting with `set:`, which show which properties have been changed, check `screen` & `monitor` values and modify the script accordingly.
```bash
109   ## For XFCE
110   if [[ "$OSTYPE" == "linux"* ]]; then
111      SCREEN="0"
112      MONITOR="1"
113   fi

```

### Quick FYI

+ In KDE, `dwall` changes the wallpaper in all the Activities.
+ While using with `pywal`, the color of other applications (Terminal, polybar, rofi, etc) will change the way you configured these application. It's on you.
+ You can add **`dwall -s style &`** to your WM's autostart file to set/restore wallpaper after login/reboot.
+ You can also create a `@reboot` crontab to set appropriate wallpaper on boot.
