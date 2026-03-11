@echo off
chcp 65001 >nul
echo ========================================
echo 推送到 GitHub 脚本
echo ========================================
echo.

cd /d E:\git_code

echo [1/5] 检查Git状态...
git status

echo.
echo [2/5] 添加所有修改...
git add .

echo.
echo [3/5] 提交更改...
set /p commit_msg="请输入提交信息 (直接回车使用默认'Update to v1.4.6'): "
if "%commit_msg%"=="" set commit_msg=Update to v1.4.6
git commit -m "%commit_msg%"

echo.
echo [4/5] 推送到GitHub...
git push origin main

echo.
echo [5/5] 推送标签...
git push origin --tags

echo.
echo ========================================
echo 推送完成!
echo ========================================
pause
