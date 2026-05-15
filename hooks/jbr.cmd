:; # Cross-platform JetBrains JBR locator.  bash/zsh: source ./jbr.cmd  |  CMD: call jbr.cmd
:; # Sets IDE_JAVA to the java binary inside any installed JetBrains IDE's embedded JetBrains Runtime.
:; T=$(mktemp /tmp/jbr.XXXXXX); awk '/^: #!\/bin\/sh/{f=1} f{if(/^:# --end--/)exit; sub(/^: ?/,""); print}' "$0" > "$T"
:; IDE_JAVA=$(sh "$T" 2>/dev/null); export IDE_JAVA; rm -f "$T"; return 2>/dev/null || exit 0
: #!/bin/sh
: # Prints the path to a JetBrains IDE's bundled java on stdout. Empty on failure.
: case "$(uname -s)" in
:   Darwin)
:     if command -v mdfind >/dev/null 2>&1; then
:       for a in $(mdfind "kMDItemCFBundleIdentifier == 'com.jetbrains.*'" 2>/dev/null) \
:                $(mdfind "kMDItemCFBundleIdentifier == 'com.google.android.studio'" 2>/dev/null); do
:         j="$a/Contents/jbr/Contents/Home/bin/java"
:         [ -x "$j" ] && { echo "$j"; exit 0; }
:       done
:     fi
:     for a in /Applications/*.app "$HOME/Applications/JetBrains Toolbox"/*.app /Applications/JetBrains\ Toolbox/*.app; do
:       [ -d "$a" ] || continue
:       case "$a" in
:         *IntelliJ*|*Rider*|*PyCharm*|*WebStorm*|*CLion*|*GoLand*|*RubyMine*|*PhpStorm*|*AppCode*|*DataGrip*|*RustRover*|*Aqua*|*Fleet*|*Android*Studio*|*Writerside*)
:           j="$a/Contents/jbr/Contents/Home/bin/java"
:           [ -x "$j" ] && { echo "$j"; exit 0; }
:           ;;
:       esac
:     done
:     ;;
:   Linux)
:     j=$(find "$HOME/.local/share/JetBrains/Toolbox/apps" -name java -path "*/jbr/bin/java" 2>/dev/null | head -1)
:     [ -x "$j" ] && { echo "$j"; exit 0; }
:     for base in /opt /usr/local /opt/JetBrains; do
:       for d in "$base"/idea* "$base"/rider* "$base"/pycharm* "$base"/webstorm* "$base"/clion* "$base"/goland* "$base"/rubymine* "$base"/phpstorm* "$base"/datagrip* "$base"/rustrover* "$base"/JetBrains/*; do
:         [ -x "$d/jbr/bin/java" ] && { echo "$d/jbr/bin/java"; exit 0; }
:       done
:     done
:     ;;
: esac
: for env_hint in "$IDEA_JDK" "$IDE_HOME" "$IDEA_HOME" "$RESHARPER_HOST_BIN"; do
:   [ -z "$env_hint" ] && continue
:   c="$env_hint"
:   while [ "$c" != "/" ] && [ "$c" != "." ]; do
:     for j in "$c/jbr/Contents/Home/bin/java" "$c/jbr/bin/java"; do
:       [ -x "$j" ] && { echo "$j"; exit 0; }
:     done
:     c=$(dirname "$c")
:   done
: done
: command -v java 2>/dev/null && exit 0
: echo "ERROR: JetBrains JBR not found" >&2
: exit 1
:# --end--
@echo off
:: --------------------------------------------------------------------------
:: Windows CMD section (bash never reaches here — it returned above)
:: Universal JetBrains IDE JBR locator → sets IDE_JAVA
:: --------------------------------------------------------------------------
set "IDE_JAVA="

:: 1. IDE-passed env hints (any JetBrains IDE may set one of these)
if defined IDEA_JDK            call :_walk "%IDEA_JDK%"
if defined IDE_JAVA goto :found
if defined IDE_HOME            call :_walk "%IDE_HOME%"
if defined IDE_JAVA goto :found
if defined IDEA_HOME           call :_walk "%IDEA_HOME%"
if defined IDE_JAVA goto :found
if defined RESHARPER_HOST_BIN  call :_walk "%RESHARPER_HOST_BIN%"
if defined IDE_JAVA goto :found

:: 2. Toolbox default: %LOCALAPPDATA%\JetBrains\Toolbox\apps\<IDE>\ch-N\<version>\
for /d %%C in ("%LOCALAPPDATA%\JetBrains\Toolbox\apps\*") do (
    for /d %%H in ("%%C\*") do (
        for /d %%V in ("%%H\*") do (
            if exist "%%V\jbr\bin\java.exe" (
                set "IDE_JAVA=%%V\jbr\bin\java.exe"
                goto :found
            )
        )
    )
)

:: 3. Program Files installs (EXE installer)
for /d %%D in ("%ProgramFiles%\JetBrains\*") do (
    if exist "%%D\jbr\bin\java.exe" (
        set "IDE_JAVA=%%D\jbr\bin\java.exe"
        goto :found
    )
)
for /d %%D in ("%ProgramFiles(x86)%\JetBrains\*") do (
    if exist "%%D\jbr\bin\java.exe" (
        set "IDE_JAVA=%%D\jbr\bin\java.exe"
        goto :found
    )
)

:: 4. Registry — JetBrains products write their install path under HKLM\SOFTWARE\WOW6432Node\JetBrains\<Product>
for /f "delims=" %%P in ('reg query "HKLM\SOFTWARE\WOW6432Node\JetBrains" 2^>nul ^| findstr /r "^HKEY_"') do (
    for /f "skip=2 tokens=2*" %%A in ('reg query "%%P" /ve 2^>nul') do (
        if exist "%%B\jbr\bin\java.exe" (
            set "IDE_JAVA=%%B\jbr\bin\java.exe"
            goto :found
        )
    )
)

:: 5. System java fallback
for /f "delims=" %%J in ('where java 2^>nul') do (
    set "IDE_JAVA=%%J"
    goto :found
)

echo ERROR: could not locate JetBrains JBR 1>&2
exit /b 1

:found
goto :eof

:: Walk up a directory tree looking for jbr\bin\java.exe
:_walk
set "_d=%~1"
:_wloop
if exist "%_d%\jbr\bin\java.exe" ( set "IDE_JAVA=%_d%\jbr\bin\java.exe" & exit /b 0 )
for %%P in ("%_d%") do set "_p=%%~dpP"
set "_p=%_p:~0,-1%"
if /i "%_p%"=="%_d%" exit /b 1
set "_d=%_p%"
goto :_wloop
