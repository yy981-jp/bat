@echo off
:f_start
set file="*.txt" 
:start
echo (今:%file%)"で囲んでください 後ろにスペースを空け、前に*.を付けてください(例:"*.bat" )
set /p file="調べる対象のファイル拡張子を追加:"
choice /c ync /m "OK?(Y=OK,N=調べる対象のファイルを追加,C=調べる対象のファイルをクリア):"
if %errorlevel%==1 goto g_start
if %errorlevel%==2 goto goto start
if %errorlevel%==3 set file=&goto start

:g_start
rem ex_mode0=一般
rem ex_mode1=指定後ex_mode0に戻る
rem ex_mode2=埋め込み

cd %systemdrive%\users\%username%\documents\

set ex_mode=2
set ex_type-f4=0
set ex_type-r=+r
set ex_type-h=+h
set ex_type-a=+a
set ex_type-s=-s
set ex_n_m_s_s=0
set ex_return-point=nul
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
goto ex_type-s

:ex_start

echo.
echo.

echo 指定したいフォルダ内のファイルを選択してください
if %ex_return-point%==file_4 echo [移動先のフォルダーにあるファイルを選択]
if %ex_return-point%==file_1 echo [ファイル選択]

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
set ex_n_m_s=%ex_n_m_s:^&=%
rem ↑ここ何とかできそう

if %ex_n_m_s%==%ex_5%    echo これはフォルダとファイルを区切るものです&goto ex_start
if %ex_n_m_s%==y9/reload goto ex_start
if %ex_n_m_s%==y9/cmd    goto ex_cmd
if %ex_n_m_s%==y9/back   cd .. >nul & goto ex_start
if %ex_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_start
if %ex_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_start
if %ex_n_m_s%==y9/type   goto ex_type-choice
set ex_n_m_s=%ex_n_m_s: =%

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
if %ex_df%==1 (
if %ex_mode%==0 goto ex_file
if %ex_mode%==1 goto ex_mode1_exit
if %ex_mode%==2 goto ex_mode1_exit
echo エラー&goto ex_start
)
cd %ex_n% & goto ex_start

:ex_mode1_exit
choice /m このファイルを選択しますか?
if %errorlevel%==2 goto ex_start
if %ex_mode%==2 goto ex_end
set ex_mode=0
goto ex_%ex_return-point%_exit

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

echo %ex_n_e%を実行しますか?(E=NOTEPADで開く C=ファイルを開くものを選択)

choice /c ynec
if %errorlevel%==1 start %ex_n% %ex_n% & goto ex_start
if %errorlevel%==2 echo %ex_n_e%の実行をキャンセルしました & goto ex_start
if %errorlevel%==3 (
start notepad %ex_n%
goto ex_start
)
set ex_mode1_n=%ex_n%
set ex_mode=1
set ex_return-point=file_1
goto ex_start

:ex_file_1_exit
start "%ex_n%" %ex_mode1_n%
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
set ex_file_4=^"%ex_n_e%^"

choice
if %errorlevel%==2 echo %ex_n_e%の移動をキャンセルしました & goto ex_start
set ex_mode=1
set ex_return-point=file_4
goto ex_start

:ex_file_4_exit

move %ex_file_4% ^"%ex_path_d_m%^" >nul
echo %ex_n_e%を%ex_mode1_path_d_m%に移動しました

goto ex_start
:ex_file_5
echo %ex_n_e%の名前を変更しますか?

choice
if %errorlevel%==2 echo %ex_n%の名前の変更をキャンセルしました & goto ex_start
set /p ex_file_5_name=%ex_n%変更後の名前を入力:

ren %ex_n% %ex_file_5_name%
echo %ex_n_e%を%ex_file_5_name%に変更しました

goto ex_start


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
goto ex_start

:ex_end
cd %ex_path_d%


set option=/S 
echo /B 行の先頭に一致するもののみ対象とする
echo /E 行の末尾に一致するもののみ対象とする
echo /I 大文字小文字を区別しない
echo /L 検索文字列をリテラルとして検索する
echo /M 検索文字列に一致するものが１つでも存在するファイル名を表示する
echo /N 検索結果に行番号を表示する
echo /O 検索結果に文字位置を表示する
echo /R 検索文字列を正規表現として検索する
echo /S サブフォルダも含めて検索する
echo /V 検索文字列に一致しない行を検索対象とする
echo /X 検索文字列が完全に一致する行を検索対象とする
:g_o
set /p option="オプションを設定(スペースで区切ってください)(今:%option%):"
choice /m OK?
if %errorlevel%==2 goto g_o

choice /c aur /m "文字コードを選択(A=ANSI,U=UTF-8(通常はUTF-8です),R=両方):"
if %errorlevel%==1 set chara=932
if %errorlevel%==2 set chara=65001
if %errorlevel%==3 goto rfind
:find
set /p find=検索する文字列を入力:
chcp %chara%
findstr /s ""%find%"" %file%
pause
chcp 932
choice /c elr /m "E=終了,L=始めからやり直す,R=検索する文字列を入力するところからやり直す:"
if %errorlevel%==2 goto f_start
if %errorlevel%==3 goto find
exit /b

:rfind
set /p find=検索する文字列を入力:
chcp 65001
findstr /s ""%find%"" %file%
pause
chcp 932
findstr /s ""%find%"" %file%
pause
choice /c elr /m "E=終了,L=始めからやり直す,R=検索する文字列を入力するところからやり直す:"
if %errorlevel%==2 goto f_start
if %errorlevel%==3 goto rfind
exit /b