@echo off

:: Verifica si se está ejecutando como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Este script necesita privilegios de administrador.
    echo Solicitando permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

PowerShell -Command "if ((Get-MMAgent).MemoryCompression -eq $false) { Enable-MMAgent -mc; Write-Host 'Compresión de memoria habilitada.' 'Memory Compression has been activated'} else { Write-Host 'La compresión de memoria ya está habilitada.' }"
pause
