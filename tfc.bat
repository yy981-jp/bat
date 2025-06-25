@echo off

tree /f %1 > %temp%\1.txt
tree /f %2 > %temp%\2.txt
more +3 %temp%\1.txt > %temp%\c1.txt
more +3 %temp%\2.txt > %temp%\c2.txt
fc %temp%\c1.txt %temp%\c2.txt