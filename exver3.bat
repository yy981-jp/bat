rem @echo off
title explorer

cd %systemdrive%\users\%username%\documents\

set ex_type-f4=0
set ex_type-r=+r
set ex_type-h=+h
set ex_type-a=+a
set ex_type-s=-s
set ex_n_m_s_s=0
goto ex_type-s

:ex_start
set ex_type-f4=0

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

echo y9/type            表示内容の選択

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo dir /b /a:d%ex_type% ^| find /c /v ""^>%temp%\ex_1.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min /wait %temp%\ex.bat
echo dir /b /a:-d%ex_type% ^| find /c /v ""^>%temp%\ex_2.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min /wait %temp%\ex.bat

set /p ex_1=<%temp%\ex_1.yy981
set /p ex_2=<%temp%\ex_2.yy981
set /a ex_3=%ex_1%+%ex_2%+1
set /a ex_4=%ex_3%-1
set /a ex_5=%ex_1%+1
set /a ex_6=%ex_3%+1
cd>%temp%\cd.yy981 & set /p ex_path_d_m=<%temp%\cd.yy981
set ex_path_d=^"%ex_path_d_m%\^"
set ex_path_d_e=%ex_path_d_m%\
if %ex_path_d%=="%systemdrive%\\" set ex_path_d_e=%ex_path_d_e:~0,3%

echo [%ex_path_d_e% ^| D=%ex_1%,F=%ex_2%,ALL=%ex_4% ^| O=(%ex_type%)]

type nul >%temp%\ex_dir.yy981
echo dir /b /o /a:d%ex_type% ^>^>%temp%\ex_dir.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min /wait %temp%\ex.bat
echo ^<=============================================^> >>%temp%\ex_dir.yy981
echo dir /b /o /a:-d%ex_type% ^>^>%temp%\ex_dir.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min %temp%\ex.bat

for /l %%a in (1,1,%ex_3%) do (
findstr /n /r "." %temp%\ex_dir.yy981 | findstr /r "^%%a:"
)



echo.

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:ex_n_m_s
rem (((数字入力)))

set ex_n_m_s=y9/reload
set /p ex_n_m_s=数字を入力(y9/backと入力すると1つ上に戻る):
set ex_n_m_s=%ex_n_m_s: =%
rem ↑ここ何とかできそう

if %ex_n_m_s%==%ex_5%    echo これはフォルダとファイルを区切るものです&goto ex_start
if %ex_n_m_s%==y9/reload goto ex_start
if %ex_n_m_s%==y9/cmd    goto ex_cmd & goto ex_start
if %ex_n_m_s%==y9/back   cd .. >nul & goto ex_start
if %ex_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_start
if %ex_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_start
if %ex_n_m_s%==y9/type   goto ex_type-choice


findstr /n /r "." %temp%\ex_dir.yy981 | findstr /r "^%ex_n_m_s%:">%temp%\ex_dir_h.yy981
for /f "delims=" %%a in (%temp%\ex_dir_h.yy981) do set ex_dir_h=%%a

if %ex_n_m_s% geq %ex_6% echo エラー(ファイルorフォルダ名の左側に表示された数字を入力してください)&goto ex_n_m_s
if %ex_n_m_s% leq 0 echo エラー(1以上を入力してください)&goto ex_n_m_s
if %ex_n_m_s% leq 9 set ex_s=%ex_dir_h:~2%&goto ex_n_m_s_s
if %ex_n_m_s% leq 99 set ex_s=%ex_dir_h:~3%&goto ex_n_m_s_s
if %ex_n_m_s% leq 999 set ex_s=%ex_dir_h:~4%&goto ex_n_m_s_s
if %ex_n_m_s% leq 9999 set ex_s=%ex_dir_h:~5%&goto ex_n_m_s_s
if %ex_n_m_s% leq 99999 set ex_s=%ex_dir_h:~6%&goto ex_n_m_s_s
if %ex_n_m_s% geq 100000 echo エラー(数字以外もしくは100000以上には対応していません)&goto ex_n_m_s

echo エラー
goto ex_start

:ex_n_m_s_s
set ex_n=^"%ex_path_d_e%%ex_s%^"
set ex_n_e=%ex_path_d_e%%ex_s%
echo cd %ex_n% >%temp%\ex.bat
echo echo %%errorlevel%%_ ^>%temp%\ex_df.yy981 >>%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min %temp%\ex.bat
:ex_df_loop
if not exist %temp%\ex_df.yy981 goto ex_df_loop
set /p ex_df=<%temp%\ex_df.yy981
set ex_df=%ex_df:~0,1%
del %temp%\ex_df.yy981
if %ex_df%==1 goto ex_file
cd %ex_n% & goto ex_start

rem cmd
:ex_cmd
set cmd=rem _
set /p cmd=cmd_
%cmd%

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
set ex_type-f4=1

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
echo dir /b /a:d%ex_type% ^| find /c /v ""^>%temp%\ex_f4_1.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min /wait %temp%\ex.bat
echo dir /b /a:-d%ex_type% ^| find /c /v ""^>%temp%\ex_f4_2.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min /wait %temp%\ex.bat

set /p ex_f4_1=<%temp%\ex_f4_1.yy981
set /p ex_f4_2=<%temp%\ex_f4_2.yy981
set /a ex_f4_3=%ex_f4_1%+%ex_f4_2%+1
set /a ex_f4_4=%ex_f4_3%-1
set /a ex_f4_5=%ex_f4_1%+1
set /a ex_f4_6=%ex_f4_3%+1

set /p ex_f4_1=<%temp%\ex_f4_1.yy981
cd>%temp%\f4_cd.yy981 & set /p ex_f4_path_d_m=<%temp%\f4_cd.yy981
set ex_f4_path_d=^"%ex_f4_path_d_m%\^"
set ex_f4_path_d_e=%ex_f4_path_d_m%\
if %ex_f4_path_d%=="%systemdrive%\\" set ex_f4_path_d_e=%ex_f4_path_d_e:~0,3%

echo [移動先のフォルダーにあるファイルを選択]

echo [%ex_f4_path_d_e% ^| D=%ex_f4_1%,F=%ex_f4_2%,ALL=%ex_f4_4% ^| O=(%ex_type%)]

type nul >%temp%\ex_f4_dir.yy981
echo dir /b /o /a:d%ex_type% ^>^>%temp%\ex_f4_dir.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min /wait %temp%\ex.bat
echo ^<=============================================^> >>%temp%\ex_f4_dir.yy981
echo dir /b /o /a:-d%ex_type% ^>^>%temp%\ex_f4_dir.yy981 >%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min /wait %temp%\ex.bat

for /l %%a in (1,1,%ex_f4_3%) do (
findstr /n /r "." %temp%\ex_f4_dir.yy981 | findstr /r "^%%a:"
)



echo.

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:ex_f4_n_m_s
rem (((数字入力)))

set ex_f4_n_m_s=y9/reload
set /p ex_f4_n_m_s=数字を入力(y9/backと入力すると1つ上に戻る):

if %ex_f4_n_m_s%==%ex_f4_5%    echo これはフォルダとファイルを区切るものです&goto ex_start
if %ex_f4_n_m_s%==y9/reload goto ex_f4_start
if %ex_f4_n_m_s%==y9/cmd    goto ex_f4_cmd & goto ex_f4_start
if %ex_f4_n_m_s%==y9/back   cd .. >nul & goto ex_f4_start
if %ex_f4_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_f4_start
if %ex_f4_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_f4_start
if %ex_f4_n_m_s%==y9/type   goto ex_type-choice

findstr /n /r "." %temp%\ex_f4_dir.yy981 | findstr /r "^%ex_f4_n_m_s%:">%temp%\ex_f4_dir_h.yy981
for /f "delims=" %%a in (%temp%\ex_f4_dir_h.yy981) do set ex_f4_dir_h=%%a

if %ex_f4_n_m_s% geq %ex_f4_6% echo エラー(ファイルorフォルダ名の左側に表示された数字を入力してください)&goto ex_f4_n_m_s
if %ex_f4_n_m_s% leq 0 echo エラー(1以上を入力してください)&goto ex_f4_n_m_s
if %ex_f4_n_m_s% leq 9 set ex_f4_s=%ex_f4_dir_h:~2%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 99 set ex_f4_s=%ex_f4_dir_h:~3%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 999 set ex_f4_s=%ex_f4_dir_h:~4%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 9999 set ex_f4_s=%ex_f4_dir_h:~5%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 99999 set ex_f4_s=%ex_f4_dir_h:~6%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% geq 100000 echo エラー(数字以外もしくは100000以上には対応していません)&goto ex_f4_n_m_s

echo エラー
goto ex_f4_start

:ex_f4_n_m_s_s
set ex_f4_n=^"%ex_f4_path_d_e%%ex_f4_s%^"
set ex_f4_n_e=%ex_f4_path_d_e%%ex_f4_s%
echo cd %ex_f4_n% >%temp%\ex.bat
echo echo %%errorlevel%%_ ^>%temp%\ex_f4_df.yy981 >>%temp%\ex.bat
echo exit >>%temp%\ex.bat
start /min %temp%\ex.bat
:ex_f4_df_loop
if not exist %temp%\ex_f4_df.yy981 goto ex_f4_df_loop
set /p ex_f4_df=<%temp%\ex_f4_df.yy981
set ex_f4_df=%ex_f4_df:~0,1%
del %temp%\ex_f4_df.yy981
if %ex_df%==1 goto ex_f4_exit
cd %ex_n% & goto ex_start

rem cmd
:ex_f4_cmd
set cmd=rem _
set /p f4_cmd=cmd_
%f4_cmd%
goto ex_f4_start

:ex_type-choice
echo R 読取り専用ファイル   %ex_type-r%
echo H 隠しファイル         %ex_type-h%
echo A アーカイブファイル   %ex_type-a%
echo S システムファイル     %ex_type-s%
echo E 選択終了

choice /c rhase
if %errorlevel%==1 (
if %ex_type-r%==-r set ex_type-r=+r
if %ex_type-r%==+r set ex_type-r=-r
)
if %errorlevel%==2 (
if %ex_type-h%==-h set ex_type-h=+h
if %ex_type-h%==+h set ex_type-h=-h
)
if %errorlevel%==3 (
if %ex_type-a%==-a set ex_type-a=+a
if %ex_type-a%==+a set ex_type-a=-a
)
if %errorlevel%==4 (
if %ex_type-s%==-s set ex_type-s=+s
if %ex_type-s%==+s set ex_type-s=-s
)
if %errorlevel%==5 goto ex_type-s

goto ex_type-choice

:ex_type-s
set ex_type=%ex_type-r%%ex_type-h%%ex_type-a%%ex_type-s%
set ex_type=%ex_type:+r=%
set ex_type=%ex_type:+h=%
set ex_type=%ex_type:+a=%
set ex_type=%ex_type:+s=%
if %ex_type-f4%==1 goto ex_f4_start
goto ex_start