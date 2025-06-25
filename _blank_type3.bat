@echo off
chcp 65001 >nul
title blank_type3-counter
set z=0
set h=0
set b=0
set /p z=時間?
set /p h=分?
set /p b=秒?
set /a zb=%z%*3600
set /a hb=%h%*60
set /a time=%zb%+%hb%+%b%
echo %z%:%h%:%b% [%time%]
title blank_t3-c(%z%:%h%:%b% [%time%])
pause
timeout /t %time% /nobreak
echo @echo off >%temp%\blank_type3.bat
echo title blank_type3 >>%temp%\blank_type3.bat
echo pause ^>nul >>%temp%\blank_type3.bat
echo exit >>%temp%\blank_type3.bat
taskkill /fi "windowtitle eq blank_type3" >nul
taskkill /fi "windowtitle eq 選択blank_type3" >nul
start /max %temp%\blank_type3.bat >nul