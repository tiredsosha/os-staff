<#
Shrek - name of your app, no extension, for example notepad (w/o .exe) 
script is working 24/7 but active only from 9:40 to 22:13. active time can be changed in first if cycle
Start-Sleep -Second (in secs), -Milliseconds (in millisecs) is waiting time of next check
#>
$default_monitors = get-wmiobject Win32_PnPEntity | select service, DeviceID | findstr "monitor"
$default_monitors_quntity = ($default_monitors | select-string "$").Count
for ($i = 0, $i -eq 0) {
    $time_now = Get-Date -Format t
    if (($time_now -gt "09:40") -and ($time_now -lt "22:13")) {
        $active_monitors = get-wmiobject Win32_PnPEntity | select service, DeviceID | findstr "monitor"
        $active_monitors_quntity = ($active_monitors | Select-String "$").Count
        if ($active_monitors_quntity -eq $default_monitors_quntity) {
            write-host "hehe"
            Start-Sleep -Milliseconds 100
        }
        else {
            write-host "fuck go back"
            Stop-Process -Name "Shrek" -Force
            get-date | Out-File monitor_log.txt -Append
            Compare-Object $default_monitors $active_monitors -IncludeEqual | Out-File monitor_log.txt -Append
            $default_monitors = $active_monitors
            $default_monitors_quntity = $active_monitors_quntity
            Start-Sleep -Second 65
        }
    }
    else {
        write-host "everyone is sleeping, get some rest too"
        Start-Sleep -Second 300
    }
}