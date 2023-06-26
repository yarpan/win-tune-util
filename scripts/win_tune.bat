
rem Disable Prefetch и SuperFetch 
sc stop "SysMain" & sc config "SysMain" start=disabled
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\Memory" /v "EnablePrefetcher" /d "00000000" /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\Memory" /v "EnableSuperfetcher" /d "00000000" /t REG_DWORD /f
rmdir /s /q C:\Windows\Prefetch

REM  *** Turn Off Delivery Optimization for Windows Update
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f

rem Disable folder "3D Objects" in Explorer 
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
REG DELETE "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

rem Disable Thumbs.db 
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /d "00000001" /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoThumbnailCache" /d "00000001" /t REG_DWORD /f

rem Disable Thumnails in TaskPanel
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /d "120000" /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TaskbarNoThumbnail" /d "000001" /t REG_DWORD /f

rem Prevent balloon tips displayed in the notification area
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /d "000000" /t REG_DWORD /f

rem Disable Runtime Broker (Time Broker service)
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "Start" /d "000004" /t REG_DWORD /f

rem Fix Slow Shutdown in Windows 10
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoEndTasks" /d "1" /t REG_SZ /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillAppTimeOut" /d "2000" /t REG_SZ /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "HungAppTimeOut" /d "2000" /t REG_SZ /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control." /v "WaitToKillAppTimeOut" /d "2000" /t REG_SZ /f

REM DISABLE CORTANA
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Cortana" /v "IsAvailable" /t REG_DWORD /d "0" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f

REM STOP INDEXING, Reset and Rebuild Search Index
net stop wsearch
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb"
SC CONFIG WSearch start= disabled
REM Enable or Disable Modifying Indexed Locations (1 - prevent, 0 - enable)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventModifyingIndexedLocations" /t REG_DWORD /d "0" /f
REM Enable or Disable Modifying Advanced Indexing Options (1 - prevent, 0 - enable)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventUsingAdvancedIndexingOptions" /t REG_DWORD /d "0" /f

REM ENABLE CONNECTIONS TO NETWORK DEVICES
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d "1" /f

REM Disable News in widgets
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /d "0" /t REG_DWORD /f
REM assign it 0 to hide the Widgets button, or 1 to make it visible.

REM Change hotkeys for switching Languages
REG ADD "HKEY_CURRENT_USER\Keyboard Layout\Toggle"  /v "Hotkey" /t REG_SZ /d "2" /f
REM 1 - Key Sequence enabled; use LEFT ALT+SHIFT to switch between locales.
REM 2 - Key Sequence enabled; use CTRL+SHIFT to switch between locales.
REM 3 - Key Sequences disabled.

REM Block Windows 10 from preloading Microsoft Edge on Start
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "AllowPrelaunch" /t REG_DWORD /d "0" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowTabPreloading" /t REG_DWORD /d "0" /f

REM DISABLE DEFENDER REAL-TIME PROTECTION
rem REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protectioin" /v "DisableRealtimeMonitoring" /d "00000001" /t REG_DWORD /f
rem REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d "00000001" /t REG_DWORD /f
rem PowerShell Set-MpPreference -DisableRealtimeMonitoring 1


pause

taskkill /F /IM explorer.exe
explorer.exe




