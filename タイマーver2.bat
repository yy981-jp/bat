
chcp 65001
cls
echo 時間は24以下の整数、分・秒は60以下の整数を入力してください
echo （空白の場合は0を入力してください）

set /p 時間=何時間？:%時間%
set /p 分=何分？:%分%
set /p 秒=何秒？:%秒%
set /a 時間秒=%時間%*3600
set /a 分秒=%分%*60
set /a 秒秒=%秒%

timeout /t 1 > nul
set /a 計測時間_=%時間秒%+%分秒%
set /a 計測時間=%計測時間_%+%秒秒%
echo %計測時間%秒計測します(%時間%時間　%分%分　%秒%秒)
echo 何かキーを押すとタイマーがスタートします(そのあとでもう一度何かキーを押すとタイマーが強制終了します)
pause>nul
for /l %%a in (1,1,%計測時間%) do (
echo %%a
set /a title=%計測時間%-%%a>nul
echo %title%
timeout /t 1 /nobreak >nul
title %title%
)



echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul
echo XY | choice>nul
timeout /t 1 /nobreak >nul