function rproc ($srv="localhost"){
<#
.SYNOPSIS
Remote and local view and stop processes
Using Get-Process and Invoke-Command via WinRM
.DESCRIPTION
Example:
rproc server-01
rproc localhost # default localhost
.LINK
https://github.com/Lifailon/psModules
#>
if ($srv -like "localhost") {
ps | Sort-Object -Descending CPU | select ProcessName,ProductVersion,
@{Name="Processor Time sec"; Expression={[int]$_.CPU}},
@{Name="Processor Time min"; Expression={$_.TotalProcessorTime -replace "\.\d+$"}},
@{Name="Memory WS"; Expression={[string]([int]($_.WS / 1024kb))+"MB"}},
@{Name="Memory PM"; Expression={[string]([int]($_.PM / 1024kb))+"MB"}},
@{Name="RunTime"; Expression={((Get-Date) - $_.StartTime) -replace "\.\d+$"}},
Path | Out-GridView -Title "Hight Process" -PassThru | Stop-Process
} else {
$remote = icm $srv {ps -IncludeUserName} | Sort-Object -Descending CPU | select ProcessName,
ProductVersion,UserName,
@{Name="Processor Time sec"; Expression={[int]$_.CPU}},
@{Name="Processor Time min"; Expression={$_.TotalProcessorTime -replace "\.\d+$"}},
@{Name="Memory WS"; Expression={[string]([int]($_.WS / 1024kb))+"MB"}},
@{Name="Memory PM"; Expression={[string]([int]($_.PM / 1024kb))+"MB"}},
@{Name="RunTime"; Expression={((Get-Date) - $_.StartTime) -replace "\.\d+$"}},
Path | Out-GridView -Title "Hight Process to server: $srv" -PassThru
$pn = $remote.ProcessName -join ", "
$wshell = New-Object -ComObject Wscript.Shell
$Output = $wshell.Popup($pn,0,"Stop process or cancel",1)
if ($output -eq 1) {
$session = New-PSSession $srv
icm -Session $session {Stop-Process -Name $using:remote.ProcessName -Force}
Remove-PSSession $session
Write-Host "Stop process: $pn"
} elseif ($output -eq 2) {Write-Host "Canceled"}
}
}
