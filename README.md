# adb_folder_push
this project allows to push files from given local folder to an android device using adb

SHIFT+Right Click on files you want to copy and select "Copy as Path", save as "win_list.txt". 
Delete all path characters use Notepad++ and replace .*\\ and " with nothing. Save as "list_windows_plain.txt"
> get_diff.bat
diff.txt contains the difference file
adjust the push_to_phone directory paths for source and target
> push_to_phone.bat
if you want to temprarily suspend copying, simply press CTRL+C and take the phone away, after comming back press "N". One file will be skipped
>get_diff.bat
make sure the diff.txt file is empty, if not push_to_phone.bat again
at the end run
> powershell -ExecutionPolicy Bypass -File delete_files.ps1 -file win_list.txt

