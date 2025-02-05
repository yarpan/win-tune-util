
#Source: https://lazyadmin.nl/win-11/disable-widgets-windows-11/

# Remove the installed package for current user
Get-AppxPackage | Where-Object {$_.Name -like "*WebExperience*"} | Remove-AppxPackage

# Remove the installed package for all users
Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*WebExperience*"} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

# Remove the provisioned package for new users
$AppxRemoval = Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like "*WebExperience*"} 
ForEach ( $App in $AppxRemoval) {
    Remove-AppxProvisionedPackage -Online -PackageName $App.PackageName 
}

# Stop service
Stop-Service -Name widgetcontainer
Set-Service -Name widgetcontainer -StartupType Disabled

# Remove the WidgetService via Task Scheduler 
Get-ScheduledTask | Where-Object {$_.TaskName -like "*widget*"} | Disable-ScheduledTask

# Remove Registry Key to Disable Widgets
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Dsh" -Recurse -Force