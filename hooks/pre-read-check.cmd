:; # PreToolUse quality-info hook — reports file problems before Claude reads a file
:; # sh/bash/zsh: runs lines 1-3 then executes embedded script  |  CMD: runs PowerShell section
:; j=$(cat|tr -d '\n'); fp=$(printf '%s' "$j"|awk -F'"file_path":"' 'NF>1{split($2,a,"\"");print a[1];exit}'); [ -z "$fp" ]&&exit 0; ext=$(printf '%s' "${fp##*.}"|tr '[:upper:]' '[:lower:]'); case "$ext" in cpp|cxx|cc|c|h|hpp|hxx|inl|cs|ts|tsx|js|jsx|mts|mjs|kt|kts|java|groovy|go|rs|swift|py);;*)exit 0;;esac; [ -f "$fp" ]||exit 0; cw=$(printf '%s' "$j"|awk -F'"cwd":"' 'NF>1{split($2,a,"\"");print a[1];exit}'); export QC_FP="$fp" QC_CW="$cw"
:; T=$(mktemp /tmp/prc.XXXXXX); QC_HOOKS_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"; export QC_HOOKS_DIR; awk '/^: #!\/bin\/sh/{f=1} f{if(/^:# --end--/)exit; sub(/^: ?/,""); print}' "$0">"$T"; sh "$T"; ec=$?; rm -f "$T"; exit $ec
: #!/bin/sh
: # JetBrains MCP pre-read quality info: lint a file and surface problems before Claude reads it
: # Inputs: QC_FP, QC_CW, QC_HOOKS_DIR — exported by the :; launcher lines.
:
: # ── Port discovery ────────────────────────────────────────────────────────────
: _ide_prefix_from_idea() {
:   local d="$1" sub f root
:   [ -d "$d" ] || return
:   root=$(dirname "$d")
:   for sub in "$d"/.idea.*.dir; do [ -d "$sub" ] && { printf 'Rider'; return; }; done
:   for f in "$d"/*.sln.iml; do [ -f "$f" ] && { printf 'Rider'; return; }; done
:   for f in "$d/projectSettingsUpdater.xml" "$d"/.idea.*.dir/.idea/projectSettingsUpdater.xml; do
:     grep -q "RiderProjectSettingsUpdater" "$f" 2>/dev/null && { printf 'Rider'; return; }
:   done
:   for f in "$root"/*.uproject; do [ -f "$f" ] && { printf 'Rider'; return; }; done
:   for f in "$root"/*.sln; do [ -f "$f" ] && { printf 'Rider'; return; }; done
:   grep -q "languageLevel" "$d/misc.xml" 2>/dev/null && { printf 'IntelliJIdea'; return; }
:   for f in "$d"/*.iml; do
:     [ -f "$f" ] && grep -q "PYTHON_MODULE" "$f" 2>/dev/null && { printf 'PyCharm'; return; }
:   done
:   for f in "$d"/*.iml; do
:     [ -f "$f" ] && grep -q "WEB_MODULE" "$f" 2>/dev/null && { printf 'WebStorm'; return; }
:   done
:   [ -f "$root/CMakeLists.txt" ] && { printf 'CLion'; return; }
: }
:
: idea_prefix=$(_ide_prefix_from_idea "$QC_CW/.idea")
: . "$QC_HOOKS_DIR/jbr.cmd" 2>/dev/null
:
: port=""
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
: if [ -z "$port" ] && [ -n "$idea_prefix" ]; then
:   port=$(awk -F'"' '/mcpServerPort/{print $4;exit}' \
:     "$HOME/Library/Application Support/JetBrains/${idea_prefix}"*/options/mcpServer.xml \
:     "$HOME/.config/JetBrains/${idea_prefix}"*/options/mcpServer.xml \
:     2>/dev/null | head -1)
: fi
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
: sse=$(mktemp /tmp/prc_sse.XXXXXX)
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
:   exit 0
: fi
: endpoint="${base}/message?sessionId=${sess}"
:
: # rpc <id> <method> <params_json>  →  prints raw SSE response line
: rpc() {
:   /usr/bin/curl -s --max-time 5 -X POST "$endpoint" \
:     -H "Content-Type: application/json" \
:     -d "{\"jsonrpc\":\"2.0\",\"id\":$1,\"method\":\"$2\",\"params\":$3}" \
:     >/dev/null 2>&1
:   local deadline=$(( $(date +%s) + 25 ))
:   while [ "$(date +%s)" -lt "$deadline" ]; do
:     local line=$(grep "^data:.*\"id\":${1}[^0-9]" "$sse" 2>/dev/null | tail -1 | sed 's/^data: //' | tr -d '\r')
:     [ -n "$line" ] && { printf '%s' "$line"; return 0; }
:     sleep 0.2
:   done
:   return 1
: }
:
: rpc 1 "initialize" \
:   '{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"prc-hook","version":"1"}}' \
:   >/dev/null
: /usr/bin/curl -s -X POST "$endpoint" -H "Content-Type: application/json" \
:   -d '{"jsonrpc":"2.0","method":"notifications/initialized"}' >/dev/null 2>&1
:
: # ── Lint the file ─────────────────────────────────────────────────────────────
: resp=$(rpc 2 "tools/call" \
:   "{\"name\":\"lint_files\",\"arguments\":{\"file_paths\":[\"$QC_FP\"],\"rootFolder\":\"$QC_CW\"}}")
:
: kill "$sse_pid" 2>/dev/null; wait "$sse_pid" 2>/dev/null; rm -f "$sse"
:
: # ── Extract problems ─────────────────────────────────────────────────────────
: err_count=$(printf '%s' "$resp" | awk -F'"severity":"ERROR"' '{print NF-1}')
: warn_count=$(printf '%s' "$resp" | awk -F'"severity":"WARNING"' '{print NF-1}')
: total=$(( ${err_count:-0} + ${warn_count:-0} ))
: [ "$total" -eq 0 ] && exit 0   # no problems — silent, no additionalContext noise
:
: fname=$(basename "$QC_FP")
: problems=$(printf '%s' "$resp" | awk -v f="$fname" -F'"severity":"' '
:   NF>1{
:     for(i=2;i<=NF;i++){
:       split($i,sv,"\""); sev=sv[1]
:       if(sev!="ERROR" && sev!="WARNING") continue
:       desc=""; split($i,dd,"\"description\":\"")
:       if(length(dd)>1){split(dd[2],de,"\""); desc=de[1]}
:       ln=0; split($i,ll,"\"line\":")
:       if(length(ll)>1){split(ll[2],le,","); ln=le[1]+0}
:       if(desc!="")printf "[%s] %s:%d: %s\n", sev, f, ln, desc
:     }
:   }')
:
: summary=""
: [ "${err_count:-0}" -gt 0 ] && summary="${err_count} error(s)"
: [ "${warn_count:-0}" -gt 0 ] && {
:   [ -n "$summary" ] && summary="${summary}, "
:   summary="${summary}${warn_count} warning(s)"
: }
:
: msg_text=$(printf 'Pre-flight %s — %s\n%s' "$fname" "$summary" "$problems")
: esc=$(printf '%s' "$msg_text" | awk 'BEGIN{ORS=""} {
:   gsub(/\\/, "\\\\"); gsub(/"/, "\\\""); gsub(/\t/, "\\t")
:   if(NR>1) printf "\\n"
:   printf "%s",$0
: }')
: printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","additionalContext":"%s"}}\n' "$esc"
: exit 0
:# --end--
@echo off
:: ---------------------------------------------------------------------------
:: Windows / PowerShell section — IDE-agnostic port discovery
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
  "$ep=\"$base/message?sessionId=$sess\";" ^
  "function Rpc($id,$method,$params){" ^
  "  try{Invoke-RestMethod -Method POST -Uri $ep -CT 'application/json' -Body \"{`\"jsonrpc`\":`\"2.0`\",`\"id`\":$id,`\"method`\":`\"$method`\",`\"params`\":$params}\" -EA Stop}catch{};" ^
  "  $dl=(Get-Date).AddSeconds(25);" ^
  "  while((Get-Date)-lt $dl){Start-Sleep -ms 200;$c=try{Get-Content $sseFile -Raw}catch{''};" ^
  "    foreach($l in ($c-split\"`n\")){if($l-match \"^data:.*`\"id`\":${id}[^0-9]\"){return($l-replace'^data: ','')}}}; return $null};" ^
  "Rpc 1 'initialize' '{\"protocolVersion\":\"2024-11-05\",\"capabilities\":{},\"clientInfo\":{\"name\":\"prc-hook\",\"version\":\"1\"}}' | Out-Null;" ^
  "try{Invoke-RestMethod -Method POST -Uri $ep -CT 'application/json' -Body '{\"jsonrpc\":\"2.0\",\"method\":\"notifications/initialized\"}' -EA Stop}catch{};" ^
  "$resp=Rpc 2 'tools/call' \"{`\"name`\":`\"lint_files`\",`\"arguments`\":{`\"file_paths`\":[`\"$fp`\"],`\"rootFolder`\":`\"$cw`\"}}\";" ^
  "Stop-Job $job -EA 0; Remove-Item $sseFile -EA 0;" ^
  "$errCount=($resp-split'\"severity\":\"ERROR\"').Count-1;" ^
  "$warnCount=($resp-split'\"severity\":\"WARNING\"').Count-1;" ^
  "if(($errCount+$warnCount) -le 0){exit 0};" ^
  "$fname=Split-Path $fp -Leaf;" ^
  "$lines=[regex]::Matches($resp,'\"severity\":\"(ERROR|WARNING)\".*?\"description\":\"([^\"]+)\".*?\"line\":(\d+)') | ForEach-Object {" ^
  "  '['+$_.Groups[1].Value+'] '+$fname+':'+$_.Groups[3].Value+': '+$_.Groups[2].Value};" ^
  "$summary=@();" ^
  "if($errCount -gt 0){$summary+=\"$errCount error(s)\"};" ^
  "if($warnCount -gt 0){$summary+=\"$warnCount warning(s)\"};" ^
  "$msgText='Pre-flight '+$fname+' — '+($summary-join', ')+\"`n\"+($lines-join\"`n\");" ^
  "$h=@{hookSpecificOutput=@{hookEventName='PreToolUse';additionalContext=$msgText}};" ^
  "Write-Host ($h|ConvertTo-Json -Compress -Depth 5); exit 0"
exit /b %ERRORLEVEL%
