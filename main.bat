@echo off
if %~x1 == .apk goto start
goto end

:start
setlocal
cd /d %~dp0
Call :UnZipFile "C:\Temp" "%~1"
exit /b
:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
echo Unzipped
pause
move "C:\Temp\assets\Data.rsdk.xmf" "%~dp1\Data.rsdk"
echo Moved
pause
del /Q "C:\Temp"
echo Deleted
pause
goto end

:end
echo end
pause