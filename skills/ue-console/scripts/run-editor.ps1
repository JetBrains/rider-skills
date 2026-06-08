# run-editor.ps1 — Native Windows/cross-platform launcher for Unreal Editor.
# Works natively on Windows PowerShell. Falls back to bash on macOS/Linux.
#
# Usage: .\run-editor.ps1 [--project <path.uproject>] [--restart]

param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$RawArgs
)
$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# ─── Detect platform ──
$IsMac = $IsMacOS -or ($PSVersionTable.OS -and $PSVersionTable.OS -match "Darwin")
$IsLin = $IsLinux -or ($PSVersionTable.OS -and $PSVersionTable.OS -match "Linux")

# ─── On macOS/Linux, delegate to bash ──
if ($IsMac -or $IsLin) {
  $sh = Join-Path $scriptDir "run-editor.sh"
  if (Get-Command bash -ErrorAction SilentlyContinue) {
    & bash $sh @RawArgs
    exit $LASTEXITCODE
  }
  Write-Error "bash is required on macOS/Linux."
  exit 1
}

# ─── Windows: parse args ──
$Project = ""
$Restart = $false

for ($i = 0; $i -lt $RawArgs.Count; $i++) {
  switch ($RawArgs[$i]) {
    "--project" { $i++; $Project = $RawArgs[$i] }
    "--restart" { $Restart = $true }
    { $_ -in "-h","--help" } {
      Write-Host @"
Usage: run-editor.ps1 [--project <path.uproject>] [--restart]

Options:
  --project PATH   Path to .uproject file (auto-detected if omitted)
  --restart        Kill running editor for this project and relaunch

Environment:
  UE_ROOT          Unreal Engine root directory (auto-detected)
  UE_PROJECT       Alternative to --project
"@
      exit 0
    }
    default { Write-Error "Unknown argument: $($RawArgs[$i])"; exit 1 }
  }
}

# ─── Find .uproject ──
function Find-UProject {
  param([string]$StartDir = (Get-Location).Path)
  $dir = $StartDir
  while ($dir -and $dir -ne [System.IO.Path]::GetPathRoot($dir)) {
    $found = Get-ChildItem -Path $dir -Filter "*.uproject" -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($found) { return $found.FullName }
    $dir = Split-Path $dir -Parent
  }
  return $null
}

if (-not $Project) { $Project = $env:UE_PROJECT }
if (-not $Project) { $Project = Find-UProject }
if (-not $Project -or -not (Test-Path $Project)) {
  Write-Error "No .uproject file found. Provide --project <path> or set UE_PROJECT."
  exit 1
}

$Project = (Resolve-Path $Project).Path
$ProjectName = [System.IO.Path]::GetFileNameWithoutExtension($Project)

# ─── Parse engine version ──
$uprojectData = Get-Content $Project -Raw | ConvertFrom-Json
$EngineVersion = $uprojectData.EngineAssociation
if (-not $EngineVersion) {
  Write-Error "Could not determine EngineAssociation from $Project"
  exit 1
}

# ─── Check if editor is running ──
function Test-EditorRunning {
  $procs = Get-Process -Name "UnrealEditor" -ErrorAction SilentlyContinue
  if (-not $procs) { return $false }
  foreach ($p in $procs) {
    try {
      $cmdLine = (Get-CimInstance Win32_Process -Filter "ProcessId = $($p.Id)" -ErrorAction SilentlyContinue).CommandLine
      if ($cmdLine -and $cmdLine -match [regex]::Escape($ProjectName)) { return $true }
    } catch { }
  }
  return $false
}

function Stop-Editor {
  $procs = Get-Process -Name "UnrealEditor" -ErrorAction SilentlyContinue
  if (-not $procs) { return }
  foreach ($p in $procs) {
    try {
      $cmdLine = (Get-CimInstance Win32_Process -Filter "ProcessId = $($p.Id)" -ErrorAction SilentlyContinue).CommandLine
      if ($cmdLine -and $cmdLine -match [regex]::Escape($ProjectName)) {
        Stop-Process -Id $p.Id -Force -ErrorAction SilentlyContinue
      }
    } catch { }
  }
}

if (Test-EditorRunning) {
  if ($Restart) {
    Write-Host "Stopping running Unreal Editor for ${ProjectName}..."
    Stop-Editor
    $waited = 0
    while ((Test-EditorRunning) -and $waited -lt 30) {
      Start-Sleep -Seconds 1; $waited++
    }
    if (Test-EditorRunning) {
      Write-Host "WARNING: Editor did not exit after 30s, forcing..."
      Stop-Editor; Start-Sleep -Seconds 2
    }
    Write-Host "Editor stopped."
  } else {
    Write-Host "Unreal Editor is already running for ${ProjectName}."
    exit 0
  }
}

# ─── Find engine root ──
$UERoot = $env:UE_ROOT
if (-not $UERoot) {
  $candidates = @(
    "C:\Program Files\Epic Games\UE_${EngineVersion}",
    "D:\Program Files\Epic Games\UE_${EngineVersion}",
    "C:\EpicGames\UE_${EngineVersion}",
    "D:\EpicGames\UE_${EngineVersion}"
  )
  foreach ($dir in $candidates) {
    if (Test-Path $dir) { $UERoot = $dir; break }
  }
}

if (-not $UERoot -or -not (Test-Path $UERoot)) {
  Write-Error @"
Unreal Engine root not found for version ${EngineVersion}.
Set UE_ROOT: `$env:UE_ROOT = "C:\Program Files\Epic Games\UE_${EngineVersion}"
"@
  exit 1
}

$Editor = Join-Path $UERoot "Engine\Binaries\Win64\UnrealEditor.exe"
if (-not (Test-Path $Editor)) {
  Write-Error "UnrealEditor.exe not found at: ${Editor}"
  exit 1
}

Write-Host "Project: ${Project}"
Write-Host "Engine:  ${UERoot}"
Write-Host "Version: ${EngineVersion}"
Write-Host ""
Write-Host "Starting Unreal Editor..."

Start-Process -FilePath $Editor -ArgumentList "`"$Project`""
Start-Sleep -Seconds 2

$proc = Get-Process -Name "UnrealEditor" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($proc) { Write-Host "Editor launched (PID: $($proc.Id))" }
else { Write-Host "Editor launch requested." }
