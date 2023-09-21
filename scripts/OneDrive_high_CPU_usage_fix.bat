rem fix OneDrive High CPU usage

taskkill /f /im OneDrive.exe

del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\setup\logs\UserTelemetryCache.otc
del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\setup\logs\UserTelemetryCache.otc.session

del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\logs\Personal\UserTelemetryCache.otc
del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\logs\Personal\UserTelemetryCache.otc.session
del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\logs\Personal\telemetry-dll-ramp-value.txt

del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\logs\Common\standaloneUpdaterTelemetryCache.otc
del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\logs\Common\standaloneUpdaterTelemetryCache.otc.session

del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\setup\logs\parentTelemetryCache.otc
del %USERPROFILE%\AppData\Local\Microsoft\OneDrive\setup\logs\parentTelemetryCache.otc.session

OneDrive.exe