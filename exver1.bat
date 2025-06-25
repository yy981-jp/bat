
@if not "%~0"=="%~dp0.\%~nx0" start /max cmd /c,"%~dp0.\%~nx0" %* & goto :eof
echo off
chcp 65001>nul

cd c:\users\%username%\documents\

:3bdf247077bc11eda66f4d90e01fbb85

echo.
echo.
echo 上のほうにフォルダ　下のほうにファイルが表示されます

echo 空白のみ入力するとバグが発生することがあります

echo.
echo 操作方法

echo フォルダ名を入力   そのフォルダに移動

echo y9/no              再読み込み

echo y9/cmd             デバック用

echo y9/back            上のフォルダに移動

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo.

dir /b | find /c /v "" >%temp%\ex_a
set /p ex_a=<%temp%\ex_a
echo [%ex_a%個のファイルとフォルダ]
echo.
dir /b /o

echo.

rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set /p ex_n_m="ファイル名もしくはフォルダ名を入力(y9/backと入力すると1つ上に戻る): "
set ex_n=^"%ex_n_m%^"
set ex_n_e=%ex_n_m%

if %ex_n_e%==y9/no goto 3bdf247077bc11eda66f4d90e01fbb85

if %ex_n_e%==y9/cmd cmd & goto 3bdf247077bc11eda66f4d90e01fbb85

if %ex_n_e%==y9/back (cd .. >nul
) else (cd %ex_n% >nul || goto ff64a200782d11eda66f4d90e01fbb85 >nul)





goto 3bdf247077bc11eda66f4d90e01fbb85

:ff64a200782d11eda66f4d90e01fbb85

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
if %errorlevel%==1 goto 3bdf247077bc11eda66f4d90e01fbb85
if %errorlevel%==2 goto ex_file_1
if %errorlevel%==3 goto ex_file_2
if %errorlevel%==4 goto ex_file_3
if %errorlevel%==5 goto ex_file_4
if %errorlevel%==6 goto ex_file_5





:ex_file_1

echo %ex_n%を実行しますか?

choice
if %errorlevel%==2 echo %ex_n%の実行をキャンセルしました & goto 3bdf247077bc11eda66f4d90e01fbb85

start %ex_n_e%
echo %ex_n%を実行します

goto 3bdf247077bc11eda66f4d90e01fbb85
:ex_file_2

echo %ex_n%をコピーしますか?

choice
if %errorlevel%==2 echo %ex_n%のコピーをキャンセルしました & goto 3bdf247077bc11eda66f4d90e01fbb85

copy %ex_n% "y9 - %ex_n%" >nul
echo [%ex_n%]を["y9 - %ex_n%"]という名前でコピーしました

goto 3bdf247077bc11eda66f4d90e01fbb85
:ex_file_3

echo %ex_n%を削除しますか?

choice
if %errorlevel%==2 echo %ex_n%の削除をキャンセルしました & goto 3bdf247077bc11eda66f4d90e01fbb85
del %ex_n%
echo %ex_n%を削除しました

goto 3bdf247077bc11eda66f4d90e01fbb85
:ex_file_4

echo 未実装
goto 3bdf247077bc11eda66f4d90e01fbb85
echo %ex_n%を移動させますか?

choice
if %errorlevel%==2 echo %ex_n%の移動をキャンセルしました & goto 3bdf247077bc11eda66f4d90e01fbb85


goto 3bdf247077bc11eda66f4d90e01fbb85
:ex_file_5
echo %ex_n%の名前を変更しますか?

choice
if %errorlevel%==2 echo %ex_n%の名前の変更をキャンセルしました & goto 3bdf247077bc11eda66f4d90e01fbb85
set /p ex_file_5_name=%ex_n%変更後の名前を入力: "

ren %ex_n% %ex_file_5_name%
echo %ex_n%を%ex_file_5_name%に変更しました

goto 3bdf247077bc11eda66f4d90e01fbb85
_________________________________________________

