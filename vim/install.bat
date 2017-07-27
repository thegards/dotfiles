@echo off
set "SCRIPT_DIR=%~dp0"
rem set "HOME_DIR=%HOMEDRIVE%%HOMEPATH%"

mklink /d %HOME%\.vim       %SCRIPT_DIR%\vimdir
mklink    %HOME%\.vimrc     %SCRIPT_DIR%\vimdir\vimrc
