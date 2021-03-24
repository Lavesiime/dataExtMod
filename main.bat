@echo off
cd "%~dp0"
if exist ext\ (
    cd ext
) else (
    md ext
    cd ext
)
rename %1 game.zip
tar -xf "%~dp1\game.zip"
cd assets
if exist Data.rsdk.xmf (
    move Data.rsdk.xmf "%~dp0"
) else (
    cls
    echo Data.rsdk couldn't be found
    echo Make sure you're using the right apk file
    pause
    goto end
)
cd ..
cd ..
rename Data.rsdk.xmf Data.rsdk
rmdir /q /s ext
::Below doesn't work for some reason, not sure why
cd "%~dp1"
rename game.zip game.apk

cls
echo Data.rsdk has been found
echo If you want to use mods, you'll need to extract the Data.rsdk
set /p answer=Do you want to extract it? (y/n)
cls
if %answer%==Y goto unpack
if %answer%==y goto unpack
goto end

:unpack
cd "%~dp0"
cd batch
echo Unpacking...

retrun x ..\Data.rsdk -d=..\Unpack -3 -L=RSDKv4FileList.txt
cls
echo Data file extracted
pause

:end
