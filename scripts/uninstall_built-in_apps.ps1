
# To get all installed Apps
#get-appxPackage | Select Name, PackageFullName


# To uninstall Windows Built-in Apps
# Uncomment those you want to uninstall
get-appxpackage *3d* | remove-appxpackage # To uninstall View 3D
get-appxpackage *3dbuilder* | remove-appxpackage # To uninstall 3D Builder
get-appxpackage *alarms* | remove-appxpackage # To uninstall Alarms & Clock
#get-appxpackage *appconnector* | remove-appxpackage # To uninstall App Connector
#get-appxpackage *appinstaller* | remove-appxpackage # To uninstall App Installer
get-appxpackage *bing* | remove-appxpackage # To uninstall Money, News, Sports and Weather apps together
get-appxpackage *bingfinance* | remove-appxpackage # To uninstall Money
get-appxpackage *bingnews* | remove-appxpackage # To uninstall News
get-appxpackage *bingsports* | remove-appxpackage # To uninstall Sports
get-appxpackage *bingweather* | remove-appxpackage # To uninstall Weather
#get-appxpackage *calculator* | remove-appxpackage # To uninstall Calculator
#get-appxpackage *camera* | remove-appxpackage # To uninstall Camera
get-appxpackage *commsphone* | remove-appxpackage # To uninstall Phone
#get-appxpackage *communicationsapps* | remove-appxpackage # To uninstall Calendar and Mail apps together
get-appxpackage *connectivitystore* | remove-appxpackage # To uninstall Microsoft Wi-Fi
get-appxpackage *feedback* | remove-appxpackage # To uninstall Feedback Hub
get-appxpackage *getstarted* | remove-appxpackage # To uninstall Get Started or Tips
get-appxpackage *holographic* | remove-appxpackage # To uninstall Windows Holographic
get-appxpackage *maps* | remove-appxpackage # To uninstall Maps
#get-appxpackage *messaging* | remove-appxpackage # To uninstall Messaging and Skype Video apps together
get-appxpackage *mspaint* | remove-appxpackage # To uninstall Paint 3D
get-appxpackage *officehub* | remove-appxpackage # To uninstall Get Office
get-appxpackage *oneconnect* | remove-appxpackage # To uninstall Paid Wi-Fi & Cellular
#get-appxpackage *onenote* | remove-appxpackage # To uninstall OneNote
get-appxpackage *people* | remove-appxpackage # To uninstall People
get-appxpackage *phone* | remove-appxpackage # To uninstall Phone and Phone Companion apps together
#get-appxpackage *photos* | remove-appxpackage # To uninstall Photos
get-appxpackage *skypeapp* | remove-appxpackage # To uninstall Get Skype
get-appxpackage *solitaire* | remove-appxpackage # To uninstall Microsoft Solitaire Collection
#get-appxpackage *soundrecorder* | remove-appxpackage # To uninstall Voice Recorder
get-appxpackage *sticky* | remove-appxpackage # To uninstall Sticky Notes
#get-appxpackage *sway* | remove-appxpackage # To uninstall Sway
get-appxpackage *wallet* | remove-appxpackage # To uninstall Microsoft Wallet
get-appxpackage *windowsphone* | remove-appxpackage # To uninstall Phone Companion
#get-appxpackage *windowsstore* | remove-appxpackage # To uninstall Windows Store
get-appxpackage *xbox* | remove-appxpackage # To uninstall Xbox:
#get-appxpackage *zune* | remove-appxpackage # To uninstall Groove Music and Movies & TV apps together
get-appxpackage *zunemusic* | remove-appxpackage # To uninstall Groove Music
get-appxpackage *zunevideo* | remove-appxpackage # To uninstall Movies & TV


# To Restore Windows 10's Built-in Apps
# Windows PowerShell - Run as administrator
get-appxpackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}

