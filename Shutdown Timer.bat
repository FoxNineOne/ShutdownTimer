@echo off
echo Good Evening Weary Traveller. 
echo:

echo We'll switch your computer off from here.
echo:

:menu

echo Choose an option:
echo ========================
echo 1 - 30 minutes (0.5 hour)
echo 2 - 60 minutes (1 hour)
echo 3 - 90 minutes (1.5 hour)
echo 4 - 120 minutes (2 hours)
echo 5 - Custom Timer (in minutes)
echo:
echo 0 - Exit (turn around, we never met)
echo:
set /p choice="Enter your choice (0-5): "

echo You chose: %choice%

if "%choice%"=="0" (
    echo Exiting...
    pause
    exit
)
if "%choice%"=="1" (
    set /a timer=30*60
    goto display_timer
)
if "%choice%"=="2" (
    set /a timer=60*60
    goto display_timer
)
if "%choice%"=="3" (
    set /a timer=90*60
    goto display_timer
)
if "%choice%"=="4" (
    set /a timer=120*60
    goto display_timer
)
if "%choice%"=="5" (
    set /p customTimer="Enter custom timer in minutes: "
    echo You entered: %customTimer%
    echo %customTimer% | findstr /r "^[0-9]*$" >nul
    if errorlevel 1 (
        echo Invalid input. Please enter a valid number of minutes.
        pause
        goto menu
    ) else (
        set /a timer=%customTimer%*60
        goto display_timer
    )
)
echo :
echo Please choose a valid option (0-5).
pause
goto menu

:display_timer
:: Uncomment the following line for the actual shutdown
shutdown -s -t %timer%
timeout /t 1 /nobreak >nul
echo Timer set for %timer% seconds.
timeout /t 2 /nobreak >nul
echo .
timeout /t 1 /nobreak >nul
echo .
timeout /t 1 /nobreak >nul
echo Rest well. 
echo .
timeout /t 1 /nobreak >nul
echo .
timeout /t 1 /nobreak >nul
echo and Listen to Zorro Sombre music.
timeout /t 2 /nobreak >nul
echo OxO
timeout /t 1 /nobreak >nul
echo .
timeout /t 1 /nobreak >nul
echo .
timeout /t 1 /nobreak >nul
pause
exit
