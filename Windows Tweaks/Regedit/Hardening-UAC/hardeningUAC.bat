:: This script makes that UAC request the password user for any action that requires admin privileges.

@echo off
echo Aplicando configuraciones al Registro de Windows...

:: Comprobar si el script se está ejecutando con privilegios de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Este script necesita privilegios de administrador.
    echo Cerrando...
    pause
    exit /b
)

:: Crear un archivo .reg temporal
set RegFile=%temp%\Config.reg

echo Windows Registry Editor Version 5.00 > "%RegFile%"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System] >> "%RegFile%"
echo "ConsentPromptBehaviorAdmin"=dword:00000001 >> "%RegFile%"
echo "ConsentPromptBehaviorEnhancedAdmin"=dword:00000001 >> "%RegFile%"

:: Importar el archivo .reg
regedit /s "%RegFile%"

:: Eliminar el archivo .reg temporal
del "%RegFile%"

echo Configuración aplicada correctamente.
pause
