
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

REM Enable or Disable Folder Merge Conflicts in Windows 11
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /d "0" /t REG_DWORD /f

REM Restore previous folder windows at logon
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "PersistBrowsers" /d "1" /t REG_DWORD /f

REM Set File Explorer to Open This PC Instead of Quick Access
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /d "1" /t REG_DWORD /f
REM 1 = This PC, 2 = Quick access, 3 = Downloads

REM Remove Gallery in File Explorer Navigation Pane in Windows 11
REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" /v "System.IsPinnedToNameSpaceTree" /d "0" /t REG_DWORD /f

REM Show "This PC" menu in Navigation Pane
REM REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /v "System.IsPinnedToNameSpaceTree" /d "1" /t REG_DWORD /f




REM to make this change take effect, restart explorer
taskkill /F /IM explorer.exe
explorer.exe


