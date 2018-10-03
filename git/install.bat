@echo off
set "SCRIPT_DIR=%~dp0"
rem set "HOME_DIR=%HOMEDRIVE%%HOMEPATH%"

mklink    %HOME%\.gitconfig   %SCRIPT_DIR%\common.gitconfig
