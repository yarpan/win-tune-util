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




