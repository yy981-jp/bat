@echo off

if not "%~0"=="%~dp0.\%~nx0" start /min cmd /c,"%~dp0.\%~nx0" %* & goto :eof
title information

rem :start
for /f "usebackq tokens=2 delims==; " %%a in (`wmic PATH Win32_Battery Get EstimatedChargeRemaining /value ^| findstr /r "[0-9]"`) do set a=%%a
for /f "usebackq tokens=2 skip=2 delims=:" %%a in (`fsutil volume diskfree %systemdrive%\`) do set b=%%a&goto b_1
:b_1

rem CPU
for /f "skip=1" %%a in ('wmic cpu get loadpercentage') do set c=%%a&goto c_1
:c_1

rem メモリ
for /f "skip=2 tokens=1,2 delims==" %%a in ('wmic OS get TotalVisibleMemorySize^,FreePhysicalMemory /value') do (
if "%%a"=="TotalVisibleMemorySize" set e_totalMemory=%%b
if "%%a"=="FreePhysicalMemory" set e_freeMemory=%%b
)
set /a e_usedMemory=%e_totalMemory%-%e_freeMemory%
set /a e=%e_usedMemory%*100/%e_totalMemory%
:e_1
set /a e_1=%e%/10000

rem _________________________________________________________________
msg /time:100000 /w %username% [%date%   %time%]^

%username%@%computername%^

^|CPU: %c%%%(全コア平均)^

^|メモリ: %e%%%(%e_usedMemory%00/%e_totalMemory%)^

バッテリー残量: %a%%%^

ディスク空き容量: %b%




rem goto start