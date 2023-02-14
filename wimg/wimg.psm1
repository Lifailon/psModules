function wimg ($url,$path="$env:userprofile\desktop\Web-img") {
<#
.SYNOPSIS
Web Download img files
.DESCRIPTION
Example:
wimg https://losst.pro/
wimg https://losst.pro/ "C:\Download\Web-img"
.LINK
https://github.com/Lifailon/psModules
#>
if (!$url) {
Write-Host (Get-Help wimg).DESCRIPTION.Text -ForegroundColor Cyan
return
}
$pars = iwr -Uri $url
if (!(Test-Path $path)) {(New-Item -Path "$path" -ItemType "Directory"  -Force) | Out-Null}
$pars.Images.src | %{
$name = $_ -replace ".+(?<=/)"
iwr $_ -OutFile "$path\$name"
}
$count_all = $pars.Images.src.Count
$count_down = (Get-Item $path\*).count
"Downloaded $count_down of $count_all files to $path"
}