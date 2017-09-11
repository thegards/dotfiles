@echo off
set "SCRIPT_DIR=%~dp0"
rem set "HOME_DIR=%HOMEDRIVE%%HOMEPATH%"

mklink    %HOME%\.tmux.conf %SCRIPT_DIR%\tmux.conf
mklink /d %HOME%\.tmux      %SCRIPT_DIR%\tmuxdir
