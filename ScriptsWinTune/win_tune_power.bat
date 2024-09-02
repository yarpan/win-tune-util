REM *** POWER MANAGEMENT ***

REM to Change the Screen Timeout in Windows 11
powercfg -change -monitor-timeout-ac 20
powercfg -change -monitor-timeout-dc 10


REM Enable or Disable Adaptive Brightness for Current Power Plan in Command Prompt
REM https://www.tenforums.com/tutorials/70157-enable-disable-adaptive-brightness-windows-10-a.html

REM (Enable - On battery)
REM powercfg -setdcvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 1
REM (Enable - Plugged in)
REM powercfg -setacvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 1

REM (Disable - On battery)
powercfg -setdcvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 0
REM (Disable - Plugged in)
powercfg -setacvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 0
REM to apply the change
powercfg -SetActive SCHEME_CURRENT


REM *** disabling the adaptive brightness 
REG ADD "HKEY_LOCAL_MACHINE\Software\Intel\Display\igfxcui\profiles\media\Brighten Movie" /v "ProcAmpBrightness" /d "0" /t REG_DWORD /f
REG ADD "HKEY_LOCAL_MACHINE\Software\Intel\Display\igfxcui\profiles\media\Darken Movie" /v "ProcAmpBrightness" /d "0" /t REG_DWORD /f

REM Enable Hibernate to show in Windows 10 Power menu by Registry Editor
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /d "1" /t REG_DWORD /f

REM Turn off fast startup
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\Power" /v "HiberbootEnabled" /d "0" /t REG_DWORD /f

REM Add "USB selective suspend setting" in Power Options
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226 /v Attributes /t REG_DWORD /d 2 /f

REM Add "Hub Selective Suspend Timeout" in Power Options
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683 /v Attributes /t REG_DWORD /d 2 /f

REM Restore Missing Default Power Plans
REM (Power saver)
powercfg -duplicatescheme a1841308-3541-4fab-bc81-f71556f20b4a
REM (Balanced)
powercfg -duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e
REM (High Performance)
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
REM (Ultimate Performance - Windows 10 build 17101 and later)
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
