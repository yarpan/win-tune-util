REM DELETE Adobe ARM Acrobar Reader Update
REM RUN THIS CMD AS administrator

taskkill /f /im armsvc.exe
taskkill /f /im AdobeARM.exe

SC STOP AdobeARMservice
SC DELETE AdobeARMservice

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown" /v "bUpdater" /d "00000001" /t REG_DWORD /f

cd C:\Program Files (x86)\Common Files\Adobe
RD /S /Q arm

rem - Delete Scheduled Task [taskschd.msc]
SchTasks /Delete /TN "\Adobe Acrobat Update Task" /F

pause