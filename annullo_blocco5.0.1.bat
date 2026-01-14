<# : Batch portion (questo viene eseguito dal CMD)
@echo off
title Annullo-Blocco - Status: Attivo
color 0A
echo.
echo ====================================================
echo    ANNULLO BLOCCO SCHERMO
echo    Status: ATTIVO
echo    Premi CTRL+C per chiudere questa finestra
echo ====================================================
echo.
echo [INFO] Simulazione pressione tasto F15 in corso...
echo [INFO] Il PC rimarrà sbloccato e su Teams rimarrai "Verde".
echo.

:: Lancia la parte PowerShell nascondendo i comandi complessi
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex (${%~f0} | Out-String)"
goto :eof
#>

$w = Add-Type -MemberDefinition '[DllImport("user32.dll")]public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);' -Name "Win32" -Namespace Win32 -PassThru

# Codice virtuale per F15: 0x7E (126). 
$VirtualKey = 0x7E 
$KeyDown = 0x0000
$KeyUp = 0x0002

Write-Host "Inizio ciclo di keep-alive..." -ForegroundColor Green

while ($true) {
    #Pressione simulata F15 (Invisibile all'utente, visibile a Windows/Teams)
    $w::keybd_event($VirtualKey, 0, $KeyDown, [UIntPtr]::Zero)
    Start-Sleep -Milliseconds 50
    $w::keybd_event($VirtualKey, 0, $KeyUp, [UIntPtr]::Zero)

    #Timestamp nella console
    $timestamp = Get-Date -Format "HH:mm:ss"
    Write-Host "[$timestamp] Refresh inviato (F15)" -ForegroundColor DarkGray

    #Attesa (per allungare, modificare l'ulitimo numero (già con 50 funziona)
    Start-Sleep -Seconds 50
}