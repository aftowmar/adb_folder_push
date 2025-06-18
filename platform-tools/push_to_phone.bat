@echo off
setlocal enabledelayedexpansion
set "SOURCE=C:\Users\mjaft\Pictures\iCloud Photos\Photos"
set "TARGET=storage/emulated/0/Download/iCloud"
set "LIST=diff.txt"

:: Count total number of lines (files)
set "filecount=0"
set "index=0"
for /f "usebackq delims=" %%F in ("%LIST%") do (
    set /a filecount+=1
)
for /f "usebackq delims=" %%F in ("%LIST%") do (
    ::set "FULLPATH=%%F"
    set "FILENAME=%%F"
    set "FULLPATH=%SOURCE%\!FILENAME!"
    set /a index+=1
    if exist "!FULLPATH!" (
        echo [!index!/!filecount!] adb push !FULLPATH! "%TARGET%/"  
        adb push "!FULLPATH!" "%TARGET%/" >nul
        if errorlevel 1 (
            echo ERROR: Failed to push !FULLPATH!
        )
    ) else (
        echo WARNING: File not found - !FULLPATH!
    )
)

cmd -k