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
rename %1 game.apk

cls
echo Data.rsdk has been found
echo If you want to mod it, you'll need retrun, which you can find at
echo https://github.com/Lavesiime/retrun
pause

:end