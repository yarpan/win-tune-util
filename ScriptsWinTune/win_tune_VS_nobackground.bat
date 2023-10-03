rem Disabling background download for Microsoft Visual Studio
rem Run as admin

rem Firs open Visual Studio and change Settings
rem Under Tools > Options > Environment > Extensions:
rem Per user extensions > Automatically check for updates: off
rem All user extensions > Automatically check for updates: off
rem Under Tools > Options > Environment > Product Updates:
rem Automatically download updates: off

rem Modify Registry
reg ADD "HKLM\SOFTWARE\Microsoft\VisualStudio\Setup" /v "BackgroundDownloadDisabled" /t REG_DWORD /d "000001" /f

rem Disable/Delete Scheduled Task [taskschd.msc]
SchTasks /Delete /TN "\Microsoft\VisualStudio\Updates\BackgroundDownload" /F
rem SchTasks /Change /TN "\Microsoft\VisualStudio\Updates\BackgroundDownload" /Disable

pause

