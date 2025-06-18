# PowerShell Script: diff.ps1
$source = Get-Content "list_windows_plain.txt"
$target = Get-Content "list_android.txt"

$missing = $source | Where-Object { $_ -notin $target }

$missing | Set-Content "diff.txt"
Write-Output "Done. Missing files written to diff.txt"