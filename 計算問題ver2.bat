@echo off
title �v�Z���

echo ------------------------
echo /option	:�ݒ�̕ύX
echo /exit	:�I��
echo next	:�����p�X
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

choice /m ����l���g�p?
if %errorlevel%==1 goto start

:option
if %start%==0 choice /m �ݒ��ύX����?
if %start%==0 if %errorlevel%==2 goto end
set /a r=%r%-1
set /p r="�����͈̔�(�ŏ��l��0)�̍ő�l���w�聦�󔒂̏ꍇ�ύX�Ȃ�(��:%r%):"
set /p s="�g�p����l�����Z�L�����w��(�|���Z,����Z,�����Z,�����Z(��:1001 ���|���Z^&�����Z))���󔒂̏ꍇ�ύX�Ȃ�(��:%s%):"
rem set /p d="�����_�扽�ʂ܂Ŏg�p���邩���w�聦�󔒂̏ꍇ�ύX�Ȃ�(��:%d%):"
choice /m "�}�C�i�X���g�p?(��:%m%(1=�͂� 0=������)):"
if %errorlevel%==1 set m=1
if %errorlevel%==2 set m=0
choice /m "�p�X��L��?(��:%passon%(1=�͂� 0=������)):"
if %errorlevel%==1 set passon=1
if %errorlevel%==2 set passon=0

set s=%s:~0,4%
set /a r=%r%+1
if %r% leq 0 echo �����͈̔͂̍ő�l��0�ȉ��ł�&goto option
if %s%==0000 echo �g�p����l�����Z�L���������w�肳��Ă��܂���&goto option
if %start%==1 set start=0


:start
set /a sr=%random%*4/32767
call set _=%%s:~%sr%,1%%
if %_%==0 goto start
if %sr%==0 set sn=*&set se=�~
if %sr%==1 set sn=/&set se=��
if %sr%==2 set sn=+&set se=�{
if %sr%==3 set sn=-&set se=�|
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
set echo=%rr2%��%rr1%
goto end


:end
echo [%echo%]
:end_n
set /a rt=%r%-1
title �v�Z���[0~%rt%,%s%,%m%,%passon%](�𓚉�=%loop%,�Z=%point%,�~=%miss%,�p�X=%pass%)

set in=nul
set /p in=��:
if "%in%"=="nul" goto end_n
if "%in%"=="/option" goto option
if "%in%"=="/exit" goto exit
if "%in%"=="/echo on" echo on&goto end_n
if "%in%"=="/echo off" echo off&goto end_n
if "%in%"=="next" if %passon%==1 (
set /a pass=%pass%+1&echo ����:%out%&goto start) else (echo �p�X�@�\�̓I�t�ɂȂ��Ă��܂�&goto end_n)
if "%in%"=="%out%" set /a loop=%loop%+1&set /a point=%point%+1&echo �Z&goto start
if not "%in%"=="%out%" set /a loop=%loop%+1&set /a miss=%miss%+1&echo �~&goto end_n
echo error
goto start


:exit
choice /m (�m�F)�I��?
if %errorlevel%==2 goto end

echo.
echo.
echo.
echo [�ݒ�^&����]
echo �����͈̔�:0~%rt%
set s_exit=_
if %s:~0,1%==1 set s_exit=%s_exit%�~
if %s:~1,1%==1 set s_exit=%s_exit%��
if %s:~2,1%==1 set s_exit=%s_exit%�{
if %s:~3,1%==1 set s_exit=%s_exit%�|
echo �g�p����l�����Z�L��:%s_exit:~1,100%
if %m%==0 set m_exit=OFF
if %m%==1 set m_exit=ON
echo �}�C�i�X�̎g�p:%m_exit%
if %passon%==0 set passon_exit=OFF
if %passon%==1 set passon_exit=ON
echo �p�X�̗L��:%passon_exit%
echo --------------------
echo �𓚉�:%loop%
echo �Z:%point%
echo �~:%miss%
echo �p�X:%pass%
timeout /t 5 /nobreak>nul
pause