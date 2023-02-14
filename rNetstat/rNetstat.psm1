function rnetstat ($srv="localhost"){
<#
.SYNOPSIS
Remote and local view network tcp connections statistics and his used process
Using Get-NetTCPConnection, ps, nslookup and Invoke-Command via WinRM
.DESCRIPTION
Example:
rnetstat server-01
rnetstat localhost # default localhost
.LINK
https://github.com/Lifailon/psModules
#>
if ($srv -like "localhost") {
Get-NetTCPConnection -State Established,Listen | sort -Descending State | select CreationTime,LocalAddress,LocalPort,RemotePort,
@{name="RemoteHostName";expression={((nslookup $_.RemoteAddress)[3]) -replace ".+:\s+"}},RemoteAddress,
State,@{name="ProcessName";expression={(ps -Id $_.OwningProcess).ProcessName}},
@{name="ProcessPath";expression={(ps -Id $_.OwningProcess).Path}} | Out-GridView -Title "Local netstat"
}
else {
icm $srv {Get-NetTCPConnection -State Established,Listen | sort -Descending State | select CreationTime,LocalAddress,LocalPort,
RemotePort,RemoteAddress,
State,@{name="ProcessName";expression={(ps -Id $_.OwningProcess).ProcessName}},
@{name="ProcessPath";expression={(ps -Id $_.OwningProcess).Path}}} | select CreationTime,LocalAddress,LocalPort,RemotePort,
@{name="RemoteHostName";expression={((nslookup $_.RemoteAddress)[3]) -replace ".+:\s+"}},
RemoteAddress,State,ProcessName,ProcessPath | Out-GridView -Title "Remote netstat to server: $srv"
}
}