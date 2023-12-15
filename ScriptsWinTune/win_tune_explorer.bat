
REM *** WINDOWS EXPLORER ***

REM Disable or enable Compact View in Explorer using Registry
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseCompactMode" /d "1" /t REG_DWORD /f

REM Show Hidden files, folders or drives
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f
REM for turnoff ... /v "Hidden" /t REG_DWORD /d 2 /f

REM Hide protected operating system files
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
REM for turn on ...  /v "ShowSuperHidden" /t REG_DWORD /d 1 /f

REM Show extensions for known file types
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /d "0" /t REG_DWORD /f

REM Enable or Disable Info Tips For Desktop & Folder Content 
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\Current\Version\Explorer\Advanced" /v "ShowInfoTip" /d "1" /t REG_DWORD /f

REM Enable or Disable Hiding Folder Merge Conflicts in Windows
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /d "0" /t REG_DWORD /f

REM Restore previous folder windows at logon
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "PersistBrowsers" /d "1" /t REG_DWORD /f

REM Set File Explorer to Open This PC Instead of Quick Access
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /d "1" /t REG_DWORD /f
REM 1 = This PC, 2 = Quick access, 3 = Downloads

REM Remove Gallery in File Explorer Navigation Pane in Windows
REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /v "System.IsPinnedToNameSpaceTree" /d "0" /t REG_DWORD /f

REM Show "This PC" menu in Navigation Pane
REM REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /v "System.IsPinnedToNameSpaceTree" /d "1" /t REG_DWORD /f

REM Set default position of Explorer window
REM REG ADD "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders" /f
REM REG ADD "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1200x120(1).left" /t REG_DWORD /d 0x000001f4 /f
REM REG ADD "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1200x120(1).top" /t REG_DWORD /d 0x00000003 /f
REM REG ADD "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1200x120(1).right" /t REG_DWORD /d 0x00000784 /f
REM REG ADD "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1200x120(1).bottom" /t REG_DWORD /d 0x000002f1 /f

REM You can enable or disable the "Prevent windows from being automatically arranged when moved to the edge of the screen"
REM This means that window won't stick automatically to the screen's edge when window's border is near the edge
REM To enable the feature (prevent automatic arrangement) - set value to 0, to disable - set value to 1
REG ADD "HKCU\Control Panel\Desktop" /v WindowArrangementActive /t REG_SZ /d 0 /f


REM to make this change take effect, restart explorer
taskkill /F /IM explorer.exe
explorer.exe
