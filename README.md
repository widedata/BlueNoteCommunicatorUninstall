# BlueNote Communicator Uninstall
Had an instance where we needed to remove, en masse, BlueNote Communicator from a good number of workstations. Upon realization that there was no way to automate uninstall natively I wrote this powershell script that cleverly, but still natively, removes BlueNote. 

It will 
1) find the path of the current install's installer 
2) extract installer contents 
3) utilize MSI in the installer to quietly uninstall Bluenote
