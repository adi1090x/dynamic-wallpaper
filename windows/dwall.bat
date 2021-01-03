@echo off

setlocal
cls

rem name of one of the directories in images
set style=firewatch

rem get current hour, %time% env var first 2 chars is 24 hour format but space padded for 0-9
set hh=%time:~0,2%
set hh=%hh: =%
set "parentdir=%~dp0"

rem get the file name of the image for the current hour
set images=%parentdir%..\images\%style%
if exist %images%\%hh%.png (
  set name=%hh%.png
)
if exist %images%\%hh%.jpg (
  set name=%hh%.jpg
)
if not exist %images%\%hh%.png if not exist %images%\%hh%.jpg (
  echo image does not exist
  exit /b 1
)

rem resolve symlink - if file size < 7, is a symlink, change name to content of the file, src https://stackoverflow.com/a/1199839/4858751
for /f "usebackq" %%a in ('%images%\%name%') do set size=%%~za
if %size% lss 7 (
  set /p name=<%images%\%name%
)
echo %images%\%name%

rem call ChangeWallpaper.exe to change background with the image
%parentdir%ChangeWallpaper.exe %images%\%name%