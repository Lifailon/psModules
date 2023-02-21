# psModules

## wget-img
Module for downloading image files from the website. \
Using **Invoke-WebRequest** \
`Import-Module .\wget-img.psm1` and `Get-Help wget-img`

**[Download (wget-img.psm1)](https://github.com/Lifailon/psModules/blob/rsa/wget-img/wget-img.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/wget-img/Example.jpg)

## ConvertFrom-XLSX
Module for convert csv to xmlx \
Using class .NET **Excel.Application** \
`Import-Module .\ConvertFrom-XLSX.psm1` and `Get-Help ConvertFrom-XLSX`

**[Download (ConvertFrom-XLSX.psm1)](https://github.com/Lifailon/psModules/blob/rsa/ConvertFrom-XLSX/ConvertFrom-XLSX.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/ConvertFrom-XLSX/Screen/ConvertFrom-XLSX.jpg)

### Example of creating and saving an object in Excel:

**[Download (Services-to-Excel.ps1)](https://github.com/Lifailon/psModules/blob/rsa/ConvertFrom-XLSX/Services-to-Excel.ps1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/ConvertFrom-XLSX/Screen/Services-to-Excel.jpg)

## rDNS
Module for remote view zones DNS, as well view and remove records \
Using **module DNSServer** via Invoke-Command (module installation is not required) \
`Import-Module .\rdns.psm1` and `Get-Help rdns`

**[Download (rDNS.psm1)](https://github.com/Lifailon/psModules/blob/rsa/rDNS/rDNS.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/rDNS/Example.jpg)

## Broker-Connect
**Add-on for module RemoteDesktop**

**Features:**
* Remote shadow connection to user via rdp
* Disconnect user
* Collection list and software
* Host list and roles

`Import-Module .\Broker-Connect.psm1` and `Get-Help Broker-Connect`

**[Download (Broker-Connect.psm1)](https://github.com/Lifailon/psModules/blob/rsa/Broker-Connect/Broker-Connect.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/Broker-Connect/Example.jpg)

## Get-Invent
Remote and local **hardware inventory via WMI**. \
`Import-Module .\Get-Invent.psm1` and `Get-Help Get-Invent`

**[Download (Get-Invent.psm1)](https://github.com/Lifailon/psModules/blob/rsa/Get-Invent/Get-Invent.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/Get-Invent/Example.jpg)

## Get-Soft
Remote and local **view and delete software via WMI** \
`Import-Module .\Get-Soft.psm1` and `Get-Help Get-Soft`

**[Download (Get-Soft.psm1)](https://github.com/Lifailon/psModules/blob/rsa/Get-Soft/Get-Soft.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/Get-Soft/Example.jpg)

## rNetstat
Remote and local view network tcp connections statistics and his used process \
Using **Get-NetTCPConnection, ps, nslookup** and Invoke-Command via WinRM \
`Import-Module .\rNetstat.psm1` and `Get-Help rNetstat`

**[Download (rNetstat.psm1)](https://github.com/Lifailon/psModules/blob/rsa/rNetstat/rNetstat.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/rNetstat/Example.jpg)

## rProc
Remote and local view and stop processes \
Using **Get-Process** and Invoke-Command via WinRM \
`Import-Module .\rProc.psm1` and `Get-Help rProc`

**[Download (rProc.psm1)](https://github.com/Lifailon/psModules/blob/rsa/rProc/rProc.psm1)**

![Image alt](https://github.com/Lifailon/psModules/blob/rsa/rProc/Example.jpg)
