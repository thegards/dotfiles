@echo off
set "SCRIPT_DIR=%~dp0"
rem set "HOME_DIR=%HOMEDRIVE%%HOMEPATH%"

mklink    %HOME%\.minttyrc  %SCRIPT_DIR%\minttyrc
