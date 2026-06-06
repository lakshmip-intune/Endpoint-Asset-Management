$Inventory = Import-Csv ".\Inventory.csv"

$SerialNumber = Read-Host "Enter Serial Number"

$Device = $Inventory | Where-Object {
    $_.SerialNumber -eq $SerialNumber
}

if ($Device)
{
    Write-Host ""
    Write-Host "Device Found"
    Write-Host ""

    $Device | Format-Table
}
else
{
    Write-Host ""
    Write-Host "Device Not Found"
}

$Inventory |
Export-Csv ".\InventoryReport.csv" -NoTypeInformation
