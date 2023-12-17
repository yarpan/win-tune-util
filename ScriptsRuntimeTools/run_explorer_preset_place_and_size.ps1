# This script runs Windows File Explorer in particular place and with pre-defined window size
# Currently it opens 2 windows for full height and 1/3 of Width
# position of windows - center and right edge
# 
# -----------------------
# | 	|		|		|
# |		|		|		|
# |		|	X	|	X	|
# |		|		|		|
# |		|		|		|
# -----------------------
#
# To run this script on Windows startup, use cmd command to add Task to Scheduler that will run this script
# schtasks /create /tn "MyTask" /tr "powershell.exe -File 'C:\Path\To\Your\Script.ps1'" /sc onstart /ru System

# Define the paths
$path1 = "D:\OneDrive"
$path2 = "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"  # My Computer

# Open the folders
$explorer1 = New-Object -ComObject Shell.Application
$explorer1.Open($path1)
$explorer2 = New-Object -ComObject Shell.Application
$explorer2.Open($path2)

# Get the windows
$window1 = $explorer1.Windows() | Where-Object { $_.LocationURL -eq "file:///$path1" }
$window2 = $explorer2.Windows() | Where-Object { $_.LocationURL -eq "file:///$path2" }

# Set the size and position
$window1.Left = 640  # 1920/3
$window1.Top = 0
$window1.Width = 640  # 1920/3
$window1.Height = 1080  # Full height

$window2.Left = 1280  # 2*(1920/3)
$window2.Top = 0
$window2.Width = 640  # 1920/3
$window2.Height = 1080  # Full height