@echo off
cd C:\Users\Marco.ma\Documents\Embarcadero\Studio\Case1
git init

REM �ˬd�����s��
ping -n 1 github.com >nul
if %errorlevel% neq 0 (
    echo Network error: Cannot connect to remote repository >> git_auto_log.txt
    exit /b 1
)

REM �O���}�l�ɶ�
echo Starting auto git push at %date% %time% >> git_auto_log.txt

REM �ˬd�ؿ��O�_�s�b
if not exist .git (
    echo Error: Not a git repository >> git_auto_log.txt
    exit /b 1
)

git add .
git commit -m "Daily auto commit %date% %time%"
git remote add origin https://github.com/Marco-ma-CSM/Marco-ma-CSM-CSM-Test.git
git push origin master

REM �O���������A
if %errorlevel% equ 0 (
    echo Push completed successfully >> git_auto_log.txt
) else (
    echo Push failed with error code %errorlevel% >> git_auto_log.txt
)

git remote -v