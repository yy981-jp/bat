@echo off

echo ����1
type con >%temp%\1
echo ����2
type con >%temp%\2
echo ��r
echo.
fc %temp%\1 %temp%\2
pause