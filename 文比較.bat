@echo off

echo ì¸óÕ1
type con >%temp%\1
echo ì¸óÕ2
type con >%temp%\2
echo î‰är
echo.
fc %temp%\1 %temp%\2
pause