@echo off
cd C:\Users\Marco.ma\Documents\Embarcadero\Studio\Case1
git init

REM 檢查網路連接
ping -n 1 github.com >nul
if %errorlevel% neq 0 (
    echo Network error: Cannot connect to remote repository >> git_auto_log.txt
    exit /b 1
)

REM 記錄開始時間
echo Starting auto git push at %date% %time% >> git_auto_log.txt

REM 檢查目錄是否存在
if not exist .git (
    echo Error: Not a git repository >> git_auto_log.txt
    exit /b 1
)

git add .
git commit -m "Daily auto commit %date% %time%"
git remote add origin https://github.com/Marco-ma-CSM/Marco-ma-CSM-CSM-Test.git
git push origin master

REM 記錄完成狀態
if %errorlevel% equ 0 (
    echo Push completed successfully >> git_auto_log.txt
) else (
    echo Push failed with error code %errorlevel% >> git_auto_log.txt
)

git remote -v