$path = Get-ChildItem -Path "C:\ProgramData\Caphyon\Advanced Installer\" -Directory
$installer = "C:\ProgramData\Caphyon\Advanced Installer\$path\bluenotesetup.exe"
&$installer /extract |Out-Null
$subpath = Get-ChildItem -Path $path -Directory
$uninstaller = "C:\ProgramData\Caphyon\Advanced Installer\$path\$subpath\BlueNoteCL.msi"
msiexec /x $uninstaller /qb
