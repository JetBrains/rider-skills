# ue-exec.ps1 — Native Windows AgentBridge client for Unreal Editor.
# Works without bash/WSL. Drop-in replacement for ue-exec.sh on Windows.
#
# Usage: .\ue-exec.ps1 --health
#        .\ue-exec.ps1 --script 'import unreal; print("hello")'
#        .\ue-exec.ps1 --file C:\path\to\script.py
#        .\ue-exec.ps1 --logs --severity error --lines 50
#        .\ue-exec.ps1 --play | --stop | --simulate

param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$RawArgs
)
$ErrorActionPreference = "Stop"

# ─── Parse arguments ──
$Mode = ""
$Script = ""
$ScriptFile = ""
$Host_ = if ($env:AGENT_BRIDGE_HOST) { $env:AGENT_BRIDGE_HOST } else { "localhost" }
$Port = $env:AGENT_BRIDGE_PORT
$Timeout = 30
$Isolated = $false
$MaxLines = 0
$LogLines = 100
$LogFilter = ""
$LogSeverity = "all"
$LogFormat = "text"
$BuildWait = $false
$BatchFile = ""
$StopOnError = $false

$i = 0
while ($i -lt $RawArgs.Count) {
  $arg = $RawArgs[$i]
  switch ($arg) {
    "--health"    { $Mode = "health" }
    "--script"    { $Mode = "exec"; $i++; $Script = $RawArgs[$i] }
    "--file"      { $Mode = "file"; $i++; $ScriptFile = $RawArgs[$i] }
    "--host"      { $i++; $Host_ = $RawArgs[$i] }
    "--port"      { $i++; $Port = $RawArgs[$i] }
    "--timeout"   { $i++; $Timeout = [int]$RawArgs[$i] }
    "--isolated"  { $Isolated = $true }
    "--max-lines" { $i++; $MaxLines = [int]$RawArgs[$i] }
    "--logs"      { $Mode = "logs" }
    "--errors"    { $Mode = "logs"; $LogSeverity = "error" }
    "--warnings"  { $Mode = "logs"; $LogSeverity = "warning" }
    "--lines"     { $i++; $LogLines = [int]$RawArgs[$i] }
    "--filter"    { $i++; $LogFilter = $RawArgs[$i] }
    "--severity"  { $i++; $LogSeverity = $RawArgs[$i] }
    "--json"      { $LogFormat = "json" }
    "--play"      { $Mode = "play" }
    "--stop"      { $Mode = "stop" }
    "--simulate"  { $Mode = "simulate" }
    "--play-pie"  { $Mode = "play-pie" }
    "--build"     { $Mode = "build" }
    "--wait"      { $BuildWait = $true }
    "--batch"     { $Mode = "batch"; $i++; $BatchFile = $RawArgs[$i] }
    "--stop-on-error" { $StopOnError = $true }
    "--devices"   { $Mode = "devices" }
    "--configs"   { $Mode = "configs" }
    { $_ -in "-h","--help" } {
      Write-Host @"
Usage: .\ue-exec.ps1 [options]

Modes:
  --health              Check if editor is reachable
  --script 'code'       Execute inline Python script
  --file path.py        Execute Python script from file
  --logs                Fetch editor logs
  --errors              Shortcut: --logs --severity error
  --play                Start Play In Editor (Selected Viewport)
  --stop                Stop active play session
  --simulate            Start Simulate In Editor
  --build               Trigger hot reload / live coding

Script options:
  --timeout SECONDS     Request timeout (default: 30)
  --isolated            Run in private scope

Environment:
  AGENT_BRIDGE_HOST     default localhost
  AGENT_BRIDGE_PORT     auto-detected from Saved\AgentBridge.port
"@
      exit 0
    }
    default { Write-Error "Unknown argument: $arg"; exit 1 }
  }
  $i++
}

# ─── Auto-detect port ──
function Find-AgentBridgePort {
  if ($Port) { return $Port }

  $searchDir = (Get-Location).Path
  while ($searchDir -and $searchDir -ne [System.IO.Path]::GetPathRoot($searchDir)) {
    $portFile = Join-Path $searchDir "Saved\AgentBridge.port"
    if (Test-Path $portFile) {
      $p = (Get-Content $portFile -Raw).Trim()
      if ($p -match '^\d+$') { return $p }
    }
    $uprojects = Get-ChildItem -Path $searchDir -Filter "*.uproject" -File -ErrorAction SilentlyContinue
    if ($uprojects) { break }
    $searchDir = Split-Path $searchDir -Parent
  }

  Write-Error "Cannot detect AgentBridge port. Saved\AgentBridge.port not found."
  exit 1
}

if ($Mode -ne "" -and $Mode -ne "help") {
  $Port = Find-AgentBridgePort
}
$BaseUrl = "http://${Host_}:${Port}"

# ─── HTTP helpers ──
function Invoke-AgentRequest {
  param(
    [string]$Method = "GET",
    [string]$Endpoint,
    [string]$Body,
    [int]$TimeoutSec = $Timeout
  )
  $url = "${BaseUrl}${Endpoint}"
  $params = @{
    Uri = $url
    Method = $Method
    TimeoutSec = $TimeoutSec
    ErrorAction = "Stop"
  }
  if ($Body) {
    $params.Body = $Body
    $params.ContentType = "application/json"
  }
  try {
    $response = Invoke-RestMethod @params
    return $response
  } catch {
    return $null
  }
}

function Invoke-AgentRaw {
  param(
    [string]$Method = "GET",
    [string]$Endpoint,
    [string]$Body,
    [int]$TimeoutSec = $Timeout
  )
  $url = "${BaseUrl}${Endpoint}"
  $params = @{
    Uri = $url
    Method = $Method
    TimeoutSec = $TimeoutSec
    ErrorAction = "Stop"
  }
  if ($Body) {
    $params.Body = [System.Text.Encoding]::UTF8.GetBytes($Body)
    $params.ContentType = "application/json; charset=utf-8"
  }
  try {
    $resp = Invoke-WebRequest @params
    return $resp.Content
  } catch {
    return $null
  }
}

function ConvertTo-SafeJson {
  param([string]$Text)
  # Use .NET for proper JSON escaping
  $escaped = [System.Web.HttpUtility]::JavaScriptStringEncode($Text)
  return $escaped
}

# Load System.Web for JSON escaping
Add-Type -AssemblyName System.Web -ErrorAction SilentlyContinue

# ─── Modes ──

if ($Mode -eq "") {
  Write-Error "Specify a mode (--health, --script, --file, --logs, --play, --stop, --simulate, --build)"
  exit 1
}

# ─── Health ──
if ($Mode -eq "health") {
  $resp = Invoke-AgentRaw -Endpoint "/agent/health" -TimeoutSec 5
  if (-not $resp) {
    Write-Error "Cannot reach editor at ${BaseUrl}"
    exit 1
  }
  Write-Host $resp
  exit 0
}

# ─── Logs ──
if ($Mode -eq "logs") {
  $query = "lines=${LogLines}"
  if ($LogFilter) { $query += "&filter=$([System.Uri]::EscapeDataString($LogFilter))" }
  if ($LogSeverity -ne "all") { $query += "&severity=${LogSeverity}" }

  $resp = Invoke-AgentRaw -Endpoint "/agent/logs?${query}" -TimeoutSec 10
  if (-not $resp) { Write-Error "Cannot reach editor at ${BaseUrl}"; exit 1 }

  if ($LogFormat -eq "json") { Write-Host $resp; exit 0 }

  $data = $resp | ConvertFrom-Json
  foreach ($entry in $data.entries) {
    $time = if ($entry.timestamp.Length -ge 19) { $entry.timestamp.Substring(11, 8) } else { $entry.timestamp }
    $sev = $entry.severity.ToUpper().PadRight(7)
    Write-Host "${time} ${sev} $($entry.message)"
  }
  Write-Host "`n--- $($data.count) entries ---"
  exit 0
}

# ─── Play/Stop/Simulate ──
if ($Mode -in "play","stop","simulate","play-pie") {
  if ($Mode -eq "play") {
    $pyScript = "import unreal; les = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem); playing = les.is_in_play_in_editor(); les.editor_request_begin_play() if not playing else None; print('playing_in_viewport' if not playing else 'already_playing')"
    $escaped = ConvertTo-SafeJson $pyScript
    $body = "{`"script`":`"${escaped}`"}"
    $resp = Invoke-AgentRaw -Method "POST" -Endpoint "/agent/execute" -Body $body
    if (-not $resp) { Write-Error "Cannot reach editor at ${BaseUrl}"; exit 1 }
    Write-Host '{"success": true, "state": "playing_in_viewport"}'
    exit 0
  }
  elseif ($Mode -eq "stop") {
    $pyScript = "import unreal; les = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem); les.editor_request_end_play(); print('stopped')"
    $escaped = ConvertTo-SafeJson $pyScript
    $body = "{`"script`":`"${escaped}`"}"
    $resp = Invoke-AgentRaw -Method "POST" -Endpoint "/agent/execute" -Body $body
    if (-not $resp) { Write-Error "Cannot reach editor at ${BaseUrl}"; exit 1 }
    Write-Host '{"success": true, "state": "stopped"}'
    exit 0
  }
  else {
    $pieMode = if ($Mode -eq "play-pie") { "pie" } else { $Mode }
    $body = "{`"mode`":`"${pieMode}`"}"
    $resp = Invoke-AgentRaw -Method "POST" -Endpoint "/agent/play" -Body $body
    if (-not $resp) { Write-Error "Cannot reach editor at ${BaseUrl}"; exit 1 }
    Write-Host $resp
    exit 0
  }
}

# ─── Build ──
if ($Mode -eq "build") {
  $waitVal = if ($BuildWait) { "true" } else { "false" }
  $resp = Invoke-AgentRaw -Method "POST" -Endpoint "/agent/build" -Body "{`"wait`":${waitVal}}" -TimeoutSec 120
  if (-not $resp) { Write-Error "Cannot reach editor at ${BaseUrl}"; exit 1 }
  Write-Host $resp
  exit 0
}

# ─── Devices / Configs ──
if ($Mode -in "devices","configs") {
  $resp = Invoke-AgentRaw -Endpoint "/agent/${Mode}" -TimeoutSec 10
  if (-not $resp) { Write-Error "Cannot reach editor at ${BaseUrl}"; exit 1 }
  Write-Host $resp
  exit 0
}

# ─── File mode ──
if ($Mode -eq "file") {
  if (-not (Test-Path $ScriptFile)) {
    Write-Error "File not found: ${ScriptFile}"
    exit 1
  }
  $Script = Get-Content $ScriptFile -Raw -Encoding UTF8
}

# ─── Execute script ──
if (-not $Script) {
  Write-Error "Empty script"
  exit 1
}

# ─── Append GC epilogue to every script execution ──
# Prevents GCObjectReferencer buildup from load_object/load_asset calls
# that block subsequent asset deletion. Uses base64-encoded exec() wrapper.
$scriptBytes = [System.Text.Encoding]::UTF8.GetBytes($Script)
$scriptB64 = [Convert]::ToBase64String($scriptBytes)
$Script = @"
import base64 as _b64, gc as _gc
try:
    exec(compile(_b64.b64decode('$scriptB64').decode('utf-8'), '<script>', 'exec'))
finally:
    _gc.collect()
    try:
        import unreal as _u
        _u.SystemLibrary.collect_garbage()
    except Exception:
        pass
"@

$escaped = ConvertTo-SafeJson $Script
$body = if ($Isolated) {
  "{`"script`":`"${escaped}`",`"isolated`":true}"
} else {
  "{`"script`":`"${escaped}`"}"
}

$resp = Invoke-AgentRaw -Method "POST" -Endpoint "/agent/execute" -Body $body
if (-not $resp) {
  Write-Error "No response from editor at ${BaseUrl}. Editor may have frozen or timed out (${Timeout}s)."
  exit 1
}

Write-Host $resp

# Check success
try {
  $data = $resp | ConvertFrom-Json
  if (-not $data.success) { exit 1 }
} catch {
  exit 1
}
