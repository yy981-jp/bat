@echo off
title 計算問題

echo ------------------------
echo /option	:設定の変更
echo /exit	:終了
echo next	:問題をパス
echo ------------------------

set start=1
set r=11
set s=0010
set d=0
set m=0
set loop=0
set point=0
set miss=0
set pass=0
set passon=1

choice /m 既定値を使用?
if %errorlevel%==1 goto start

:option
if %start%==0 choice /m 設定を変更する?
if %start%==0 if %errorlevel%==2 goto end
set /a r=%r%-1
set /p r="数字の範囲(最小値は0)の最大値を指定※空白の場合変更なし(今:%r%):"
set /p s="使用する四則演算記号を指定(掛け算,割り算,足し算,引き算(例:1001 ←掛け算^&引き算))※空白の場合変更なし(今:%s%):"
rem set /p d="小数点第何位まで使用するかを指定※空白の場合変更なし(今:%d%):"
choice /m "マイナスを使用?(今:%m%(1=はい 0=いいえ)):"
if %errorlevel%==1 set m=1
if %errorlevel%==2 set m=0
choice /m "パスを有効?(今:%passon%(1=はい 0=いいえ)):"
if %errorlevel%==1 set passon=1
if %errorlevel%==2 set passon=0

set s=%s:~0,4%
set /a r=%r%+1
if %r% leq 0 echo 数字の範囲の最大値が0以下です&goto option
if %s%==0000 echo 使用する四則演算記号が何も指定されていません&goto option
if %start%==1 set start=0


:start
set /a sr=%random%*4/32767
call set _=%%s:~%sr%,1%%
if %_%==0 goto start
if %sr%==0 set sn=*&set se=×
if %sr%==1 set sn=/&set se=÷
if %sr%==2 set sn=+&set se=＋
if %sr%==3 set sn=-&set se=－
if not %sr%==1 goto start_sr023
if %sr%==1 goto start_sr1

:start_sr023
set /a rr1=%random%*%r%/32767
set /a rr2=%random%*%r%/32767
if %sr%==3 if %m%==0 if %rr1% lss %rr2% goto start_sr023
set /a out=%rr1%%sn%%rr2%
set echo=%rr1%%se%%rr2%
goto end

:start_sr1
set /a rr1=%random%*%r%/32767
set /a rr2=%random%*%r%/32767
set /a rr2=%rr2%/%rr1%
set /a rr2=%rr1%*%rr2%
set /a out=%rr2%%sn%%rr1%
set echo=%rr2%÷%rr1%
goto end


:end
echo [%echo%]
:end_n
set /a rt=%r%-1
title 計算問題[0~%rt%,%s%,%m%,%passon%](解答回数=%loop%,〇=%point%,×=%miss%,パス=%pass%)

set in=nul
set /p in=解答:
if "%in%"=="nul" goto end_n
if "%in%"=="/option" goto option
if "%in%"=="/exit" goto exit
if "%in%"=="/echo on" echo on&goto end_n
if "%in%"=="/echo off" echo off&goto end_n
if "%in%"=="next" if %passon%==1 (
set /a pass=%pass%+1&echo 答え:%out%&goto start) else (echo パス機能はオフになっています&goto end_n)
if "%in%"=="%out%" set /a loop=%loop%+1&set /a point=%point%+1&echo 〇&goto start
if not "%in%"=="%out%" set /a loop=%loop%+1&set /a miss=%miss%+1&echo ×&goto end_n
echo error
goto start


:exit
choice /m (確認)終了?
if %errorlevel%==2 goto end

echo.
echo.
echo.
echo [設定^&結果]
echo 数字の範囲:0~%rt%
set s_exit=_
if %s:~0,1%==1 set s_exit=%s_exit%×
if %s:~1,1%==1 set s_exit=%s_exit%÷
if %s:~2,1%==1 set s_exit=%s_exit%＋
if %s:~3,1%==1 set s_exit=%s_exit%－
echo 使用する四則演算記号:%s_exit:~1,100%
if %m%==0 set m_exit=OFF
if %m%==1 set m_exit=ON
echo マイナスの使用:%m_exit%
if %passon%==0 set passon_exit=OFF
if %passon%==1 set passon_exit=ON
echo パスの有効:%passon_exit%
echo --------------------
echo 解答回数:%loop%
echo 〇:%point%
echo ×:%miss%
echo パス:%pass%
timeout /t 5 /nobreak>nul
pause