@echo off
cls

title Winget Update Interface v0.0.1


:get_available_upgrades
echo:
echo ------
echo all available updates EXCLUDING UNKNOWN
echo ------
echo:

winget upgrade

echo:
echo ------
echo all available updates INLCUDING UNKNOWN
echo ------
echo:

winget upgrade --include-unknown


:dialogue
echo:
echo ------
set /P dialogue_result=Include unknown packages or update normally (Y/N/Q)? 
echo ------
echo:

if /I "%dialogue_result%" equ "Y" goto :upgrade_include_unknown
if /I "%dialogue_result%" equ "N" goto :upgrade_normally
if /I "%dialogue_result%" equ "Q" goto :quit


:upgrade_include_unknown
echo:
echo ------
echo update: include unknown
echo ------
echo:

winget upgrade --all --include-unknown
goto :quit


:upgrade_normally
echo:
echo ------
echo update: normally
echo ------
echo:

winget upgrade --all
goto :quit


:quit
echo:
echo ------
echo quit
echo ------
echo:

pause
exit
