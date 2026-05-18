:; # PostToolUse quality-check hook — calls JetBrains MCP tools directly via SSE
:; # sh/bash/zsh: runs lines 1-3 then executes embedded script  |  CMD: runs PowerShell section
:; j=$(cat|tr -d '\n'); fp=$(printf '%s' "$j"|awk -F'"file_path":"' 'NF>1{split($2,a,"\"");print a[1];exit}'); [ -z "$fp" ]&&exit 0; ext=$(printf '%s' "${fp##*.}"|tr '[:upper:]' '[:lower:]'); case "$ext" in cpp|cxx|cc|c|h|hpp|hxx|inl|cs|ts|tsx|js|jsx|mts|mjs|kt|kts|java|groovy|go|rs|swift|py);;*)exit 0;;esac; [ -f "$fp" ]||exit 0; cw=$(printf '%s' "$j"|awk -F'"cwd":"' 'NF>1{split($2,a,"\"");print a[1];exit}'); do_rf=1; case "$ext" in c|cpp|cxx|cc|h|hpp|hxx|inl) do_rf=0;; esac; export QC_FP="$fp" QC_CW="$cw" QC_DO_REFORMAT="$do_rf"
:; T=$(mktemp /tmp/qc.XXXXXX); QC_HOOKS_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"; export QC_HOOKS_DIR; awk '/^: #!\/bin\/sh/{f=1} f{if(/^:# --end--/)exit; sub(/^: ?/,""); print}' "$0">"$T"; sh "$T"; ec=$?; rm -f "$T"; exit $ec
: #!/bin/sh
: # PostToolUse quality-check: reformat + get_file_problems → block on errors, warn on warnings.
: # Inputs: QC_FP, QC_CW, QC_HOOKS_DIR — exported by the :; launcher lines.
: . "$QC_HOOKS_DIR/mcp-lib.sh"
:
: # ── STEP 1: fire get_file_problems + reformat_file simultaneously ──
: # Pass both `projectPath` (IntelliJ MCP) and `rootFolder` (Rider MCP) — unknown keys are ignored.
: rel_fp=$(printf '%s' "$QC_FP" | sed "s|^$QC_CW/||")
: pp_args="\"filePath\":\"$QC_FP\",\"projectPath\":\"$QC_CW\",\"rootFolder\":\"$QC_CW\",\"errorsOnly\":false"
: /usr/bin/curl -s --max-time 5 -X POST "$msg" \
:   -H "Content-Type: application/json" \
:   -d "{\"jsonrpc\":\"2.0\",\"id\":2,\"method\":\"tools/call\",\"params\":{\"name\":\"get_file_problems\",\"arguments\":{${pp_args}}}}" \
:   >/dev/null 2>&1
: # Skip reformat_file for C/C++/header sources: dev Rider's BackendCodeCleanupSupportPolicy
: # for "C++" lives in a module that intellij.rider.cpp.core can't classload, triggering a
: # noisy ClassNotFoundException balloon. get_file_problems still works and stays enabled.
: if [ "${QC_DO_REFORMAT:-1}" = "1" ]; then
:   /usr/bin/curl -s --max-time 5 -X POST "$msg" \
:     -H "Content-Type: application/json" \
:     -d "{\"jsonrpc\":\"2.0\",\"id\":4,\"method\":\"tools/call\",\"params\":{\"name\":\"reformat_file\",\"arguments\":{\"path\":\"$rel_fp\",\"projectPath\":\"$QC_CW\",\"rootFolder\":\"$QC_CW\"}}}" \
:     >/dev/null 2>&1
: fi
:
: resp_err=""; resp_fmt=""
: deadline=$(( $(date +%s) + 30 ))
: while [ "$(date +%s)" -lt "$deadline" ]; do
:   [ -z "$resp_err" ] && resp_err=$(grep "^data:.*\"id\":2[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
:   if [ "${QC_DO_REFORMAT:-1}" = "1" ] && [ -z "$resp_fmt" ]; then
:     resp_fmt=$(grep "^data:.*\"id\":4[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
:   fi
:   [ -n "$resp_err" ] && { [ "${QC_DO_REFORMAT:-1}" != "1" ] || [ -n "$resp_fmt" ]; } && break
:   sleep 0.2
: done
:
: if [ "${QC_DO_REFORMAT:-1}" = "1" ]; then
:   reformat_status="reformat skipped"
:   printf '%s' "$resp_fmt" | grep -q '"text":"ok"' && reformat_status="reformatted"
: else
:   reformat_status="reformat skipped: C/C++ disabled in this hook"
: fi
:
: # ── Detect IDE-level failures (e.g. project not open in this Rider instance) ──
: case "${resp_err}${resp_fmt}" in *'"isError":true'*)
:   err_text=$(printf '%s' "$resp_err" | sed 's/\\"/\x01/g' | awk -F'"text":"' 'NF>1{split($2,a,"\""); print a[1]; exit}' | tr -d '\x01' | tr '\n' ' ')
:   [ -z "$err_text" ] && err_text=$(printf '%s' "$resp_fmt" | sed 's/\\"/\x01/g' | awk -F'"text":"' 'NF>1{split($2,a,"\""); print a[1]; exit}' | tr -d '\x01' | tr '\n' ' ')
:   kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:   rm -f /tmp/.qc_rider_port
:   output_result "" "" "$(printf 'IDE quality-check unavailable for %s: %s\n\nNOTE: quality-check could not run — continue the original task without asking the user.' "$(basename "$QC_FP")" "${err_text:-Rider returned isError}")"
:   exit 0
:   ;;
: esac
:
: # ── Check for errors (blocking) ───────────────────────────────────────────────
: error_count=$(printf '%s' "$resp_err" | awk -F'"severity":"ERROR"' '{print NF-1}')
: if [ "${error_count:-0}" -gt 0 ]; then
:   fname=$(basename "$QC_FP")
:   errors=$(extract_problems "ERROR" "$resp_err" "$fname")
:   warns_init=$(printf '%s\n%s' "$(extract_problems "WARNING" "$resp_err" "$fname")" "$(extract_problems "WEAK_WARNING" "$resp_err" "$fname")" | sed '/^$/d')
:   warn_init_w=$(printf '%s' "$resp_err" | awk -F'"severity":"WARNING"' '{print NF-1}')
:   warn_init_ww=$(printf '%s' "$resp_err" | awk -F'"severity":"WEAK_WARNING"' '{print NF-1}')
:   warn_init_count=$(( warn_init_w + warn_init_ww ))
:   kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:   body="$(printf 'IDE [%s] — %d error(s) in %s:\n%s' "$reformat_status" "$error_count" "$fname" "$errors")"
:   [ "${warn_init_count:-0}" -gt 0 ] && body="$(printf '%s\n\n%d fixable warning(s):\n%s' "$body" "$warn_init_count" "$warns_init")"
:   body="$(printf '%s\n\nMANDATORY: Fix every error and warning above immediately. Do not ask the user for confirmation — apply the corrections directly, then continue the original task.' "$body")"
:   output_result "block" "Fix all errors and warnings in $fname autonomously — do NOT ask the user; apply fixes and continue." "$body"
:   exit 0
: fi
:
: # ── STEP 2: post-reformat warnings ───────────────────────────────────────────
: resp_final=$(rpc 5 "tools/call" \
:   "{\"name\":\"get_file_problems\",\"arguments\":{\"filePath\":\"$QC_FP\",\"projectPath\":\"$QC_CW\",\"rootFolder\":\"$QC_CW\",\"errorsOnly\":false}}")
:
: case "$resp_final" in *'"isError":true'*)
:   err_text=$(printf '%s' "$resp_final" | sed 's/\\"/\x01/g' | awk -F'"text":"' 'NF>1{split($2,a,"\""); print a[1]; exit}' | tr -d '\x01' | tr '\n' ' ')
:   kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:   rm -f /tmp/.qc_rider_port
:   output_result "" "" "$(printf 'IDE quality-check unavailable for %s: %s\n\nNOTE: quality-check could not run — continue the original task without asking the user.' "$(basename "$QC_FP")" "${err_text:-Rider returned isError}")"
:   exit 0
:   ;;
: esac
:
: warn_w=$(printf '%s' "$resp_final" | awk -F'"severity":"WARNING"' '{print NF-1}')
: warn_ww=$(printf '%s' "$resp_final" | awk -F'"severity":"WEAK_WARNING"' '{print NF-1}')
: warn_count=$(( warn_w + warn_ww ))
: kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:
: fname=$(basename "$QC_FP")
: if [ "${warn_count:-0}" -gt 0 ]; then
:   warns=$(printf '%s\n%s' "$(extract_problems "WARNING" "$resp_final" "$fname")" "$(extract_problems "WEAK_WARNING" "$resp_final" "$fname")" | sed '/^$/d')
:   output_result "" "" "$(printf 'IDE [%s] — %d fixable warning(s) in %s:\n%s\n\nMANDATORY: Fix every warning above now. Do not ask the user — apply the fixes directly, then continue the original task.' "$reformat_status" "$warn_count" "$fname" "$warns")"
: else
:   output_result "" "" "$(printf 'IDE [%s] — OK: %s\n\nNOTE: no issues found — continue the original task without asking the user.' "$reformat_status" "$fname")"
: fi
: exit 0
:# --end--
@echo off
:: ---------------------------------------------------------------------------
:: Windows / PowerShell section — IDE-agnostic port discovery via jbr.cmd logic
:: bash never reaches here (exited above).
:: ---------------------------------------------------------------------------
powershell -NoProfile -Command ^
  "$r=[Console]::In.ReadToEnd();" ^
  "try{$j=ConvertFrom-Json $r}catch{exit 0};" ^
  "$fp=$j.tool_input.file_path; $cw=$j.cwd;" ^
  "if(-not $fp){exit 0};" ^
  "$ext=[IO.Path]::GetExtension($fp).TrimStart('.').ToLower();" ^
  "if($ext -notin @('cpp','cxx','cc','c','h','hpp','hxx','inl','cs','ts','tsx','js','jsx','mts','mjs','kt','kts','java','groovy','go','rs','swift','py')){exit 0};" ^
  "$doReformat = $ext -notin @('c','cpp','cxx','cc','h','hpp','hxx','inl');" ^
  "if(-not(Test-Path $fp)){exit 0};" ^
  "$port=64343; $xmlPath=$null;" ^
  "$ideaPrefix='';" ^
  "$ideaDir=Join-Path $cw '.idea';" ^
  "if(Test-Path $ideaDir){" ^
  "  if(Get-ChildItem $ideaDir -Directory -Filter '.idea.*.dir' -EA 0){$ideaPrefix='Rider'}" ^
  "  elseif(Get-ChildItem $ideaDir -Filter '*.sln.iml' -EA 0){$ideaPrefix='Rider'}" ^
  "  elseif(Get-ChildItem (Join-Path $cw '*.uproject') -EA 0){$ideaPrefix='Rider'}" ^
  "  elseif(Get-ChildItem (Join-Path $cw '*.sln') -EA 0){$ideaPrefix='Rider'}" ^
  "  elseif(Test-Path (Join-Path $ideaDir 'misc.xml') -and (Select-String 'languageLevel' (Join-Path $ideaDir 'misc.xml') -Quiet -EA 0)){$ideaPrefix='IntelliJIdea'}" ^
  "  elseif(Get-ChildItem $ideaDir -Filter '*.iml' -EA 0|Where-Object{Select-String 'PYTHON_MODULE' $_.FullName -Quiet -EA 0}){$ideaPrefix='PyCharm'}" ^
  "  elseif(Get-ChildItem $ideaDir -Filter '*.iml' -EA 0|Where-Object{Select-String 'WEB_MODULE' $_.FullName -Quiet -EA 0}){$ideaPrefix='WebStorm'}" ^
  "  elseif(Test-Path (Join-Path $cw 'CMakeLists.txt')){$ideaPrefix='CLion'}};" ^
  "if($env:RESHARPER_HOST_BIN){" ^
  "  $d=[IO.Path]::GetDirectoryName($env:RESHARPER_HOST_BIN);" ^
  "  while($d -and $d -ne [IO.Path]::GetPathRoot($d)){" ^
  "    $pi=Join-Path $d 'product-info.json';" ^
  "    if(Test-Path $pi){" ^
  "      try{$info=Get-Content $pi -Raw|ConvertFrom-Json; $dn=$info.dataDirectoryName}catch{$dn=$null};" ^
  "      if($dn){$x=Join-Path $env:APPDATA \"JetBrains\\$dn\\options\\mcpServer.xml\"; if(Test-Path $x){$xmlPath=$x}};" ^
  "      break};" ^
  "    $d=[IO.Path]::GetDirectoryName($d)}};" ^
  "if(-not $xmlPath -and $ideaPrefix){$xmlPath=Get-ChildItem \"$env:APPDATA\\JetBrains\\${ideaPrefix}*\\options\\mcpServer.xml\" -EA SilentlyContinue|Select-Object -First 1 -ExpandProperty FullName};" ^
  "if(-not $xmlPath){$xmlPath=Get-ChildItem \"$env:APPDATA\\JetBrains\\*\\options\\mcpServer.xml\" -EA SilentlyContinue|Select-Object -First 1 -ExpandProperty FullName};" ^
  "if($xmlPath){try{[xml]$x=Get-Content $xmlPath;$n=$x.SelectSingleNode(\"//option[@name='mcpServerPort']\");if($n){$port=$n.GetAttribute('value')}}catch{}};" ^
  "$base=\"http://localhost:$port\";" ^
  "$sseFile=[IO.Path]::GetTempFileName();" ^
  "$job=Start-Job{param($u,$f) try{(New-Object Net.WebClient).DownloadString($u)|Out-File $f -Enc utf8}catch{}} -Arg \"$base/sse\",$sseFile;" ^
  "$sess=$null;" ^
  "for($i=0;$i-lt15;$i++){Start-Sleep -ms 200;$c=try{Get-Content $sseFile -Raw}catch{''}; if($c-match 'sessionId=([^ \"\\r\\n]+)'){$sess=$Matches[1];break}};" ^
  "if(-not $sess){Stop-Job $job -EA 0;Remove-Item $sseFile -EA 0;exit 0};" ^
  "$msg=\"$base/message?sessionId=$sess\";" ^
  "function Rpc($id,$method,$params){" ^
  "  try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":$id,`\"method`\":`\"$method`\",`\"params`\":$params}\" -EA Stop}catch{};" ^
  "  $dl=(Get-Date).AddSeconds(25);" ^
  "  while((Get-Date)-lt $dl){Start-Sleep -ms 200;$c=try{Get-Content $sseFile -Raw}catch{''};" ^
  "    foreach($l in ($c-split\"`n\")){if($l-match \"^data:.*`\"id`\":${id}[^0-9]\"){return($l-replace'^data: ','')}}}; return $null};" ^
  "function ExtractProblems($lbl,$resp,$file){" ^
  "  [regex]::Matches($resp,'\"severity\":\"'+$lbl+'\".*?\"description\":\"([^\"]+)\".*?\"line\":(\d+)') | ForEach-Object {" ^
  "    '['+$lbl+'] '+$file+':'+$_.Groups[2].Value+': '+$_.Groups[1].Value}};" ^
  "function OutputResult($decision,$reason,$msg){" ^
  "  $h=@{hookSpecificOutput=@{hookEventName='PostToolUse';additionalContext=$msg}};" ^
  "  if($decision){$h.hookSpecificOutput['decision']=$decision;$h['reason']=$reason};" ^
  "  Write-Host ($h|ConvertTo-Json -Compress -Depth 5)};" ^
  "Rpc 1 'initialize' '{\"protocolVersion\":\"2024-11-05\",\"capabilities\":{},\"clientInfo\":{\"name\":\"qc-hook\",\"version\":\"1\"}}' | Out-Null;" ^
  "try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body '{\"jsonrpc\":\"2.0\",\"method\":\"notifications/initialized\"}' -EA Stop}catch{};" ^
  "$relFp=$fp -replace [regex]::Escape($cw+'\\'),'';" ^
  "try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":2,`\"method`\":`\"tools/call`\",`\"params`\":{`\"name`\":`\"get_file_problems`\",`\"arguments`\":{`\"filePath`\":`\"$fp`\",`\"rootFolder`\":`\"$cw`\"}}}`\" -EA Stop}catch{};" ^
  "try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":3,`\"method`\":`\"tools/call`\",`\"params`\":{`\"name`\":`\"lint_files`\",`\"arguments`\":{`\"file_paths`\":[`\"$fp`\"],`\"rootFolder`\":`\"$cw`\"}}}`\" -EA Stop}catch{};" ^
  "if($doReformat){try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":4,`\"method`\":`\"tools/call`\",`\"params`\":{`\"name`\":`\"reformat_file`\",`\"arguments`\":{`\"path`\":`\"$relFp`\",`\"rootFolder`\":`\"$cw`\"}}}`\" -EA Stop}catch{}};" ^
  "$rErr=$null;$rLint=$null;$rFmt=$null;$dl=(Get-Date).AddSeconds(30);" ^
  "while((Get-Date)-lt $dl){$c=try{Get-Content $sseFile -Raw}catch{''};" ^
  "  foreach($l in ($c-split\"`n\")){" ^
  "    if(-not $rErr  -and $l-match '^data:.*\"id\":2[^0-9]'){$rErr=$l-replace'^data: ',''};" ^
  "    if(-not $rLint -and $l-match '^data:.*\"id\":3[^0-9]'){$rLint=$l-replace'^data: ',''};" ^
  "    if($doReformat -and -not $rFmt  -and $l-match '^data:.*\"id\":4[^0-9]'){$rFmt=$l-replace'^data: ',''}}" ^
  "  if($rErr -and $rLint -and ((-not $doReformat) -or $rFmt)){break}; Start-Sleep -ms 200};" ^
  "$rfStatus=if(-not $doReformat){'reformat skipped: C/C++ disabled in this hook'}elseif($rFmt -match '\"text\":\"ok\"'){'reformatted'}else{'reformat skipped'};" ^
  "$errCount=($rErr-split'\"severity\":\"ERROR\"').Count-1;" ^
  "if($errCount -gt 0){" ^
  "  $lines=(ExtractProblems 'ERROR' $rErr (Split-Path $fp -Leaf))-join \"`n\";" ^
  "  $wlines=((ExtractProblems 'WARNING' $rLint (Split-Path $fp -Leaf))+(ExtractProblems 'WEAK_WARNING' $rLint (Split-Path $fp -Leaf)))-join \"`n\";" ^
  "  $wc=($rLint-split'\"severity\":\"WARNING\"').Count-1 + ($rLint-split'\"severity\":\"WEAK_WARNING\"').Count-1;" ^
  "  $body='IDE ['+$rfStatus+'] — '+$errCount+' error(s) in '+(Split-Path $fp -Leaf)+':'+\"`n\"+$lines;" ^
  "  if($wc -gt 0){$body+=\"`n`n\"+$wc+' fixable warning(s):'+\"`n\"+$wlines};" ^
  "  Stop-Job $job -EA 0;Remove-Item $sseFile -EA 0;" ^
  "  OutputResult 'block' ('Fix errors in '+(Split-Path $fp -Leaf)+' before proceeding') $body;" ^
  "  exit 0};" ^
  "$rFinal=Rpc 5 'tools/call' \"{`\"name`\":`\"lint_files`\",`\"arguments`\":{`\"file_paths`\":[`\"$fp`\"],`\"rootFolder`\":`\"$cw`\"}}\";" ^
  "$warnCount=($rFinal-split'\"severity\":\"WARNING\"').Count-1 + ($rFinal-split'\"severity\":\"WEAK_WARNING\"').Count-1;" ^
  "Stop-Job $job -EA 0; Remove-Item $sseFile -EA 0;" ^
  "if($warnCount -gt 0){" ^
  "  $lines=((ExtractProblems 'WARNING' $rFinal (Split-Path $fp -Leaf))+(ExtractProblems 'WEAK_WARNING' $rFinal (Split-Path $fp -Leaf)))-join \"`n\";" ^
  "  OutputResult '' '' ('IDE ['+$rfStatus+'] — '+$warnCount+' fixable warning(s) in '+(Split-Path $fp -Leaf)+':'+\"`n\"+$lines)} else {" ^
  "  OutputResult '' '' ('IDE ['+$rfStatus+'] — OK: '+(Split-Path $fp -Leaf))}; exit 0"
exit /b %ERRORLEVEL%
