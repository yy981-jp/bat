@echo off
chcp 65001>nul
title タイマー

set h=0
set m=0
set s=0
set /p h=時間?
set /p m=分?
set /p s=秒?
set /a hs=%h%*360
set /a ms=%m%*60
set /a c=%hs%+%ms%+%s%
echo %c%s (%h%h,%m%m,%s%s)
echo @echo off^&chcp 65001^&title %c%s (%h%h,%m%m,%s%s) >%temp%\timer.bat
echo timeout /t %c% /nobreak >>%temp%\timer.bat
echo msg %username% /w %c%s (%h%h,%m%m,%s%s)のタイマーが終了(%%date%%_%%time%%) >>%temp%\timer.bat
echo exit >>%temp%\timer.bat
echo 何かキーを押して開始
pause >nul
start /min %temp%\timer.bat