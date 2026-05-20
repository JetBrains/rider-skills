:; # SessionStart inject hook — cmd/sh polyglot.
:; # sh: `:` is the null builtin; `;` ends the statement, so each `:;` prefix is a no-op.
:; # cmd: `:;` is a (junk) label, so cmd skips these lines entirely and falls through to @echo off below.
:; # Emits skills/<name>/injector.md alongside each skill it reinforces.
:;
:; PROJ="${CLAUDE_PROJECT_DIR:-$PWD}"
:; SKILLS="$PROJ/.claude/skills"
:; emit() { [ -f "$1" ] || return 0; cat "$1"; printf '\n\n'; }
:; emit "$SKILLS/ide/injector.md"
:; for u in "$PROJ"/*.uproject; do
:;   [ -e "$u" ] || continue
:;   emit "$SKILLS/ide-ue/injector.md"
:;   break
:; done
:; exit 0
@echo off
setlocal
set "PROJ=%CLAUDE_PROJECT_DIR%"
if "%PROJ%"=="" set "PROJ=%CD%"
set "SKILLS=%PROJ%\.claude\skills"
if exist "%SKILLS%\ide\injector.md" (
  type "%SKILLS%\ide\injector.md"
  echo(
  echo(
)
dir /b "%PROJ%\*.uproject" >nul 2>&1
if errorlevel 1 goto :eof
if exist "%SKILLS%\ide-ue\injector.md" (
  type "%SKILLS%\ide-ue\injector.md"
  echo(
  echo(
)
exit /b 0
