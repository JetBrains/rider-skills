#  Packaging with the editor running

When the editor is open with Live Coding active, `RunUAT BuildCookRun -build` fails immediately:
> `Unable to build while Live Coding is active. Exit the editor and game`

**Workaround — split the pipeline into three steps:**

**Step 1 — Cook** (skip build entirely; editor commandlet handles content):
```powershell
RunUAT.bat BuildCookRun -project="<path>.uproject" -targetplatform=Win64 -clientconfig=DebugGame `
  -NoCompile -cook -unattended -nop4 -utf8output `
  > Saved\Logs\UAT_Package.log 2>&1
```

**Step 2 — Build the game target** via UBT with `-LiveCoding=false` (bypasses the lock):
```powershell
dotnet.exe "UE_ROOT\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.dll" `
  <GameName> Win64 DebugGame -Project="<path>.uproject" -LiveCoding=false
```
UBA caches most of the work — a full DebugGame build typically takes 10–15 s on a warm cache.

**Step 3 — Pak / Stage / Package** using the existing binary and cooked content:
```powershell
RunUAT.bat BuildCookRun -project="<path>.uproject" -targetplatform=Win64 -clientconfig=DebugGame `
  -NoCompile -skipcook -pak -stage -package -prereqs -unattended -nop4 -utf8output `
  >> Saved\Logs\UAT_Package.log 2>&1
```
