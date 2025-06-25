if %~x1==.cab goto k
goto a

:a
makecab %1 %1.cab
exit

:k
expand /r %1
exit
