Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class Window {
        [DllImport("user32.dll")]
        public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

        [DllImport("user32.dll")]
        public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
    }
"@

# Close all open Explorer windows
#Get-Process | Where-Object { $_.MainWindowTitle -ne "" -and $_.ProcessName -eq "explorer" } | Stop-Process

# Open the first Explorer window at "C:"
Start-Process explorer.exe "D:\OneDrive\"

# Wait for the window to open and get its handle
Start-Sleep -Seconds 1
$handle = [Window]::FindWindow("", "File Explorer")

# Move and resize the window
[Window]::MoveWindow($handle, 1920, 0, 1920/3, 1200, $true) | Out-Null

# Open the second Explorer window at "My Computer"
Start-Process explorer.exe "shell:MyComputerFolder"

# Wait for the window to open and get its handle
Start-Sleep -Seconds 1
$handle = [Window]::FindWindow("", "File Explorer")

# Move and resize the window
[Window]::MoveWindow($handle, 1920/3*2, 0, 1920/3, 1200, $true) | Out-Null
