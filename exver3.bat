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

echo ��̂ق��Ƀt�H���_�@���̂ق��Ƀt�@�C�����\������܂�

echo [������@]

echo �t�H���_��         ���̃t�H���_�Ɉړ�

echo �t�@�C����         ���̃t�@�C����ҏW��

echo y9/reload          �ēǂݍ���

echo y9/cmd             �f�o�b�N�p

echo y9/back            ��̃t�H���_�Ɉړ�

echo y9/uback           ���[�U�[�̃t�H���_�Ɉړ�

echo y9/xback           �ŏ�̃t�H���_�Ɉړ�

echo y9/type            �\�����e�̑I��

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
rem (((��������)))

set ex_n_m_s=y9/reload
set /p ex_n_m_s=���������(y9/back�Ɠ��͂����1��ɖ߂�):
set ex_n_m_s=%ex_n_m_s: =%
rem ���������Ƃ��ł�����

if %ex_n_m_s%==%ex_5%    echo ����̓t�H���_�ƃt�@�C������؂���̂ł�&goto ex_start
if %ex_n_m_s%==y9/reload goto ex_start
if %ex_n_m_s%==y9/cmd    goto ex_cmd & goto ex_start
if %ex_n_m_s%==y9/back   cd .. >nul & goto ex_start
if %ex_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_start
if %ex_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_start
if %ex_n_m_s%==y9/type   goto ex_type-choice


findstr /n /r "." %temp%\ex_dir.yy981 | findstr /r "^%ex_n_m_s%:">%temp%\ex_dir_h.yy981
for /f "delims=" %%a in (%temp%\ex_dir_h.yy981) do set ex_dir_h=%%a

if %ex_n_m_s% geq %ex_6% echo �G���[(�t�@�C��or�t�H���_���̍����ɕ\�����ꂽ��������͂��Ă�������)&goto ex_n_m_s
if %ex_n_m_s% leq 0 echo �G���[(1�ȏ����͂��Ă�������)&goto ex_n_m_s
if %ex_n_m_s% leq 9 set ex_s=%ex_dir_h:~2%&goto ex_n_m_s_s
if %ex_n_m_s% leq 99 set ex_s=%ex_dir_h:~3%&goto ex_n_m_s_s
if %ex_n_m_s% leq 999 set ex_s=%ex_dir_h:~4%&goto ex_n_m_s_s
if %ex_n_m_s% leq 9999 set ex_s=%ex_dir_h:~5%&goto ex_n_m_s_s
if %ex_n_m_s% leq 99999 set ex_s=%ex_dir_h:~6%&goto ex_n_m_s_s
if %ex_n_m_s% geq 100000 echo �G���[(�����ȊO��������100000�ȏ�ɂ͑Ή����Ă��܂���)&goto ex_n_m_s

echo �G���[
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
rem ��������
rem 
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo 0,�L�����Z��

echo 1,���s

echo 2,�R�s�[

echo 3,�폜

echo 4,�ړ�

echo 5,���O�̕ύX

choice /c:012345
if %errorlevel%==1 goto ex_start
if %errorlevel%==2 goto ex_file_1
if %errorlevel%==3 goto ex_file_2
if %errorlevel%==4 goto ex_file_3
if %errorlevel%==5 goto ex_file_4
if %errorlevel%==6 goto ex_file_5





:ex_file_1

echo %ex_n_e%�����s���܂���?

choice
if %errorlevel%==2 echo %ex_n_e%�̎��s���L�����Z�����܂��� & goto ex_start

start "" %ex_n%
echo %ex_n_e%�����s���܂�

goto ex_start
:ex_file_2

echo %ex_n_e%���R�s�[���܂���?

choice
if %errorlevel%==2 echo %ex_n%�̃R�s�[���L�����Z�����܂��� & goto ex_start

copy %ex_n% "y9 - %ex_s%" >nul
echo [%ex_n_e%]��["y9 - %ex_s%"]�Ƃ������O�ŃR�s�[���܂���

goto ex_start
:ex_file_3

echo %ex_n_e%���폜���܂���?

choice
if %errorlevel%==2 echo %ex_n%�̍폜���L�����Z�����܂��� & goto ex_start
del %ex_n%
echo %ex_n_e%���폜���܂���

goto ex_start
:ex_file_4

echo %ex_n_e%���ړ������܂���?

choice
if %errorlevel%==2 echo %ex_n_e%�̈ړ����L�����Z�����܂��� & goto ex_start
goto ex_f4_start

:ex_f4_exit
choice /m ���̃t�@�C����I�����܂���?
if %errorlevel%==2 goto ex_f4_start
set ex_f4_output=^"%ex_f4_path_d_m%^"

move %ex_n% %ex_f4_output%
echo %ex_n_e%��%ex_f4_path_d_m%�Ɉړ����܂���

goto ex_start
:ex_file_5
echo %ex_n_e%�̖��O��ύX���܂���?

choice
if %errorlevel%==2 echo %ex_n%�̖��O�̕ύX���L�����Z�����܂��� & goto ex_start
set /p ex_file_5_name=%ex_n%�ύX��̖��O�����: "

ren %ex_n% %ex_file_5_name%
echo %ex_n_e%��%ex_file_5_name%�ɕύX���܂���

goto ex_start
_________________________________________________
:ex_f4_start
set ex_type-f4=1

echo.
echo.

echo ��̂ق��Ƀt�H���_�@���̂ق��Ƀt�@�C�����\������܂�

echo [������@]

echo �t�H���_��         ���̃t�H���_�Ɉړ�

echo �t�@�C����         ���̃t�@�C����ҏW��

echo y9/reload          �ēǂݍ���

echo y9/cmd             �f�o�b�N�p

echo y9/back            ��̃t�H���_�Ɉړ�

echo y9/uback           ���[�U�[�̃t�H���_�Ɉړ�

echo y9/xback           �ŏ�̃t�H���_�Ɉړ�

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

echo [�ړ���̃t�H���_�[�ɂ���t�@�C����I��]

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
rem (((��������)))

set ex_f4_n_m_s=y9/reload
set /p ex_f4_n_m_s=���������(y9/back�Ɠ��͂����1��ɖ߂�):

if %ex_f4_n_m_s%==%ex_f4_5%    echo ����̓t�H���_�ƃt�@�C������؂���̂ł�&goto ex_start
if %ex_f4_n_m_s%==y9/reload goto ex_f4_start
if %ex_f4_n_m_s%==y9/cmd    goto ex_f4_cmd & goto ex_f4_start
if %ex_f4_n_m_s%==y9/back   cd .. >nul & goto ex_f4_start
if %ex_f4_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_f4_start
if %ex_f4_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_f4_start
if %ex_f4_n_m_s%==y9/type   goto ex_type-choice

findstr /n /r "." %temp%\ex_f4_dir.yy981 | findstr /r "^%ex_f4_n_m_s%:">%temp%\ex_f4_dir_h.yy981
for /f "delims=" %%a in (%temp%\ex_f4_dir_h.yy981) do set ex_f4_dir_h=%%a

if %ex_f4_n_m_s% geq %ex_f4_6% echo �G���[(�t�@�C��or�t�H���_���̍����ɕ\�����ꂽ��������͂��Ă�������)&goto ex_f4_n_m_s
if %ex_f4_n_m_s% leq 0 echo �G���[(1�ȏ����͂��Ă�������)&goto ex_f4_n_m_s
if %ex_f4_n_m_s% leq 9 set ex_f4_s=%ex_f4_dir_h:~2%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 99 set ex_f4_s=%ex_f4_dir_h:~3%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 999 set ex_f4_s=%ex_f4_dir_h:~4%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 9999 set ex_f4_s=%ex_f4_dir_h:~5%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% leq 99999 set ex_f4_s=%ex_f4_dir_h:~6%&goto ex_f4_n_m_s_s
if %ex_f4_n_m_s% geq 100000 echo �G���[(�����ȊO��������100000�ȏ�ɂ͑Ή����Ă��܂���)&goto ex_f4_n_m_s

echo �G���[
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
echo R �ǎ���p�t�@�C��   %ex_type-r%
echo H �B���t�@�C��         %ex_type-h%
echo A �A�[�J�C�u�t�@�C��   %ex_type-a%
echo S �V�X�e���t�@�C��     %ex_type-s%
echo E �I���I��

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