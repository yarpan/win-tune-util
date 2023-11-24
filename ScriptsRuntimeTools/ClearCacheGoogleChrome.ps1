#Clear cache on Google Chrome
#https://www.hexnode.com/mobile-device-management/help/script-to-clear-browser-cache-on-windows-devices/

param([string] $username="")  

if(Test-Path -Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Default\Cache)  

{  
   $itemsCountBefore = Get-ChildItem -Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Default\Cache -Recurse | Measure-Object | %{$_.Count} 

   Remove-Item -Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Default\Cache -Recurse -Force  

   $itemsCountAfter = Get-ChildItem -Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Default\Cache -Recurse | Measure-Object | %{$_.Count} 

   if($itemsCountBefore -gt $itemsCountAfter) 
   { 
      Write-host "Cache cleared for Google Chrome" 
   } 
   else 
   { 
      Write-Host "Failed to clear cache for Google Chrome" 
   } 
}  
else  
{  
   Write-host "Specified path doesn't exist."  
} 