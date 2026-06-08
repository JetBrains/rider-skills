# Scalability & Large-Scale Project Organization

## World Partition

### Overview
Replaces World Composition and manual sublevel management. Stores entire world in a single persistent level, automatically divided into streamable grid cells.

### Key Features
- **Grid Streaming**: Cells load/unload by proximity to streaming sources (configurable cell size, e.g., 256m)
- **One File Per Actor (OFPA)**: Each actor in its own file — eliminates level-file source control conflicts
- **Data Layers**: Logical content organization; disabled layers don't load regardless of proximity
- **HLOD**: Auto-generated simplified proxies for distant geometry
- **Loading Range**: Configurable per-grid (e.g., load at 768m, unload at 1024m)

### Best Practices
- Use a single 2D Runtime Hash grid (multiple grids hurt performance)
- Use Location Volumes for editor-time region management
- Reference City Sample's Big City map for production patterns
- Data layers for conditional content (weather, difficulty, seasonal)

---

## Project Organization by Scale

### Small Indie (1-3 devs)
```
Source/
  MyGame/          # Single runtime module
  MyEditor/        # Editor-only (optional)
Plugins/
  GameFeatures/    # 1-2 feature plugins (optional)
Content/
  Core/            # Shared assets
  Maps/
```

**Architecture**: Basic components, DataAssets for key configs, direct references acceptable. Don't over-engineer.

### Medium (4-10 devs)
```
Source/
  MyGame/          # Core runtime
  MyEditor/        # Editor tools
Plugins/
  CommonSystems/   # Shared utility plugin(s)
  GameFeatures/
    ModeA/         # GameFeature per mode
    ModeB/
Content/
  Core/
  Modes/
    ModeA/
    ModeB/
```

**Architecture**: Full module architecture. GameFeature plugins for content. Subsystems for services. GAS for abilities. Init state for pawn coordination.

### Large (10+ devs)
```
Source/
  MyGame/          # Core framework
  MyEditor/        # Validators, commandlets
Plugins/
  CommonGame/      # Game framework utilities
  CommonUser/      # User/session management
  UIExtension/     # UI extension system
  Messaging/       # Event routing
  GameFeatures/
    CoreShooter/   # Shared shooter mechanics
    MapPack1/      # Content packs
    MapPack2/
    SeasonalEvent/ # Activatable content
Content/           # Organized by feature
```

**Architecture**: Lyra-level. Experience system. Modular gameplay. Custom replication graph. Full testing pipeline. Build automation.

---

## Module Boundaries

### Dependency Rules
```
GameFeature Plugins → Core Game Module → Utility Plugins → Engine
```
Never reverse the arrow. Never create circular dependencies.

### Compile Time Optimization
- Only changed modules recompile
- `PrivateDependencyModuleNames` reduces transitive recompilation
- Forward-declare in headers, include in .cpp
- Consider FASTBuild for distributed compilation

### Content Organization
Organize by **feature**, not by asset type:
```
Content/
  Weapons/
    Rifle/
      SK_Rifle.uasset
      M_Rifle.uasset
      SFX_Rifle_Fire.uasset
      DA_Rifle_Definition.uasset
```

NOT:
```
Content/
  Meshes/SK_Rifle.uasset
  Materials/M_Rifle.uasset
  Sounds/SFX_Rifle_Fire.uasset
```

---

## Scaling Subsystems

| Scope | Subsystem Type | Scales With |
|-------|---------------|-------------|
| Global services | GameInstanceSubsystem | Project complexity |
| Level-specific | WorldSubsystem | Number of levels/modes |
| Per-player | LocalPlayerSubsystem | Player count (local) |

Avoid direct references between subsystems — use events/dispatchers.

---

## Build System Scaling

### BuildGraph (Lyra Pattern)
- `LyraBuild.xml`: Multi-platform compilation pipeline
- `LyraTests.xml`: Automated test orchestration
- `GauntletSettings.xml`: Test configuration
- Submit to Perforce/Git for CI/CD

### Target Configurations
Multiple targets for different deployment scenarios:
- Game, Editor, Server, Client-only
- Platform variants (EOS, Steam, SteamEOS)
- Shared settings in `ApplySharedLyraTargetSettings()`

---

## Live Service Considerations

### Feature Toggles
- GameFeature plugins naturally support activation/deactivation
- Seasonal content = GameFeature plugin with activation schedule
- A/B testing via different Experience definitions

### Content Updates
- GameFeature plugins as DLC packages
- Asset Bundles for selective downloads
- Primary Asset Manager for content discovery

### Monitoring
- `bUseLoggingInShipping = true` for production telemetry
- SignificanceManager for adaptive performance
- Network statistics for bandwidth monitoring

---

## Anti-Patterns
- **Single monolithic module**: Compile times grow linearly with project size
- **Flat content directory**: Assets impossible to find at scale
- **No module boundaries**: Spaghetti dependencies across all code
- **Manual sublevel management**: Use World Partition for large worlds
- **No build automation**: Manual builds don't scale past 3 developers
- **Premature optimization**: Profile first, optimize second
- **Over-engineering for small teams**: A solo developer doesn't need Lyra-level architecture
