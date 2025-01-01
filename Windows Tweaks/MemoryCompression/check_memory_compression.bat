@echo off

:: Verifica si se está ejecutando como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Este script necesita privilegios de administrador.
    echo Solicitando permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

PowerShell -Command ((Get-MMAgent))
pause
