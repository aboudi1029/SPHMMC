@echo off
echo ========================================================
echo Publishing SPHMMC Maternal Health Study to GitHub
echo ========================================================
echo.
set /p REPO_NAME=Enter your GitHub repository name [default: sphmmc-maternal-health-study]: 
if "%REPO_NAME%"=="" set REPO_NAME=sphmmc-maternal-health-study

echo.
echo Linking to https://github.com/aboudi10/%REPO_NAME%.git ...
git remote remove origin 2>nul
git remote add origin https://github.com/aboudi10/%REPO_NAME%.git
git branch -M main
echo.
echo Pushing to GitHub...
git push -u origin main
echo.
echo ========================================================
echo If this succeeded, your code is live on GitHub!
echo To turn on the live website (GitHub Pages):
echo 1. Go to https://github.com/aboudi10/%REPO_NAME%/settings/pages
echo 2. Set Branch to 'main' and click Save.
echo ========================================================
pause
