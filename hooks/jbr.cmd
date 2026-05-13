:; # Cross-platform JBR locator.  bash/zsh: source ./jbr.cmd  |  CMD: call jbr.cmd
:; # Sets RIDER_JAVA to the java binary inside the IDE's embedded JetBrains Runtime.
:; _jbr(){ local j a c; case "$(uname -s)" in Darwin) command -v mdfind >/dev/null 2>&1 && { a=$(mdfind "kMDItemCFBundleIdentifier == 'com.jetbrains.rider'" 2>/dev/null|head -1); j="$a/Contents/jbr/Contents/Home/bin/java"; [ -x "$j" ] && { echo "$j"; return 0; }; };; Linux) j=$(find "$HOME/.local/share/JetBrains/Toolbox/apps/Rider" -name java -path "*/jbr/bin/java" 2>/dev/null|head -1); [ -x "$j" ] && { echo "$j"; return 0; }; for d in /opt/rider* /usr/local/rider* /opt/JetBrains/Rider*; do [ -x "$d/jbr/bin/java" ] && { echo "$d/jbr/bin/java"; return 0; }; done;; esac; if [ -n "$RESHARPER_HOST_BIN" ]; then c="$RESHARPER_HOST_BIN"; while [ "$c" != "/" ] && [ "$c" != "." ]; do j="$c/jbr/Contents/Home/bin/java"; [ -x "$j" ] && { echo "$j"; return 0; }; j="$c/jbr/bin/java"; [ -x "$j" ] && { echo "$j"; return 0; }; c=$(dirname "$c"); done; fi; command -v java 2>/dev/null && return 0; echo "ERROR: Rider JBR not found" >&2; return 1; }
:; RIDER_JAVA="$(_jbr)"; export RIDER_JAVA; unset -f _jbr; return 2>/dev/null || exit 0
@echo off
:: --------------------------------------------------------------------------
:: Windows CMD section (bash never reaches here — it returned above)
:: --------------------------------------------------------------------------
set "RIDER_JAVA="

:: 1. RESHARPER_HOST_BIN walk — set by the IDE in its own terminals/hooks
if defined RESHARPER_HOST_BIN (
    call :_walk "%RESHARPER_HOST_BIN%"
    if defined RIDER_JAVA goto :found
)

:: 2. Toolbox default: %LOCALAPPDATA%\JetBrains\Toolbox\apps\Rider\ch-N\<version>\
for /d %%C in ("%LOCALAPPDATA%\JetBrains\Toolbox\apps\Rider\*") do (
    for /d %%V in ("%%C\*") do (
        if exist "%%V\jbr\bin\java.exe" (
            set "RIDER_JAVA=%%V\jbr\bin\java.exe"
            goto :found
        )
    )
)

:: 3. Program Files install (EXE installer)
for /d %%D in ("%ProgramFiles%\JetBrains\Rider*") do (
    if exist "%%D\jbr\bin\java.exe" (
        set "RIDER_JAVA=%%D\jbr\bin\java.exe"
        goto :found
    )
)

:: 4. Registry (EXE installer writes install path here)
for /f "skip=2 tokens=2*" %%A in (
    'reg query "HKLM\SOFTWARE\WOW6432Node\JetBrains\Rider" /ve 2^>nul'
) do (
    if exist "%%B\jbr\bin\java.exe" (
        set "RIDER_JAVA=%%B\jbr\bin\java.exe"
        goto :found
    )
)

:: 5. System java fallback
for /f "delims=" %%J in ('where java 2^>nul') do (
    set "RIDER_JAVA=%%J"
    goto :found
)

echo ERROR: could not locate Rider JBR 1>&2
exit /b 1

:found
goto :eof

:: Walk up a directory tree looking for jbr\bin\java.exe
:_walk
set "_d=%~1"
:_wloop
if exist "%_d%\jbr\bin\java.exe" ( set "RIDER_JAVA=%_d%\jbr\bin\java.exe" & exit /b 0 )
for %%P in ("%_d%") do set "_p=%%~dpP"
set "_p=%_p:~0,-1%"
if /i "%_p%"=="%_d%" exit /b 1
set "_d=%_p%"
goto :_wloop
