# PowerShell Script: diff.ps1
param (
    [string]$source_file = 'list_windows_plain.txt',
    [string]$target_file = 'android_list.txt',
    [string]$output_file = 'diff.txt'
)
$source = Get-Content $source_file
$source_len = ($source | Measure-Object -Line).Lines
$target = Get-Content $target_file
$target_len = ($target | Measure-Object -Line).Lines
$missing = $source | Where-Object { $_ -notin $target }
$missing_len = ($missing | Measure-Object -Line).Lines
$missing | Set-Content $output_file
Write-Output "Found $source_len files in source, $target_len files in target, missing $missing_len files written to $output_file"