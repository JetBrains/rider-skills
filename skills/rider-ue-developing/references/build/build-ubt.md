# rider-ue-developing:build + long-ops — Build and Long-Running Operations

## Build pipeline (UE-specific addenda on top of `ide:build`)

The core build flow (`build_solution_start` + `build_solution_state`, silent-failure guard) is in the **`ide`** skill. The notes here are UE-specific only.

- **Which runner ran** is opaque from MCP. For `.uproject` solutions Rider picks: editor connected + Live Coding available → Hot Reload (very fast); otherwise → UBT compile of the primary game target. Confirm via shell when it matters:
  ```bash
  ps -eo command | grep UnrealBuildTool | grep -v grep
  ```
- **Verify Live Coding outcome with editor log**, not just build state:
  ```
  ue_get_logs(category="LogLiveCoding", pattern="patched|failed", count=20)
  ```
  `"Creating library ...patch_0.lib"` + `"Live coding succeeded"` = real success. `"Live coding failed"` + compile errors = real failure.
- **`build_solution_state` may report `buildIsSuccess: false` even when Live Coding succeeded.** When the change includes reflection/data-type changes (new `UCLASS`/`USTRUCT`, new `UPROPERTY`/`UFUNCTION`, replication markers), Live Coding emits *"Live coding succeeded, data type changes may cause packaging to fail…"* — Rider misreports this as a failure with `"Build failed without diagnostic output (check Rider's build log)."` Always confirm via `ue_get_logs(category="LogLiveCoding")` before declaring failure.
- **Live Coding adds new types; it only struggles to *relayout existing* ones.** New `UCLASS`/`USTRUCT`/`UENUM` in new files compile and register into the running editor via Live Coding — the new class is immediately usable (Blueprint parent, spawn, class picker) with **no editor restart**. New `UPROPERTY`/`UFUNCTION` on an existing type also patch in (with the *"data type changes may cause packaging to fail"* warning noted above — harmless for an in-editor iteration). What Live Coding genuinely **cannot** apply is a change to the memory layout or reflected signature of an *existing* type that already has live instances: changing a class's parent, removing/reordering an existing `UPROPERTY`, or changing an existing reflected method signature. For those only: exit the editor → `build_solution_start(rebuild=true)` → relaunch via `execute_run_configuration`. (Bash alternative when memory-constrained: `cmd.exe /c "Build.bat <Target> Win64 DebugGame -MaxParallelActions 2"`.)
- **Live Coding cannot apply changes in default values for variables in constructor implemented in `.cpp`.** When changing default values for variables, values set in the constructor implemented in the .cpp file will not update in existing instances of objects. However, if you change them in your .h file, you will see the change take place.
- **Live Coding linker errors on UClass symbols** (`LNK2019: Z_Construct_UClass_…`, `<Class>(FVTableHelper&)`, `~<Class>`) can appear when a patch touches UHT-generated registration in a way Live++ can't link incrementally — typically a hierarchy or layout change to an *existing* reflected type, **not** an ordinary `.cpp` body edit or a brand-new class (those patch fine). When you actually see these symbols in the build log, stop retrying Live Coding and do a full UBT rebuild + relaunch.
- **Cook / pak / stage / archive** — no MCP tool. Use RunUAT via `Bash run_in_background` + `ide:long-ops` protocol:
  ```bash
  "${UE_ROOT}/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="<path.uproject>" -targetplatform=Mac -clientconfig=Development \
    -build -cook -pak -stage -prereqs -archive \
    -archivedirectory="<out>" -unattended -nop4 -utf8output \
    > /tmp/ue-package.log 2>&1
  ```

## Long-ops — UE monitor filter cheatsheet

When tailing a UE cook/package log with `Monitor`, use these three-category filter patterns:

- **Terminal markers:** `BUILD SUCCESSFUL|BUILD FAILED|PACKAGE SUCCEEDED|PACKAGE FAILED|AutomationTool exiting|ERROR:|Exception:|fatal error|Killed|OOM`
- **Phase transitions:** `Running: .*UnrealEditor-Cmd.*-run=Cook|Cook complete|Running: .*UnrealPak|Stage commandlet|Copying to staging directory|Archiving to|All done`
- **Heartbeats (throttled):** `\[[0-9]+0/[0-9]+\] Compile` (every 10th), `Cooked packages [0-9]+00 ` (every 100th), `Archiving [0-9]+ shaders`, `Adding file to pak`

For `build_solution_start`-driven Live Coding / UBT compiles, the IDE's own run log lives under `out/dev-data/<ide-system>/tmp/ij_run__*.log` — point Monitor at the freshest match.

The background-run protocol details (`Bash run_in_background`, `ScheduleWakeup`, truthful reporting) are in **`ide:long-ops`**.

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `build_solution_start` | Start an incremental or full UBT / Hot Reload compile | After every C++ edit; returns `sessionId` for polling |
| `build_solution_state` | Poll build progress and collect per-file errors | Loop until `state != "Running"`; require `buildIsSuccess == true` before any downstream step |
| `get_file_problems` | IDE diagnostics for a single file | Run on each edited `.h`/`.cpp` before the build; catch errors early |
| `lint_files` | Batch IDE diagnostics across multiple files | After a multi-file refactor — one call instead of N `get_file_problems` calls |
| `get_project_problems` | Solution-wide problems panel (build errors, NuGet issues) | Confirm no pre-existing errors before starting a long build |
| `execute_run_configuration` | Launch the Unreal Editor after a successful full rebuild | Find the correct config with `get_run_configurations` first; only call after `buildIsSuccess == true` |
| `ue_get_logs` | Verify Live Coding / UBT outcome | `ue_get_logs(category="LogLiveCoding", pattern="patched\|failed", count=20)` — "Code successfully patched" = success |
