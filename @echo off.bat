@echo off
cd C:\Users\Marco.ma\Documents\Embarcadero\Studio\Case1

REM �O���}�l�ɶ�
echo Starting auto git push at %date% %time% >> git_auto_log.txt

REM �ˬd�ò����w�s�b�����ݭܮw�]�w
git remote remove origin

REM ���s�K�[���ݭܮw
git remote add origin https://github.com/Marco-ma-CSM/Marco-ma-CSM-CSM-Test.git

REM �K�[�Ҧ��ܧ�
git add .

REM �����ܧ�
git commit -m "Daily auto commit %date% %time%"

REM �j����e�� master ����
git push -f origin master

REM �O���������A
if %errorlevel% equ 0 (
    echo Push completed successfully >> git_auto_log.txt
) else (
    echo Push failed with error code %errorlevel% >> git_auto_log.txt
)

git remote -v

git config --global credential.helper store