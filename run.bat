rem REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /d "RemoteSigned" /t REG_SZ /f
rem Restricted – No scripting allowed
rem Unrestricted – You can run any script, No signing is required.
rem RemoteSigned – Good for Test, Dev environments. Only files from the internet need to be signed. This is the default setting on servers.
rem AllSigned  – local or remote script – It should be signed by a trusted publisher.

rem Powershell.exe -executionpolicy remotesigned

rem Powershell.exe -noexit -File .\scripts\delete_telemetry.ps1
powershell -ExecutionPolicy Bypass -Force
powershell -noexit -File .\scripts\delete_telemetry.ps1

pause