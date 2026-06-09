# Network Profiling & Performance Analysis

Comprehensive guide to capturing, analyzing, and optimizing network performance in Unreal Engine.

---

## 1. Profiling Tools Overview

| Tool | Purpose | Best For |
|------|---------|----------|
| `stat net` | Real-time HUD overlay | Quick health check |
| `stat nettraffic` | Per-actor class bandwidth | Identifying bandwidth hogs |
| Network Profiler | Offline .nprof analysis | Deep per-actor/property/RPC costs |
| Unreal Insights (Network Trace) | Timeline .utrace analysis | Packet-level inspection, timing |
| Replication Graph Debug | RepGraph visualization | Relevancy & spatial debugging |

---

## 2. Real-Time Stat Commands

### Core Network Stats
```
stat net                    // Ping, channels, bytes in/out, packets, bunches, loss, voice
stat nettraffic             // Per-actor-class bandwidth breakdown (sorted by cost)
```

### stat net Metrics Explained
| Metric | Description | Warning Threshold |
|--------|-------------|-------------------|
| Ping | Round-trip time (microseconds, divide by 1000 for ms) | > 100ms |
| Channels | Total active net channels (actor channels + control) | > 1000 |
| In Rate / Out Rate | Bytes received/sent per second | Out > bandwidth budget |
| In Packets / Out Packets | Packets per second | High count = fragmentation risk |
| In Bunches / Out Bunches | Bunches (logical groups) per second | High = many small updates |
| In Loss / Out Loss | Packet loss percentage | > 1% |
| Saturated | 0.0-1.0, bandwidth saturation ratio | = 1.0 means over budget |
| Voice bytes/packets | Voice chat traffic | Unusual spikes |

### Additional Stat Groups
```
stat game                   // Server tick time, including replication overhead
stat NetActor               // Per-actor replication timing and cost
stat serverstat             // Server-specific performance counters
```

### Server Timing Stats (CPU profiling)
```
// Key server-side timing counters (visible in Unreal Insights CPU trace):
NetBroadcastTickTime        // Total time spent in replication broadcast per frame
NetBroadcastTick.GatherActors  // Time gathering actors to replicate
NetBroadcastTick.ReplicateActors // Time serializing & sending actor data
NetTickTime                 // Total networking tick time
```

---

## 3. Network Profiler (Legacy, Still Useful)

### Recording

**Command-line (auto-record from start):**
```bash
# Editor
UnrealEditor.exe MyProject.uproject -game networkprofiler=true

# Dedicated server
UnrealEditor.exe MyProject.uproject MapName -server -log networkprofiler=true
```

**Console commands (runtime toggle):**
```
netprofile              // Toggle recording on/off (type once to start, again to stop)
```

**Output location:**
```
<Project>/Saved/Profiling/<ProjectName>-<Timestamp>.nprof
```
While recording, a temp file `NetworkProfiling.tmp` exists in the same folder.

### Opening the Profiler
```
<UE Install>/Engine/Binaries/DotNET/NetworkProfiler.exe
```
Click "Open File" and select the `.nprof` file.

### What It Shows

**Summary View:**
- Total bytes sent/received over session
- Outgoing bandwidth vs Game socket send size (outgoing includes IP+UDP header approximation)
- Top bandwidth consumers by actor class

**Frame View (single frame):**
- List of actor types replicated that frame, sorted by CPU time
- Expanding tree shows each replicated **property** with its byte cost
- RPC calls and their byte cost

**Filters:**
- Filter by actor class, RPC name, or property name
- Time range selection for focused analysis
- Choose display: raw count, count/sec, bytes, bytes/sec

### Key Analysis Workflow
1. Record a gameplay session (2-5 min of representative gameplay)
2. Open in NetworkProfiler.exe
3. Sort by bytes/sec to find top bandwidth consumers
4. Drill into top actors to see per-property and per-RPC costs
5. Look for: replicated arrays (switch to FFastArraySerializer), high-frequency properties (add conditions), unnecessary RPCs

### Prerequisites
- Engine must be compiled with `STATS` macro defined (non-zero)
- Editor builds and Debug builds have this; Shipping builds do NOT
- `net.AllowProfiler=1` CVar may be needed

---

## 4. Unreal Insights — Network Trace

The modern, recommended approach for deep network analysis.

### Enabling Network Trace

**Command-line arguments (ALL are needed):**
```bash
# Minimum required:
-NetTrace=1 -trace=net

# Full recommended setup:
-NetTrace=1 -trace=net,cpu,frame,bookmark -tracehost=localhost

# Higher verbosity (more packet detail):
-NetTrace=3 -trace=net,cpu,frame -tracehost=localhost

# Save to file instead of live connection:
-NetTrace=1 -trace=net -tracefile=MyNetTrace
```

**IMPORTANT:** `-trace=net` alone is NOT enough. You MUST also specify `-NetTrace=1` (or higher).

**Trace output options:**
| Argument | Description |
|----------|-------------|
| `-tracehost=<IP>` | Send trace to Unreal Insights running at IP (default port 1980) |
| `-tracefile=<Name>` | Save .utrace to `Saved/Profiling/` |
| `-NetTrace=<N>` | Verbosity: 1=basic, 2=detailed, 3=full packet content |

### Launching Unreal Insights
```bash
# macOS
open "<UE_ROOT>/Engine/Binaries/Mac/UnrealInsights.app"

# Windows
"<UE_ROOT>\Engine\Binaries\Win64\UnrealInsights.exe"

# Linux
"<UE_ROOT>/Engine/Binaries/Linux/UnrealInsights"
```

Start Insights BEFORE launching the game when using `-tracehost=localhost`.

### Runtime Trace Control (Console Commands)
```
Trace.Start cpu,gpu,net,frame,log  // Start recording trace at runtime (combine channels)
Trace.Stop                         // Stop tracing
Trace.File MyFile.utrace cpu,net   // Start file-based trace with specific channels
Trace.Send 127.0.0.1 cpu,net      // Send trace to remote Insights instance
Trace.SnapshotFile MySnapshot      // Snapshot current buffer to file (non-interrupting)
Trace.Bookmark MyEvent             // Emit bookmark event (vertical line in Insights)
```

### Programmatic Trace Control (C++)
```cpp
#include "ProfilingDebugging/TraceAuxiliary.h"

// Start trace
FTraceAuxiliary::Start(
    FTraceAuxiliary::EConnectionType::Network,
    TEXT("localhost"),           // or file path
    nullptr,                    // log category
    TEXT("net,cpu,frame")       // channels
);

// Stop trace
FTraceAuxiliary::Stop();

// Toggle specific channel
Trace::ToggleChannel(TEXT("Net"), true);

// Emit bookmarks for marking events in traces
TRACE_BOOKMARK(TEXT("BossSpawned"));
```

### What Network Insights Shows

**Networking Tab Panels:**
- **Packet Overview** — Timeline of all packets sent/received, size per packet
- **Packet Content** — Drill into individual packets to see: actor updates, property changes, RPCs, bunch data
- **Connection List** — All active connections with per-connection stats
- **Net Stats** — Aggregated statistics over time

**Key Metrics:**
- Bytes per packet, packets per frame
- Per-actor replication cost within each packet
- RPC invocations with parameter sizes
- Bunch overhead and fragmentation

**Tips:**
- Client-side traces show MORE detail about packet contents than server-side
- Greyed-out Networking tab = no network data in trace (check both `-NetTrace=1` AND `-trace=net`)
- UE 5.3+ Insights is more stable for network traces than earlier versions

### Recommended Capture Workflow
1. Launch Unreal Insights application
2. Launch game/PIE with: `-NetTrace=1 -trace=net,cpu,frame -tracehost=localhost`
3. Play representative gameplay for 2-5 minutes
4. Stop the game (trace auto-saves)
5. Open the session in Insights
6. Navigate to Networking tab
7. Zoom into frames with high bandwidth
8. Drill into packets to find costly actors/properties

---

## 5. Network Emulation (Simulating Bad Conditions)

### Console Commands
```
net PktLag=100              // One-way latency in ms (100ms = ~200ms RTT)
net PktLagVariance=20       // Jitter: +/- 20ms
net PktLoss=5               // 5% packet loss
net PktDup=2                // 2% packet duplication
net PktOrder=1              // Enable packet reordering

// Reset all
net PktLag=0
net PktLoss=0
net PktDup=0
net PktOrder=0
net PktLagVariance=0

// Recommended test profiles:
// Good broadband:   net PktLag=25  PktLagVariance=5  PktLoss=0.5
// Average WiFi:     net PktLag=50  PktLagVariance=15 PktLoss=1
// Bad mobile:       net PktLag=100 PktLagVariance=30 PktLoss=3
// Stress test:      net PktLag=150 PktLagVariance=50 PktLoss=5 PktDup=3 PktOrder=1
```

### DefaultEngine.ini Network Emulation
```ini
[PacketSimulationSettings]
PktLag=50
PktLagVariance=10
PktLoss=1
PktIncomingLoss=0
PktDup=0
PktOrder=0
PktIncomingLagMin=0
PktIncomingLagMax=0
```

### Additional Emulation CVars
```
net PktLossBurst=5                  // Burst packet loss (consecutive drops)
net PktIncomingLoss=3               // Incoming-only packet loss percentage
netEmulation.PktBufferBloatInMS=400 // (UE 5.7+) Simulate outgoing congestion/buffer bloat
```

### Bandwidth Throttling
```ini
[/Script/Engine.Player]
ConfiguredInternetSpeed=10000   ; Bytes/sec cap for internet connections
ConfiguredLanSpeed=20000        ; Bytes/sec cap for LAN connections
```

---

## 6. Replication Debug Commands

### Visual Debugging
```
ShowDebug Net                       // Show net-relevant actors in viewport
net.DrawDebugReplicationInfo=1      // Draw replication info on actors
net.ShowNetRole=1                   // Show net role labels on actors
p.NetShowCorrections 1              // Show movement corrections (red = correction)
p.NetCorrectionLifetime 5           // How long correction markers stay visible (seconds)
```

### Actor Channel Info
```
net.ListActorChannelInfo            // List all actor channels and their state
```

### Replication Graph Debug Commands
```
Net.RepGraph.PrintGraph                     // Print graph hierarchy to log
Net.RepGraph.DrawGraph                      // Draw graph on HUD
Net.RepGraph.PrintAllActorInfo <substring>  // Print info for actors matching name
Net.RepGraph.PrioritizedLists.Print         // Print prioritized replication list to log
Net.RepGraph.PrioritizedLists.Draw          // Draw prioritized list on HUD
Net.RepGraph.Lists.DisplayDebug             // Show RepActorList stats on HUD
Net.RepGraph.Lists.Stats                    // Print RepActorList stats to log
Net.RepGraph.Lists.Details                  // Print extended RepActorList details to log
```

### Movement Debugging
```
log LogNetPlayerMovement verbose    // Verbose movement replication logs
p.NetShowCorrections 1             // Visualize server corrections
p.NetCorrectionLifetime 5          // Duration of correction visualization
```

---

## 7. Key CVars for Network Tuning

### Bandwidth & Update Frequency
```
net.MaxRatePerNetUpdate=0                   // Max bytes per actor net update (0=unlimited)
net.UseAdaptiveNetUpdateFrequency=1         // Enable adaptive frequency (uses Min/Max range)
net.MaxNetUpdateFrequency=0                 // Global cap on update frequency (0=no cap)
```

### Push Model (CPU Optimization)
```ini
; DefaultEngine.ini [SystemSettings]
net.IsPushModelEnabled=1                    ; Enable push model globally
net.PushModelSkipUndirtiedReplication=1     ; Skip actors with no dirty properties (UE 5.3+)
```

**Server.Target.cs:**
```csharp
bWithPushModel = true;
```

**Build.cs dependency:**
```csharp
PrivateDependencyModuleNames.Add("NetCore");
```

**Code pattern:**
```cpp
void AMyActor::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const
{
    Super::GetLifetimeReplicatedProps(OutLifetimeProps);

    FDoRepLifetimeParams Params;
    Params.bIsPushBased = true;
    DOREPLIFETIME_WITH_PARAMS_FAST(ThisClass, MyProperty, Params);
}

void AMyActor::SetMyProperty(int32 NewValue)
{
    MyProperty = NewValue;
    MARK_PROPERTY_DIRTY_FROM_NAME(ThisClass, MyProperty, this);
}
```

**Performance impact:** NetBroadcastTickTime reduced 50%+ in benchmarks (167ms -> 76ms with 976 actors).

### Reliable Buffer
```
net.MaxReliableBufferSize=512               // Increase reliable buffer (default 256, temporary fix)
```

### Dormancy
```
net.DormancyEnable=1                        // Enable/disable dormancy system
LogNetDormancy verbose                      // Log dormancy state changes
```

### Miscellaneous Network CVars
```
n.IpNetDriverMaxFrameTimeBeforeAlert=1      // Seconds before networking alert
n.IpNetDriverMaxFrameTimeBeforeLogging=10   // Seconds before networking warning log
n.VerifyPeer=1                              // Peer verification toggle
net.MaxNetStringSize=2048                   // Max replicated string size
net.MaxConstructedPartialBunchSizeBytes=65536 // Max partial bunch size
```

### Iris Replication System (UE 5.4+)
```ini
; DefaultEngine.ini [SystemSettings]
net.SubObjects.DefaultUseSubObjectReplicationList=1
net.IsPushModelEnabled=1
net.Iris.UseIrisReplication=1
net.Iris.PushModelMode=1
```

**Build.cs:**
```csharp
SetupIrisSupport(Target);
```

**Iris performance (100-player benchmark):**
| Metric | Legacy | Iris | Improvement |
|--------|--------|------|-------------|
| Net Tick Time | 13.3ms | 10.2ms | 23% |
| NetBroadcastTickTime | 66.2ms | 29.5ms* | 55% |
| Frame Time | 83.9ms | 45.5ms* | 46% |
*With patches applied

**Iris version status:**
- UE 5.1-5.3: Experimental
- UE 5.4-5.6: Experimental with improvements
- UE 5.7: Promoted to **Beta**

**UE 5.7 Iris optimizations:**
- Parallel polling: `bAllowParallelTasks=true` in `ReplicationSystemConfig`
- Cache-line-sized chunk processing in `FObjectPoller`
- Polling only processes dirty objects/properties
- New emulation: `netEmulation.PktBufferBloatInMS`

Note: ReplicationGraph is considered deprecated in favor of Iris but still functional.

---

## 8. Logging Categories

```
// Enable verbose logging per category:
Log LogNet Verbose              // Channel/connection/control messages
Log LogNetTraffic Verbose       // Bandwidth breakdown
Log LogRep Verbose              // Replication details
Log LogNetDormancy Verbose      // Dormancy state changes
Log LogNetSerialization Verbose // Serialization details
Log LogNetPlayerMovement Verbose // Movement replication
Log LogNetFastTArray Verbose    // FastArray delta serialization
Log LogNetPackageMap Verbose    // Package map (asset references)
Log LogSockets Verbose          // Socket-level operations

// Common error patterns to grep for:
"No owning connection"          // Ownership chain broken
"Stably named object"           // Actor reference can't be resolved on client
"Reliable buffer overflow"      // Too many reliable RPCs
"NaN"                           // Physics/movement corruption
"Server rejected"               // RPC validation failure
"Saturated"                     // Bandwidth exceeded
```

---

## 9. Network Replay System

Record and replay network sessions for debugging:
```
demorec MyReplay                // Start recording
demostop                        // Stop recording
demoplay MyReplay               // Playback recording
```

Files saved to `<Project>/Saved/Demos/`. Useful for reproducing intermittent network bugs — replay from any player's perspective.

---

## 10. Profiling Workflow Cheat Sheet

### Quick Health Check (1 minute)
1. Run PIE with 2+ clients + dedicated server
2. `stat net` — check ping, loss, saturation
3. `stat nettraffic` — identify top bandwidth actors

### Bandwidth Investigation (15 minutes)
1. Add `networkprofiler=true` to launch args or run `netprofile` in console
2. Play 2-5 min of representative gameplay
3. Stop recording (`netprofile` or end session)
4. Open `.nprof` in NetworkProfiler.exe
5. Sort by bytes/sec → drill into top actors → check per-property costs
6. Action items: add COND_, switch arrays to FFastArraySerializer, lower NetUpdateFrequency, enable dormancy

### Deep Packet Analysis (30 minutes)
1. Launch Unreal Insights
2. Launch PIE with: `-NetTrace=1 -trace=net,cpu,frame -tracehost=localhost`
3. Play 2-5 min
4. Open session in Insights → Networking tab
5. Find frames with bandwidth spikes
6. Drill into packets → identify exact actors/properties/RPCs causing spikes
7. Cross-reference with CPU trace for server replication timing

### Server CPU Bottleneck
1. Launch server with `-trace=cpu,frame,net -tracehost=localhost`
2. Open in Insights → Timing Insights
3. Search for `NetBroadcastTick` in CPU trace
4. If > 5ms/frame: enable Push Model, reduce NetUpdateFrequency, add dormancy, consider Network Managers or Iris

### Stress Testing
1. Set up automated bots or multiple PIE clients (8+)
2. Apply network emulation: `net PktLag=100 PktLagVariance=30 PktLoss=2`
3. Monitor `stat net` for saturation
4. Record with Insights for post-analysis
5. Profile both client AND server separately

---

## 11. Bandwidth Budget Guidelines

| Game Type | Per-Client Budget | Notes |
|-----------|------------------|-------|
| Competitive FPS (< 16 players) | 10-20 KB/s | Low latency critical |
| Battle Royale (100 players) | 5-10 KB/s | Heavy relevancy filtering |
| Co-op PvE (4 players) | 20-50 KB/s | More relaxed |
| MMO-style (many players) | 3-8 KB/s | Aggressive LOD needed |

### Per-Actor Budget Rules of Thumb
- Player character: ~200-500 bytes/update at 30Hz = 6-15 KB/s
- AI character: ~100-300 bytes/update at 10Hz = 1-3 KB/s
- Projectile: ~50-100 bytes/update at 30Hz = 1.5-3 KB/s
- Static actor (dormant): 0 bytes until state change
- Game state: ~50-200 bytes/update at 5Hz = 0.25-1 KB/s

---

## 12. Optimization Decision Tree

```
Is NetBroadcastTickTime too high? (> 5ms)
├── Yes → Enable Push Model (net.IsPushModelEnabled=1)
│   ├── Still high? → Add dormancy to static/infrequent actors
│   │   ├── Still high? → Reduce NetUpdateFrequency on non-critical actors
│   │   │   ├── Still high? → Implement Network Managers (aggregate into FFastArraySerializer)
│   │   │   │   └── Still high? → Enable Iris (UE 5.4+) or custom ReplicationGraph
│   │   │   └── OK
│   │   └── OK
│   └── OK
└── No → Check bandwidth (stat net → Saturated)
    ├── Saturated → Reduce per-actor data:
    │   ├── Add replication conditions (COND_OwnerOnly, COND_SkipOwner)
    │   ├── Quantize vectors (FVector_NetQuantize)
    │   ├── Use FFastArraySerializer for arrays
    │   ├── Use smallest integer types (uint8 > int32)
    │   └── Reduce NetUpdateFrequency
    └── Not saturated → Check client-side:
        ├── Packet loss? → Test with net emulation, check ISP
        └── Desync? → See debugging.md workflows
```
