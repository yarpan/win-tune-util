#To disable power saving for all devices in Device Manager?

$devicesUSB = Get-PnpDevice | where {$_.InstanceId -like "*USB\ROOT*"}  | 
ForEach-Object -Process {
Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root\wmi 
}

#disable Power Management
foreach ( $device in $devicesUSB )
{
    Set-CimInstance -Namespace root\wmi -Query "SELECT * FROM MSPower_DeviceEnable WHERE InstanceName LIKE '%$($device.PNPDeviceID)%'" -Property @{Enable=$False} -PassThru
}