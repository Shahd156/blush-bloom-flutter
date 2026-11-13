@echo off
setlocal

echo ==========================================
echo BrightPath Flutter App - Windows Setup
 echo ==========================================

where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter was not found in PATH.
  echo Install Flutter, add flutter\bin to PATH, then run this file again.
  pause
  exit /b 1
)

echo Creating missing Flutter platform files...
flutter create .
if errorlevel 1 goto :error

echo Installing dependencies...
flutter pub get
if errorlevel 1 goto :error

echo Starting the app...
flutter run
if errorlevel 1 goto :error
exit /b 0

:error
echo.
echo Something went wrong. Please check the message above.
pause
exit /b 1
