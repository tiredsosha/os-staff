# quantity-of-monitors
```
powershell script that starts with cmd. check whether quantity of monitors changed, if does cscript restarts game - 'shrek'
default path for script is "c:\app\monitors\"
```
## monitors.ps1 description
```
Shrek - name of your app, no extension, for example notepad (w/o .exe)
default_monitors - quantity of displys in system on first launch
script is working 24/7 but active only from 9:40 to 22:13
active time can be changed in first if cycle
Start-Sleep -Second (in secs), -Milliseconds (in millisecs) is waiting time of next check
monitor_log.txt - log where you can track what displays changed and when
```
## monitors_start.bat description
```
start ps1 script minimized im cmd
you you wanna start it with nircmd you just need to add rem before 2 line
```
