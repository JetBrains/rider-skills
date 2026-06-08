param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$PassthroughArgs
)
$ErrorActionPreference = "Stop"
$sh = Join-Path $PSScriptRoot "ue-deploy.sh"
if (Get-Command bash -ErrorAction SilentlyContinue) {
  & bash $sh @PassthroughArgs
  exit $LASTEXITCODE
}
if (Get-Command wsl -ErrorAction SilentlyContinue) {
  $wslScript = (wsl wslpath -a "$sh").Trim()
  & wsl bash $wslScript @PassthroughArgs
  exit $LASTEXITCODE
}
Write-Error "bash or wsl is required to run ue-deploy.sh on Windows."
