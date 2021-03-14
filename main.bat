@echo off
if %~x1 == .apk goto start
goto end

:start
cd "%~dp0"
xcopy "%1" "%~dp1/game.zip"
mkdir "%~dp1/ext"
echo ZipFile="%~dp1/game.zip" > thing.vbs
echo ExtractTo="%~dp1ext" >> thing.vbs
echo Set fso = CreateObject("Scripting.FileSystemObject") >> thing.vbs
echo If NOT fso.FolderExists(ExtractTo) Then >> thing.vbs
echo    fso.CreateFolder(ExtractTo) >> thing.vbs
echo End If >> thing.vbs
echo set objShell = CreateObject("Shell.Application") >> thing.vbs
echo set FilesInZip=objShell.NameSpace(ZipFile).items >> thing.vbs
echo objShell.NameSpace(ExtractTo).CopyHere(FilesInZip) >> thing.vbs
echo Set fso = Nothing >> thing.vbs
echo Set objShell = Nothing >> thing.vbs
wscript thing.vbs
del thing.vbs

:end
echo end
pause