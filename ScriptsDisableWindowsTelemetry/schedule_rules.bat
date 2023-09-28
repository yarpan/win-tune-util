REM *** Task that collects data for SmartScreen in Windows ***
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable

REM *** Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable

REM *** Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable

REM *** Aggregates and uploads Application Telemetry information if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /Disable

REM *** This task collects and uploads autochk SQM data if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable

REM *** If the user has consented to participate in the Windows Customer Experience Improvement Program, this job collects and sends usage data to Microsoft ***
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable

REM *** The Kernel CEIP (Customer Experience Improvement Program) task collects additional information about the system and sends this data to Microsoft. *** 
REM *** If the user has not consented to participate in Windows CEIP, this task does nothing ***
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable

REM *** The Bluetooth CEIP (Customer Experience Improvement Program) task collects Bluetooth related statistics and information about your machine and sends it to Microsoft ***
REM *** The information received is used to help improve the reliability, stability, and overall functionality of Bluetooth in Windows ***
REM *** If the user has not consented to participate in Windows CEIP, this task does not do anything.***
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disable

REM *** Create Object Task ***
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable

REM *** The Windows Disk Diagnostic reports general disk and system information to Microsoft for users participating in the Customer Experience Program ***
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable

REM *** Measures a system's performance and capabilities ***
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable

REM *** Network information collector ***
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable

REM *** Initializes Family Safety monitoring and enforcement ***
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable

REM *** Synchronizes the latest settings with the Family Safety website ***
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable

REM *** SQM (Software Quality Management) ***
schtasks /Change /TN "Microsoft\Windows\IME\SQM data sender" /Disable

REM *** This task initiates the background task for Office Telemetry Agent, which scans and uploads usage and error information for Office solutions ***
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable

REM *** This task initiates Office Telemetry Agent, which scans and uploads usage and error information for Office solutions when a user logs on to the computer ***
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable





