This directory contains the files needed to install dynamic wallpaper in Windows.

No external dependencies required. Just plain batch files and some workarounds in the form of Visual Basic and VBScript.

## Installation

Clone/download this repo and double click `install.bat`. You should see your desktop background change.

## Change Images

Open `dwall.bat` in a text editor, change the `style` variable to any of the folder names in the [../images](../images) folder, eg `set style=sahara`

## Uninstallation

Double click `uninstall.bat`.

## The boring stuff - How it all works

Unlike Unix, Windows does not have the luxury of running bash scripts without using WSL, and neither does `feh` nor `cron` work on Windows. The equivalent of `feh` is `ChangeWallpaper.exe`, and for `cron` is the Task Scheduler (called via `schtasks`).

`install.bat` schedules a task to run `dwall.bat` every hour and on user login. `install.bat` reads `task.xml.template` and generate the xml file required to create the scheduled task. The task calls `wscript.exe "<absolute path of invis.vbs>" "<absolute path of dwall.bat>"`.

`uninstall.bat` simply removes the scheduled task.

`invis.vbs` is a oneliner script that allows running the argument batch file without spawning a window (see Invisible.vbs section of [here](https://ss64.com/vb/run.html)). Without this, a command prompt window will flash open whenever the task runs.

`dwall.bat` is the main script which finds the image and updates the background by calling `ChangeWallpaper.exe`.

`ChangeWallpaper.exe` is compiled from `ChangeWallpaper.vbs` ([source](https://winsourcecode.blogspot.com/2019/06/changewallpaper.html)). If you want to compile it yourself, run

```
C:\Windows\Microsoft.NET\Framework\v4.0.30319\vbc "ChangeWallpaper.vb" /out:"ChangeWallpaper.exe" /target:winexe
```

The most difficult part working on this is figuring a way to change desktop background via a batch script. I tried other ways including changing registry values and calling `rundll32.exe user32.dll,UpdatePerUserSystemParameters` which I found to be unreliable (changes sometimes, does nothing sometimes) before settling on using that VBScript.

To debug any of the batch files, open command prompt and run the batch file. `echo` prints to the terminal.

### Why use a batch script

Windows can run batch scripts without requiring extra dependencies. I know python can also [change desktop background](https://stackoverflow.com/a/46504228/4858751) but this would require user to install python.
