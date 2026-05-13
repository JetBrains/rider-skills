:; # PostToolUse quality-check hook — calls JetBrains MCP tools directly via SSE
:; # sh/bash/zsh: runs lines 1-3 then executes embedded script  |  CMD: runs PowerShell section
:; j=$(cat|tr -d '\n'); fp=$(printf '%s' "$j"|awk -F'"file_path":"' 'NF>1{split($2,a,"\"");print a[1];exit}'); [ -z "$fp" ]&&exit 0; ext=$(printf '%s' "${fp##*.}"|tr '[:upper:]' '[:lower:]'); case "$ext" in cpp|cxx|cc|c|h|hpp|hxx|inl|cs|ts|tsx|js|jsx|mts|mjs|kt|kts|java|groovy|go|rs|swift|py);;*)exit 0;;esac; [ -f "$fp" ]||exit 0; cw=$(printf '%s' "$j"|awk -F'"cwd":"' 'NF>1{split($2,a,"\"");print a[1];exit}'); export QC_FP="$fp" QC_CW="$cw"
:; T=$(mktemp /tmp/qc.XXXXXX); QC_HOOKS_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"; export QC_HOOKS_DIR; awk '/^: #!\/bin\/sh/{f=1} f{if(/^:# --end--/)exit; sub(/^: ?/,""); print}' "$0">"$T"; sh "$T"; ec=$?; rm -f "$T"; exit $ec
: #!/bin/sh
: # JetBrains MCP quality-check: errors + inspections → reformat → report all
: # Inputs: QC_FP, QC_CW, QC_HOOKS_DIR — exported by the :; detection lines.
:
: # ── Port discovery ────────────────────────────────────────────────────────────
:
: # Step 1: detect IDE type from .idea folder → config directory name prefix
: # Returns e.g. "Rider", "IntelliJIdea", "PyCharm", "CLion", "WebStorm"
: _ide_prefix_from_idea() {
:   local d="$1" sub f root
:   [ -d "$d" ] || return
:   root=$(dirname "$d")
:   # Rider: .idea.*.dir/ subdirectory (C++/Unreal/CMake directory-based project)
:   for sub in "$d"/.idea.*.dir; do [ -d "$sub" ] && { printf 'Rider'; return; }; done
:   # Rider: *.sln.iml present (C# .NET solution)
:   for f in "$d"/*.sln.iml; do [ -f "$f" ] && { printf 'Rider'; return; }; done
:   # Rider: RiderProjectSettingsUpdater in top-level or nested projectSettingsUpdater.xml
:   for f in "$d/projectSettingsUpdater.xml" "$d"/.idea.*.dir/.idea/projectSettingsUpdater.xml; do
:     grep -q "RiderProjectSettingsUpdater" "$f" 2>/dev/null && { printf 'Rider'; return; }
:   done
:   # Rider: *.uproject in project root (Unreal Engine)
:   for f in "$root"/*.uproject; do [ -f "$f" ] && { printf 'Rider'; return; }; done
:   # Rider: *.sln in project root
:   for f in "$root"/*.sln; do [ -f "$f" ] && { printf 'Rider'; return; }; done
:   # IntelliJ IDEA: languageLevel in misc.xml → Java project
:   grep -q "languageLevel" "$d/misc.xml" 2>/dev/null && { printf 'IntelliJIdea'; return; }
:   # PyCharm: PYTHON_MODULE in any .iml file
:   for f in "$d"/*.iml; do
:     [ -f "$f" ] && grep -q "PYTHON_MODULE" "$f" 2>/dev/null && { printf 'PyCharm'; return; }
:   done
:   # WebStorm: WEB_MODULE in any .iml file
:   for f in "$d"/*.iml; do
:     [ -f "$f" ] && grep -q "WEB_MODULE" "$f" 2>/dev/null && { printf 'WebStorm'; return; }
:   done
:   # CLion: CMakeLists.txt in project root (no .sln found above)
:   [ -f "$root/CMakeLists.txt" ] && { printf 'CLion'; return; }
: }
:
: idea_prefix=$(_ide_prefix_from_idea "$QC_CW/.idea")
:
: # Step 2: source jbr.cmd to detect the running IDE installation; sets RIDER_JAVA
: . "$QC_HOOKS_DIR/jbr.cmd" 2>/dev/null
:
: port=""
: # Step 3: derive exact config path from RIDER_JAVA (most precise — specific version)
: if [ -n "$RIDER_JAVA" ]; then
:   case "$(uname -s)" in
:     Darwin)
:       bundle=$(printf '%s' "$RIDER_JAVA" | sed 's|/Contents/jbr/.*||')
:       if [ -d "$bundle" ]; then
:         ide_name=$(basename "$bundle" .app)
:         ide_ver=$(defaults read "$bundle/Contents/Info" CFBundleShortVersionString 2>/dev/null \
:           | awk -F. '{printf "%s.%s",$1,$2}')
:         xml="$HOME/Library/Application Support/JetBrains/${ide_name}${ide_ver}/options/mcpServer.xml"
:         [ -f "$xml" ] && port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' "$xml")
:       fi
:       ;;
:     Linux)
:       ide_root=$(printf '%s' "$RIDER_JAVA" | sed 's|/jbr/bin/java||')
:       if [ -f "$ide_root/product-info.json" ]; then
:         data_dir=$(awk -F'"dataDirectoryName":"' 'NF>1{split($2,a,"\"");print a[1];exit}' \
:           "$ide_root/product-info.json")
:         xml="$HOME/.config/JetBrains/${data_dir}/options/mcpServer.xml"
:         [ -f "$xml" ] && port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' "$xml")
:       fi
:       ;;
:   esac
: fi
:
: # Step 4: .idea prefix → targeted glob (narrows to the right IDE when multiple are installed)
: if [ -z "$port" ] && [ -n "$idea_prefix" ]; then
:   port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' \
:     "$HOME/Library/Application Support/JetBrains/${idea_prefix}"*/options/mcpServer.xml \
:     "$HOME/.config/JetBrains/${idea_prefix}"*/options/mcpServer.xml \
:     2>/dev/null | head -1)
: fi
:
: # Step 5: broad fallback — any JetBrains IDE config dir
: if [ -z "$port" ]; then
:   port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' \
:     "$HOME/Library/Application Support/JetBrains/"*/options/mcpServer.xml \
:     "$HOME/.config/JetBrains/"*/options/mcpServer.xml \
:     2>/dev/null | head -1)
: fi
: port=${port:-64343}
: base="http://localhost:${port}"
:
: # ── SSE connection ────────────────────────────────────────────────────────────
: sse=$(mktemp /tmp/qc_sse.XXXXXX)
: /usr/bin/curl -s --no-buffer --max-time 90 -N "${base}/sse" >> "$sse" 2>/dev/null &
: sse_pid=$!
:
: sess=""
: for _i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
:   sess=$(grep -o 'sessionId=[^ "]*' "$sse" 2>/dev/null | head -1 | sed 's/sessionId=//' | tr -d '\r')
:   [ -n "$sess" ] && break
:   sleep 0.2
: done
: if [ -z "$sess" ]; then
:   kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:   exit 0   # IDE not running or MCP unavailable — skip silently
: fi
: msg="${base}/message?sessionId=${sess}"
:
: # rpc <id> <method> <params_json>  →  prints raw SSE response line, returns 1 on timeout
: rpc() {
:   /usr/bin/curl -s --max-time 5 -X POST "$msg" \
:     -H "Content-Type: application/json" \
:     -d "{\"jsonrpc\":\"2.0\",\"id\":$1,\"method\":\"$2\",\"params\":$3}" \
:     >/dev/null 2>&1
:   deadline=$(( $(date +%s) + 25 ))
:   while [ "$(date +%s)" -lt "$deadline" ]; do
:     line=$(grep "^data:.*\"id\":${1}[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
:     [ -n "$line" ] && { printf '%s' "$line"; return 0; }
:     sleep 0.2
:   done
:   return 1
: }
:
: # Initialize MCP session
: rpc 1 "initialize" \
:   '{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"qc-hook","version":"1"}}' \
:   >/dev/null
: /usr/bin/curl -s -X POST "$msg" -H "Content-Type: application/json" \
:   -d '{"jsonrpc":"2.0","method":"notifications/initialized"}' >/dev/null 2>&1
:
: # ── STEP 1: fire get_file_problems + lint_files + reformat_file simultaneously ──
: rel_fp=$(printf '%s' "$QC_FP" | sed "s|^$QC_CW/||")
: /usr/bin/curl -s --max-time 5 -X POST "$msg" \
:   -H "Content-Type: application/json" \
:   -d "{\"jsonrpc\":\"2.0\",\"id\":2,\"method\":\"tools/call\",\"params\":{\"name\":\"get_file_problems\",\"arguments\":{\"filePath\":\"$QC_FP\",\"rootFolder\":\"$QC_CW\"}}}" \
:   >/dev/null 2>&1
: /usr/bin/curl -s --max-time 5 -X POST "$msg" \
:   -H "Content-Type: application/json" \
:   -d "{\"jsonrpc\":\"2.0\",\"id\":3,\"method\":\"tools/call\",\"params\":{\"name\":\"lint_files\",\"arguments\":{\"file_paths\":[\"$QC_FP\"],\"rootFolder\":\"$QC_CW\"}}}" \
:   >/dev/null 2>&1
: /usr/bin/curl -s --max-time 5 -X POST "$msg" \
:   -H "Content-Type: application/json" \
:   -d "{\"jsonrpc\":\"2.0\",\"id\":4,\"method\":\"tools/call\",\"params\":{\"name\":\"reformat_file\",\"arguments\":{\"path\":\"$rel_fp\",\"rootFolder\":\"$QC_CW\"}}}" \
:   >/dev/null 2>&1
:
: # wait for all three responses
: resp_err=""; resp_lint=""; resp_fmt=""
: deadline=$(( $(date +%s) + 30 ))
: while [ "$(date +%s)" -lt "$deadline" ]; do
:   [ -z "$resp_err"  ] && resp_err=$(grep  "^data:.*\"id\":2[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
:   [ -z "$resp_lint" ] && resp_lint=$(grep "^data:.*\"id\":3[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
:   [ -z "$resp_fmt"  ] && resp_fmt=$(grep  "^data:.*\"id\":4[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
:   [ -n "$resp_err" ] && [ -n "$resp_lint" ] && [ -n "$resp_fmt" ] && break
:   sleep 0.2
: done
:
: fmt_ok=$(printf '%s' "$resp_fmt" | grep -o '"text":"ok"' | head -1)
: reformat_status="reformat skipped"
: [ -n "$fmt_ok" ] && reformat_status="reformatted"
:
: # extract_problems <severity> <resp> <basename>
: extract_problems() {
:   label="$1"; resp="$2"
:   printf '%s' "$resp" | awk -v lbl="$label" -F'"severity":"' '
:     NF>1{
:       for(i=2;i<=NF;i++){
:         split($i,sv,"\""); if(sv[1]!=lbl) continue
:         desc=""; split($i,dd,"\"description\":\"")
:         if(length(dd)>1){split(dd[2],de,"\""); desc=de[1]}
:         ln=0; split($i,ll,"\"line\":")
:         if(length(ll)>1){split(ll[2],le,","); ln=le[1]+0}
:         if(desc!="")printf "• L%d: %s\n", ln, desc
:       }
:     }'
: }
:
: # JSON-escape a string: \ → \\ , " → \" , tab → \t , newlines → \n
: _jesc() {
:   printf '%s' "$1" | awk 'BEGIN{ORS=""} {
:     gsub(/\\/, "\\\\"); gsub(/"/, "\\\""); gsub(/\t/, "\\t")
:     if(NR>1) printf "\\n"
:     printf "%s",$0
:   }'
: }
:
: # output_result <decision|""> <reason|""> <message>
: # Always exits 0; decision="block" makes Claude Code block the edit.
: output_result() {
:   local decision="$1" reason="$2" msg="$3"
:   local esc_msg esc_reason
:   esc_msg=$(_jesc "$msg")
:   if [ -n "$decision" ]; then
:     esc_reason=$(_jesc "$reason")
:     printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"%s","decision":"%s"},"reason":"%s"}\n' \
:       "$esc_msg" "$decision" "$esc_reason"
:   else
:     printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"%s"}}\n' "$esc_msg"
:   fi
: }
:
: # ── Check for critical errors (blocking) ─────────────────────────────────────
: error_count=$(printf '%s' "$resp_err" | awk -F'"severity":"ERROR"' '{print NF-1}')
: if [ "${error_count:-0}" -gt 0 ]; then
:   errors=$(extract_problems "ERROR" "$resp_err")
:   warns_init=$(extract_problems "WARNING" "$resp_lint")
:   warn_init_count=$(printf '%s' "$resp_lint" | awk -F'"severity":"WARNING"' '{print NF-1}')
:   kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:   body="$(printf 'Rider [%s] — %d error(s) in %s:\n%s' "$reformat_status" "$error_count" "$(basename "$QC_FP")" "$errors")"
:   [ "${warn_init_count:-0}" -gt 0 ] && body="$(printf '%s\n\n%d fixable warning(s):\n%s' "$body" "$warn_init_count" "$warns_init")"
:   output_result "block" "Fix errors in $(basename "$QC_FP") before proceeding" "$body"
:   exit 0
: fi
:
: # ── STEP 2: post-reformat inspections ────────────────────────────────────────
: resp_final=$(rpc 5 "tools/call" \
:   "{\"name\":\"lint_files\",\"arguments\":{\"file_paths\":[\"$QC_FP\"],\"rootFolder\":\"$QC_CW\"}}")
:
: warn_count=$(printf '%s' "$resp_final" | awk -F'"severity":"WARNING"' '{print NF-1}')
:
: kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:
: if [ "${warn_count:-0}" -gt 0 ]; then
:   warns=$(extract_problems "WARNING" "$resp_final")
:   output_result "" "" \
:     "$(printf 'Rider [%s] — %d fixable warning(s) in %s:\n%s' "$reformat_status" "$warn_count" "$(basename "$QC_FP")" "$warns")"
: else
:   output_result "" "" "Rider [${reformat_status}] — OK: $(basename "$QC_FP")"
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
  "function ExtractProblems($lbl,$resp){" ^
  "  [regex]::Matches($resp,'\"severity\":\"'+$lbl+'\".*?\"description\":\"([^\"]+)\".*?\"line\":(\d+)') | ForEach-Object {" ^
  "    '• L'+$_.Groups[2].Value+': '+$_.Groups[1].Value}};" ^
  "function OutputResult($decision,$reason,$msg){" ^
  "  $h=@{hookSpecificOutput=@{hookEventName='PostToolUse';additionalContext=$msg}};" ^
  "  if($decision){$h.hookSpecificOutput['decision']=$decision;$h['reason']=$reason};" ^
  "  Write-Host ($h|ConvertTo-Json -Compress -Depth 5)};" ^
  "Rpc 1 'initialize' '{\"protocolVersion\":\"2024-11-05\",\"capabilities\":{},\"clientInfo\":{\"name\":\"qc-hook\",\"version\":\"1\"}}' | Out-Null;" ^
  "try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body '{\"jsonrpc\":\"2.0\",\"method\":\"notifications/initialized\"}' -EA Stop}catch{};" ^
  "$relFp=$fp -replace [regex]::Escape($cw+'\\'),'';" ^
  "try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":2,`\"method`\":`\"tools/call`\",`\"params`\":{`\"name`\":`\"get_file_problems`\",`\"arguments`\":{`\"filePath`\":`\"$fp`\",`\"rootFolder`\":`\"$cw`\"}}}`\" -EA Stop}catch{};" ^
  "try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":3,`\"method`\":`\"tools/call`\",`\"params`\":{`\"name`\":`\"lint_files`\",`\"arguments`\":{`\"file_paths`\":[`\"$fp`\"],`\"rootFolder`\":`\"$cw`\"}}}`\" -EA Stop}catch{};" ^
  "try{Invoke-RestMethod -Method POST -Uri $msg -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":4,`\"method`\":`\"tools/call`\",`\"params`\":{`\"name`\":`\"reformat_file`\",`\"arguments`\":{`\"path`\":`\"$relFp`\",`\"rootFolder`\":`\"$cw`\"}}}`\" -EA Stop}catch{};" ^
  "$rErr=$null;$rLint=$null;$rFmt=$null;$dl=(Get-Date).AddSeconds(30);" ^
  "while((Get-Date)-lt $dl){$c=try{Get-Content $sseFile -Raw}catch{''};" ^
  "  foreach($l in ($c-split\"`n\")){" ^
  "    if(-not $rErr  -and $l-match '^data:.*\"id\":2[^0-9]'){$rErr=$l-replace'^data: ',''};" ^
  "    if(-not $rLint -and $l-match '^data:.*\"id\":3[^0-9]'){$rLint=$l-replace'^data: ',''};" ^
  "    if(-not $rFmt  -and $l-match '^data:.*\"id\":4[^0-9]'){$rFmt=$l-replace'^data: ',''}}" ^
  "  if($rErr -and $rLint -and $rFmt){break}; Start-Sleep -ms 200};" ^
  "$rfStatus=if($rFmt -match '\"text\":\"ok\"'){'reformatted'}else{'reformat skipped'};" ^
  "$errCount=($rErr-split'\"severity\":\"ERROR\"').Count-1;" ^
  "if($errCount -gt 0){" ^
  "  $lines=(ExtractProblems 'ERROR' $rErr)-join \"`n\";" ^
  "  $wlines=(ExtractProblems 'WARNING' $rLint)-join \"`n\";" ^
  "  $wc=($rLint-split'\"severity\":\"WARNING\"').Count-1;" ^
  "  $body='Rider ['+$rfStatus+'] — '+$errCount+' error(s) in '+(Split-Path $fp -Leaf)+':'+\"`n\"+$lines;" ^
  "  if($wc -gt 0){$body+=\"`n`n\"+$wc+' fixable warning(s):'+\"`n\"+$wlines};" ^
  "  Stop-Job $job -EA 0;Remove-Item $sseFile -EA 0;" ^
  "  OutputResult 'block' ('Fix errors in '+(Split-Path $fp -Leaf)+' before proceeding') $body;" ^
  "  exit 0};" ^
  "$rFinal=Rpc 5 'tools/call' \"{`\"name`\":`\"lint_files`\",`\"arguments`\":{`\"file_paths`\":[`\"$fp`\"],`\"rootFolder`\":`\"$cw`\"}}\";" ^
  "$warnCount=($rFinal-split'\"severity\":\"WARNING\"').Count-1;" ^
  "Stop-Job $job -EA 0; Remove-Item $sseFile -EA 0;" ^
  "if($warnCount -gt 0){" ^
  "  $lines=(ExtractProblems 'WARNING' $rFinal)-join \"`n\";" ^
  "  OutputResult '' '' ('Rider ['+$rfStatus+'] — '+$warnCount+' fixable warning(s) in '+(Split-Path $fp -Leaf)+':'+\"`n\"+$lines)} else {" ^
  "  OutputResult '' '' ('Rider ['+$rfStatus+'] — OK: '+(Split-Path $fp -Leaf))}; exit 0"
exit /b %ERRORLEVEL%
