# Subsystem Architecture

## Overview
Subsystems are Unreal's official mechanism for modularizing features without overriding engine classes. The engine manages their lifecycle automatically.

## Subsystem Types

| Type | Lifetime | Use For |
|------|----------|---------|
| `UEngineSubsystem` | Engine lifetime | Engine-wide utilities, global services |
| `UEditorSubsystem` | Editor lifetime | Editor tools and automation |
| `UGameInstanceSubsystem` | Game instance (persists across levels) | Save systems, analytics, session management, online services |
| `UWorldSubsystem` | World lifetime (one per UWorld) | Team management, spawning, level-specific features |
| `ULocalPlayerSubsystem` | Local player lifetime | Per-player UI state, input preferences |

## When to Use Subsystems

**Good fit**:
- Cross-cutting services that don't belong to any single actor
- Features that need a guaranteed single instance per scope
- Replacing manual singletons with automatic lifecycle
- Services accessed by many systems (team queries, message routing)

**Bad fit**:
- Replicated/networked state (subsystems are local singletons — use replicated Actors)
- Need multiple instances per scope
- Blueprint subclassing required (subsystems are C++-only)
- Per-actor state (use components instead)

## Lyra's Subsystem Usage

| Subsystem | Type | Purpose |
|-----------|------|---------|
| `ULyraTeamSubsystem` | WorldSubsystem | Team registration, comparison, friendly-fire rules |
| `ULyraGlobalAbilitySystem` | WorldSubsystem | Global abilities/effects applied to all ASCs |
| `ULyraSignificanceManager` | WorldSubsystem | Actor significance for LOD/streaming |
| `UGameplayMessageSubsystem` | GameInstanceSubsystem | Cross-system event messaging |
| `UCommonUserSubsystem` | GameInstanceSubsystem | User initialization state tracking |
| `UCommonSessionSubsystem` | GameInstanceSubsystem | Session/matchmaking management |
| `UGameUIManagerSubsystem` | WorldSubsystem | UI layout management |
| `UPocketLevelSubsystem` | WorldSubsystem | Isolated sub-world management |
| `UGameFrameworkComponentManager` | GameInstanceSubsystem | Runtime component injection |

## Advantages Over Manual Singletons
- **Automatic lifecycle**: No manual Create/Destroy
- **Explicit scope**: You know exactly when they exist
- **No PIE issues**: Unlike raw singletons that persist between editor sessions
- **No CDO interference**: Clean per-instance state
- **Discoverable**: Can iterate all subsystems of a type

## Best Practices
- Avoid direct references between subsystems — use event dispatchers or interfaces
- Don't implement `Tick()` unless genuinely needed
- Use `Get()` static helper for type-safe access: `UMySubsystem::Get(WorldContextObject)`
- Keep subsystems focused on one service/concern
- Use GameInstanceSubsystem for anything that must persist across level transitions
- Use WorldSubsystem for anything scoped to a specific level/world

## Anti-Patterns
- Using subsystems for per-actor state (use components)
- Putting tick-heavy logic in subsystems (use actors with tick management)
- Creating subsystems with circular dependencies
- Assuming subsystem exists before world/game instance is initialized

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_execute_python` | Query a subsystem's state at runtime | `unreal.get_engine_subsystem(unreal.MySubsystem).some_method()` to inspect live service state |
| `ue_play` | Exercise subsystem lifecycle | Start/stop PIE to verify `Initialize`/`Deinitialize` and `OnWorldBeginPlay` fire in the correct order |
| `search_symbol` | Find all subsystem `Get()` calls | Audit which systems are accessing a subsystem to detect premature calls before initialization |
| `analyze_calls` | Map subsystem consumers | `INCOMING_CALLS` on a subsystem `Get()` method to see every call site that could be affected by a lifecycle change |
