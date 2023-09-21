REM CLEANING UP THE SYSTEM BEFORE BACKUP CREATING

REM Clean-up system disk from outdated component
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
Dism.exe /Online /Cleanup-Image /StartComponentCleanup

REM Clean-up TEMP folder
del %temp%\*.* /s /q