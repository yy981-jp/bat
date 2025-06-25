@echo off
set out=0
:loop
set /p _=
if %_%==exit echo %out%&pause&exit
set /a out=%out%+%_%
goto loop