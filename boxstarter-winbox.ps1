
# Invoke using following syntax into IE:
# http://boxstarter.org/package/url?[raw link to this gist]
try {
# Boxstarter options
$Boxstarter.RebootOk=$true
$Boxstarter.NoPassword=$false # Is this a machine with no logon password?
$Boxstarter.AutoLogin=$true


#####################
# Install Boxstarter
###################### 


#####################
# PREREQUISITES
#####################

Set-ExecutionPolicy Unrestricted -Force;


#####################
# Set Windows variables
#####################
cinst Microsoft-Hyper-V-All -source windowsFeatures
Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\mstsc.exe"

Enable-RemoteDesktop
Set-CornerNavigationOptions -EnableUpperRightCornerShowCharms -EnableUpperLeftCornerSwitchApps -EnableUsePowerShellOnWinX

Set-StartScreenOptions -EnableBootToDesktop
Disable-UAC
Disable-InternetExplorerESC
Update-ExecutionPolicy Unrestricted

Set-ExplorerOptions -showHiddenFilesFoldersDrives -showHiddenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-TaskbarSmall



# Setting Time Zone
Write-BoxstarterMessage "Setting time zone to Central Standard Time"
& C:\Windows\system32\tzutil /s "Central Standard Time"

# Set Windows power options
Write-BoxstarterMessage "Setting Standby Timeout to Never"
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0
 
Write-BoxstarterMessage "Setting Monitor Timeout to 20 minutes"
powercfg -change -monitor-timeout-ac 20
powercfg -change -monitor-timeout-dc 20
 
Write-BoxstarterMessage "Setting Disk Timeout to Never"
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 0

# AC lid close action (do nothing)
powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
# DC lid close action (sleep)
powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1
 
 
Write-BoxstarterMessage "Turning off Windows Hibernation"
powercfg -h off



    # Powershell
    cinst PowerShell
    cinst poshgit

    #####################
    # SOFTWARE
    #####################

    # 7Zip
    cinst 7zip.install

    # Some browsers
    cinst GoogleChrome
    cinst -y adblockpluschrome
    #cinst chromium
    #cinst brave
    cinst firefox
    #cinst firefox-dev --pre 
    #cinst Opera
    #cinst microsoft-edge-insider
    #cinst microsoft-edge-insider-dev
    cinst -y flashplayerplugin

    cinst dotnet4.5
    cinst git
    cinst git-credential-winstore
    cinst poshgit
    cinst windowsazurepowershell

    cinst nodejs.install
    cinst ruby
    cinst python2

    cinst dotpeek
    cinst putty
    cinst sourcetree
    cinst sysinternals
    cinst diffmerge
    cinst -y sublimetext3

    cinst lastpass
    cinst visualstudiocode
    #cinst cyberduck
    #cinst markdownpad2

    #cinst inkscape
    #cinst paint.net

    cinst -y wireshark
    cinst fiddler4

    #Plugins and Runtime
    cinst javaruntime

    # Geek tools
    cinst steam
    cinst twitch --ignore-checksums

    # Dev Tools
    cinst git.install
    cinst nvm
    #cinst cascadiacode
    cinst vscode
    #cinst vscode-insiders
    #cinst gitkraken
    cinst github-desktop
    cinst postman
    cinst microsoft-windows-terminal
    cinst teamviewer
    cinst azure-cli

    # Messaging
    #cinst discord
    cinst slack
    #cinst whatsapp
    #cinst telegram
    cinst microsoft-teams
    #cinst skype

    # Tools
    #cinst foxitreader
    #cinst vlc
    cinst ccleaner

    # Graphic Tools
    #cinst paint.net

    # Audio Tools
    #cinst audacity
    #cinst lightworks
    #cinst screentogif
    #cinst spotify --ignore-checksums





Install-BoxstarterPackage -PackageName https://gist.githubusercontent.com/kasuken/d5e2ce84a9108002e81603fc3d42e492/raw/b5c5175ffa90c7665200a061db739a051abf0f74/devmachine.ps1 -DisableReboots
