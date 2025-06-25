@echo off
chcp 65001>nul
title explorer

cd %systemdrive%\users\%username%\documents\

:ex_start

rem test


echo.
echo.
echo 上のほうにフォルダ　下のほうにファイルが表示されます

echo [操作方法]

echo フォルダ名         そのフォルダに移動

echo ファイル名         そのファイルを編集等

echo y9/reload          再読み込み

echo y9/cmd             デバック用

echo y9/back            上のフォルダに移動

echo y9/uback           ユーザーのフォルダに移動

echo y9/xback           最上のフォルダに移動

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
dir /b | find /c /v "">%temp%\ex_1.yy981
set /p ex_1=<%temp%\ex_1.yy981
cd>%temp%\cd.yy981 & set /p ex_path_d_m=<%temp%\cd.yy981
set ex_path_d=^"%ex_path_d_m%\^"
set ex_path_d_e=%ex_path_d_m%\
if %ex_path_d_e%==%systemdrive%\\ set ex_path_d_e=%ex_path_d_e:~0,3%

echo [%ex_path_d_e% ^| %ex_1%個のファイルとフォルダ]

dir /b /o>%temp%\ex_dir.yy981

for /l %%a in (1,1,%ex_1%) do (
findstr /n /r "." %temp%\ex_dir.yy981 | findstr /r "^%%a:"
)



echo.

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:ex_n_m_s
rem (((数字入力)))

set ex_n_m_s=y9/reload
set /p ex_n_m_s="数字を入力(y9/backと入力すると1つ上に戻る): "

if %ex_n_m_s%==y9/reload goto ex_start
if %ex_n_m_s%==y9/cmd    goto ex_cmd & goto ex_start
if %ex_n_m_s%==y9/back   cd .. >nul & goto ex_start
if %ex_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_start
if %ex_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_start

findstr /n /r "." %temp%\ex_dir.yy981 | findstr /r "^%ex_n_m_s%:">%temp%\ex_dir_h.yy981
for /f "delims=" %%a in (%temp%\ex_dir_h.yy981) do set ex_dir_h=%%a

if %ex_n_m_s% leq 0 echo エラー(1以上を入力してください) goto ex_n_m_s_s
if %ex_n_m_s% leq 9 set ex_s=%ex_dir_h:~2%&goto ex_n_m_s_s
if %ex_n_m_s% leq 99 set ex_s=%ex_dir_h:~3%&goto ex_n_m_s_s
if %ex_n_m_s% leq 999 set ex_s=%ex_dir_h:~4%&goto ex_n_m_s_s
if %ex_n_m_s% leq 9999 set ex_s=%ex_dir_h:~5%&goto ex_n_m_s_s
if %ex_n_m_s% leq 99999 set ex_s=%ex_dir_h:~6%&goto ex_n_m_s_s
if %ex_n_m_s% geq 100000 echo エラー(数字以外もしくは100000以上には対応していません)&goto ex_n_m_s_s

echo エラー
goto ex_start

:ex_n_m_s_s
set ex_n=^"%ex_path_d_e%%ex_s%^"
set ex_n_e=%ex_path_d_e%%ex_s%
cd %ex_n%>nul
if %errorlevel%==1 goto ex_file 
goto ex_start

rem cmd
:ex_cmd
set cmd=rem _
set /p cmd=cmd_
%cmd%

goto ex_start

cd 
echo エラー
goto ex_start

:ex_file

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rem 処理部分
rem 
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo 0,キャンセル

echo 1,実行

echo 2,コピー

echo 3,削除

echo 4,移動

echo 5,名前の変更

choice /c:012345
if %errorlevel%==1 goto ex_start
if %errorlevel%==2 goto ex_file_1
if %errorlevel%==3 goto ex_file_2
if %errorlevel%==4 goto ex_file_3
if %errorlevel%==5 goto ex_file_4
if %errorlevel%==6 goto ex_file_5





:ex_file_1

echo %ex_n_e%を実行しますか?

choice
if %errorlevel%==2 echo %ex_n_e%の実行をキャンセルしました & goto ex_start

start "" %ex_n%
echo %ex_n_e%を実行します

goto ex_start
:ex_file_2

echo %ex_n_e%をコピーしますか?

choice
if %errorlevel%==2 echo %ex_n%のコピーをキャンセルしました & goto ex_start

copy %ex_n% "y9 - %ex_s%" >nul
echo [%ex_n_e%]を["y9 - %ex_s%"]という名前でコピーしました

goto ex_start
:ex_file_3

echo %ex_n_e%を削除しますか?

choice
if %errorlevel%==2 echo %ex_n%の削除をキャンセルしました & goto ex_start
del %ex_n%
echo %ex_n_e%を削除しました

goto ex_start
:ex_file_4

echo %ex_n_e%を移動させますか?

choice
if %errorlevel%==2 echo %ex_n_e%の移動をキャンセルしました & goto ex_start
goto ex_f4_start

:ex_f4_exit
choice /m このファイルを選択しますか?
if %errorlevel%==2 goto ex_f4_start
set ex_f4_output=^"%ex_f4_path_d_m%^"

move %ex_n% %ex_f4_output%
echo %ex_n_e%を%ex_f4_path_d_m%に移動しました

goto ex_start
:ex_file_5
echo %ex_n_e%の名前を変更しますか?

choice
if %errorlevel%==2 echo %ex_n%の名前の変更をキャンセルしました & goto ex_start
set /p ex_file_5_name=%ex_n%変更後の名前を入力: "

ren %ex_n% %ex_file_5_name%
echo %ex_n_e%を%ex_file_5_name%に変更しました

goto ex_start
_________________________________________________
:ex_f4_start

rem test
echo.
echo.

echo 上のほうにフォルダ　下のほうにファイルが表示されます

echo 空白のみ入力するとバグが発生することがあります

echo [操作方法]

echo フォルダ名         そのフォルダに移動

echo ファイル名         そのファイルを編集等

echo y9/reload          再読み込み

echo y9/cmd             デバック用

echo y9/back            上のフォルダに移動

echo y9/uback           ユーザーのフォルダに移動

echo y9/xback           最上のフォルダに移動

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
dir /b | find /c /v "">%temp%\ex_f4_1.yy981
set /p ex_f4_1=<%temp%\ex_f4_1.yy981
cd>%temp%\f4_cd.yy981 & set /p ex_f4_path_d_m=<%temp%\f4_cd.yy981
set ex_f4_path_d=^"%ex_f4_path_d_m%\^"
set ex_f4_path_d_e=%ex_f4_path_d_m%\

echo [移動先のフォルダーにあるファイルを選択]

echo [%ex_f4_path_d_e% ^| %ex_f4_1%個のファイルとフォルダ]

dir /b /o>%temp%\ex_f4_dir.yy981

for /l %%a in (1,1,%ex_f4_1%) do (
findstr /n /r "." %temp%\ex_f4_dir.yy981 | findstr /r "^%%a:"
)



echo.

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:ex_f4_n_m_s
rem (((数字入力)))

set ex_f4_n_m_s=y9/reload
set /p ex_f4_n_m_s="数字を入力(y9/backと入力すると1つ上に戻る): "

if %ex_f4_n_m_s%==y9/reload goto ex_f4_start
if %ex_f4_n_m_s%==y9/cmd    goto ex_f4_cmd & goto ex_f4_start
if %ex_f4_n_m_s%==y9/back   cd .. >nul & goto ex_f4_start
if %ex_f4_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_f4_start
if %ex_f4_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_f4_start

findstr /n /r "." %temp%\ex_f4_dir.yy981 | findstr /r "^%ex_f4_n_m_s%:">%temp%\ex_f4_dir_h.yy981
for /f "delims=" %%a in (%temp%\ex_f4_dir_h.yy981) do set ex_f4_dir_h=%%a

if %ex_f4_n_m_s% leq 0 echo エラー(1以上を入力してください) goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 9 set ex_f4_s=%ex_f4_dir_h:~2%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 99 set ex_f4_s=%ex_f4_dir_h:~3%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 999 set ex_f4_s=%ex_f4_dir_h:~4%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 9999 set ex_f4_s=%ex_f4_dir_h:~5%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 99999 set ex_f4_s=%ex_f4_dir_h:~6%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% geq 100000 echo エラー(数字以外もしくは100000以上には対応していません)&goto ex_f4_n_m_s_s

echo エラー
goto ex_f4_start

:ex_f4_n_m_s_s
set ex_f4_n=^"%ex_f4_path_d_e%%ex_f4_s%^"
set ex_f4_n_e=%ex_f4_path_d_e%%ex_f4_s%
cd %ex_f4_n%>nul
if %errorlevel%==1 goto ex_f4_exit
goto ex_f4_start

rem cmd
:ex_f4_cmd
set cmd=rem _
set /p f4_cmd=cmd_
%f4_cmd%
goto ex_f4_start
