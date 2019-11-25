# This will extract the uninstall path from the registry (split-path will chop the drive letter off when trying to remove the registry string qualifier)
$uninstaller_path = Split-Path (Split-Path (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match "BlueNote" } | Select-Object -Property UninstallPath -First 1) -NoQualifier)

# This puts the drive letter back in the path of the uninstaller location
$uninstaller_path = "C:$uninstaller_path"

# This grabs the folder path of the uninstaller
$path = Split-Path $uninstaller_path -Parent

# Forces execution of the string to extract the installer contents into a subdirectory
&$uninstaller_path /extract |Out-Null

# Lets get the subdirectory folder path
$subpath = Get-ChildItem -Path "$path" -Directory

# Lets make a string for the MSI uninstaller path
$uninstaller = "$path\$subpath\BlueNoteCL.msi"

# Execute uninstallation with basic UI so we know when it's finished
msiexec /x $uninstaller /qb
