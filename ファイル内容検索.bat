@echo off
:f_start
set file="*.txt" 
:start
echo (��:%file%)"�ň͂�ł������� ���ɃX�y�[�X���󂯁A�O��*.��t���Ă�������(��:"*.bat" )
set /p file="���ׂ�Ώۂ̃t�@�C���g���q��ǉ�:"
choice /c ync /m "OK?(Y=OK,N=���ׂ�Ώۂ̃t�@�C����ǉ�,C=���ׂ�Ώۂ̃t�@�C�����N���A):"
if %errorlevel%==1 goto g_start
if %errorlevel%==2 goto goto start
if %errorlevel%==3 set file=&goto start

:g_start
rem ex_mode0=���
rem ex_mode1=�w���ex_mode0�ɖ߂�
rem ex_mode2=���ߍ���

cd %systemdrive%\users\%username%\documents\

set ex_mode=2
set ex_type-f4=0
set ex_type-r=+r
set ex_type-h=+h
set ex_type-a=+a
set ex_type-s=-s
set ex_n_m_s_s=0
set ex_return-point=nul
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
goto ex_type-s

:ex_start

echo.
echo.

echo �w�肵�����t�H���_���̃t�@�C����I�����Ă�������
if %ex_return-point%==file_4 echo [�ړ���̃t�H���_�[�ɂ���t�@�C����I��]
if %ex_return-point%==file_1 echo [�t�@�C���I��]

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
set ex_n_m_s=%ex_n_m_s:^&=%
rem ���������Ƃ��ł�����

if %ex_n_m_s%==%ex_5%    echo ����̓t�H���_�ƃt�@�C������؂���̂ł�&goto ex_start
if %ex_n_m_s%==y9/reload goto ex_start
if %ex_n_m_s%==y9/cmd    goto ex_cmd
if %ex_n_m_s%==y9/back   cd .. >nul & goto ex_start
if %ex_n_m_s%==y9/uback  cd %systemdrive%\users\%username%\ >nul & goto ex_start
if %ex_n_m_s%==y9/xback  cd %systemdrive%\ & goto ex_start
if %ex_n_m_s%==y9/type   goto ex_type-choice
set ex_n_m_s=%ex_n_m_s: =%

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
if %ex_df%==1 (
if %ex_mode%==0 goto ex_file
if %ex_mode%==1 goto ex_mode1_exit
if %ex_mode%==2 goto ex_mode1_exit
echo �G���[&goto ex_start
)
cd %ex_n% & goto ex_start

:ex_mode1_exit
choice /m ���̃t�@�C����I�����܂���?
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

echo %ex_n_e%�����s���܂���?(E=NOTEPAD�ŊJ�� C=�t�@�C�����J�����̂�I��)

choice /c ynec
if %errorlevel%==1 start %ex_n% %ex_n% & goto ex_start
if %errorlevel%==2 echo %ex_n_e%�̎��s���L�����Z�����܂��� & goto ex_start
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
set ex_file_4=^"%ex_n_e%^"

choice
if %errorlevel%==2 echo %ex_n_e%�̈ړ����L�����Z�����܂��� & goto ex_start
set ex_mode=1
set ex_return-point=file_4
goto ex_start

:ex_file_4_exit

move %ex_file_4% ^"%ex_path_d_m%^" >nul
echo %ex_n_e%��%ex_mode1_path_d_m%�Ɉړ����܂���

goto ex_start
:ex_file_5
echo %ex_n_e%�̖��O��ύX���܂���?

choice
if %errorlevel%==2 echo %ex_n%�̖��O�̕ύX���L�����Z�����܂��� & goto ex_start
set /p ex_file_5_name=%ex_n%�ύX��̖��O�����:

ren %ex_n% %ex_file_5_name%
echo %ex_n_e%��%ex_file_5_name%�ɕύX���܂���

goto ex_start


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
goto ex_start

:ex_end
cd %ex_path_d%


set option=/S 
echo /B �s�̐擪�Ɉ�v������̂̂ݑΏۂƂ���
echo /E �s�̖����Ɉ�v������̂̂ݑΏۂƂ���
echo /I �啶������������ʂ��Ȃ�
echo /L ��������������e�����Ƃ��Č�������
echo /M ����������Ɉ�v������̂��P�ł����݂���t�@�C������\������
echo /N �������ʂɍs�ԍ���\������
echo /O �������ʂɕ����ʒu��\������
echo /R ����������𐳋K�\���Ƃ��Č�������
echo /S �T�u�t�H���_���܂߂Č�������
echo /V ����������Ɉ�v���Ȃ��s�������ΏۂƂ���
echo /X ���������񂪊��S�Ɉ�v����s�������ΏۂƂ���
:g_o
set /p option="�I�v�V������ݒ�(�X�y�[�X�ŋ�؂��Ă�������)(��:%option%):"
choice /m OK?
if %errorlevel%==2 goto g_o

choice /c aur /m "�����R�[�h��I��(A=ANSI,U=UTF-8(�ʏ��UTF-8�ł�),R=����):"
if %errorlevel%==1 set chara=932
if %errorlevel%==2 set chara=65001
if %errorlevel%==3 goto rfind
:find
set /p find=�������镶��������:
chcp %chara%
findstr /s ""%find%"" %file%
pause
chcp 932
choice /c elr /m "E=�I��,L=�n�߂����蒼��,R=�������镶�������͂���Ƃ��납���蒼��:"
if %errorlevel%==2 goto f_start
if %errorlevel%==3 goto find
exit /b

:rfind
set /p find=�������镶��������:
chcp 65001
findstr /s ""%find%"" %file%
pause
chcp 932
findstr /s ""%find%"" %file%
pause
choice /c elr /m "E=�I��,L=�n�߂����蒼��,R=�������镶�������͂���Ƃ��납���蒼��:"
if %errorlevel%==2 goto f_start
if %errorlevel%==3 goto rfind
exit /b