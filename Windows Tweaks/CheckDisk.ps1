# you can and should ignore this script.

# Ruta del registro para verificar el estado del apagado
$ShutdownRegistryKey = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager"
$ShutdownStatus = Get-ItemProperty -Path $ShutdownRegistryKey -Name BootExecute

# Verificar si el sistema no se apagó correctamente
if ($ShutdownStatus.BootExecute -notmatch "autocheck autochk *") {
    Write-Output "El sistema no se apagó correctamente. Ejecutando chkdsk en C: y D:..."
    
    # Ejecutar chkdsk en C:
    Start-Process "cmd.exe" -ArgumentList "/c chkdsk /F C:" -Verb RunAs

    # Ejecutar chkdsk en D:
    Start-Process "cmd.exe" -ArgumentList "/c chkdsk /F D:" -Verb RunAs
}
