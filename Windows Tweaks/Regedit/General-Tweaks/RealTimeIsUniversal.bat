:: This makes that windows sync time in UTC.

@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo this script needs admin privileges
    echo please, run this script as administrador.
    pause
    exit /b
)

set RegFile=%~n0.reg

echo Windows Registry Editor Version 5.00 > "%RegFile%"
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation] > "%RegFile%"
echo "RealTimeIsUniversal"=dword:00000001 > "%RegFile%"
echo  > "%RegFile%"
echo  > "%RegFile%"
echo  > "%RegFile%"
echo  > "%RegFile%"

regedit /s "%RegFile%"

del "%RegFile%"

pause

