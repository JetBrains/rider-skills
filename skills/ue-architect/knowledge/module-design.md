# Module and Plugin Architecture

## Module Organization Principles

### Module Types
| Type | Purpose | Example |
|------|---------|---------|
| Runtime | Game client + server code | LyraGame |
| Editor | Editor-only tools, validators | LyraEditor |
| Developer | Tools and standalone programs | Build tools |
| ThirdParty | External library wrappers | Third-party SDKs |

### Folder Structure Convention
```
Source/
  MyGame/                    # Runtime module
    Public/                  # Headers exposed to dependents
      Character/
      AbilitySystem/
      GameModes/
    Private/                 # Implementation (hidden from dependents)
      Character/
      AbilitySystem/
      GameModes/
    MyGame.Build.cs
  MyEditor/                  # Editor-only module
    Public/
    Private/
    MyEditor.Build.cs
```

Headers in `Private/` are invisible to other modules — true encapsulation.

### Build.cs Dependency Management
```cpp
// PublicDependencyModuleNames — propagated to dependents (use sparingly)
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine", "GameplayTags"
});

// PrivateDependencyModuleNames — NOT propagated (prefer this)
PrivateDependencyModuleNames.AddRange(new string[] {
    "EnhancedInput", "CommonUI", "UIExtension"
});
```

**Rule**: Prefer `PrivateDependencyModuleNames` wherever possible. Only use `PublicDependencyModuleNames` when your public headers expose types from that module.

### Reducing Compile-Time Coupling
- Forward-declare types in public headers instead of including headers
- Convert public dependencies to private by forward-declaring in headers, including in .cpp files
- Split monolithic modules — only changed modules recompile
- Use `bUseUBTMakefiles` for cached target data in iterative builds

---

## Plugin Architecture

### Plugin Categories

**Utility Plugins** (reusable across projects):
| Plugin | Purpose |
|--------|---------|
| ModularGameplayActors | Base classes for modular actor architecture |
| CommonGame | Game framework utilities |
| CommonUser | User/session management |
| GameplayMessageRouter | Decoupled gameplay event messaging |
| UIExtension | UI extension point system |
| AsyncMixin | Async task patterns |
| PocketWorlds | Isolated sub-world system |
| GameSettings | Settings management framework |

**GameFeature Plugins** (content + mechanics, runtime-activated):
| Plugin | Purpose |
|--------|---------|
| ShooterCore | Shooter mechanics, aim assist, accolades |
| ShooterMaps | Shooter map content |
| TopDownArena | Top-down game mode variant |

### Plugin Best Practices
1. **One module per plugin** unless editor-specific code is needed (then add a second module)
2. **Clear, focused purpose** — each plugin does one thing well
3. **Minimal cross-plugin dependencies** — plugins should be independently usable
4. **Public/Private API boundary** — expose only what dependents need

### GameFeature Plugin Requirements
```json
{
    "ExplicitlyLoaded": true,
    "EnabledByDefault": false,
    "BuiltInInitialFeatureState": "Registered"
}
```

GameFeature plugins MUST set these flags. Lyra's build system validates this automatically in `LyraGame.Target.cs`.

### Plugin State Machine
```
Installed → Registered → Loaded → Active
```
- **Installed**: Not recognized by engine
- **Registered**: Recognized but not in memory (recommended initial state)
- **Loaded**: In memory, awaiting activation
- **Active**: Fully operational (do NOT edit while active)

### Dependency Direction
```
GameFeature Plugins
       ↓ (depends on)
Core Game Module (LyraGame)
       ↓ (depends on)
Utility Plugins (CommonGame, UIExtension, etc.)
       ↓ (depends on)
Engine Modules (Core, Engine, GameplayAbilities)
```

**Critical rule**: Dependencies flow DOWN only. Core game NEVER references GameFeature plugins. This enables adding/removing features without touching core code.

---

## Lyra's Module Architecture

### LyraGame Module (Runtime)
- **35+ subsystem directories** organized by feature
- Public include path: `"LyraGame"` (headers relative to module root)
- PCH: `UseExplicitOrSharedPCHs`
- Key public dependencies: GameplayAbilities, GameplayTags, ReplicationGraph, GameFeatures, ModularGameplay, SignificanceManager
- Key private dependencies: EnhancedInput, CommonUI, CommonGame, CommonUser, UIExtension

### LyraEditor Module (Editor-only)
- Custom asset validators
- Mesh collision checking
- Editor commandlets
- Style customization

### Build Targets
| Target | Type | Modules |
|--------|------|---------|
| LyraGame | Game client | LyraGame |
| LyraEditor | Editor | LyraGame + LyraEditor |
| LyraServer | Dedicated server | LyraGame |
| LyraClient | Client-only | LyraGame |
| LyraGameEOS | Game + Epic Online Services | LyraGame |
| LyraGameSteam | Game + Steam | LyraGame |

### Shared Build Settings (`ApplySharedLyraTargetSettings`)
- Shadow variable warnings → **errors**
- `SHIPPING_DRAW_DEBUG_ERROR=1` globally
- `WITH_RPC_REGISTRY=0` in Shipping, `1` otherwise
- `bUseLoggingInShipping = true`
- `bDisableUnverifiedCertificates = true` (non-server)
- GameFeature plugin validation (ExplicitlyLoaded, EnabledByDefault checks)

---

## When to Create a New Module vs. Plugin

| Situation | Create |
|-----------|--------|
| New game system tightly coupled to project | Directory in existing module |
| Reusable utility for multiple projects | Utility plugin |
| Content + mechanics that activate at runtime | GameFeature plugin |
| Editor-only tools | Editor module within existing plugin |
| External library integration | ThirdParty plugin |
| Team wants to develop independently | Separate module or plugin |
| Compile times are too long | Split monolithic module |

---

## Anti-Patterns

- **Monolithic single module**: Any change recompiles everything
- **Circular dependencies**: Module A depends on B, B depends on A → resolve with interfaces or shared base module
- **Leaking implementation details**: Internal headers in Public/, using PublicDependency when Private would suffice
- **Mixing editor and runtime code**: Editor-only code in runtime modules bloats game builds
- **Referencing GameFeature plugins from core**: Defeats the purpose of modularity; creates hard load dependencies
