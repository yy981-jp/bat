@echo off

compact /c /i /s:c:\
for /l %%a in (1,1,30) do echo.
rem cleanmgr.exe /D C: /verylowdisk /setup
exit