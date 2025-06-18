# adb_folder_push
this project allows to push files from given local folder to an android device using adb

find files on android device:

powershell:
> adb shell
> ls target_dir > android_list.txt
> exit
> adb pull android_list.txt
adjust paths in diff.ps1 to reflect windows_list.txt and android_list.txt
make both lists consistent: to delete all path characters use: .*\\ and replace with nothing in Notepad++
> powershell -ExecutionPolicy Bypass -File diff.ps1
diff.txt contains the difference file

