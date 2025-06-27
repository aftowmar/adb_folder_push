@echo off
set "SOURCE=C:\Users\user\Pictures"
set "TARGET=storage/emulated/0/DCIM"
set "tmp=android_list.txt"
del %tmp%
echo checking "%TARGET%/" contents...
adb shell ls "%TARGET%/" > "%tmp%"
if exist "list_windows_plain.txt" (
    if exist "%tmp%" (
        powershell -ExecutionPolicy Bypass -File diff.ps1 -source_file "list_windows_plain.txt" -target_file "android_list.txt" -output_file "diff.txt"
    ) else (
        echo ERROR: %tmp% not found, somthing went wrong with adb
        exit /b 1
    )
) else (
    echo ERROR: list_windows_plain.txt not found, use SHIFT+Right Click, Copy as Path on files you want to copy and save as list_windows_plain.txt
    exit /b 1
)