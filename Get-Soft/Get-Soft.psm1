function Get-Soft ($srv="localhost"){
<#
.SYNOPSIS
Remote and local view and delete software via WMI
.DESCRIPTION
Example:
Get-Soft server-01
Get-Soft localhost # default localhost
.LINK
https://github.com/Lifailon/psModules
#>
$soft_wmi = gwmi Win32_Product -ComputerName $srv | select Name,Version,Vendor,
InstallDate,InstallLocation,InstallSource | sort -Descending InstallDate |
Out-Gridview -Title "Software to $srv" -PassThru
$soft_wmi_uninstall = $soft_wmi.Name
if ($soft_wmi_uninstall -ne $null) {
$wshell = New-Object -ComObject Wscript.Shell
$output = $wshell.Popup("Delete $soft_wmi_uninstall to server $srv ?",0,"Select",4)
} else {
Write-Host Canceled
break
}
if ($output -eq "7") {
Write-Host Canceled
break
}
if ($output -eq "6") {
$uninstall = (gwmi Win32_Product -ComputerName $srv -Filter "Name = '$soft_wmi_uninstall'").Uninstall()
}
$outcode = $uninstall.ReturnValue
if ($outcode -eq 0) {Write-Host -ForegroundColor Green "Successfully"} else {
Write-Host -ForegroundColor Red "Error: $outcode"
}
}