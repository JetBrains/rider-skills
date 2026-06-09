# Network Debugging Techniques

## PIE Multiplayer Testing

### Setup
```
Editor → Play → Advanced Settings:
  Number of Players: 2-4
  Net Mode: Play As Listen Server (or Play As Client with Dedicated Server)

Recommended: "Play As Client" + check "Run Dedicated Server"
This catches bugs that only appear with a true dedicated server.
```

### Console Commands for Network Simulation
```
// Simulate bad network conditions
net PktLag=100          // Add 100ms latency (one-way)
net PktLagVariance=20   // +/- 20ms jitter
net PktLoss=5           // 5% packet loss
net PktDup=2            // 2% packet duplication
net PktOrder=1          // Enable packet reordering

// Reset
net PktLag=0
net PktLoss=0

// Useful combo for testing at 100ms ping:
net PktLag=50 PktLagVariance=10 PktLoss=1
```

### Network Profiling
```
// Show network stats overlay
stat net              // Basic net stats
stat nettraffic       // Bandwidth breakdown by actor class

// Detailed network profiling
net.AllowProfiler=1  // Enable network profiler
// Then use: Window → Developer Tools → Network Profiler
```

> **For comprehensive profiling guidance** — see `knowledge/network-profiling.md` which covers:
> Unreal Insights network trace, Network Profiler (.nprof), Push Model, Iris, bandwidth budgets,
> optimization decision trees, and step-by-step profiling workflows.

## Log Categories

### Important Network Logs
```
// Enable verbose logging
Log LogNet Verbose
Log LogNetTraffic Verbose
Log LogRep Verbose          // Replication details
Log LogNetDormancy Verbose  // Dormancy state changes
Log LogNetSerialization Verbose

// Common error patterns to search for:
"No owning connection"       // Ownership chain broken
"Stably named object"        // Actor reference can't be resolved
"Reliable buffer overflow"   // Too many reliable RPCs
"NaN"                        // Physics/movement corruption
"Server rejected"            // RPC validation failure
```

### Custom Network Logging
```cpp
// Add to your classes for debugging
UE_LOG(LogNet, Warning, TEXT("[%s] %s: Health changed to %.1f"),
    HasAuthority() ? TEXT("SERVER") : TEXT("CLIENT"),
    *GetName(), Health);
```

## Network Visualizer

### Console Commands
```
// Show net-relevant actors
ShowDebug Net

// Show replication info on actors
net.DrawDebugReplicationInfo=1

// Show network role on all actors
net.ShowNetRole=1
```

## Common Debugging Workflows

### "Property Not Replicating"
1. Check `bReplicates = true` in constructor
2. Check `DOREPLIFETIME()` in `GetLifetimeReplicatedProps()`
3. Check `#include "Net/UnrealNetwork.h"` in .cpp
4. Check replication condition isn't filtering out the target client
5. Check actor is relevant to the target client (distance, `bAlwaysRelevant`)
6. Check dormancy — actor might be dormant; call `FlushNetDormancy()`
7. Add log in OnRep to confirm server is sending updates
8. Check `NetUpdateFrequency` — might be too low for rapid changes; try `ForceNetUpdate()`

### "RPC Not Firing"
1. Confirm the RPC is called from the correct side:
   - `Server` → must be called from owning client
   - `Client` → must be called from server
   - `NetMulticast` → must be called from server
2. Check ownership chain: Actor → Owner → ... → PlayerController → NetConnection
3. Check `HasAuthority()` / `IsLocallyControlled()` at call site
4. Add log before and in `_Implementation` to trace flow
5. Check if actor is replicated (`bReplicates`)
6. For Server RPCs: check `_Validate` isn't returning false

### "Client Desync"
1. Log the value on both server and client every second:
   ```cpp
   if (GEngine && GFrameCounter % 60 == 0)
       GEngine->AddOnScreenDebugMessage(-1, 1.f,
           HasAuthority() ? FColor::Green : FColor::Yellow,
           FString::Printf(TEXT("Health: %.1f"), Health));
   ```
2. Check if client is modifying the value directly
3. Check for non-deterministic prediction
4. Check OnRep is applying the value correctly
5. Look for race conditions (client reads before server replicates)

### "Bandwidth Too High"
1. Run `stat nettraffic` to identify top bandwidth consumers
2. Check for replicated arrays — switch to `FFastArraySerializer`
3. Check `NetUpdateFrequency` — lower for non-critical actors
4. Add replication conditions (`COND_OwnerOnly`, etc.)
5. Check for redundant replicated properties (derive instead)
6. Enable dormancy for static/infrequent actors
7. Quantize vectors and rotators

### "Reliable Buffer Overflow"
1. Search code for `Reliable` RPCs called in Tick or timers
2. Switch frequent RPCs to `Unreliable`
3. Reduce the frequency of reliable RPCs
4. Check for infinite loops causing RPC spam
5. Increase buffer size (temporary fix): `net.MaxReliableBufferSize=512`

## Network Replay

UE supports recording and replaying network sessions:
```
// Start recording
demorec MyReplay

// Stop recording
demostop

// Play recording
demoplay MyReplay
```

Useful for reproducing intermittent networking bugs — record a session, replay to see what happened from any player's perspective.

## Useful Editor Settings

```
[/Script/Engine.GameEngine]
; In DefaultEngine.ini — enable network emulation in shipping builds
bSmoothFrameRate=true

; For testing with latency
[/Script/Engine.Player]
ConfiguredInternetSpeed=10000  ; Simulated bandwidth cap (bytes/sec)
ConfiguredLanSpeed=20000
```
