@echo off
echo Downloading Google Chrome installation file…
setlocal EnableDelayedExpansion

set DOWNLOAD_URL=https://dl.google.com/chrome/install/standalone/ChromeStandaloneSetup.exe
set DOWNLOAD_FILE=%USERPROFILE%\Desktop\ChromeStandaloneSetup.exe

powershell -command Invoke-WebRequest %DOWNLOAD_URL% -OutFile “%DOWNLOAD_FILE%”

if NOT EXIST “%DOWNLOAD_FILE%” (
echo Error downloading installation file.
exit /b 1
)

echo Google Chrome installation file downloaded.

echo Installing Google Chrome…
set SILENT_SWITCHES=/install /silent /norestart

start /wait “” “%DOWNLOAD_FILE%” %SILENT_SWITCHES%

if %errorlevel% neq 0 (
echo Error installing Google Chrome.
exit /b 1
)

echo Google Chrome successfully installed.
