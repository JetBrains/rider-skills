---
name: ue:networking
description: "Use when user asks about replication, RPCs, net relevancy, prediction, network authority, property replication conditions, multiplayer movement, dedicated/listen servers, debugging replication issues, network profiling, bandwidth analysis, push model replication, Iris replication, or network optimization. DO NOT TRIGGER for single-player-only code (use ue:coder), general architecture without networking focus (use ue:architect), or editor automation (use ue:editor)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[networking task or question]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions (replication, RPCs, push model, network prediction, Iris replication graph), fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Networking Agent — Specialized Subagent

Spawn a focused subagent for Unreal Engine multiplayer networking tasks: replication setup, RPC implementation, prediction, relevancy, authority patterns, and debugging network issues.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — dedicated vs listen server, replication scope, prediction requirements
2. **Pre-flight** — check existing replication setup, network mode, existing RPCs
3. **Implement** — replicated properties, RPCs, authority checks, replication conditions
4. **Build** — compile via `ue:builder`; fix any C++ errors before proceeding
5. **Verify** — test with simulated client/server; check replication in network profiler
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL — Mistakes That Waste Hours

These rules prevent the most common and time-consuming multiplayer bugs.

### 1. Authority Check BEFORE State Changes
- **WRONG**: Modifying replicated state on clients — causes desync, rubber-banding, or ignored changes
- **CORRECT**: Always check `HasAuthority()` or `GetLocalRole() == ROLE_Authority` before modifying replicated state
- Server is the single source of truth — clients REQUEST changes via RPCs, never make them directly
- Exception: predicted movement (CharacterMovementComponent handles this internally)

### 2. UPROPERTY(Replicated) Requires GetLifetimeReplicatedProps
- Adding `Replicated` to UPROPERTY is NOT enough — it does nothing without the registration
- You MUST add `DOREPLIFETIME(ClassName, PropertyName)` in `GetLifetimeReplicatedProps()`
- Missing registration = property never replicates = silent bug on clients
- Symptoms: server state correct, client state stuck at default

### 3. RepNotify Fires on Client ONLY (by default)
- `ReplicatedUsing=OnRep_Foo` calls `OnRep_Foo()` on **clients** when the value changes
- It does NOT fire on the server — server must apply effects directly
- **Common bug**: Putting initialization logic only in OnRep → server never runs it
- **Pattern**: Extract shared logic into a helper, call from both `SetFoo()` (server) and `OnRep_Foo()` (client)

### 4. RPC Validation: Server MUST Validate Client Input
- `Server` RPCs come from potentially malicious clients
- **NEVER** trust client-sent values: positions, damage amounts, item IDs
- Always validate: range checks, ownership verification, cooldown enforcement
- Use `WithValidation` for critical RPCs: `UFUNCTION(Server, Reliable, WithValidation)`
- `_Validate` returning false disconnects the client — use for anti-cheat

### 5. Reliable vs Unreliable RPCs
- **Reliable**: Guaranteed delivery, ordered, queued — use for important game events (damage, ability activation, chat)
- **Unreliable**: May be dropped, not queued — use for cosmetic/frequent updates (VFX triggers, voice chat)
- **NEVER** send Reliable RPCs every tick — this saturates the reliable buffer and causes disconnects
- Rule of thumb: if it happens > 10x/second, it MUST be Unreliable or use property replication instead

### 6. NetMulticast RPCs Are NOT Reliable by Default
- `NetMulticast` RPCs skip clients outside relevancy range
- They don't replay for clients who join mid-game
- For persistent state, use replicated properties (they catch up new clients automatically)
- **WRONG**: Using Multicast to set health → late-joining clients see default health
- **CORRECT**: Replicate health as a property, use Multicast only for the cosmetic hit reaction

### 7. Constructor Setup for Replication
- `bReplicates = true` in constructor — without this, NOTHING replicates
- `bAlwaysRelevant = true` for actors that all clients need (game state, managers)
- `bReplicateMovement = true` for actors that move
- `SetReplicatingMovement(true)` for pawns
- `NetUpdateFrequency` — default 100Hz is wasteful; 10-30Hz is typical for most actors

### 8. Component Replication Is Separate
- `SetIsReplicatedByDefault(true)` in component constructor
- Or `SetIsReplicated(true)` at runtime
- Components don't automatically replicate just because the owner does
- Subobject registration: `DOREPLIFETIME(UMyComponent, MyProperty)`

### 9. Actor Ownership Chain
- RPCs route through the ownership chain: Actor → Owner → ... → PlayerController → Connection
- If an actor has no owner path to a connection, Server RPCs from clients won't reach it
- `SetOwner()` is critical for abilities, weapons, inventory items
- **Symptom**: "No owning connection" warnings in log, client RPCs silently failing

### 10. Replication Conditions Save Bandwidth
- `DOREPLIFETIME_CONDITION(ClassName, Prop, COND_OwnerOnly)` — only to owning client
- `COND_SkipOwner` — everyone except owner (useful for third-person cosmetics)
- `COND_InitialOnly` — send once, never update (team, class, cosmetic loadout)
- `COND_Custom` — fully custom via `PreReplication()` (most flexible but most complex)
- Default `COND_None` sends to all relevant clients on every change

## Clarify Before Delegating (if ambiguous)

Before spawning the subagent, ask **one question at a time** if the answers would change the implementation architecture. Stop as soon as you have enough.

**The most load-bearing questions for any networking task:**

- **"Dedicated server, listen server, or peer-to-peer?"** — dedicated server is the hardest mode (no server-side pawn, controller-less authority path); listen server has a hosting player; P2P is unusual in UE. This single answer shapes authority patterns, RPC targets, and who "owns" game state.

- **"Is movement prediction needed, or just state replication?"** — prediction requires `UCharacterMovementComponent` hooks or a custom `FSavedMove`; pure state replication is much simpler. Mixing them incorrectly causes rubber-banding.

- **"Does GAS handle any of this, or is it custom replication?"** — GAS has its own replication pipeline (ability activation prediction, GameplayEffect replication, cue events). Mixing custom RPCs with GAS events on the same state causes conflicts.

Skip this step if: the user's request already answers these (e.g., "dedicated server multiplayer shooter"), or the codebase shows it clearly (grep for `NetMode`, `IsDedicatedServer`).

## When to Delegate

- **Replication setup** — making actors, components, or properties replicate correctly
- **RPC implementation** — Server/Client/Multicast RPCs with validation
- **Movement replication** — CharacterMovementComponent networking, custom movement modes
- **Prediction & reconciliation** — client-side prediction, server correction, smoothing
- **Relevancy & priority** — net relevancy overrides, priority optimization, dormancy
- **Dedicated/listen server architecture** — game mode authority, seamless travel, sessions
- **Network debugging** — desync investigation, bandwidth profiling, packet loss simulation
- **Network profiling** — Unreal Insights network trace, Network Profiler, stat commands, bandwidth analysis
- **Network optimization** — Push Model, dormancy, Network Managers, Iris replication, bandwidth budgets
- **Replication graph** — custom replication drivers, spatial grid optimization
- **Online subsystem integration** — sessions, matchmaking, lobby management
- **Network testing** — PIE multiplayer setup, simulated latency/packet loss

## When NOT to Delegate

- **Single-player code** — use **ue:coder**
- **GAS-specific replication** — use **ue:gas** (handles ability prediction internally)
- **High-level architecture** — use **ue:architect** (unless specifically about network topology)
- **Editor automation** — use **ue:editor** or **ue:task**
- **Building** — use **ue:builder**

## How to Spawn

Use the **Agent** tool with `subagent_type: "general-purpose"`.

### Prompt Template

```
You are a senior Unreal Engine networking engineer with deep experience in multiplayer replication (Fortnite-scale knowledge, Lyra patterns). Provide actionable networking guidance.

**Task:** [describe the networking task or issue]

**Context:** [dedicated server vs listen server, player count, existing movement setup, relevant actors]

**Knowledge base — read these files based on the topic:**

| Topic | File |
|-------|------|
| Replication fundamentals | ~/.claude/skills/ue:networking/knowledge/replication.md |
| Replication patterns (RepGraph, FastArray, Iris) | ~/.claude/skills/ue:networking/knowledge/replication-patterns.md |
| RPC patterns & validation | ~/.claude/skills/ue:networking/knowledge/rpcs.md |
| Prediction & reconciliation | ~/.claude/skills/ue:networking/knowledge/prediction.md |
| Relevancy, priority & dormancy | ~/.claude/skills/ue:networking/knowledge/relevancy.md |
| Network profiling & optimization | ~/.claude/skills/ue:networking/knowledge/network-profiling.md |
| Common networking pitfalls | ~/.claude/skills/ue:networking/knowledge/pitfalls.md |
| Network debugging techniques | ~/.claude/skills/ue:networking/knowledge/debugging.md |
| GAS-specific networking | ~/.claude/skills/ue:networking/knowledge/gas-networking.md |
| Game networking fundamentals | ~/.claude/skills/ue:networking/knowledge/game-networking-fundamentals.md |

**Instructions:**
1. Read the relevant knowledge files for the topic
2. Check for common pitfalls in pitfalls.md
3. Provide code that follows authoritative server patterns
4. Include validation for any Server RPCs
5. Note bandwidth implications of design choices

**Response format:**
1. **Approach** — The networking pattern and why it's correct
2. **Implementation** — Code with replication setup, RPCs, OnRep handlers
3. **Testing** — How to verify in PIE (multiple clients + dedicated server)
4. **Pitfalls** — What can go wrong and how to avoid it
```

## Knowledge Files

| Topic | File |
|-------|------|
| Replication fundamentals | knowledge/replication.md |
| Replication patterns (RepGraph, FastArray, Iris) | knowledge/replication-patterns.md |
| RPC patterns & validation | knowledge/rpcs.md |
| Prediction & reconciliation | knowledge/prediction.md |
| Relevancy, priority & dormancy | knowledge/relevancy.md |
| **Network profiling & optimization** | **knowledge/network-profiling.md** |
| Common networking pitfalls | knowledge/pitfalls.md |
| Network debugging techniques | knowledge/debugging.md |
| GAS-specific networking | knowledge/gas-networking.md |
| Game networking fundamentals | knowledge/game-networking-fundamentals.md |
