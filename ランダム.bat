@echo off
chcp 65001


echo [処理に時間がかかる場合があります]
echo.

:@3b_start
set @3b_type= 
set @3b_loop=1
set /p @3b_u_loop=文字数を入力してください:
set @3b_output= 
set @3b_nul= 

echo 1. 数字

echo 2. アルファベット小文字

echo 3. アルファベット大文字

echo 4. アルファベット小文字+アルファベット大文字

echo 5. 数字+アルファベット小文字

echo 6. 数字+アルファベット大文字

echo 7. 数字+アルファベット小文字+アルファベット大文字

:@3b_restart
%@3b_type%choice /c 1234567%@3b_nul%
if %errorlevel%==1 set @3b_type=echo 1^|&goto @3b_start_1
if %errorlevel%==2 set @3b_type=echo 2^|&goto @3b_start_2
if %errorlevel%==3 set @3b_type=echo 3^|&goto @3b_start_3
if %errorlevel%==4 set @3b_type=echo 4^|&goto @3b_start_4
if %errorlevel%==5 set @3b_type=echo 5^|&goto @3b_start_5
if %errorlevel%==6 set @3b_type=echo 6^|&goto @3b_start_6
if %errorlevel%==7 set @3b_type=echo 7^|&goto @3b_start_7

echo エラー
goto @3b_restart

:@3b_start_1
goto @3b_numbers

:@3b_start_2
goto @3b_alphabet_k

:@3b_start_3
goto @3b_alphabet_o

:@3b_start_4
set /a @3b_start_test=%random%*2/32767
if %@3b_start_test%==0 goto @3b_alphabet_k
if %@3b_start_test%==1 goto @3b_alphabet_o

:@3b_start_5
set /a @3b_start_test=%random%*2/32767
if %@3b_start_test%==0 goto @3b_alphabet_k
if %@3b_start_test%==1 goto @3b_numbers

:@3b_start_6
set /a @3b_start_test=%random%*2/32767
if %@3b_start_test%==0 goto @3b_alphabet_o
if %@3b_start_test%==1 goto @3b_numbers

:@3b_start_7
set /a @3b_start_test=%random%*3/32767
if %@3b_start_test%==0 goto @3b_alphabet_k
if %@3b_start_test%==1 goto @3b_alphabet_o
if %@3b_start_test%==2 goto @3b_numbers

rem -------------------------

:@3b_alphabet_k
set /a @3b_alphabet_k=%random%*27/32767

if %@3b_alphabet_k%==1 set @3b__output_=a
if %@3b_alphabet_k%==2 set @3b__output_=b
if %@3b_alphabet_k%==3 set @3b__output_=c
if %@3b_alphabet_k%==4 set @3b__output_=d
if %@3b_alphabet_k%==5 set @3b__output_=e
if %@3b_alphabet_k%==6 set @3b__output_=f
if %@3b_alphabet_k%==7 set @3b__output_=g
if %@3b_alphabet_k%==8 set @3b__output_=h
if %@3b_alphabet_k%==9 set @3b__output_=i
if %@3b_alphabet_k%==10 set @3b__output_=l
if %@3b_alphabet_k%==11 set @3b__output_=k
if %@3b_alphabet_k%==12 set @3b__output_=l
if %@3b_alphabet_k%==13 set @3b__output_=m
if %@3b_alphabet_k%==14 set @3b__output_=n
if %@3b_alphabet_k%==15 set @3b__output_=o
if %@3b_alphabet_k%==16 set @3b__output_=p
if %@3b_alphabet_k%==17 set @3b__output_=q
if %@3b_alphabet_k%==18 set @3b__output_=r
if %@3b_alphabet_k%==19 set @3b__output_=s
if %@3b_alphabet_k%==20 set @3b__output_=t
if %@3b_alphabet_k%==21 set @3b__output_=u
if %@3b_alphabet_k%==22 set @3b__output_=v
if %@3b_alphabet_k%==23 set @3b__output_=w
if %@3b_alphabet_k%==24 set @3b__output_=x
if %@3b_alphabet_k%==25 set @3b__output_=y
if %@3b_alphabet_k%==26 set @3b__output_=z

if %@3b_alphabet_k%==0 goto @3b_alphabet_k
goto @3b_set

:@3b_alphabet_o
set /a @3b_alphabet_o=%random%*27/32767

if %@3b_alphabet_o%==1 set @3b__output_=A
if %@3b_alphabet_o%==2 set @3b__output_=B
if %@3b_alphabet_o%==3 set @3b__output_=C
if %@3b_alphabet_o%==4 set @3b__output_=D
if %@3b_alphabet_o%==5 set @3b__output_=E
if %@3b_alphabet_o%==6 set @3b__output_=F
if %@3b_alphabet_o%==7 set @3b__output_=G
if %@3b_alphabet_o%==8 set @3b__output_=H
if %@3b_alphabet_o%==9 set @3b__output_=I
if %@3b_alphabet_o%==10 set @3b__output_=J
if %@3b_alphabet_o%==11 set @3b__output_=K
if %@3b_alphabet_o%==12 set @3b__output_=L
if %@3b_alphabet_o%==13 set @3b__output_=M
if %@3b_alphabet_o%==14 set @3b__output_=N
if %@3b_alphabet_o%==15 set @3b__output_=O
if %@3b_alphabet_o%==16 set @3b__output_=P
if %@3b_alphabet_o%==17 set @3b__output_=Q
if %@3b_alphabet_o%==18 set @3b__output_=R
if %@3b_alphabet_o%==19 set @3b__output_=S
if %@3b_alphabet_o%==20 set @3b__output_=T
if %@3b_alphabet_o%==21 set @3b__output_=U
if %@3b_alphabet_o%==22 set @3b__output_=V
if %@3b_alphabet_o%==23 set @3b__output_=W
if %@3b_alphabet_o%==24 set @3b__output_=X
if %@3b_alphabet_o%==25 set @3b__output_=Y
if %@3b_alphabet_o%==26 set @3b__output_=Z

if %@3b_alphabet_o%==0 goto @3b_alphabet_o
goto @3b_set

:@3b_numbers
set /a @3b_numbers=%random%*10/32767
set @3b__output_=%@3b_numbers%
goto @3b_set

:@3b_set
set @3b_nul=^>nul
set @3b_output=%@3b_output%%@3b__output_%
if %@3b_loop%==%@3b_u_loop% goto @3b_end
set /a @3b_loop=%@3b_loop%+1
goto @3b_restart

:@3b_end
echo.
echo ^<出力^>
echo%@3b_output%
echo.

choice /m 乱数をコピーしますか?
if %errorlevel%==1 echo%@3b_output%|clip
echo 何かキーを押して続行
pause >nul
goto @3b_start