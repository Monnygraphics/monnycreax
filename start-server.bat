@echo off
echo Starting MonnyCreaX Website Server...
echo.
echo Choose your server:
echo 1. Python (if installed)
echo 2. Node.js http-server (if installed)
echo 3. PHP (if installed)
echo.
set /p choice="Enter choice (1-3): "

if "%choice%"=="1" (
    echo Starting Python server...
    python -m http.server 8000
) else if "%choice%"=="2" (
    echo Starting Node.js server...
    http-server -p 8000
) else if "%choice%"=="3" (
    echo Starting PHP server...
    php -S localhost:8000
) else (
    echo Invalid choice. Please run this file again.
    pause
)

