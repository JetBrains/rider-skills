---
name: ide-ue
description: "Rider Unreal Engine MCP driver. Single entry point for driving Unreal Engine through the JetBrains Rider MCP server. MANDATORY for: editor lifecycle & PIE — health, play state, logs (ide-ue:editor); build / Live Coding — trigger build, target discovery, problems (ide-ue:build); asset & GameplayTag index — assets, class hierarchy, CDOs, tags (ide-ue:assets); Blueprint inspection — find usages, open BP (ide-ue:blueprint); Python automation — single-shot and resumable batches (ide-ue:python); canonical MCP-first pipelines for C++/Live Coding/PIE/crash repro (ide-ue:pipelines); long-running build/cook/package runs (ide-ue:long-ops). Use `mcp__<rider_mcp_name>__ue_*` and related tools instead of CLI fallbacks, tail-ing log files, or manual editor actions."
---

# Unreal Engine IDE Skill

One skill for all UE-flavored MCP interactions against the **JetBrains Rider MCP Server** (Rider 2026.2+). Pick your domain below, share the GATE and universal rules above it.

For UE domain knowledge (GAS, Animation, Networking pitfalls, C++ patterns, etc.) use the **`ue-expert`** skill. This skill is the MCP driver only.

## Domain Routing

| Domain | Trigger | Key tools |
|--------|---------|-----------|
| **ide-ue:editor** | health check, PIE play/pause/stop, set play mode, pull Output Log | `ue_health`, `ue_get_play_state`, `ue_set_play_mode`, `ue_play_control`, `ue_get_logs` |
| **ide-ue:build** | trigger Live Coding, full solution build, target discovery, code analysis | `ue_trigger_build`, `build`, `build_solution`, `list_buildable_targets`, `get_solution_projects`, `get_project_dependencies`, `get_file_problems`, `lint_files`, `get_project_problems` |
| **ide-ue:assets** | find `.uasset`/`.umap`, derived BPs of a C++ class, CDO defaults, GameplayTags | `search_assets`, `get_class_hierarchy`, `get_asset_properties`, `search_tags` |
| **ide-ue:blueprint** | find BP references to a C++ symbol, open a BP in the visual editor | `ue_find_blueprint_usages`, `ue_open_blueprint` |
| **ide-ue:python** | run editor Python (single-shot or resumable batch) | `ue_execute_python`, `ue_execute_python_batch` |
| **ide-ue:pipelines** | canonical MCP-first workflows (P1–P8) | composes the above |
| **ide-ue:long-ops** | builds / cooks / packages that run for minutes-to-hours | `ue_trigger_build` polling, `Bash run_in_background`, `Monitor`, `ScheduleWakeup` |

### Delegate to the `ide` skill for non-UE IDE actions

This skill covers only the Unreal-specific MCP surface. For every other IDE action — code search, file editing, refactors, inspections, run configurations, debugging — delegate to the **`ide`** skill. Both skills target the same Rider MCP server, so the prefix you resolve in the GATE below works for both.

| `ide` sub-skill | Use it for | Key tools |
|-----------------|------------|-----------|
| **`ide:quality`** | Inspections, lint, problems, quick-fixes, rename, reformat, PSI tree | `lint_files`, `get_file_problems`, `get_inspections`, `apply_quick_fix`, `rename_refactoring`, `reformat_file`, `run_inspection_kts`, `generate_psi_tree` |
| **`ide:runner`** | Listing / executing run configurations, capturing test or `Main` output, one-shot launch overrides | `get_run_configurations`, `execute_run_configuration` |
| **`ide:search`** | Symbol / file / text / regex search across the indexed project | `search_symbol`, `search_file`, `search_text`, `search_regex` |
| **`ide:debugger`** | Mixed-mode C++ debugging against `UnrealEditor`: sessions, breakpoints, stepping, frame & variable inspection, expression evaluation | `xdebug_start_debugger_session`, `xdebug_get_debugger_status`, `xdebug_control_session`, `xdebug_set_breakpoint`, `xdebug_list_breakpoints`, `xdebug_remove_breakpoint`, `xdebug_run_to_line`, `xdebug_get_threads`, `xdebug_get_stack`, `xdebug_get_frame_values`, `xdebug_get_value_by_path`, `xdebug_evaluate_expression`, `xdebug_set_variable` |
| **(file editing)** | Read/write/patch source files, create new files, move types | `read_file`, `replace_text_in_file`, `apply_patch`, `create_new_file`, `move_type_to_namespace` — see `ide:quality` workflow for hook-fed auto-fixes |

The pipelines in **`ide-ue:pipelines`** (P1, P3, P4) compose this skill's `ue_*` tools with the above `ide` tools — when you see `search_symbol`, `apply_patch`, `xdebug_*`, etc. in a pipeline step, that call goes through the `ide` skill's conventions (same MCP prefix, same `rootFolder` rule).

---

## GATE — Resolve the Rider MCP server name first

Before calling **any** tool, resolve `<rider_mcp_name>` — the actual MCP server prefix. The string `mcp__<rider_mcp_name>__` is a placeholder; the real prefix varies per install (`rider`, `jetbrains`, `jetbrains-ide`, etc.).

**Detection (in order):**
1. Scan the deferred tool list in `<system-reminder>` for a clearly Unreal-aware tool (e.g. `ue_health`, `ue_trigger_build`, `ue_get_logs`, `search_assets`, `get_class_hierarchy`, `search_tags`). Take the prefix between `mcp__` and the second `__`. Example: `mcp__rider__ue_health` → `<rider_mcp_name>` = `rider`.
2. Prefer the prefix that owns the broadest family of matching `ue_*` tools — IntelliJ/PyCharm advertise the same JetBrains MCP envelope but expose **no** `ue_*` tools.
3. **If no `ue_*` tools appear at all** — STOP and tell the user: *"I can't find the Unreal MCP tools. Please make sure **Rider** (not IntelliJ/PyCharm) is running with the MCP server enabled and the RiderLink editor plugin connected, then ask me again."*
4. **Cache the resolved name for the rest of the session.** Never re-resolve on every step.

## Universal Rules

- **`ue_health` first, every session.** Don't assume the editor is connected. If `connected = false`, switch to filesystem + `scripts/ue-build.sh` mode and tell the user.
- **Always pass `rootFolder`** on every Rider MCP call when you know the project path — eliminates ambiguous-project resolution and is required for multi-solution setups. Ask once if unknown; reuse for every subsequent call.
- **Asset paths differ across tools.** `ue_open_blueprint` uses Unreal **package path** (`/Game/.../BP_Foo.BP_Foo`); `get_asset_properties` uses absolute **filesystem path** (`.../Content/.../BP_Foo.uasset`). Mixing them is the #1 source of "asset not found" errors.
- **Asset/tag index tools do NOT need the editor.** `search_assets`, `search_tags`, `get_class_hierarchy`, `get_asset_properties` are pure Rider-backend operations — use them even when `ue_health` reports `connected = false`.
- **The MCP tools are the only way to drive the editor.** Do not fall back to "please click in the editor" or to tailing `Saved/Logs/*.log` when an `ue_*` tool exists.
- **If a tool is missing**, tell the user which Rider build / MCP module is needed instead of simulating the action manually.

---

## ide-ue:editor

### Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `ue_health` | Reports RiderLink connection, project name, editor PID | **Always call first** before any other `ue_*` tool |
| `ue_get_play_state` | Returns `Idle` / `Play` / `Pause` | Gate `ue_play_control` calls; check before triggering builds |
| `ue_set_play_mode` | Sets PIE mode (0=Viewport, 1=MobilePreview, 2=Floating, 3=VR, 4=Standalone, 5=Simulate), player count, dedicated server, spawn-at-PlayerStart | Call **before** `ue_play_control("play")` when reproducing networked / VR / standalone bugs |
| `ue_play_control` | `play` / `pause` / `resume` / `stop` / `frame_skip` | Drive PIE from chat; `frame_skip` lets you single-step paused gameplay |
| `ue_get_logs` | Pull recent log entries with `category`, `minVerbosity`, `count` (≤1000), `sinceTimestampMs` filters | Replace tail-on-`Saved/Logs/*.log`; **always** filter by category + verbosity to avoid 10k-line floods |

### Workflow

1. **Health check.** `ue_health`. If `connected = false`, stop and surface to the user — no further `ue_*` call will work.
2. **Read play state.** `ue_get_play_state` before driving PIE.
3. **Configure mode if needed.** `ue_set_play_mode` for networked / VR / standalone repros — done once before play.
4. **Drive PIE.** `ue_play_control("play")` / `"pause"` / `"frame_skip"` / `"stop"`.
5. **Pull logs.** `ue_get_logs` with **mandatory** filters — `category` + `minVerbosity` + `count`. Use `sinceTimestampMs` to avoid re-reading old entries.

### Critical rules

- **`ue_get_logs` must be filtered.** An unfiltered call returns ≤1000 entries and will fill your context with noise. Specify `category` + `minVerbosity` + a sensible `count` every time.
- **`ue_set_play_mode` is sticky.** It persists for subsequent `play` calls; reset explicitly when switching repro scenarios.
- **`frame_skip` only works while `Pause`d.** Calling it during `Play` is a no-op.
- **Do not tail `Saved/Logs/*.log`** when the editor is connected — `ue_get_logs` is already structured and pre-filtered.

---

## ide-ue:build

### Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `ue_trigger_build` | Triggers **Hot Reload / Live Coding** inside the running editor | C++ change with editor up; fastest iteration |
| `build` / `build_solution` | Full Rider solution / project / file compile | Editor down, structural changes (new UPROPERTY, hierarchy), or Live Coding refused |
| `list_buildable_targets` / `get_solution_projects` / `get_project_dependencies` | Discover targets and module wiring | Before editing Build.cs or adding new modules |
| `get_file_problems` / `lint_files` / `get_project_problems` | ReSharper code analysis | After C++ edits, before requesting a build |

### Workflow

1. **Analyze.** `get_file_problems` on the edited file(s). Fix every error before triggering a build.
2. **Pick the right build path.**
   - Editor running + non-structural change → `ue_trigger_build` (Live Coding).
   - Editor down or structural change → `build` / `build_solution`.
3. **Trigger build.** `ue_trigger_build` is **fire-and-forget** — it returns immediately.
4. **Poll for completion.** `ue_get_logs { category: "LogLiveCoding", count: 200, minVerbosity: "Display" }` until `Code successfully patched` or `Patch failed`. Do **not** assume completion from the trigger call.
5. **Escalate on rejection.** Live Coding rejects: new `UPROPERTY`, reflected method signature changes, class hierarchy changes, new `UCLASS`/`USTRUCT`. On rejection: `ue_play_control("stop")` → exit editor → `build_solution` / `scripts/ue-build.sh --force-ubt` → relaunch editor via `execute_run_configuration`.

### Critical rules

- **`ue_trigger_build` is not synchronous.** It returns immediately. Always poll `LogLiveCoding` (or `get_file_problems`) for completion.
- **Live Coding ≠ full rebuild.** After structural changes (new `UPROPERTY`, new `UCLASS`, virtual function additions, base-class swaps), Live Coding may succeed-then-corrupt-state. Restart the editor.
- **Build failed = stale binary.** NEVER launch the editor or proceed when the build reports failure.
- **`Trying to recreate changed class` / CDO mismatch** — escalate to `--force-ubt` + editor restart; Live Coding cannot recover.

---

## ide-ue:assets

### Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `search_assets` | Find `.uasset`/`.umap` by name **or** by derived `baseClass` (e.g. `ALyraCharacter`) | Filename glob is case-insensitive; `baseClass` traverses inheritance |
| `get_class_hierarchy` | Lists all Blueprints inheriting from a C++ class (full chain) | Use to enumerate concrete BPs of an abstract base; `limit` defaults 1000 |
| `get_asset_properties` | Dumps CDO property values from a `.uasset` (absolute path required) | Read default values without opening the editor |
| `search_tags` | Search GameplayTag definitions across `.uasset` files; supports `prefix` filter | Use before adding new tags to avoid duplicates / collisions |

### Workflow

1. **Find by name or class.** `search_assets { query: "BP_Hero" }` or `search_assets { baseClass: "ALyraCharacter" }`.
2. **Enumerate descendants.** `get_class_hierarchy { baseClass: ..., limit: 5000 }` for the full BP tree.
3. **Inspect defaults.** `get_asset_properties { assetPath: "/abs/.../Foo.uasset" }` (absolute filesystem path).
4. **Audit tags.** `search_tags { prefix: "Ability.Damage" }` before adding new tags.

### Critical rules

- **`get_asset_properties` requires absolute filesystem path**, not `/Game/...` package path.
- **`baseClass` is case-sensitive** and must match the C++ identifier exactly (including the `A`/`U`/`F` prefix).
- **None of these tools need the editor connected.** Use them even when `ue_health` reports `connected = false`.

---

## ide-ue:blueprint

### Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `ue_find_blueprint_usages` | Resolve all BP references to a C++ symbol or BP path | Empty result → symbol is C++-only |
| `ue_open_blueprint` | Open a BP in the visual graph editor (path form `/Game/.../BP_Foo.BP_Foo`) | Use to direct the user to the asset; focuses the editor window |

### Workflow

1. **Find usages.** `ue_find_blueprint_usages { symbol: "ALyraGameplayAbility::ActivateAbility" }` — also accepts a BP path.
2. **Inspect visually if needed.** `ue_open_blueprint { path: "/Game/Blueprints/BP_Hero.BP_Hero" }` focuses the editor; useful when directing the user to an asset.

### Critical rules

- **`ue_open_blueprint` uses Unreal package path** (`/Game/.../BP_Foo.BP_Foo`), NOT filesystem path.
- **Empty `ue_find_blueprint_usages` result means C++-only** — do not interpret as "no callers."

---

## ide-ue:python

### Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `ue_execute_python` | Run a Python snippet on the editor game thread (full `unreal` API). Output capped at 10k chars. Set `isolated: true` for expression-style eval | Asset edits, automation, batch operations |
| `ue_execute_python_batch` | Run a list of Python scripts sequentially with resume-on-failure (`startFrom` = `lastSuccessfulIndex + 1`) | Multi-step pipelines: cook fix-ups, content audits, BP migrations |

### Workflow (single-shot)

1. **Health check.** `ue_health` must be `connected`.
2. **Execute snippet.** `ue_execute_python` with a self-contained script:
   - Expression: `unreal.SystemLibrary.get_engine_version()` (set `isolated: true`).
   - Statement block: full `import unreal; ...` script.
3. **Handle large output.** Output is capped at 10k chars. For large dumps, write to a `.txt` under `Saved/` and read it back via `read_file`.

### Workflow (resumable batch)

1. Build the script list as an array of independently re-runnable Python snippets.
2. `ue_execute_python_batch { scripts: [...], startFrom: 0 }`.
3. On failure: response contains `lastSuccessfulIndex`. Fix the offender (edit source, regenerate snippet).
4. Re-call with `startFrom: <lastSuccessfulIndex + 1>` — never replay completed steps (idempotency is on you).

### Critical rules

- **Runs on the game thread.** Long scripts block the editor UI. Keep snippets short; for heavy work, schedule via `unreal.EditorAssetLibrary.checkout_loaded_asset(...)` patterns or async subsystems.
- **Batch is for resumability, not parallelism.** Scripts run sequentially. If you need parallel asset operations, batch inside one Python script using `Subsystem`/`AsyncTask`.
- **`xdebug_*` operates on the same UnrealEditor process** that hosts PIE. Setting a breakpoint inside hot gameplay code will pause the editor itself — coordinate with the user before doing this on a live session.

---

## ide-ue:pipelines

Canonical workflows composing the domains above. Follow them step-for-step; do not invent shortcuts.

### P1. C++ edit → Live Coding → verify in PIE

1. `ue_health` — confirm editor connected (else fall back to `scripts/ue-build.sh`).
2. `read_file` / `search_symbol` to locate target.
3. `replace_text_in_file` or `apply_patch` to edit.
4. `get_file_problems` on the edited file — fix everything red before building.
5. `ue_trigger_build` — Live Coding compile.
6. `ue_get_logs { category: "LogLiveCoding", minVerbosity: "Display", count: 200 }` — confirm `Code successfully patched`.
7. `ue_get_play_state`; if `Idle` then `ue_set_play_mode` + `ue_play_control("play")`.
8. `ue_get_logs { category: "LogTemp", count: 100 }` — verify gameplay output.
9. `ue_play_control("stop")`.

> Live Coding rejects: new `UPROPERTY`, reflected method signature changes, class hierarchy changes, new `UCLASS`/`USTRUCT`. On rejection, escalate to `scripts/ue-build.sh --force-ubt` + editor restart.

### P2. Discover Blueprints derived from a C++ class

1. `search_assets { baseClass: "ALyraWeaponInstance" }` — fast filename-only result.
2. `get_class_hierarchy { baseClass: "ALyraWeaponInstance", limit: 5000 }` — full descendant list with paths.
3. `get_asset_properties` on selected paths to compare CDOs without opening the editor.
4. `ue_open_blueprint` on one to inspect interactively.

### P3. Audit / refactor a GameplayTag

1. `search_tags { prefix: "Ability.Damage" }` — enumerate existing tags.
2. `search_text` for the tag's literal in `.cpp`/`.h`.
3. `ue_find_blueprint_usages { symbol: "Ability.Damage.Headshot" }` — BP references.
4. Edit the C++ tag table; `apply_patch`.
5. `ue_trigger_build`.
6. `ue_get_logs { category: "LogGameplayTags", minVerbosity: "Warning" }` — confirm no unresolved tag warnings.

### P4. Crash / nullptr investigation

1. `ue_get_logs { minVerbosity: "Error", count: 500 }` — pull the actual crash output, not a guess.
2. `xdebug_get_debugger_status` — if a session is attached, dump it; else start one.
3. `xdebug_start_debugger_session` with the editor's run configuration (`get_run_configurations` to find it).
4. `xdebug_set_breakpoint` on the suspect file:line (e.g. inside the crashing function).
5. Reproduce: `ue_play_control("play")`.
6. On hit: `xdebug_get_stack`, `xdebug_get_frame_values`, `xdebug_evaluate_expression` to inspect state.
7. `xdebug_set_variable` to test a fix hypothesis without rebuilding.
8. `xdebug_control_session("resume")` to continue or `stop` to detach.

### P5. Editor automation via Python (single-shot)

1. `ue_health` — must be `connected`.
2. `ue_execute_python` with a self-contained script. Examples:
   - `import unreal; unreal.EditorAssetLibrary.list_assets('/Game/Characters', recursive=True)`
   - Asset retag, batch material parameter set, level actor stats — anything in the `unreal` Python module.
3. Output is capped at 10k chars — for large dumps, write to a `.txt` under `Saved/` and read it back via `read_file`.

### P6. Multi-step content migration (resumable)

1. Build the script list as an array of independently re-runnable Python snippets.
2. `ue_execute_python_batch { scripts: [...], startFrom: 0 }`.
3. On failure: response contains `lastSuccessfulIndex`. Fix the offender (edit source, regenerate snippet).
4. Re-call with `startFrom: <lastSuccessfulIndex + 1>` — never replay completed steps (idempotency is on you).

### P7. PIE networking repro

1. `ue_set_play_mode { mode: 4, players: 2, dedicatedServer: true, spawnAtPlayerStart: true }` (standalone + dedicated server + 2 clients).
2. `ue_play_control("play")`.
3. `ue_get_logs { category: "LogNet", minVerbosity: "Warning" }` for replication / connection issues.
4. `ue_play_control("pause")` + `ue_play_control("frame_skip")` to single-step a desync.
5. `ue_play_control("stop")` when done.

### P8. Inspect a Blueprint's CDO without opening the editor

1. `search_assets { query: "BP_Hero" }` — get the `.uasset` path.
2. `get_asset_properties { assetPath: "/abs/path/.../BP_Hero.uasset" }`.
3. Diff against expected defaults; `ue_open_blueprint` only if a visual inspection is needed.

---

## ide-ue:long-ops

UE builds, cooks, and packages routinely take 10–60+ minutes. NEVER run them in the foreground — the shell call blocks until completion and your context window fills with thousands of compile lines. Follow this protocol every time.

### Build & Package scripts

```bash
# Auto-detects Live Coding when editor is running
bash ${CLAUDE_SKILL_DIR}/scripts/ue-build.sh \
  --project "/path/to/Game.uproject" \
  --platform Mac --config Development --target Editor

# Clean intermediate artifacts
bash ${CLAUDE_SKILL_DIR}/scripts/ue-clean.sh --project "/path/to/Game.uproject"

# Package game (full build → cook → pak → stage → archive)
bash ${CLAUDE_SKILL_DIR}/scripts/ue-package.sh \
  --project "/path/to/Game.uproject" \
  --platform Mac --config Development \
  --archive "/path/to/output"
```

Escalation path:
- Editor running → Live Coding (default)
- Live Coding crash (CDO mismatch) → `--force-ubt` + restart editor
- Persistent crash → `ue-clean.sh` + `--force-ubt` + restart

**Known issue:** the wrapper scripts source `${TOOLKIT_ROOT}/scripts/common/ue-env.sh`, which may not exist in some installs. If `source: No such file or directory` appears, fall back to invoking `RunUAT.sh` / `RunUBT.sh` directly (see fallback command below) and report the broken install to the user.

### Background protocol (mandatory for build / cook / package)

1. **Launch in background**, redirecting all output to a log file:
   ```bash
   bash ${CLAUDE_SKILL_DIR}/scripts/ue-package.sh ... > /tmp/ue-package.log 2>&1
   ```
   Call the `Bash` tool with `run_in_background: true`. Capture the returned shell ID.

2. **Fallback if the wrapper is broken**, invoke RunUAT directly (same background pattern):
   ```bash
   "${UE_ROOT}/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
     -project="<path.uproject>" -targetplatform=Mac -clientconfig=Development \
     -build -cook -pak -stage -prereqs -archive \
     -archivedirectory="<out>" -unattended -nop4 -utf8output \
     > /tmp/ue-package.log 2>&1
   ```

3. **Actually monitor it** — pick ONE of these, do not skip:
   - **`Monitor` tool**, persistent, watching the log with `tail -F | grep --line-buffered -E ...`. The filter MUST cover three categories so the user gets steady progress visibility, not just a silent wait followed by a single end event:
     - **Terminal markers** (success + every failure signature): `BUILD SUCCESSFUL|BUILD FAILED|PACKAGE SUCCEEDED|PACKAGE FAILED|AutomationTool exiting|ERROR:|Exception:|fatal error|Killed|OOM`
     - **Phase transitions** so the user sees the pipeline advancing: `Running: .*UnrealEditor-Cmd.*-run=Cook|Cook complete|Running: .*UnrealPak|Stage commandlet|Copying to staging directory|Archiving to|All done`
     - **Periodic progress heartbeats** that the log emits naturally — pick patterns that fire every few seconds during the long phases so the user can see motion: `\[[0-9]+/[0-9]+\] Compile` (build), `LogCook: Display: Cooked packages [0-9]+` / `Cooking package` (cook), `Archiving [0-9]+ shaders` (shader compile), `Adding file to pak` (pak). Pick 1-2 patterns per long phase; do NOT pipe raw logs — Monitor auto-stops if event volume is too high.

     Example combined filter:
     ```bash
     tail -F /tmp/ue-package.log | grep --line-buffered -E "(BUILD (SUCCESSFUL|FAILED)|PACKAGE (SUCCEEDED|FAILED)|AutomationTool exiting|ERROR:|Exception:|fatal error|Running: .*-run=Cook|Cook complete|Running: .*UnrealPak|Copying to staging directory|Archiving to|\[[0-9]+0/[0-9]+\] Compile|Cooked packages [0-9]+00 |Archiving [0-9]+ shaders)"
     ```
     Note `[0-9]+0/` and `[0-9]+00 ` — these throttle the heartbeat to every 10th compile / 100th cooked package so notification volume stays reasonable.
   - **`ScheduleWakeup`** at 270s (cache-warm) or 1200s+ (cache-miss) intervals to check `tail` of the log and `ps` on the PID. Use this as a fallback safety net alongside Monitor, not instead of it — Monitor gives the user real-time visibility; ScheduleWakeup only catches the case where Monitor stalls silently.

4. **Report only what is true.** Do not say "a monitor is armed" unless you actually called `Monitor`. Do not say "running in background" if `run_in_background` was false. Truthful status report after launch:
   - PID (from `BashOutput` or `ps`)
   - Log path
   - Whether a `Monitor`/`ScheduleWakeup` is actually registered (and what it watches for)

5. **On completion**, tail the last ~100 lines of the log, confirm the success marker, and report the archive path + elapsed time.

6. **On failure**, grep the log for `error:`, `ERROR:`, `Exception`, `fatal error`, `LogInit: Warning` near the tail; show the user the relevant excerpt, not the whole log.

---

## Cross-skill references

- **General IDE actions on the same Rider MCP** → **`ide`** skill. Routes:
  - **`ide:quality`** — `lint_files`, `get_file_problems`, `get_inspections`, `apply_quick_fix`, `rename_refactoring`, `reformat_file`, `run_inspection_kts`, `generate_psi_tree` (plus the hook-fed auto-fix protocol).
  - **`ide:runner`** — `get_run_configurations`, `execute_run_configuration` (launch overrides, test runs, `Main` execution).
  - **`ide:search`** — `search_symbol`, `search_file`, `search_text`, `search_regex` (with `paths` glob filtering).
  - **`ide:debugger`** — full `xdebug_*` family for mixed-mode debugging of `UnrealEditor`.
  - **File editing** — `read_file`, `replace_text_in_file`, `apply_patch`, `create_new_file`, `move_type_to_namespace`.

  Pipelines P1 (C++ edit → Live Coding → PIE), P3 (tag refactor), and P4 (crash debug) explicitly cross-call these tools. Reuse the GATE-resolved `<rider_mcp_name>` prefix and the `rootFolder` value across both skills.

- **UE domain knowledge** (GAS, Animation, Networking pitfalls, C++ patterns, knowledge files) → **`ue-expert`** skill. This skill drives the MCP; that skill knows what to drive it toward.
