@echo off
chcp 65001>nul
title bit確認

set error=1
if %processor_architecture%==AMD64 set bit=64bit&set error=0
if %processor_architecture%==x86 set bit=32bit&set error=0
if %error%==1 (
echo エラー このbatファイルでは調べることが出来ませんでした 個人的におすすめのサイトに飛びますか? https://jp.piliapp.com/what-is-my/computer-32bit-64bit/
choice
if %errorlevel%==1 start https://jp.piliapp.com/what-is-my/computer-32bit-64bit/
goto end
)
echo %bit%

:end
echo 何かキーを押して終了
pause >nul
