rem - info about service - https://www.itechgyan.com/microsoft-compatibility-telemetry/
rem - Run as admin

rem - Delete Services
SC STOP DiagTrack 
SC STOP dmwappushservice
sc DELETE DiagTrack 
sc DELETE dmwappushservice

rem - Modify Registry
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

rem - Clear already collected Data
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl 

rem - Delete Scheduled Task [taskschd.msc]
SchTasks /Delete /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /F
SchTasks /Delete /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /F
SchTasks /Delete /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /F
SchTasks /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /F
SchTasks /Delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /F

pause