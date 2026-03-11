@echo off
chcp 65001 >nul
echo ========================================
echo Git 合并远程 v1.4.6 版本脚本
echo ========================================
echo.

set PROJECT_DIR=E:\git_code
set REMOTE_URL=https://github.com/rustdesk/rustdesk.git

cd /d %PROJECT_DIR%

REM 检查是否已是Git仓库
if exist .git (
    echo [1/6] 检测到Git仓库,跳过初始化...
) else (
    echo [1/6] 初始化Git仓库...
    git init
)

echo.
echo [2/6] 添加远程仓库...
git remote remove origin 2>nul
git remote add origin %REMOTE_URL%
git remote -v

echo.
echo [3/6] 获取远程所有分支和标签...
git fetch origin --tags

echo.
echo [4/6] 查看可用的远程标签...
git tag -l | findstr "1.4"

echo.
echo [5/6] 创建新分支合并v1.4.6...
git checkout -b merge-v1.4.6 2>nul || git checkout merge-v1.4.6

echo.
echo [6/6] 合并远程v1.4.6标签...
git merge v1.4.6 --no-ff -m "Merge remote v1.4.6"

echo.
echo ========================================
echo 合并完成!
echo ========================================
echo.
echo 如果有冲突,请手动解决后执行:
echo   git add .
echo   git commit -m "Resolved conflicts"
echo.
pause
