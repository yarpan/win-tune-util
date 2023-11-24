#Clear cache on Mozilla Firefox
#https://www.hexnode.com/mobile-device-management/help/script-to-clear-browser-cache-on-windows-devices/

param([string] $username="")  

if(Test-Path -Path C:\Users\$username\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\entries)  

{  
   $itemsCountBefore = Get-ChildItem -Path C:\Users\$username\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\entries -Recurse | Measure-Object | %{$_.Count} 

   Remove-Item -Path C:\Users\$username\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\entries -Recurse -Force  

   $itemsCountAfter = Get-ChildItem -Path C:\Users\$username\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\entries -Recurse | Measure-Object | %{$_.Count} 

   if($itemsCountBefore -gt $itemsCountAfter) 
   { 
      Write-host "Cache cleared for Mozilla Firefox" 
   } 
   else 
   { 
      Write-Host "Failed to clear cache for Mozilla Firefox" 
   } 
}  
else  
{  
   Write-host "Specified path doesn't exist."  
} 