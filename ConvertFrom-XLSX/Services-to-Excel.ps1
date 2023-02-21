$path = "$home\Desktop\Services-to-Excel.xlsx"
$Excel = New-Object -ComObject Excel.Application
$Excel.Visible = $false
$ExcelWorkBook = $Excel.Workbooks.Add() # Create book
$ExcelWorkSheet = $ExcelWorkBook.Worksheets.Item(1) # Create sheet
$ExcelWorkSheet.Name = "Services"
$ExcelWorkSheet.Cells.Item(1,1) = "Name service"
$ExcelWorkSheet.Cells.Item(1,2) = "Description"
$ExcelWorkSheet.Cells.Item(1,3) = "Status"
$ExcelWorkSheet.Cells.Item(1,4) = "Startup type"
$ExcelWorkSheet.Rows.Item(1).Font.Bold = $true
$ExcelWorkSheet.Rows.Item(1).Font.size=14
$ExcelWorkSheet.Columns.Item(1).ColumnWidth=30
$ExcelWorkSheet.Columns.Item(2).ColumnWidth=80
$ExcelWorkSheet.Columns.Item(3).ColumnWidth=15
$ExcelWorkSheet.Columns.Item(4).ColumnWidth=25
$services =  Get-Service
$counter = 2 # start from line 2
foreach ($service in $services) {
$status = $service.Status
if ($status -eq 1) {
$status_type = "Stopped"
} elseif ($status -eq 4) {
$status_type = "Running"
}
$Start = $service.StartType
if ($Start -eq 1) {
$start_type = "Delayed start"
} elseif ($Start -eq 2) {
$start_type = "Automatic"
} elseif ($Start -eq 3) {
$start_type = "Manually"
} elseif ($Start -eq 4) {
$start_type = "Disabled"
}
$ExcelWorkSheet.Columns.Item(1).Rows.Item($counter) = $service.Name
$ExcelWorkSheet.Columns.Item(2).Rows.Item($counter) = $service.DisplayName
$ExcelWorkSheet.Columns.Item(3).Rows.Item($counter) = $status_type
$ExcelWorkSheet.Columns.Item(4).Rows.Item($counter) = $start_type
$counter++ # +1 line
}
$ExcelWorkBook.SaveAs($path)
$ExcelWorkBook.close($true)
$Excel.Quit()

#$Excel = New-Object -ComObject Excel.Application
#$ExcelWorkBook = $excel.Workbooks.Open($path) # Open book
#$ExcelWorkBook.Sheets| fl Name # View sheets
#$ExcelWorkSheet = $ExcelWorkBook.Sheets.Item("Services") # Open Sheet
#1..200 | %{$ExcelWorkSheet.Range("A$_").Text} # Get cells data column A, lines 1 to 200