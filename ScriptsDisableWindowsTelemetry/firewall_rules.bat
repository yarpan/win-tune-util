@echo off
cls
echo Telemetry 
echo Rules of Firewall
echo.
echo press any key to continue...
pause > NUL
echo Rules of Firewall 
echo.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0.\firewall_rules.ps1""' -Verb RunAs}"
echo Rules included in Firewall...
echo.
pause