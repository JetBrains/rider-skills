# Network Profiling, Emulation & Optimization

Canonical home for measuring and tuning network performance. Pitfalls/debug workflows are in `pitfalls.md`; replication mechanics in `replication.md`. Run console commands through `ue_execute_python` → `execute_console_command` and read overlays via `take_screenshot`, text output via `ue_get_logs` (see `debugger/console-commands.md`).

## Tools at a glance

| Tool | Purpose | Best for |
|---|---|---|
| `stat net` | Real-time HUD overlay | Quick health check |
| `stat nettraffic` | Per-actor-class bandwidth | Finding bandwidth hogs |
| Network Profiler (`.nprof`) | Offline per-actor/property/RPC bytes | Deep bandwidth attribution |
| Unreal Insights (Network trace) | Timeline / packet-level | Packet inspection + server CPU timing |
| RepGraph debug cmds | Relevancy/spatial visualization | RepGraph tuning |

## Real-time stats

```
stat net          // ping, channels, in/out rate, packets, bunches, loss, Saturated, voice
stat nettraffic   // per-actor-class bandwidth, sorted
stat game         // server tick incl. replication overhead
stat NetActor     // per-actor replication timing
```
`stat net` warning thresholds: Ping > 100 ms · Loss > 1% · **Saturated = 1.0 → over budget** · Channels > 1000. Ping is in µs (÷1000 for ms).

Server CPU counters (in Insights CPU trace): `NetBroadcastTickTime` (total replication broadcast/frame), `NetBroadcastTick.GatherActors`, `NetBroadcastTick.ReplicateActors`, `NetTickTime`.

## Network Profiler (legacy `.nprof`, still useful)

Record: launch arg `networkprofiler=true` (e.g. `-game networkprofiler=true`, or server `-server -log networkprofiler=true`), or console `netprofile` to toggle. Output → `<Project>/Saved/Profiling/<Project>-<Timestamp>.nprof`. Open with `<UE>/Engine/Binaries/DotNET/NetworkProfiler.exe`.
- Summary: total bytes, top consumers by actor class. Frame view: per-frame actors → expand to per-**property** and per-**RPC** byte cost. Filter by class/RPC/property; choose count vs bytes vs /sec.
- Workflow: record 2–5 min representative play → sort by bytes/sec → drill into top actors → look for replicated arrays (→ FastArray), high-freq properties (→ conditions), unnecessary RPCs.
- Requires `STATS` (editor/Debug builds; **not** Shipping); may need `net.AllowProfiler=1`.

## Unreal Insights — Network trace (modern, recommended)

**Both flags required:** `-NetTrace=1` (verbosity 1=basic, 2=detailed, 3=full packet) **and** `-trace=net`. Full setup: `-NetTrace=1 -trace=net,cpu,frame,bookmark -tracehost=localhost` (start Insights *before* the game when using `-tracehost`). File mode: `-tracefile=MyNetTrace` → `Saved/Profiling/`.

Runtime control (console): `Trace.Start net,cpu,frame` / `Trace.Stop` / `Trace.File MyFile.utrace cpu,net` / `Trace.Send 127.0.0.1 cpu,net` / `Trace.Bookmark MyEvent`. C++: `FTraceAuxiliary::Start(EConnectionType::Network, TEXT("localhost"), nullptr, TEXT("net,cpu,frame"))` / `::Stop()`; `TRACE_BOOKMARK(...)`.

Networking tab: Packet Overview (timeline + sizes), Packet Content (drill into actor updates / property changes / RPCs / bunches), Connection List, Net Stats. Client-side traces show more packet detail than server. Greyed-out tab = missing `-NetTrace=1` **or** `-trace=net`.

## Network emulation (simulate bad conditions)

```
net PktLag=100          // one-way ms (≈200ms RTT)
net PktLagVariance=20   // jitter ±ms
net PktLoss=5           // % loss
net PktDup=2            // % duplication
net PktOrder=1          // reordering
net PktLossBurst=5      // consecutive drops
net PktIncomingLoss=3   // incoming-only %
// reset: set each back to 0
```
Profiles — broadband `PktLag=25 Variance=5 Loss=0.5` · WiFi `50/15/1` · bad mobile `100/30/3` · stress `150/50/5 PktDup=3 PktOrder=1`. INI form: `[PacketSimulationSettings]` keys. UE 5.7+: `netEmulation.PktBufferBloatInMS=400`. Bandwidth cap: `[/Script/Engine.Player] ConfiguredInternetSpeed`/`ConfiguredLanSpeed` (bytes/sec).

## Replication & movement debug commands

```
ShowDebug Net                       // net-relevant actors in viewport
net.DrawDebugReplicationInfo=1      // replication info on actors
net.ShowNetRole=1                   // net role labels
net.ListActorChannelInfo            // actor channels + state
p.NetShowCorrections 1              // movement corrections (red)
p.NetCorrectionLifetime 5           // correction marker lifetime (s)
log LogNetPlayerMovement verbose
// RepGraph:
Net.RepGraph.PrintGraph | DrawGraph | PrintAllActorInfo <sub> | PrioritizedLists.Print|Draw | Lists.Stats|Details
```

## Key tuning CVars

```
net.UseAdaptiveNetUpdateFrequency=1   // uses Min/Max range
net.MaxNetUpdateFrequency=0           // global cap (0=none)
net.MaxRatePerNetUpdate=0             // max bytes/actor/update
net.MaxReliableBufferSize=512         // raise reliable buffer (default 256, temp fix)
net.DormancyEnable=1
net.MaxNetStringSize=2048
```

### Push Model (CPU win — skip un-dirtied actors)
```ini
; DefaultEngine.ini [SystemSettings]
net.IsPushModelEnabled=1
net.PushModelSkipUndirtiedReplication=1   ; UE 5.3+
```
`Build.cs`: `PrivateDependencyModuleNames.Add("NetCore")`; server target `bWithPushModel = true`.
```cpp
FDoRepLifetimeParams P; P.bIsPushBased = true;
DOREPLIFETIME_WITH_PARAMS_FAST(ThisClass, MyProp, P);
// on change: MARK_PROPERTY_DIRTY_FROM_NAME(ThisClass, MyProp, this);
```
Impact: NetBroadcastTickTime −50%+ in benchmarks (167→76 ms @ 976 actors).

### Iris (UE 5.4+ replication system; Beta in 5.7)
```ini
; DefaultEngine.ini [SystemSettings]
net.Iris.UseIrisReplication=1
net.Iris.PushModelMode=1
net.SubObjects.DefaultUseSubObjectReplicationList=1
```
`Build.cs`: `SetupIrisSupport(Target)`. 100-player bench: Net Tick 13.3→10.2 ms, NetBroadcastTick 66→29.5 ms, Frame 83.9→45.5 ms. 5.7 adds parallel polling (`bAllowParallelTasks`) + dirty-only polling. ReplicationGraph is deprecated in favor of Iris but still functional.

## Bandwidth budgets (rules of thumb)

| Game | Per-client | | Per-actor | Cost |
|---|---|---|---|---|
| Competitive FPS (<16) | 10–20 KB/s | | Player char | ~200–500 B/update @30Hz = 6–15 KB/s |
| Battle Royale (100) | 5–10 KB/s | | AI char | ~100–300 B @10Hz = 1–3 KB/s |
| Co-op PvE (4) | 20–50 KB/s | | Projectile | ~50–100 B @30Hz = 1.5–3 KB/s |
| MMO-style | 3–8 KB/s | | Dormant actor | 0 until change |

## Workflow cheat-sheets

- **Health check (1 min):** PIE w/ 2+ clients + dedicated server → `stat net` (ping/loss/saturation) → `stat nettraffic` (top actors).
- **Bandwidth (15 min):** `netprofile` / `networkprofiler=true` → 2–5 min play → open `.nprof` → sort bytes/sec → drill per-property → add `COND_*`, FastArray, lower `NetUpdateFrequency`, dormancy.
- **Deep packets (30 min):** Insights + `-NetTrace=1 -trace=net,cpu,frame -tracehost=localhost` → Networking tab → zoom bandwidth spikes → identify actors/properties/RPCs → cross-ref CPU trace.
- **Server CPU:** `-trace=cpu,frame,net` → Timing Insights → search `NetBroadcastTick` → if >5 ms/frame: Push Model → dormancy → lower frequency → Iris/RepGraph.

## Optimization decision tree

```
NetBroadcastTickTime > 5ms?
├─ Yes → Push Model (net.IsPushModelEnabled=1)
│        → still high → dormancy on static/infrequent actors
│        → still high → lower NetUpdateFrequency on non-critical actors
│        → still high → aggregate into FFastArraySerializer
│        → still high → Iris (5.4+) or custom ReplicationGraph
└─ No  → stat net Saturated?
         ├─ Saturated → reduce per-actor data: COND_* conditions, FVector_NetQuantize,
         │              FFastArraySerializer, smallest int types, lower NetUpdateFrequency
         └─ Not saturated → packet loss (test w/ emulation) or desync (→ pitfalls.md workflows)
```
