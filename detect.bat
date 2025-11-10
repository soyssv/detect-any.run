@echo off
net session >nul 2>&1

if %errorLevel% neq 0 (
    PowerShell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

set "targetDir=C:\Program Files\KernelLogger"
set "targetFile=%targetDir%\test.txt"
set "success=0"

if not exist "%targetDir%" (
    mkdir "%targetDir%"
    if %errorLevel% neq 0 (
        goto :cleanup
    )
)

echo https://github.com/soyssv > "%targetFile%"

if %errorLevel% neq 0 (
    goto :cleanup
)

set "success=1"
type "%targetFile%"
echo.

:cleanup
if exist "%targetFile%" (
    del "%targetFile%"
)

if "%success%"=="1" (
    echo any.run not detected
) else (
    echo any.run detected
)

echo.
pause
