param (
    [string]$file
)
Get-Content $file | ForEach-Object { Remove-Item -Force ($_ -replace '^"|"$') }
