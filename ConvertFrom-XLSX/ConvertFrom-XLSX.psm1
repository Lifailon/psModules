function ConvertFrom-XLSX {
<#
.SYNOPSIS
Module for convert csv to xmlx
.DESCRIPTION
Example Export to csv:
Get-Service | Select Name,DisplayName,Status,StartType | Export-csv -path "$home\Desktop\Get-Service.csv" -Append -Encoding Default
Example conversion csv to xlsx:
ConvertFrom-XLSX "$home\Desktop\Get-Service.csv" "$home\Desktop\Get-Service.xlsx" # Object Export-csv to file
ConvertFrom-XLSX "$home\Desktop\Get-Service.csv" "$home\Desktop\Get-Service.xlsx" , # Default delimiter
.LINK
https://github.com/Lifailon/psModules
#>
Param (
[Parameter(Mandatory = $True, HelpMessage = "Source path to file csv")] $SourceCsv,
[Parameter(Mandatory = $True, HelpMessage = "Destination path to file xlsx")] $DestXlsx,
[Parameter(HelpMessage="Delimiter")] $Delimiter=","
)
$Excel = New-Object -ComObject excel.application
$WorkBook = $Excel.WorkBooks.Add(1)
$WorkSheet = $WorkBook.WorkSheets.Item(1)
$TxtConnector = ("TEXT;" + $SourceCsv)
$Connector = $WorkSheet.QueryTables.add($TxtConnector,$WorkSheet.Range("A1"))
$QueryTables = $WorkSheet.QueryTables.item($Connector.name)
$QueryTables.TextFileOtherDelimiter = $Delimiter
$QueryTables.Refresh()
$QueryTables.Delete()
$WorkBook.SaveAs($DestXlsx)
$Excel.Quit()
}