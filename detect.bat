@echo off
net session >nul 2>&1

if %errorLevel% neq 0 (
    PowerShell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

set "Dir=C:\Program Files\KernelLogger"
set "File=%Dir%\soyssv.txt"
set "IsNotAnyRun=0"

if not exist "%Dir%" (
    mkdir "%Dir%" 2>nul
    if %errorLevel% neq 0 (
        goto :clean
    )
)

echo https://github.com/soyssv > "%File%"

if %errorLevel% neq 0 (
    goto :clean
)

set "IsNotAnyRun=1"
type "%File%"
echo.

:clean
if exist "%File%" (
    del "%File%" >nul 2>&1
)

if exist "%Dir%" (
    rd "%Dir%" >nul 2>&1
)

if "%IsNotAnyRun%"=="1" (
    echo any.run not detected
) else (
    echo https://github.com/soyssv
    echo.
    echo any.run detected
)

echo.
pause
