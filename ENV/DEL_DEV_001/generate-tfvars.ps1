
param (
    [string]$CsvPath,
    [string]$TfvarsFolderPath
)

Write-Host "Reading CSV file..."
Write-Host "CSV Path: $CsvPath"
Write-Host "Terraform variables folder: $TfvarsFolderPath"

# Read CSV file
$rgs = Import-Csv -Path $CsvPath

Write-Host "CSV file read successfully."
Write-Host "Total Resource Groups: $($rgs.Count)"

# Create Terraform map
$tfvarsContent = "rgs = {`n"

$index = 1

foreach ($rg in $rgs) {

    $tfvarsContent += "  rg$index = {`n"
    $tfvarsContent += "    name     = `"$($rg.resource_group_name)`"`n"
    $tfvarsContent += "    location = `"$($rg.location)`"`n"
    $tfvarsContent += "  }`n"

    $index++
}

$tfvarsContent += "}`n"

# Create terraform.tfvars
$TfvarsPath = Join-Path $TfvarsFolderPath "terraform.tfvars"

$tfvarsContent | Out-File -FilePath $TfvarsPath -Encoding utf8

Write-Host ""
Write-Host "======================================"
Write-Host "terraform.tfvars created successfully!"
Write-Host "Location: $TfvarsPath"
Write-Host "======================================"

Get-Content $TfvarsPath

