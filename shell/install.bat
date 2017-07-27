@echo off
set "SCRIPT_DIR=%~dp0"
rem set "HOME_DIR=%HOMEDRIVE%%HOMEPATH%"

mklink %HOME%\.bash_aliases  %SCRIPT_DIR%\aliases
mklink %HOME%\.bash_common   %SCRIPT_DIR%\bash_common
mklink %HOME%\.bash_profile  %SCRIPT_DIR%\profile
mklink %HOME%\.bashrc        %SCRIPT_DIR%\bashrc
