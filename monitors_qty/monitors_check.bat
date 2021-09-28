rem if you wanna launch script with nircmd add rem before 2 line
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
powershell.exe -file "c:\app\monitors\monitors.ps1"