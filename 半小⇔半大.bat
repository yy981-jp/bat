@echo off
chcp 65001>nul

:start
title START
set output=
set type_o=0
set type_k=0
set in_m=_error
set /p in_m=入力欄:
choice /c 0123 /m "0.再入力 1.大文字 2.反転 3.小文字"
if %errorlevel%==1 goto start
if %errorlevel%==2 set type_o=1
if %errorlevel%==3 set type_o=1&set type_k=1
if %errorlevel%==4 set type_k=1
set in_m=%in_m%`
set loop=0

:loop
set in=^%in_m:~0,1%
set in_m=%in_m:~1,10000000000%
if "%in%"=="`" goto end
set out=%in%

if %type_o%==1 (
if %in%==a set out=A
if %in%==b set out=B
if %in%==c set out=C
if %in%==d set out=D
if %in%==e set out=E
if %in%==f set out=F
if %in%==g set out=G
if %in%==h set out=H
if %in%==i set out=I
if %in%==j set out=J
if %in%==k set out=K
if %in%==l set out=L
if %in%==m set out=M
if %in%==n set out=N
if %in%==o set out=O
if %in%==p set out=P
if %in%==q set out=Q
if %in%==r set out=R
if %in%==s set out=S
if %in%==t set out=T
if %in%==u set out=U
if %in%==v set out=V
if %in%==w set out=W
if %in%==x set out=X
if %in%==y set out=Y
if %in%==z set out=Z
)
if %type_k%==1 (
if %in%==A set out=a
if %in%==B set out=b
if %in%==C set out=c
if %in%==D set out=d
if %in%==E set out=e
if %in%==F set out=f
if %in%==G set out=g
if %in%==H set out=h
if %in%==I set out=i
if %in%==J set out=j
if %in%==K set out=k
if %in%==L set out=l
if %in%==M set out=m
if %in%==N set out=n
if %in%==O set out=o
if %in%==P set out=p
if %in%==Q set out=q
if %in%==R set out=r
if %in%==S set out=s
if %in%==T set out=t
if %in%==U set out=u
if %in%==V set out=v
if %in%==W set out=w
if %in%==X set out=x
if %in%==Y set out=y
if %in%==Z set out=z
)

set output=%output%%out%
set /a title=%loop%+1
title %title%文字目を処理
set /a loop=%loop%+1
goto loop

:end
set /a loop=%loop%-1
title 処理終了

echo ^<出力^>
echo %output%
choice /m コピー?
if %errorlevel%==1 echo %output%|clip
goto start