function rdns ($srv) {
<#
.SYNOPSIS
Module for remote view zones DNS, as well view and remove records
Using module DNSServer via Invoke-Command (module installation is not required)
.DESCRIPTION
Example:
rdns dc-01
.LINK
https://github.com/Lifailon/psModules
#>
if (!$srv) {
Write-Host (Get-Help rdns).SYNOPSIS -ForegroundColor Cyan
Write-Host
Write-Host (Get-Help rdns).DESCRIPTION.Text -ForegroundColor Cyan
return
}
$zone = icm $srv {Get-DnsServerZone} | select ZoneName,ZoneType,DynamicUpdate,ReplicationScope,SecureSecondaries,
DirectoryPartitionName | Out-GridView -Title "DNS Server: $srv" –PassThru
$zone_name = $zone.ZoneName
if ($zone_name -ne $null) {
$A = icm $srv {
Get-DnsServerResourceRecord -ZoneName $using:zone_name | sort RecordType | select RecordType,HostName, @{
Label="IPAddress"; Expression={$_.RecordData.IPv4Address.IPAddressToString}},TimeToLive,Timestamp
} | select RecordType,HostName,IPAddress,TimeToLive,Timestamp | Out-GridView -Title "DNS Server: $srv | Zone: $zone_name" –PassThru
}
if ($A -ne $null) {
$RT = $A.RecordType
$HN = $A.HostName
$wshell = New-Object -ComObject Wscript.Shell
$output = $wshell.Popup("Romove record $HN (type: $RT)",0,"Select",4)
if ($output -eq 6) {
icm $srv {
Remove-DnsServerResourceRecord -ZoneName $using:zone_name -RRType $using:RT -Name $using:HN –Force
}
}
if ($output -eq 7) {Write-Host "Canceled" -ForegroundColor Cyan}
}
}