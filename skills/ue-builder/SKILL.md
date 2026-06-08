---
name: ue:builder
description: "Use when user asks to build, compile, or clean an Unreal Engine project. DO NOT TRIGGER for packaging/cooking/distributing (use ue:platform), general C++ builds, or non-UE projects."
allowed-tools: Bash, Read
argument-hint: "[build|clean] [platform] [config]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Builder

Build (compile) and clean Unreal Engine projects using UnrealBuildTool (UBT). For packaging and cooking, use the **ue:platform** skill.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Determine operation** — build vs clean, platform, config, target; check if editor is running (Live Coding vs full UBT)
2. **Build** — run the appropriate script (`ue-build.sh` / `ue-build.ps1`)
3. **Check result** — verify success; fix errors and rebuild if failed

## Instructions

1. Determine the operation: **build** (compile) or **clean**. For **packaging**, use the **ue:platform** skill instead.
2. Determine parameters:
   - **project** — path to `.uproject` (auto-detected if in project directory)
   - **platform** — `Win64`, `Linux`, `LinuxArm64`, `Mac` (default: current host)
   - **config** — `Development`, `Shipping`, `DebugGame`, `Debug`, `Test` (default: `Development`)
   - **target** — `Game`, `Editor`, `Server`, `Client` (default: `Editor`)

3. **Always prefer Live Coding when the editor is running.** Call `ue-build.sh` without `--force-ubt` — the script auto-detects the running editor and uses Live Coding. This applies to ALL change types including new `.h` files, new `.cpp` files, and header layout changes.

   | Scenario | Pipeline | Commands |
   |---|---|---|
   | Editor is running (any changes) | **Live Coding** | `ue-build.sh` (auto-detects running editor) |
   | Editor is NOT running | **Full UBT** | `ue-build.sh` (falls back to UBT automatically) |
   | Live Coding fails with crash (CDO mismatch, SIGSEGV) | **Escalate: UBT + Restart** | `ue-build.sh --force-ubt` → `/ue:console --restart` |
   | Corrupted state / persistent crashes | **Clean Rebuild** | `ue-clean.sh` → `ue-build.sh --force-ubt` → `/ue:console --restart` |

   > **Important:** Do NOT use `--force-ubt` preemptively. Only escalate to `--force-ubt` + restart if Live Coding fails or causes a crash. Do NOT restart the editor unless explicitly asked or a crash requires it.

4. Run the appropriate script:

   **Build (compile):**
   ```bash
   bash ${CLAUDE_SKILL_DIR}/scripts/ue-build.sh \
     --project "/path/to/Game.uproject" \
     --platform Win64 --config Development --target Editor
   ```

   ```powershell
   powershell -ExecutionPolicy Bypass -File "${CLAUDE_SKILL_DIR}\scripts\ue-build.ps1" --project "C:\Path\Game.uproject" --platform Win64 --config Development --target Editor
   ```

   > **Live Coding auto-detection:** When building an **Editor** target, `ue-build.sh` automatically checks if the Unreal Editor is running (via `Saved/AgentBridge.port` health check). If the editor is running, it triggers **Live Coding** (`/ue:console --build --wait`) instead of a full UBT rebuild — this is faster and avoids restarting the editor. If the editor is not running, it falls back to a standard UBT build.

   **Package:** Use the **ue:platform** skill (`/ue:platform`).

   **Clean:**
   ```bash
   bash ${CLAUDE_SKILL_DIR}/scripts/ue-clean.sh \
     --project "/path/to/Game.uproject"
   ```

   ```powershell
   powershell -ExecutionPolicy Bypass -File "${CLAUDE_SKILL_DIR}\scripts\ue-clean.ps1" --project "C:\Path\Game.uproject"
   ```

5. **Check the build result before proceeding.** Parse the final output for `Result: Failed` or non-zero exit code.
   - If the build **succeeded**: report success and proceed with any follow-up actions (e.g., launching the editor).
   - If the build **failed**: report the failure with the error details. **Do NOT proceed to launch the editor or any downstream step.** Instead:
     1. Identify which files had errors (look for `error:` lines in the output).
     2. Distinguish between errors in **new/modified code** vs **pre-existing errors** in other files.
     3. If the errors are in new/modified code: fix them and rebuild.
     4. If the errors are pre-existing (in files you didn't touch): inform the user and ask how to proceed — do NOT silently skip to editor launch.
     5. A build with compilation errors means the editor binary was NOT updated. Launching it would run stale code.

## Environment

| Variable | Default | Description |
|----------|---------|-------------|
| `UE_ROOT` | *(auto-detect)* | Unreal Engine root directory |
| `UE_PROJECT` | *(auto-detect)* | Path to `.uproject` file |

## Error Recovery

- **"UE_ROOT not found"**:
  - macOS: `export UE_ROOT="/Users/Shared/Epic Games/UE_5.6"`
  - Linux: `export UE_ROOT="$HOME/UnrealEngine/UE_5.6"`
  - Windows PowerShell: `$env:UE_ROOT="C:\Program Files\Epic Games\UE_5.6"`
- **"No .uproject found"**: Provide `--project` or cd into the project directory.
- **Build errors**: Check include paths, `Build.cs` dependencies, run `Setup.sh` if missing deps.
- **Build failed with pre-existing errors**: If errors are in files you didn't modify, report them to the user. Do NOT launch the editor — the binary was not updated.

## Guidelines

- Default timeout: 30 min for build.
- **clean** is safe — only removes generated artifacts, not source code.
- **`--force-ubt`**: Bypass Live Coding and force a full UBT rebuild. Only use as escalation when:
  - Live Coding failed with a crash (`Trying to recreate changed class`, CDO mismatch, SIGSEGV)
  - User explicitly requests a full rebuild
  - Do NOT use preemptively for new files or header changes — try Live Coding first
- **After completing a task**: Run PIE (`/ue:console --play`) to test, then stop PIE (`/ue:console --stop`).
- **Crash recovery / pipeline escalation** (only escalate when Live Coding actually fails):
  - `Trying to recreate changed class` or `CDO mismatch` → escalate to `--force-ubt` + `/ue:console --restart`.
  - SIGSEGV / access violation right after Live Coding → escalate to `--force-ubt` + `/ue:console --restart`.
  - Persistent crash even after full rebuild → corrupted Intermediate. Run `ue-clean.sh` → `--force-ubt` → `/ue:console --restart`.
  - `Module not found` after adding plugin module → check `.uplugin` lists the module, then `--force-ubt` + restart.
