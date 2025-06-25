@if not "%~0"=="%~dp0.\%~nx0" start /max cmd /c,"%~dp0.\%~nx0" %* & goto :eof
@echo off
taskkill /fi "windowtitle eq blank_type1" >nul
taskkill /fi "windowtitle eq 選択blank_type1" >nul
title blank_type1
pause>nul