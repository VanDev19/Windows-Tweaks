:: This script improve wallpaper quality for jpeg wallpapers.
:: Este script mejora la calidad de los wallpapers que están en formato jpeg, de 85% a 100%.

@echo off


net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script needs admin privileges.
    echo please, run as administrador.
    pause
    exit /b
)

set RegFile=%temp%\JPEGImportQuality.reg

echo Windows Registry Editor Version 5.00 > "%RegFile%"
echo [HKEY_CURRENT_USER\Control Panel\Desktop] > "%RegFile%"
echo "JPEGImportQuality"=dword:00000064 > "%RegFile%"

regedit /s %RegFile%

del %RegFile%

pause