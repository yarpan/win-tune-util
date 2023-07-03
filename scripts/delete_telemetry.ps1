param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

#rem - info about service - https://www.itechgyan.com/microsoft-compatibility-telemetry/
#rem - Run as admin

#rem - Delete Services
SC STOP DiagTrack 
SC STOP dmwappushservice
sc DELETE DiagTrack 
sc DELETE dmwappushservice

#rem - Modify Registry
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

#rem - Clear already collected Data
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl 

#rem - Delete Scheduled Task [taskschd.msc]
SchTasks /Delete /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /F
SchTasks /Delete /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /F
SchTasks /Delete /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /F
SchTasks /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /F
SchTasks /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /F

Write-Host "This is Test PowerShell script"