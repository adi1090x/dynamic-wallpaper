<pre align="center"><code>
╺┳┓╻ ╻┏┓╻┏━┓┏┳┓╻┏━╸   ╻ ╻┏━┓╻  ╻  ┏━┓┏━┓┏━┓┏━╸┏━┓
 ┃┃┗┳┛┃┗┫┣━┫┃┃┃┃┃     ┃╻┃┣━┫┃  ┃  ┣━┛┣━┫┣━┛┣╸ ┣┳┛
╺┻┛ ╹ ╹ ╹╹ ╹╹ ╹╹┗━╸   ┗┻┛╹ ╹┗━╸┗━╸╹  ╹ ╹╹  ┗━╸╹┗╸
[ I M P R O V E D ]

A bash script to adapt your wallpaper to the time

Sponsor the original creator, adi1090x:
<a href="https://www.buymeacoffee.com/adi1090x">Buy Me a Coffee</a> | <a href="https://ko-fi.com/adi1090x">Ko-fi</a> | <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=U3VK2SSVQWAPN">PayPal</a> | <a href="https://www.patreon.com/adi1090x">Patreon</a>
</code></pre>

![Showcase with a timelapse of a desktop background changing throughout the day](https://raw.githubusercontent.com/adi1090x/files/master/dynamic-wallpaper/main.gif) <br />

## DWI (Dynamic Wallpaper Improved)
### Overview

+ [25+](https://github.com/adi1090x/files/tree/master/dynamic-wallpaper/wallpapers) different adaptive wallpapers included
+ Easy manual addition of custom wallpapers
+ Extensive [Pywal](https://github.com/dylanaraps/pywal) support to adjust your program themes as well
+ Uses [cronjobs](https://github.com/cronie-crond/cronie/) to reliably refresh the wallpaper (e.g. every hour)
+ Tested on many setups:
  - **`Window Managers`** : `Openbox`, `i3wm`, `bspwm`, `awesomewm`, `Fluxbox`, `Fvwm`, `Swaywm`
  - **`Desktop Environments`** : `KDE`, `Pantheon`, `Gnome`, `Deepin`, `Cinnamon`, `XFCE`, `LXDE`, `MATE`
+ Extended support for GNOME theming 

### System Requirements

Make sure your system fulfills the following requirements before using DWI:

- **GNU Operating System** (required): DWI makes use of a lot of standard GNU utilities (such as `bash`, `grep`, `xargs`, etc.). If you're using a common "Linux" distribution, you're probably running the GNU Operating System. If you're on a BSD, Windows, macOS or a demanding Linux distribution (such as Alpine Linux), this script will not work without significant workarounds! One way to make sure you're on GNU is by checking the output of `uname -o` in a terminal.
- **`feh`** (required): This is used to set the wallpaper in most environments
- **`cron`** (semi-required): While not necessary for DWI to function, you probably want to run this script every hour or so to refresh your background wallpaper. This can preferrably be done by using a `cronjob`. A popular tool to manage cronjobs is [Cronie](https://github.com/cronie-crond/cronie/). An instruction on how to set up a cronjob with Cronie can be found in the [original Dynamic Wallpaper program](https://github.com/adi1090x/dynamic-wallpaper) by adi1090x.
- **`xrandr`** (semi-required): Xrandr is only needed if you use the `XFCE` desktop environment
- **`pywal`** (optional): If you use [Pywal](https://github.com/dylanaraps/pywal) to theme your applications like your desktop wallpaper, DWI can do that for you automatically!

### Improvements

  * Pywal
    * Added the option to pass in a different pywal backend using `-b [BACKEND]`
    * Added the option to create a light or dark theme based on
      * Forcing the light theme (using `-l`)
      * Automatically guessing day/night time by evaluating
        * The GNOME theme
        * The current time of day
  * GNOME
    * DWI also refreshes the lock screen image
    * Better Pywal integration (by taking the current GNOME theme into account)

### Instructions

Make sure to follow the instructions included in the [original Dynamic Wallpaper](https://github.com/adi1090x/dynamic-wallpaper) repository!