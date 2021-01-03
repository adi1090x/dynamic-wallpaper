@echo off

setlocal
cls

set "parentdir=%~dp0%"
rem delete scheduled task if exists
schtasks /query /tn dynamic-wallpaper | find "cannot find"
if errorlevel 1 (
  echo Found existing dynamic-wallpaper scheduled task, deleting and recreating
  schtasks /delete /tn dynamic-wallpaper /f
)

rem schtasks does not support creating multiple triggers through the cli, but we can call it with a xml file with multiple triggers
rem read task.xml.template and replace {0} and {1} with absolute path to invis.vbs and dwall.bat respectively, save as task.xml
setlocal enabledelayedexpansion
for /f "tokens=* delims=" %%x in ('type %parentdir%task.xml.template') do set template=!template!%%x
set template=!template:{0}=%parentdir%invis.vbs!
set template=!template:{1}=%parentdir%dwall.bat!
echo !template! > task.xml
setlocal disabledelayedexpansion

rem create scheduled task with populated task.xml, then remove it
schtasks /create /tn dynamic-wallpaper /xml task.xml
del task.xml

rem run once to change background
%parentdir%dwall.bat

pause