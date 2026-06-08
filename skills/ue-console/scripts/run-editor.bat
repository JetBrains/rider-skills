@echo off
setlocal enabledelayedexpansion

REM Launch Unreal Editor for a project, preventing duplicate instances.
REM Usage: run-editor.bat [--project <path.uproject>]
REM
REM Auto-detects the .uproject file, engine version, and engine installation.
REM Works on Windows (cmd.exe and PowerShell).

set PROJECT=
set RESTART=0

REM ─── parse args ────────────────────────────────────────────────────
:parse_args
if "%~1"=="" goto :done_args
if /I "%~1"=="--project" (
    set PROJECT=%~2
    shift
    shift
    goto :parse_args
)
if /I "%~1"=="--restart" (
    set RESTART=1
    shift
    goto :parse_args
)
if /I "%~1"=="-h" goto :show_help
if /I "%~1"=="--help" goto :show_help
echo Unknown argument: %~1
exit /b 1

:show_help
echo Usage: %~nx0 [--project ^<path.uproject^>] [--restart]
echo.
echo Options:
echo   --project PATH   Path to .uproject file (auto-detected if omitted)
echo   --restart        Kill running editor for this project and relaunch
echo.
echo Environment:
echo   UE_ROOT          Unreal Engine root directory (auto-detected)
echo   UE_PROJECT       Alternative to --project
exit /b 0

:done_args

REM ─── find .uproject ────────────────────────────────────────────────
if "%PROJECT%"=="" if defined UE_PROJECT set PROJECT=%UE_PROJECT%

if "%PROJECT%"=="" (
    REM Search current directory and parents
    set SEARCH_DIR=%CD%
    :find_uproject_loop
    for %%F in ("!SEARCH_DIR!\*.uproject") do (
        if exist "%%F" (
            set PROJECT=%%F
            goto :found_project
        )
    )
    REM Go up one directory
    for %%D in ("!SEARCH_DIR!\..") do set SEARCH_DIR=%%~fD
    if "!SEARCH_DIR!"=="!SEARCH_DIR:~0,3!" goto :no_project
    goto :find_uproject_loop
)

:no_project
if "%PROJECT%"=="" (
    echo ERROR: No .uproject file found.
    echo   Provide --project ^<path^>, set UE_PROJECT, or run from within a UE project directory.
    exit /b 1
)

:found_project
for %%F in ("%PROJECT%") do (
    set PROJECT=%%~fF
    set PROJECT_NAME=%%~nF
)

REM ─── check if already running ─────────────────────────────────────
REM Use PowerShell CimInstance — wmic is removed in Windows 11 build 22621+.
powershell -ExecutionPolicy Bypass -Command "(Get-CimInstance Win32_Process -Filter \"name='UnrealEditor.exe'\").CommandLine" 2>NUL | find /I "%PROJECT_NAME%" >NUL
if %ERRORLEVEL%==0 (
    if "%RESTART%"=="1" (
        echo Stopping running Unreal Editor for %PROJECT_NAME%...
        powershell -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Process -Filter \"name='UnrealEditor.exe'\" | Where-Object { $_.CommandLine -like '*%PROJECT_NAME%*' } | ForEach-Object { & taskkill /PID $_.ProcessId /F 2>$null }" >NUL 2>&1
        echo Waiting for editor to exit...
        timeout /t 5 /nobreak >NUL
        echo Editor stopped.
    ) else (
        echo Unreal Editor is already running with %PROJECT_NAME%.
        exit /b 0
    )
)

REM ─── parse EngineAssociation from .uproject ────────────────────────
set ENGINE_VERSION=
for /f "tokens=2 delims=:" %%A in ('findstr /C:"EngineAssociation" "%PROJECT%"') do (
    set RAW=%%A
)
set ENGINE_VERSION=%RAW:"=%
set ENGINE_VERSION=%ENGINE_VERSION: =%
set ENGINE_VERSION=%ENGINE_VERSION:,=%

if "%ENGINE_VERSION%"=="" (
    echo WARNING: Could not determine EngineAssociation from %PROJECT%
    echo   Will search for any installed engine version.
)

REM ─── find UE_ROOT ──────────────────────────────────────────────────
if defined UE_ROOT goto :check_ue_root

REM Search common installation paths (version-specific first)
if not "%ENGINE_VERSION%"=="" (
    for %%P in (
        "C:\Program Files\Epic Games\UE_%ENGINE_VERSION%"
        "D:\Program Files\Epic Games\UE_%ENGINE_VERSION%"
        "C:\EpicGames\UE_%ENGINE_VERSION%"
        "D:\EpicGames\UE_%ENGINE_VERSION%"
    ) do (
        if exist %%P (
            set UE_ROOT=%%~P
            goto :check_ue_root
        )
    )
)

REM Fallback: search for any UE 5.x
for /d %%P in ("C:\Program Files\Epic Games\UE_5.*") do (
    if exist "%%P" (
        set UE_ROOT=%%~P
        goto :check_ue_root
    )
)
for /d %%P in ("D:\Program Files\Epic Games\UE_5.*") do (
    if exist "%%P" (
        set UE_ROOT=%%~P
        goto :check_ue_root
    )
)

echo ERROR: Unreal Engine root not found.
echo   Set UE_ROOT to your UE installation directory.
echo   Example: set UE_ROOT=C:\Program Files\Epic Games\UE_5.6
exit /b 1

:check_ue_root
if not exist "%UE_ROOT%" (
    echo ERROR: UE_ROOT directory does not exist: %UE_ROOT%
    exit /b 1
)

REM ─── locate editor binary ─────────────────────────────────────────
set EDITOR=%UE_ROOT%\Engine\Binaries\Win64\UnrealEditor.exe

if not exist "%EDITOR%" (
    echo ERROR: UnrealEditor.exe not found at expected location.
    echo   UE_ROOT: %UE_ROOT%
    echo   Expected: %EDITOR%
    exit /b 1
)

REM ─── launch ────────────────────────────────────────────────────────
echo Project: %PROJECT%
echo Engine:  %UE_ROOT%
echo Version: %ENGINE_VERSION%
echo.
echo Starting Unreal Editor...
start "" "%EDITOR%" "%PROJECT%"
echo Editor launched.
