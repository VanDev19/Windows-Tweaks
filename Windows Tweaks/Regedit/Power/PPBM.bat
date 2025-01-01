:: This enable Processor performance boost mode option in "Power Options" for any power plan.

@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo this script needs admin privileges
    echo please, run this script as administrador.
    pause
    exit /b
)

set RegFile=%temp%\Attributes.reg

echo Windows Registry Editor Version 5.00
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7]
echo "Attributes"=dword:00000002

regedit /s "%RegFile%"

del "%RegFile%"

pause