function Broker-Connect {
<#
.SYNOPSIS
Add-on for module RemoteDesktop
.DESCRIPTION
Example:
broker-connect localhost # default
broker-connect server-01 -r # remote shadow connection to user via rdp
broker-connect server-01 -d # disconnect user
broker-connect server-01 -c # collection list and software
broker-connect server-01 -h # host list and roles
.LINK
https://github.com/Lifailon/psModules
#>
Param (
$broker="localhost",
[switch]$r,
[switch]$d,
[switch]$c,
[switch]$h
)
if ($c) {
$Coll = Get-RDRemoteDesktop -ConnectionBroker $broker | Out-GridView -title "Broker-Connect" -PassThru
$CollName = $Coll.CollectionName
}
if ($CollName) {
Get-RDAvailableApp -ConnectionBroker $broker -CollectionName $CollName | Out-GridView -title "Software $CollName"
}
if ($h) {
Get-RDServer -ConnectionBroker $broker | Out-GridView -title "Broker-Connect"
}
if ((!($c)) -and (!($h))) {
$data = Get-RDUserSession -ConnectionBroker $broker | select hostserver, UserName, SessionState, CreateTime, DisconnectTime, unifiedsessionid | Out-GridView -title "Broker-Connect" -PassThru | select hostserver, unifiedsessionid
}
if ($data) {
$id = $data.UnifiedSessionId
$srv = $data.HostServer
}
if ($r) {
mstsc /v:"$srv" /shadow:"$id" /control /noconsentprompt
}
if ($d) {
Disconnect-RDUser -HostServer $srv -UnifiedSessionID $id # -Force
}
}