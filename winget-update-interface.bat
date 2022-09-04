rem clear console and make it prettier

@echo off
cls

title Winget Update Interface v0.0.1


:get_available_upgrades
rem show the user a list of all available updates and options

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
rem ask the user if they want to include unknown packages when updating

echo:
echo ------
set /P dialogue_result=Include unknown packages or update normally (Y/N/Q)? 
echo ------
echo:

if /I "%dialogue_result%" equ "Y" goto :upgrade_include_unknown
if /I "%dialogue_result%" equ "N" goto :upgrade_normally
if /I "%dialogue_result%" equ "Q" goto :quit


:upgrade_include_unknown
rem update including unknown packages

echo:
echo ------
echo update: include unknown
echo ------
echo:

winget upgrade --all --include-unknown
goto :quit


:upgrade_normally
rem update excluding unknown packages

echo:
echo ------
echo update: normally
echo ------
echo:

winget upgrade --all
goto :quit

rem ^^^ i know this is unnecessary but it's uniform and it looks pretty =)


:quit
rem quit the job and close the console window

echo:
echo ------
echo quit
echo ------
echo:

pause
exit
