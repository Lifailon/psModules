function wget-img ($url,$path="$env:userprofile\desktop\Web-img") {
<#
.SYNOPSIS
Module for downloading image files from the website.
Using Invoke-WebRequest
.DESCRIPTION
Example:
wget-img https://losst.pro/
wget-img https://losst.pro/ "$env:userprofile\desktop\Web-img" # default save path
.LINK
https://github.com/Lifailon/psModules
#>
if (!$url) {
Write-Host (Get-Help wget-img).DESCRIPTION.Text -ForegroundColor Cyan
return
}
$pars = wget -Uri $url
if (!(Test-Path $path)) {(New-Item -Path "$path" -ItemType "Directory"  -Force) | Out-Null}
$pars.Images.src | %{
$name = $_ -replace ".+(?<=/)"
wget $_ -OutFile "$path\$name"
}
$count_all = $pars.Images.src.Count
$count_down = (Get-Item $path\*).count
"Downloaded $count_down of $count_all files to $path"
}