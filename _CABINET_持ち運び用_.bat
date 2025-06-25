if %~x1==.cab goto k
goto a

:a
makecab %1 %1.cab
del %1
del %0

:k
expand /r %1
del %1
del %0
