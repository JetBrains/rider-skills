---
name: ide-ue
description: "Rider Unreal Engine MCP driver — the UE-specific surface only. Editor lifecycle, PIE control, log streaming (ide-ue:editor); asset & GameplayTag index (ide-ue:assets); editor Python (ide-ue:python); canonical UE pipelines (ide-ue:pipelines). For solution build, run configurations, debugging, search, file editing, and the long-running-job protocol use the generic `ide` skill — this skill only adds UE-specific addenda on top (ide-ue:build, ide-ue:long-ops). Use `mcp__<rider_mcp_name>__ue_*` and related tools instead of CLI fallbacks, tail-ing log files, or manual editor actions."
---

# Unreal Engine IDE Skill

One skill for all UE-flavored MCP interactions against the **JetBrains Rider MCP Server** (Rider 2026.2+). Pick your domain below, share the GATE and universal rules above it.

> **Pair with the `ue-expert` skill — the *what* lives there, the *how* lives here.**
> `ue-expert` carries the UE domain knowledge: GAS, Enhanced Input, animation, networking/replication, physics/collision, AI/BT, crash anatomy, rendering (Nanite/Lumen/shaders), PCG, Sequencer, GameplayCues, plus the project-wide universal rules (no `GetWorld()` in constructors, `UPROPERTY` lifetime rules, UE units, etc.). This skill (`ide-ue`) is the MCP driver — `ue_*` tools, asset/tag/CDO indices, PIE, Live Coding, Python automation, long-running build/cook/package. Whenever a pipeline below says "decide whether to do X" (Live Coding vs. full rebuild, GameplayTag taxonomy, ability vs. component design, crash root cause), the *decision* belongs to `ue-expert`; once decided, drive it through `ide-ue`.

## Domain Routing

| Domain | Trigger | Key tools |
|--------|---------|-----------|
| **ide-ue:editor** | health, PIE play/pause/stop/frame_skip, mode + players + flags, log streaming, combined status pulse, persistent log-tail Monitor for warnings/errors (P9) | `ue_health`, `ue_play`, `ue_status`, `ue_get_logs`, `Monitor` |
| **ide-ue:build** | UE-specific addenda (runner-dispatch confirmation via `ps`, Live Coding log verification, cook/package RunUAT template) on top of **`ide:build`** | — (delegates to `ide:build`) |
| **ide-ue:assets** | find `.uasset`/`.umap`, derived BPs of a C++ class (full hierarchy incl. abstract bases), CDO defaults, per-field default overrides across descendants, GameplayTags | `search_assets`, `get_class_hierarchy`, `get_asset_properties`, `find_default_value_overrides`, `search_tags` |
| **ide-ue:visuals** | capture a PNG of the editor window, the active level viewport, or an asset's preview thumbnail (cache-first; explicit live render) | `take_screenshot` |
| **ide-ue:python** | run editor Python — single script or resumable batch via one tool | `ue_execute_python` |
| **ide-ue:pipelines** | canonical MCP-first workflows | composes the above |
| **ide-ue:long-ops** | UE-specific cook/package monitor-filter cheatsheet on top of **`ide:long-ops`** | — (delegates to `ide:long-ops`) |

> **Removed in this codebase:** `ue_play_control`, `ue_get_play_state`, `ue_set_play_mode`, `ue_trigger_build`, `ue_open_blueprint`, `ue_find_blueprint_usages`, `ue_execute_python_batch`. If `tools/list` still shows any of them, the running Rider has a stale UnrealLink jar — restart it.

### Delegate to the `ide` skill for non-UE IDE actions

This skill covers only the Unreal-specific MCP surface. For every other IDE action — code search, file editing, refactors, inspections, run configurations, debugging — delegate to the **`ide`** skill. Both skills target the same Rider MCP server, so the prefix you resolve in the GATE below works for both.

| `ide` sub-skill | Use it for | Key tools |
|-----------------|------------|-----------|
| **`ide:quality`** | Inspections, lint, problems, quick-fixes, rename, reformat, PSI tree | `lint_files`, `get_file_problems`, `get_inspections`, `apply_quick_fix`, `rename_refactoring`, `reformat_file`, `run_inspection_kts`, `generate_psi_tree` |
| **`ide:build`** | Non-blocking solution build + status polling + silent-failure guard (UE specifics in **ide-ue:build**) | `build_solution_start`, `build_solution_state`, `get_solution_projects`, `get_project_dependencies` |
| **`ide:runner`** | Listing / executing run configurations, capturing test or `Main` output, launch overrides, **stopping a run via terminal kill** | `get_run_configurations`, `execute_run_configuration`, `execute_terminal_command` |
| **`ide:search`** | Symbol / file / text / regex search across the indexed project | `search_symbol`, `search_file`, `search_text`, `search_regex` |
| **`ide:debugger`** | Mixed-mode C++ debugging against `UnrealEditor`: sessions, breakpoints, stepping, frame & variable inspection, expression evaluation | `xdebug_start_debugger_session`, `xdebug_get_debugger_status`, `xdebug_control_session`, `xdebug_set_breakpoint`, `xdebug_list_breakpoints`, `xdebug_remove_breakpoint`, `xdebug_run_to_line`, `xdebug_get_threads`, `xdebug_get_stack`, `xdebug_get_frame_values`, `xdebug_get_value_by_path`, `xdebug_evaluate_expression`, `xdebug_set_variable` |
| **`ide:long-ops`** | Background-run protocol for builds/cooks/packages — `Monitor` filter shape, `ScheduleWakeup`, truthful reporting (UE-specific filter patterns in **ide-ue:long-ops**) | `Bash run_in_background`, `Monitor`, `ScheduleWakeup` |
| **(file editing)** | Read/write/patch source files, create new files, move types | `read_file`, `replace_text_in_file`, `apply_patch`, `create_new_file`, `move_type_to_namespace` — see `ide:quality` workflow for hook-fed auto-fixes |

The pipelines in **`ide-ue:pipelines`** (P1, P4) compose this skill's `ue_*` tools with the above `ide` tools — when you see `search_symbol`, `apply_patch`, `xdebug_*`, etc. in a pipeline step, that call goes through the `ide` skill's conventions (same MCP prefix, same `rootFolder` rule).

---

## GATE — Resolve the Rider MCP server name first

Before calling **any** tool, resolve `<rider_mcp_name>` — the actual MCP server prefix. The string `mcp__<rider_mcp_name>__` is a placeholder; the real prefix varies per install (`rider`, `jetbrains`, `jetbrains-ide`, etc.).

**Detection (in order):**
1. Scan the deferred tool list in `<system-reminder>` for a clearly Unreal-aware tool (e.g. `ue_health`, `ue_play`, `ue_status`, `ue_get_logs`, `search_assets`, `get_class_hierarchy`, `search_tags`). Take the prefix between `mcp__` and the second `__`. Example: `mcp__rider__ue_health` → `<rider_mcp_name>` = `rider`.
2. Prefer the prefix that owns the broadest family of matching `ue_*` tools — IntelliJ/PyCharm advertise the same JetBrains MCP envelope but expose **no** `ue_*` tools.
3. **If no `ue_*` tools appear at all** — STOP and tell the user: *"I can't find the Unreal MCP tools. Please make sure **Rider** (not IntelliJ/PyCharm) is running with the MCP server enabled and the RiderLink editor plugin connected, then ask me again."*
4. **Cache the resolved name for the rest of the session.** Never re-resolve on every step.

## Universal Rules

- **`ue_health` or `ue_status` first, every session.** Don't assume the editor is connected. If `connected = false`, switch to filesystem + script mode and tell the user.
- **Always pass `rootFolder`** on every Rider MCP call when you know the project path — eliminates ambiguous-project resolution and is required for multi-solution setups. Ask once if unknown; reuse for every subsequent call.
- **PIE state transitions are async.** Every `ue_play` non-`state` action returns the **pre-fire** snapshot (`state` field) and echoes which action was issued (`requested`). To confirm a transition landed, re-query via `ue_status` or `ue_play(action="state")` after 5-10 s.
- **`ue_play` settings persist to `ULevelEditorPlaySettings` via SaveConfig.** `mode`, `players`, `dedicatedServer`, `spawnAtPlayerStart`, `compileBeforeRun` are written back to disk on each `play`. Subsequent plays inherit whatever was last sent. **Always pass `mode` and `players` explicitly per call** — relying on "the default" means inheriting whatever the previous test left in the editor's config.
- **Multiple `play` calls add PIE worlds, they don't replace them.** A second `ue_play(action="play")` while one PIE world is up spawns a second. Use `ue_play(action="stop")` to tear down **all** active PIE worlds at once before starting a fresh one.
- **Asset paths differ across tools.** `get_asset_properties` uses absolute filesystem path; package paths (`/Game/...`) are only used by tools that ingest them — read each tool's docstring.
- **Asset/tag index tools do NOT need the editor.** `search_assets`, `search_tags`, `get_class_hierarchy`, `get_asset_properties` are pure Rider-backend operations — use them even when `ue_health` reports `connected = false`.
- **The MCP tools are the only way to drive the editor.** Do not fall back to "please click in the editor" or to tailing `Saved/Logs/*.log` when an `ue_*` tool exists.
- **If a tool is missing**, tell the user which Rider build / MCP module is needed instead of simulating the action manually.

---

## ide-ue:editor

### Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `ue_health` | Reports RiderLink connection, project name, editor PID | First call before any other `ue_*` tool when you only need health |
| `ue_status` | One-stop pulse: `{ connected, projectName?, processId?, playState?, recentLogs[] }`. Takes the same filter shape as `ue_get_logs` (`count`, `category`, `minVerbosity`, `pattern`, `sinceTimestampMs`). Always one-shot, never follow. | Single round-trip "is editor up, what's PIE doing, what just happened" pulse — preferred over three separate `ue_health` + `ue_play(state)` + `ue_get_logs` calls |
| `ue_play` | Action-driven PIE controller: `state` reads, `play` starts (with mode + players + flags), `pause` / `resume` / `stop` / `frame_skip` operate on a running session | Drive PIE from chat; `frame_skip` lets you single-step paused gameplay |
| `ue_get_logs` | Stream log entries with `category`, `minVerbosity`, `count` (1..1000), `sinceTimestampMs`, `pattern`, `follow`, `followTimeoutMs` filters | Replace tail-on-`Saved/Logs/*.log`; **always** filter by category/verbosity/pattern to avoid floods |

### `ue_play(action, ...)` — actions & params

| Action | Effect | Params honoured |
|---|---|---|
| `state` | Read-only. Returns current PIE state. Ignores all other params. | — |
| `play` | Persists mode + players + netMode + flags to `ULevelEditorPlaySettings` via SaveConfig, then fires play. | `mode`, `players`, `netMode`, `dedicatedServer`, `spawnAtPlayerStart`, `compileBeforeRun`, `runUnderOneProcess` |
| `pause` / `resume` / `stop` | Operate on running PIE; mode/players params ignored. `stop` tears down ALL active PIE worlds. | — |
| `frame_skip` | Advance one frame. Only valid while `state == "Pause"`; no-op otherwise. | — |

**`mode` accepts int 0-5 OR a case-insensitive name alias** (mapping mirrors UE's `EPlayModeType`):

| Int | Aliases | What you get |
|---|---|---|
| 0 | `viewport`, `selected`, `selectedviewport` | PIE plays inside the selected viewport in the main editor window — no new window |
| 1 | `mobile`, `mobilepreview` | Mobile preview window (mobile rendering target) |
| 2 | `floating`, `editorfloating`, `new-window`, `newwindow` | **New editor window** — each client/server PIE instance gets its own floating window |
| 3 | `vr` | VR preview (HMD required for full experience) |
| 4 | `standalone`, `newprocess`, `process` | Standalone game spawned as a separate OS process — closer to shipped-game behaviour but slower to iterate |
| 5 | `simulate`, `simulation` | Simulate in editor — runs the world without spawning a Pawn / accepting input |

**`netMode` accepts a case-insensitive alias** (mapping mirrors UE's `EPlayNetMode`):

| Alias | EPlayNetMode | What you get |
|---|---|---|
| `standalone` (default), `single` | `PIE_Standalone` | No networking. Each PIE instance is its own world; `players > 1` produces multiple disconnected standalone instances. |
| `listen`, `listenserver`, `host` | `PIE_ListenServer` | First PIE window opens the map with `?listen` → becomes the listen server (binds `127.0.0.1:17777` by default). Remaining `players - 1` windows connect as clients. |
| `client` | `PIE_Client` | All PIE windows are clients. Pair with `dedicatedServer=true` to spawn a server (otherwise nothing to connect to). |

**Other PIE knobs:**

| Param | Default | What it controls |
|---|---|---|
| `players` | `1` | Number of client windows (1..4). For `netMode=listen`: 1 = listen server only; 2+ = listen server + (N-1) clients. |
| `dedicatedServer` | `false` | When `true`, UE spawns a separate dedicated-server PIE instance alongside the clients. Combine with `netMode=client` for "headless server + N clients". |
| `spawnAtPlayerStart` | `false` | When `true`, Pawns spawn at `PlayerStart` actors instead of the camera location. Almost always desirable for gameplay testing. |
| `compileBeforeRun` | `false` | Triggers a code compile before launching PIE. Set to `true` for "build-and-run" iterations. |
| `runUnderOneProcess` | `true` | All client/server PIE instances share the editor process (fast startup, easy in-editor debugging). Set to `false` to launch each as a separate OS process — slower, but tests real process boundaries (separate GC, separate audio device, real socket marshalling). |

### Network-topology recipes — choosing the right `ue_play` shape

| What you want | Call | Notes |
|---|---|---|
| **Pure gameplay test, no networking** (single player, AI sandbox, level walkthrough) | `ue_play(action="play", mode="viewport")` (in-editor) or `mode="floating"` (own window) | Don't touch `netMode`; the default `standalone` is correct. |
| **Multi-window standalone "split"** (each window a separate non-networked instance — useful for testing two characters' POV in isolation) | `ue_play(action="play", mode="floating", players=2, netMode="standalone")` | Each PIE world is independent; no replication. |
| **Server inside editor + 1 client window** | `ue_play(action="play", mode="floating", players=2, netMode="listen", runUnderOneProcess=true, spawnAtPlayerStart=true)` | First floating window hosts the listen server, second is a client connecting to `127.0.0.1:17777`. Best default for hand-debugging server/client logic side-by-side. |
| **Server inside editor + N clients in separate windows** | same as above with `players=N+1` (N ≤ 3) | Server is window #1; clients are windows #2..N+1. |
| **Dedicated server (no window) + N clients** | `ue_play(action="play", mode="floating", players=N, netMode="client", dedicatedServer=true, runUnderOneProcess=true)` | Closest to a shipped MP game's runtime topology while still keeping everything inside the editor process. |
| **Server and clients in separate OS processes** (real process boundary — e.g. catching server-only memory leaks, separate logs per process) | any of the network shapes above plus `runUnderOneProcess=false` | Slower startup, separate `Saved/Logs/*.log` files per instance. |
| **Standalone game (no PIE plumbing at all)** — closest to shipped runtime | `ue_play(action="play", mode="standalone")` | UE spawns the game as a fully separate process. Heaviest iteration; reserve for verifying shipping-config issues. |

### Best practice: how to actually test client/server logic

1. **Default to `mode="floating", netMode="listen", players=2, runUnderOneProcess=true, spawnAtPlayerStart=true`.** The server is window #1 (its title shows `[NetMode: ListenServer N]`); the client is window #2 (`[NetMode: Client N]`). You can `xdebug_*` into either world via the standard `ide:debugger`.
2. **Verify the handshake actually happened** before drawing gameplay conclusions. Pull logs and require BOTH of these markers from `LogNet` after the play call:
   - Server side: `IpNetDriver listening on port 17777` + `NotifyAcceptingConnection accepted from: 127.0.0.1:<port>` + `AddClientConnection: Added client connection … IsServer: YES`.
   - Client side: `InitBase PendingNetDriver` + `Browse: 127.0.0.1:17777/<Map>` + `UPendingNetGame::SendInitialJoin: Sending hello.`
3. **Scale up to dedicated server only when client-server confidence is high.** Adding `dedicatedServer=true` introduces a third process/world; debug client/server isolation in the simpler listen-server topology first.
4. **Use `runUnderOneProcess=false` only for symptom-specific checks** — separate-process testing is real but reveals issues (different GC, different audio devices, real IPC) that mask gameplay logic bugs. Default to `true`.
5. **For non-network gameplay** (animations, abilities, UI, world-streaming, single-player AI) **do not enable networking** — `netMode="standalone"` (default) and either `mode="viewport"` (single in-editor) or `mode="floating"` (its own window). Networking adds replication overhead and order-of-operations noise that obscures pure gameplay bugs.

### Game-project-specific override gotcha

Some game projects override the standard PIE listen-server URL routing inside their `UGameInstance` (Lyra is one). Symptoms:

- `EditorPerProjectUserSettings.ini` correctly shows `PlayNetMode=PIE_ListenServer` after `ue_play(netMode="listen")`, **but**
- runtime logs show `LogNet: Browse: …?Experience=…` with **no `?listen` suffix**, and both windows end up with `NetMode: Standalone`.

That's the game-side `UGameInstance` building its own `Browse()` URL and bypassing PIE's standard listen-server URL plumbing. The MCP/protocol layer is doing its job — verify by `grep`-ing the persisted `EditorPerProjectUserSettings.ini`:

```bash
grep -E "PlayNetMode|RunUnderOneProcess|PlayNumberOfClients|LastExecutedPlayModeType" \
  <UProject>/Saved/Config/MacEditor/EditorPerProjectUserSettings.ini
```

If the ini shows the right values but PIE still runs Standalone, the fix is on the game's side:
- Pick a map / experience that respects standard PIE URL routing (in Lyra, the front-end map `L_LyraFrontEnd` does — its "Host Game" / "Join Game" flow uses the listen-server URL correctly).
- Or temporarily disable the project's custom GameInstance route while testing the protocol path.

### `ue_get_logs` — filters & streaming

| Param | Default | Notes |
|---|---|---|
| `category` | (none) | Exact match against the UE log category name (`LogTemp`, `LogLiveCoding`, `LogNet`, `LogPython`, …) |
| `minVerbosity` | (none) | One of `Fatal | Error | Warning | Display | Log | Verbose | VeryVerbose` |
| `count` | 200 | 1..1000; cap on entries returned |
| `sinceTimestampMs` | (none) | Epoch ms cutoff. Use `lastEntry.timestampMs + 1` between polls to avoid duplicates |
| `pattern` | (none) | Kotlin/Java regex matched against `entry.message` (substring via `containsMatchIn`). Combines with the other filters via AND. |
| `follow` | `false` | When `true`, the call blocks server-side until at least one matching entry lands OR `followTimeoutMs` elapses (long-poll). On timeout, returns an empty batch — caller can re-poll. |
| `followTimeoutMs` | 30000 | 1..600000; only used when `follow=true` |

The buffer only accumulates while RiderLink is connected. Pre-connection entries are lost.

### Workflow

1. **Pulse.** `ue_status` (or `ue_health` if you don't need logs/play state). If `connected = false`, stop and surface to the user.
2. **Read play state** if not already in the `ue_status` result: `ue_play(action="state")`.
3. **Drive PIE.** `ue_play(action="play", mode="floating", players=1, netMode="standalone", runUnderOneProcess=true)` — **always pass `mode`, `players`, `netMode`, and `runUnderOneProcess` explicitly**. Every value is `SaveConfig`'d on the editor side, so omitting one means inheriting whatever the previous test (possibly weeks ago) left in `EditorPerProjectUserSettings.ini`.
4. **Confirm transition.** Sleep 5-10 s, then re-pulse `ue_status` and check `playState == "Play"`.
5. **For networked plays, also verify the handshake.** After `playState == "Play"`, grep `LogNet` for the handshake markers listed in "Best practice: how to actually test client/server logic" — `PlayNetMode=PIE_ListenServer` in the persisted config is necessary but not sufficient; the game project can still override it.
6. **Stream logs.** Record `t0 = now_ms()` **before** the play call; loop `ue_get_logs(sinceTimestampMs=cutoff, pattern=..., follow=true, followTimeoutMs=8000)`; advance `cutoff = entries[-1].timestampMs + 1` between polls.
7. **Stop.** `ue_play(action="stop")` tears down every active PIE world in one shot (server + every client).

### Critical rules

- **`ue_get_logs` must be filtered.** Unfiltered, the buffer's most-recent slice is dominated by `LogEOSSDK` background polling and similar engine chatter. Always specify at least one of `category`, `minVerbosity ≥ Warning`, or `pattern`.
- **All play params are sticky** — UE writes `mode`, `players`, `netMode`, `dedicatedServer`, `spawnAtPlayerStart`, `runUnderOneProcess` to `ULevelEditorPlaySettings` on every `play` via SaveConfig. Pass them explicitly per call; do not rely on "the default". The classic symptom of omission is "I asked for 1 floating window and got 3" or "I asked for standalone and got a listen server" — both mean a previous test's settings leaked through.
- **`ue_play(action="play")` returns the pre-fire snapshot.** `state` in the result is what it was **before** the signal fired; `requested` echoes the action issued. To know whether PIE actually entered: wait and re-query.
- **`frame_skip` only works while paused.** During `Play` it's a no-op.
- **`stop` is global.** It tears down every PIE world the editor is hosting, not just the one started most recently.
- **Follow-mode timeout is server-side.** `ue_get_logs(follow=true, followTimeoutMs=N)` blocks for at most N ms on the server. Set a comparable client-side timeout (a few seconds longer than `followTimeoutMs`) to avoid orphaning the call.
- **Do not tail `Saved/Logs/*.log`** when the editor is connected — `ue_get_logs` is structured, pre-filtered, and skips files entirely.

### Streaming recipes

```text
# "Did my play land?"
t0 = now_ms()
ue_play(action="play", mode="floating", players=1)
sleep(8)
ue_status(count=1).playState == "Play"

# "Did my listen-server actually start networking?"
# Required server-side markers (from LogNet):
#   "IpNetDriver listening on port 17777"
#   "AddClientConnection: Added client connection … IsServer: YES"
# Required client-side markers:
#   "Browse: 127.0.0.1:17777/<Map>"
#   "UPendingNetGame::SendInitialJoin: Sending hello."
t0 = now_ms()
ue_play(action="play", mode="floating", players=2, netMode="listen",
        runUnderOneProcess=true, spawnAtPlayerStart=true)
sleep(15)
ue_get_logs(sinceTimestampMs=t0,
            category="LogNet",
            pattern="listening on port|NotifyAcceptingConnection|AddClientConnection|SendInitialJoin|Browse:",
            count=100)
# If you see Browse:.../?Experience=… with NO "listen" URL suffix, the game
# project (e.g. Lyra LocalMultiplayer) is overriding the standard PIE network
# path — see the "game-project-specific override gotcha" section.

# "Stream PIE startup, no duplicates"
t0 = now_ms()
ue_play(action="play", mode="floating", players=1)
cutoff = t0
while time-budget remains:
    r = ue_get_logs(sinceTimestampMs=cutoff,
                    pattern="PIE|HUDLayout|GameMode|LoadMap|Audio Device:",
                    minVerbosity="Display",
                    follow=true, followTimeoutMs=6000)
    for e in r.entries: handle(e)
    if r.entries: cutoff = r.entries[-1].timestampMs + 1

# "Wait for compile failure"
ue_get_logs(minVerbosity="Error",
            pattern="error C|fatal|Compile failed|Live Coding",
            follow=true, followTimeoutMs=60000)

# "Periodic pulse"
ue_status(count=5, minVerbosity="Warning")
```

---

## ide-ue:build

> The build pipeline (`build_solution_start` + `build_solution_state`, status semantics, silent-failure guard) lives in **`ide:build`**. Use it directly for every UE compile. Only UE-specific addenda live here.

### UE-specific addenda

- **Which runner ran** is opaque from MCP. For .uproject solutions Rider picks: editor connected + Live Coding available → Hot Reload (very fast, no `.dylib` rewrite); otherwise → UBT compile of the primary game target (slow, full link). Confirm via shell when it matters: `ps -eo command | grep UnrealBuildTool | grep -v grep` — shows the active UBT target.
- **Verify Live Coding outcome with the editor log**, not just the build state. After `build_solution_state` reports `Completed + buildIsSuccess=true`:
  ```
  ue_get_logs(category="LogLiveCoding", pattern="patched|failed", count=20)
  ```
- **Live Coding cannot apply structural changes.** New `UPROPERTY`, reflected method signature changes, hierarchy changes, new `UCLASS`/`USTRUCT` → exit the editor, do a full `build_solution_start(rebuild=true)` via **ide:build**, relaunch via **ide:runner** (`execute_run_configuration`).
- **Cook / pak / stage / archive** (`BuildCookRun`) has no MCP tool — drop to RunUAT via `Bash run_in_background` and follow the **ide:long-ops** protocol. Template:
  ```bash
  "${UE_ROOT}/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="<path.uproject>" -targetplatform=Mac -clientconfig=Development \
    -build -cook -pak -stage -prereqs -archive \
    -archivedirectory="<out>" -unattended -nop4 -utf8output \
    > /tmp/ue-package.log 2>&1
  ```

---

## ide-ue:assets

### Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `search_assets` | Find `.uasset`/`.umap` by name **or** by derived `baseClass` (e.g. `LyraCharacter`) | Filename glob is case-insensitive; `baseClass` walks the **full C++ inheritance closure** — abstract / `NotBlueprintable` bases work, returns BPs of every concrete subclass. |
| `get_class_hierarchy` | Lists all Blueprints inheriting from a C++ class (full chain) | Walks the **full C++ inheritance closure** — abstract / `NotBlueprintable` bases descend correctly. `limit` defaults 1000. |
| `get_asset_properties` | Dumps CDO property values from a `.uasset` (absolute path required) | Read default values without opening the editor |
| `find_default_value_overrides` | For a `UPROPERTY` field, list every BP whose CDO overrides its default value | Returns `{ assetPath, instanceName, typeName, value }` per override. Mirrors Rider's gutter `"<value>" (Default__BP_C)` next to UPROPERTY declarations. |
| `search_tags` | Search GameplayTag definitions across `.uasset` files; supports `prefix` filter | Use before adding new tags to avoid duplicates / collisions |

### Workflow

1. **Find by name or class.** `search_assets { query: "BP_Hero" }` or `search_assets { baseClass: "LyraCharacter" }`.
2. **Enumerate descendants.** `get_class_hierarchy { baseClass: "LyraCameraMode", limit: 5000 }` for the full BP tree — including BPs that inherit only via concrete C++ subclasses of an abstract base.
3. **Inspect one BP's CDO.** `get_asset_properties { assetPath: "/abs/.../Foo.uasset" }` (absolute filesystem path).
4. **Find every override of one field across the hierarchy.** `find_default_value_overrides { className: "LyraCameraMode", fieldName: "FieldOfView" }` — returns the BPs that differ from the C++ default plus the textual value each one stores.
5. **Audit tags.** `search_tags { prefix: "Ability.Damage" }` before adding new tags.

### Critical rules

- **`get_asset_properties` requires absolute filesystem path**, not `/Game/...` package path.
- **`baseClass` and `className` accept either UE convention.** Bare name (`LyraCameraMode`) or C++ form with prefix (`ULyraCameraMode`) both match — the backend probes the C++ symbol cache with every UE class prefix (`U`/`A`/`F`/`S`/`H`/`T`/`E`/`I`) when the input is unprefixed. **Do NOT use the `/Script/Module.Class` FQN** — that form is rejected. Matching is case-sensitive on the identifier itself.
- **`get_class_hierarchy` and `search_assets { baseClass }` descend through `Abstract` / `NotBlueprintable` bases.** The backend builds the full C++ inheritance closure (root + every direct/indirect subclass) before consulting the BP index, so a query against `ULyraCameraMode` returns BPs of `ULyraCameraMode_ThirdPerson`, `ULyraCameraMode_TopDownArenaCamera`, etc. without you having to enumerate concrete subclasses yourself.
- **`find_default_value_overrides` reads CDO data from Rider's index, not the running editor.** Works whether or not `ue_health` reports `connected`. The `value` field is the textual presentation UE generates for the property type (e.g. `"70"` for a float, `"Lyra.Weapon.SteadyAimingCamera"` for an `FGameplayTag`); fields whose property type has no `ValuePresentation` (struct-only members) are omitted.
- **None of these tools need the editor connected.** Use them even when `ue_health` reports `connected = false`.

---

## ide-ue:visuals

`take_screenshot` is the single MCP tool for grabbing a PNG of the running editor. It writes the file to `<Project>/Saved/Screenshots/<Platform>/RiderMCP/<YYYYMMDD-HHMMSS>_<kind>.png` and returns the absolute path plus dimensions and a diagnostic `sourceApi` label. The image bytes do **not** travel through MCP — the client reads the file from disk.

### Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `take_screenshot { kind, assetPath?, width?, height?, forceLive? }` | Capture one of three editor surfaces and return its on-disk path | Requires editor connected (`ue_health.connected = true`). |

`kind` values:

| Kind | What it captures | Underlying API (returned as `sourceApi`) |
|------|------------------|------------------------------------------|
| `editor_window` | Active top-level editor window: chrome + viewport + every docked panel | `FSlateApplication::GetActiveTopLevelRegularWindow` (with focus-aware fallback) → `FSlateApplication::TakeScreenshot(SWindow)` |
| `viewport` | Active level-editor viewport only (no panels / chrome) | `ILevelEditor::GetActiveViewportInterface() → SLevelViewport` → `FSlateApplication::TakeScreenshot(SLevelViewport)` |
| `asset_preview` | The same image the Content Browser shows for an asset — Blueprint, Material, AnimBP, Niagara, etc. | Cache-first: `ThumbnailTools::FindCachedThumbnail` (in-memory) → `ThumbnailTools::LoadThumbnailFromPackage` via `IAssetRegistry::GetAssetByObjectPath` (on-disk). Live fallback only when `forceLive=true`: `ThumbnailTools::RenderThumbnail(NeverFlush)`. |

### Workflow

1. **Pulse first.** `ue_status` (or `ue_health`). If `connected = false`, stop — the editor must be running.
2. **Pick the kind.**
   - "What does the editor look like right now?" → `editor_window`.
   - "What's on screen in the level viewport?" → `viewport`.
   - "What does asset X look like?" → `asset_preview { assetPath: "/Game/.../X" }`.
3. **Resolve `assetPath` for `asset_preview`.** Long package path form (`/Game/Foo/BP_Hero`), not a disk path. Use `search_assets` to discover paths if you don't already know them — note `search_assets` returns disk paths; convert by stripping the project's `Content/` prefix and the `.uasset` suffix, then prepending `/Game/`.
4. **Read the file the call returned** — the `path` field is absolute. PNG is BGRA8-sRGB.

### Critical rules

- **The MCP call blocks on the game thread.** Internally a screenshot needs render-thread coordination (`FlushRenderingCommands`). Slow but bounded; callers don't see the threading. Never call `ue_execute_python` *inside* a screenshot-driven workflow expecting them to interleave — both go through the game thread.
- **`asset_preview` defaults to cache-only on purpose.** Returns a clean error (`"no cached thumbnail. Open the asset in the editor once, or set forceLive=true"`) in <1 s rather than risking a render-time hang. The hang risk is real: `ThumbnailTools::RenderThumbnail(AlwaysFlush)` on assets that pull long streaming chains (skeletal mesh / AnimBP) can wedge the render thread inside a graphics-driver call that is **not killable** from user mode (`taskkill /F`, `Stop-Process -Force`, even WMIC return Access Denied — only a reboot recovers). The tool only invokes `RenderThumbnail` when `forceLive=true`, and even then uses `NeverFlush` so streaming-readiness can't block the call.
- **`editor_window` has a fallback when UE doesn't own focus.** `GetActiveTopLevelRegularWindow()` returns null if Rider (or any other app) is the foreground process when the MCP request lands. The tool then picks the first visible, non-minimised interactive top-level window — practically always the editor frame. No caller action needed.
- **Save path is project-relative; response path is absolute.** Internally the engine receives a relative path so its own canonical resolution rules apply. The response always carries `FPaths::ConvertRelativePathToFull(...)` so MCP clients don't need to know where the project lives.
- **Materials & Textures almost always have an embedded thumbnail.** AnimBPs / ControlRigs / Niagara often don't — they're rendered the first time the asset is opened. If `asset_preview` returns `"no cached thumbnail"`, either open the asset in the editor once (it'll be saved next time the package is saved) or pass `forceLive=true`.
- **Unrelated UE engine `ensure()` in `VirtualShadowMapCacheManager`.** When debugging with "Break on C++ Exception" enabled, a screenshot can trip a UE 5.x render-thread `ensure(IsInGameThread())` in `FVirtualShadowMapArrayCacheManager::TrimLoggingInfo` (calls `FApp::GetDeltaTime` from the render thread). This is a UE engine bug, **not the screenshot tool** — the ensure is non-fatal; resume the session and the screenshot still completes (and its PNG is already on disk by the time you see the pause).

---

## ide-ue:python

The python execution surface is a **single tool**, `ue_execute_python`, that accepts either a single script or a list with resumable batch semantics.

### Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `ue_execute_python` | Run Python on the editor game thread. Pass **exactly one** of `script` (single source) or `scripts` (list). Always returns batch-shape (`{ results: [...], lastSuccessfulIndex }`) — single-script call is a 1-item batch. | `isolated=true` runs a single script as `EvaluateStatement` (returns expression value); ignored for batch. `startFrom` resumes a batch from a 0-based index (use `lastSuccessfulIndex + 1` after a failure). Output of each script capped at 10,000 chars. |

### Workflow (single shot)

1. `ue_health` (or `ue_status`) must be `connected`.
2. `ue_execute_python { script: "..." }`. Use `isolated: true` for expression-style eval.
3. Output > 10k chars → write to a temp file under `Saved/` from inside the script and `read_file` it.

### Workflow (resumable batch)

1. Build the script list as an array of independently re-runnable Python snippets.
2. `ue_execute_python { scripts: [...], startFrom: 0 }`.
3. On failure: response contains `lastSuccessfulIndex`. Fix the offender.
4. Re-call with `startFrom: lastSuccessfulIndex + 1` — never replay completed steps (idempotency is on you).

### Critical rules

- **Runs on the game thread.** Long scripts block the editor UI. Keep snippets short.
- **Batch is sequential, not parallel.** For parallelism, structure the work inside a single Python script using subsystems / async tasks.
- **`script` is compiled with `compile(..., 'single')` — only one statement.** Multi-line scripts (`import unreal\nfoo()`) raise `SyntaxError: multiple statements found while compiling a single statement`. Two workarounds, in order of preference:
  - **Semicolon-join** when the body is one short line: `import unreal; asset = unreal.EditorAssetLibrary.load_asset('/Game/X'); …`. A chain of `;`-separated statements compiles as one and avoids the file dance.
  - **`exec(open(...))`** for anything multi-line: write the body to `/tmp/foo.py`, then `script="exec(open('/tmp/foo.py').read())"`. The `exec()` call is itself a single statement, so `compile(..., 'single')` accepts it; the file body runs unrestricted.
- **Reference: https://dev.epicgames.com/documentation/en-us/unreal-engine/python-api/**

### UE Python API cheatsheet (5.7-tested)

| Goal | Snippet | Notes |
|---|---|---|
| Load asset by package path | `bp = unreal.EditorAssetLibrary.load_asset('/Game/B_X')` | Use `/Game/...`, **not** the absolute `.uasset` path. |
| Open asset in editor | `unreal.get_editor_subsystem(unreal.AssetEditorSubsystem).open_editor_for_assets([bp])` | Returns `True` on success. No MCP wrapper for this any more. |
| Get the generated class | `gen = bp.generated_class()` | The `*_C` class — what `unreal.get_default_object` takes. |
| Read the CDO | `cdo = unreal.get_default_object(gen)` | Class Default Object — UPROPERTY defaults live here. |
| Read a UPROPERTY value | `cdo.get_editor_property('default_pawn_class')` | Snake-case the C++ name. Falls back to `AttributeError`; wrap in try/except when iterating `dir(cdo)`. |
| Iterate components on an AActor CDO | `cdo.get_components_by_class(unreal.ActorComponent)` | Empty list for non-Actor CDOs (e.g. GameMode-config-only BPs that own no SCS components). |
| C++ inheritance chain | `t = type(cdo); while t and t.__name__ != 'object': chain.append(t.__name__); t = t.__bases__[0]` | `BlueprintGeneratedClass` does **not** expose `get_superclass()`; walk the Python class projection instead. |
| AssetRegistry data | `ar = unreal.AssetRegistryHelpers.get_asset_registry(); ad = ar.get_asset_by_object_path(unreal.Name(bp.get_path_name()))` | Old overload — deprecated in 5.7 (warning, still works). Prefer `unreal.SoftObjectPath(bp.get_path_name())` when 5.7+ types are accepted. |
| Asset-registry tags (parent class, etc.) | `ad.get_tag_value('ParentClass')`, `ad.get_tag_value('NativeParentClass')`, `ad.get_tag_value('ImplementedInterfaces')` | Always-available metadata without parsing the .uasset. |
| Find derived BPs of any C++ class (incl. abstract) | `unreal.AssetRegistryHelpers.get_asset_registry().get_assets_by_class(... )` | Or prefer the MCP **`get_class_hierarchy`** tool — Rider's index is faster and works without the editor running. |

### UE Python API gotchas

- **`unreal.SystemLibrary.get_class_property_names` / `get_class_function_names` do NOT exist.** Don't reach for them — there is no first-class UE-Python reflection API for "list every UPROPERTY/UFUNCTION on a class". Walk `dir(cdo)` and probe with `get_editor_property`, or read the AssetRegistry tags.
- **`bp.parent_class` and `bp.simple_construction_script` are not Python attributes.** They look like UPROPERTYs on the `UBlueprint`, but only `get_editor_property('parent_class')` / `'simple_construction_script'` works — and even those return `None` in 5.7. Use the C++ inheritance chain from `type(cdo).__bases__` and the AssetRegistry `ParentClass` tag instead.
- **`ubergraph_pages` / `function_graphs` / `macro_graphs` are not Python-accessible.** No reliable UE Python API exposes Blueprint graph contents. For graph introspection either parse the `.uasset` via Rider's index (the MCP asset tools already do this for CDO data) or fall back to C++ editor internals.
- **`dir(cdo)` reflection logs `DeprecationWarning` for renamed Actor properties** (`life_span` → `initial_life_span`, `on_actor_touch` → `on_actor_begin_overlap`, `on_actor_un_touch` → `on_actor_end_overlap`). Cosmetic noise — the values are still readable; skip those keys explicitly if you want a quiet log.
- **`Class.get_superclass()` does not exist on `BlueprintGeneratedClass`.** Walk `type(cdo).__bases__` instead.

---

## ide-ue:pipelines

Canonical workflows composing the domains above. Follow them step-for-step; do not invent shortcuts.

### P1. C++ edit → Live Coding → verify in PIE

> **Domain decisions first.** Before editing, consult **`ue-expert`** for the *what*: which UCLASS / UPROPERTY conventions apply (no `GetWorld()` in constructors, `TObjectPtr<>`, lifetime/GC rules), whether this is a GAS / Input / Network / Replication concern, what Lyra's modular plugin pattern expects. The steps below only cover the MCP plumbing — they don't tell you *what* to change.

1. `ue_status` — confirm editor connected (else fall back to UBT-only flow).
2. `read_file` / `search_symbol` to locate target.
3. `replace_text_in_file` or `apply_patch` to edit.
4. `get_file_problems` on the edited file — fix everything red before building.
5. `build_solution_start` → `sessionId`.
6. Poll `build_solution_state(sessionId)` until `state != "Running"`; require `buildIsSuccess == true`.
7. `ue_get_logs(category="LogLiveCoding", pattern="patched|failed", count=20)` — confirm `Code successfully patched`.
8. If PIE was `Idle`: `ue_play(action="play", mode="floating", players=1)`. Wait 5-10 s; verify via `ue_status`.
9. `ue_get_logs(category="LogTemp", count=100)` — verify gameplay output.
10. `ue_play(action="stop")`.

> Live Coding rejects: new `UPROPERTY`, reflected method signature changes, class hierarchy changes, new `UCLASS`/`USTRUCT`. On rejection, exit the editor, do a full `build_solution_start(rebuild=true)`, then relaunch via `execute_run_configuration`.

### P2. Discover Blueprints derived from a C++ class

1. `get_class_hierarchy { baseClass: "LyraWeaponInstance", limit: 5000 }` — single call. The backend walks the full C++ inheritance closure, so abstract / `NotBlueprintable` bases (e.g. `ULyraCameraMode`) return BPs of every concrete subclass without you having to enumerate them first. Either UE-form (`LyraWeaponInstance`) or C++-form (`ULyraWeaponInstance`) is accepted.
2. (Alternative entry) `search_assets { baseClass: "LyraWeaponInstance" }` — same hierarchy traversal, plus optional `query` filter on the BP name.
3. `get_asset_properties` on selected paths to compare CDOs without opening the editor.
4. **One field across the whole hierarchy:** `find_default_value_overrides { className, fieldName }` — returns every BP whose CDO overrides that UPROPERTY, with the textual value. Matches Rider's gutter `"<value>" (Default__BP_C)`.
5. Visual inspection requires the editor's own UI — there is no MCP "open blueprint" tool any more; navigate via Rider's Solution Explorer or the editor itself.

### P3. Audit / refactor a GameplayTag

> **Tag taxonomy is a domain call.** Naming, hierarchy depth, "is this a state tag or an event tag", redirector rules — all live in **`ue-expert`** (`ue:gas` knowledge). Use this pipeline for the mechanics; consult `ue-expert` for *what* tag to introduce or *whether* to merge.

1. `search_tags { prefix: "Ability.Damage" }` — enumerate existing tags.
2. `search_text` for the tag's literal in `.cpp`/`.h`.
3. Edit the C++ tag table; `apply_patch`.
4. `build_solution_start` and poll.
5. `ue_get_logs(category="LogGameplayTags", minVerbosity="Warning")` — confirm no unresolved tag warnings.

### P4. Crash / nullptr investigation

> **Interpretation is a `ue-expert` task.** This pipeline gets you the crash dump, stack, and live variables. *Diagnosing* "GC reclaimed an unmanaged `UObject*`", "`GetWorld()` in CDO construction", "RPC reliability buffer overflow" etc. is UE domain knowledge — route through **`ue-expert`** for the universal-rules / GAS / Networking pages.

1. `ue_get_logs(minVerbosity="Error", count=500)` — pull the actual crash output, not a guess.
2. `xdebug_get_debugger_status` — if a session is attached, dump it; else start one.
3. `xdebug_start_debugger_session` with the editor's run configuration (`get_run_configurations` to find it).
4. `xdebug_set_breakpoint` on the suspect file:line.
5. Reproduce: `ue_play(action="play", mode="floating", players=1)`.
6. On hit: `xdebug_get_stack`, `xdebug_get_frame_values`, `xdebug_evaluate_expression`.
7. `xdebug_set_variable` to test a fix hypothesis without rebuilding.
8. `xdebug_control_session("resume")` to continue or `stop` to detach.

### P5. Editor automation via Python (single-shot)

1. `ue_status` — must be `connected`.
2. `ue_execute_python { script: "import unreal; ..." }`. Set `isolated: true` for expressions like `unreal.SystemLibrary.get_engine_version()`.
3. Output is capped at 10k chars — write large dumps to `Saved/*.txt` from inside the script and `read_file` them.

### P6. Multi-step content migration (resumable)

1. Build the script list as an array of independently re-runnable Python snippets.
2. `ue_execute_python { scripts: [...], startFrom: 0 }`.
3. On failure: response contains `lastSuccessfulIndex`. Fix the offender.
4. Re-call with `startFrom: lastSuccessfulIndex + 1` — never replay completed steps (idempotency is on you).

### P7. PIE networking repro

1. `ue_play(action="play", mode="standalone", players=2, dedicatedServer=true, spawnAtPlayerStart=true)`.
2. `ue_get_logs(category="LogNet", minVerbosity="Warning", follow=true, followTimeoutMs=15000)` for replication / connection issues.
3. `ue_play(action="pause")` + `ue_play(action="frame_skip")` to single-step a desync.
4. `ue_play(action="stop")` when done.

### P8. Inspect a Blueprint's CDO without opening the editor

1. `search_assets { query: "BP_Hero" }` — get the `.uasset` path.
2. `get_asset_properties { assetPath: "/abs/path/.../BP_Hero.uasset" }`.
3. Diff against expected defaults. No MCP "open blueprint" tool — inspect visually via the editor UI if needed.

### P9. Recommended setup: tail UE editor logs in the background as warnings/errors arrive

Whenever you're driving the editor over multiple turns (Python introspection, PIE iteration, asset edits), arm a persistent `Monitor` that long-polls `ue_get_logs` and surfaces each Warning+ entry as its own notification. Catches silent UE script errors, deprecation warnings from your own probes, RiderLink assertions, and `LogPython` tracebacks the moment they're emitted — instead of waiting for the next `ue_get_logs` pull to discover them.

**Setup (one-shot per session):**

1. Drop a tailer script at `/tmp/ue-log-tail.py` (or anywhere persistent) that:
   - reuses your existing MCP client (e.g. `mcp_call.py`),
   - calls `ue_get_logs` with `minVerbosity="Warning"`, a noise-resistant `pattern` (`(?i)error|fatal|assert|crash|exception|failed|cannot|warning`), `follow=true`, `followTimeoutMs=25000`,
   - advances a `sinceTimestampMs` cursor as `entries[-1].timestampMs + 1` between polls,
   - **applies a client-side deny-list before printing** (see "Telemetry noise" below) — the MCP `pattern` is positive-match only,
   - prints **one line per entry** that survives the deny-list to stdout with `print(..., flush=True)` so each becomes a Monitor event.
2. Arm:
   ```
   Monitor(
     description="UE editor warnings/errors",
     persistent=true,
     timeout_ms=3600000,
     command="python3 -u /tmp/ue-log-tail.py",
   )
   ```
3. Keep working — events arrive in-chat as the editor logs.

**Telemetry noise — deny-list these categories and phrases by default:**

When the dev machine is offline or behind a captive portal, UE/EOS retry telemetry forever and saturate any "Warning+" stream. Both belong in the tailer's client-side deny-list (the server-side `pattern` can't exclude — it's positive-match only):

| Layer | Drop | Why |
|---|---|---|
| Category | `LogEOSSDK` | Epic Online Services SDK config + telemetry retries (per-minute when offline) |
| Category | `LogHttp` | Generic engine HTTP probes, incl. Apple's `google.com/generate_204` connectivity check (per-30s when offline) |
| Message substring (case-insensitive) | `internet connection appears to be offline` | Backup catch — any category emitting offline-retry chatter |
| Message substring | `sdkconfig`, `sdk config product update request` | EOS retry backoff loop |
| Message substring | `telemetry` | Anyone phoning home |

If a category is *normally* useful but a single recurring message is noise, drop on the substring — don't blanket-ban the category. Example: `LogNet` is critical for replication work; don't deny-list it just because one offline-only warning keeps firing.

**Critical rules:**

- **One stdout line per entry.** Multi-line tracebacks are batched within 200ms into a single notification, so let the tailer print each `entry.message[:400]` on its own line with a `[Category][Verbosity]` prefix; the chunker groups related lines naturally.
- **Server-side long-poll, not client-side polling.** `follow=true` blocks the MCP call up to `followTimeoutMs`. That avoids tight loops; one Python subprocess per ~25s is fine. Don't drop `follow=true` and busy-loop — you'll burn tokens for nothing.
- **`Warning+` minimum, never `Verbose`.** Unfiltered the buffer is dominated by `LogEOSSDK` background polling, audio mixer chatter, and per-frame log noise. Always require `minVerbosity` plus a pattern. If you suspect a bug is hiding below Warning, narrow on `category` instead of dropping the verbosity floor.
- **Cursor must advance even when every entry is denied.** Initialize to `int(time.time() * 1000)` so historical noise doesn't flood, then advance to `last.timestampMs + 1` regardless of whether the entries survived the deny-list — otherwise the next poll re-pulls and re-discards the same noise on a tight loop.
- **Monitor events are not user input.** When you act on the next user message, don't treat an interleaved monitor notification as confirmation or as a question being answered. Surface what's useful, keep working.
- **If the monitor starts flooding the chat, stop and tighten — don't tolerate it.** The harness auto-kills monitors that emit too many events; restart with a wider deny-list rather than letting one bad pattern drown signal.
- **Stop with `TaskStop`** before you switch projects or the editor restarts on a different port — the tailer hard-codes `MCP_URL`. Re-arm against the new endpoint.

**When to skip this:** purely-offline asset queries (`search_assets`, `get_class_hierarchy`, `find_default_value_overrides`, `get_asset_properties`) don't touch the editor; no log stream to watch. If `ue_health.connected = false` the buffer is empty anyway.

---

## ide-ue:long-ops

> The background-run protocol (`Bash run_in_background`, `Monitor` with terminal-markers + phase-transitions + heartbeats, `ScheduleWakeup`, truthful status reporting) lives in **`ide:long-ops`**. Follow it for every UE build, cook, package, and large test run.

### UE-specific monitor filter cheatsheet

When tailing a UE cook/package log with the `Monitor` tool, use these patterns in your three-category filter:

- **Terminal markers:** `BUILD SUCCESSFUL|BUILD FAILED|PACKAGE SUCCEEDED|PACKAGE FAILED|AutomationTool exiting|ERROR:|Exception:|fatal error|Killed|OOM`
- **Phase transitions:** `Running: .*UnrealEditor-Cmd.*-run=Cook|Cook complete|Running: .*UnrealPak|Stage commandlet|Copying to staging directory|Archiving to|All done`
- **Heartbeats (throttled):** `\[[0-9]+0/[0-9]+\] Compile` (every 10th compile), `Cooked packages [0-9]+00 ` (every 100th cooked package), `Archiving [0-9]+ shaders`, `Adding file to pak`

For `build_solution_start`-driven Live Coding / UBT compiles, the IDE's own run log lives under `out/dev-data/<ide-system>/tmp/ij_run__*.log` — point Monitor at the freshest match.

---

## Cross-skill references

- **General IDE actions on the same Rider MCP** → **`ide`** skill. Routes:
  - **`ide:quality`** — `lint_files`, `get_file_problems`, `get_inspections`, `apply_quick_fix`, `rename_refactoring`, `reformat_file`, `run_inspection_kts`, `generate_psi_tree`.
  - **`ide:build`** — `build_solution_start` / `build_solution_state`, status semantics, silent-failure guard. The UE-specific dispatch rules (Live Coding vs UBT, RunUAT cook/package) live in **ide-ue:build** as addenda.
  - **`ide:runner`** — `get_run_configurations`, `execute_run_configuration`, plus the `execute_terminal_command kill <pid>` stop-replacement.
  - **`ide:search`** — `search_symbol`, `search_file`, `search_text`, `search_regex`.
  - **`ide:debugger`** — full `xdebug_*` family for mixed-mode debugging of `UnrealEditor`.
  - **`ide:long-ops`** — background protocol (`Bash run_in_background`, `Monitor` filter shape, `ScheduleWakeup`, truthful reporting). UE-specific monitor-filter cheatsheet lives in **ide-ue:long-ops**.
  - **File editing** — `read_file`, `replace_text_in_file`, `apply_patch`, `create_new_file`, `move_type_to_namespace`.

  Pipelines P1, P3, P4, and P7 explicitly cross-call these tools. Reuse the GATE-resolved `<rider_mcp_name>` prefix and the `rootFolder` value across both skills.

- **UE domain knowledge** (GAS, Animation, Networking pitfalls, C++ patterns, knowledge files) → **`ue-expert`** skill. This skill drives the MCP; that skill knows what to drive it toward.


# TODO
- **UE Python API index:** `ue-console/knowledge/_index.md`
- **Turnkey SDK setup:** `ue-platform/knowledge/turnkey-and-sdks.md`
- **Editor Python recipes & subsystems:** `ue-editor/knowledge/{recipes,docs_python_scripting,docs_subsystems,docs_scriptable_tools,docs_editor_utilities}.md`