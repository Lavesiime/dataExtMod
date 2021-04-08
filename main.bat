@echo off

::Move to this program's location
cd "%~dp0"
if exist ext\ (
    cd ext
) else (
    md ext
    cd ext
)
echo Extracting...
tar -xf "%1"
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

::Make it look cool
@echo on
retrun x ..\Data.rsdk -d=..\unpack -3 -L=RSDKv4FileList.txt
@echo off
cls
echo Data file extracted
pause

:end