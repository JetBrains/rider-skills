# Packaging with the editor running

When the editor is open with Live Coding active, `RunUAT BuildCookRun -build` fails immediately:
> `Unable to build while Live Coding is active. Exit the editor and game`

**Workaround — split the pipeline into three steps.** Run all three from the **project root**, and keep `-targetplatform` and `-clientconfig` **identical** across every step (mismatched config/platform → stage can't find the cooked or built output). These are long ops — drive them via the `ide:long-ops` background protocol (`Bash run_in_background` + `Monitor`), not as blocking calls.

Why this order works: step 1 cooks with the **already-built editor commandlet** (no compile needed), step 2 produces the **standalone game binary** that staging requires, and step 3 packages the cooked content + that binary without recompiling or recooking.

**Step 1 — Cook** (skip build entirely; editor commandlet handles content):
```powershell
RunUAT.bat BuildCookRun -project="<path>.uproject" -targetplatform=Win64 -clientconfig=DebugGame `
  -NoCompile -cook -unattended -nop4 -utf8output `
  > Saved\Logs\UAT_Package.log 2>&1
```

**Step 2 — Build the game target** via UBT with `-LiveCoding=false` (bypasses the lock):
```powershell
dotnet.exe "UE_ROOT\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.dll" `
  <GameName> Win64 DebugGame -Project="<path>.uproject" -LiveCoding=false `
  >> Saved\Logs\UAT_Package.log 2>&1
```
UBA caches most of the work — a full DebugGame build typically takes 10–15 s on a warm cache. This is the step most likely to fail, so confirm it succeeded before step 3.

**Step 3 — Pak / Stage / Package** using the existing binary and cooked content:
```powershell
RunUAT.bat BuildCookRun -project="<path>.uproject" -targetplatform=Win64 -clientconfig=DebugGame `
  -NoCompile -skipcook -pak -stage -package -prereqs -unattended -nop4 -utf8output `
  >> Saved\Logs\UAT_Package.log 2>&1
```
