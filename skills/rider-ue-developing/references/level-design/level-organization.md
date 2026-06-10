# Level & Map Organization

## Lyra Map Organization Pattern

### Map Categories

| Category | Location | Purpose |
|----------|----------|---------|
| Frontend | `/Game/System/FrontEnd/Maps/` | Main menu, loading screens |
| Editor default | `/Game/System/DefaultEditorMap/` | Editor startup map |
| Gameplay | `/Game/Maps/` | Core playable levels |
| GameFeature maps | `/PluginName/Content/Maps/` | Mode-specific maps |
| Test maps | `/ShooterTests/Content/Maps/` | Functional test levels |

### Naming Convention

- **`L_`** prefix for all levels: `L_LyraFrontEnd`, `L_IslandGraybox`, `L_Expanse`
- **Descriptive name** after prefix: map name or purpose
- **No version numbers** in names — use source control for versioning
- **Sub-levels** use purpose prefix after `L_`: `L_Expanse_Lighting`, `L_Expanse_Audio`

---

## Map Configuration in DefaultEngine.ini

```ini
[/Script/EngineSettings.GameMapsSettings]
# Server startup / default travel map
GameDefaultMap=/Game/System/FrontEnd/Maps/L_LyraFrontEnd.L_LyraFrontEnd

# Editor PIE startup map
EditorStartupMap=/Game/System/DefaultEditorMap/L_DefaultEditorOverview.L_DefaultEditorOverview

# Seamless travel transition map (optional)
; TransitionMap=/Game/Maps/TransitionMap.TransitionMap
```

Maps to test in PIE (editor config):
```ini
[/Script/UnrealEd.UnrealEditorSettings]
+MapsToPIETest=/Game/System/DefaultEditorMap/L_DefaultEditorOverview.L_DefaultEditorOverview
+MapsToPIETest=/Game/System/FrontEnd/Maps/L_LyraFrontEnd.L_LyraFrontEnd
+MapsToPIETest=/ShooterMaps/Maps/L_Expanse.L_Expanse
```

---

## Experience-Map Connection

Each map specifies its default gameplay experience through World Settings:

```
Map (L_Expanse.umap)
  └── ALyraWorldSettings
        └── DefaultGameplayExperience → ULyraExperienceDefinition
              ├── GameFeaturesToEnable: ["ShooterCore", "ShooterMaps"]
              ├── DefaultPawnData → character setup
              └── Actions[] → abilities, input, UI, gameplay cues
```

### Experience Resolution Order

When a map loads, the game mode resolves which experience to use in this priority:

1. **Matchmaking assignment** — online service dictates experience
2. **URL options** — `?Experience=B_MyExperience`
3. **Developer Settings** — PIE-only override
4. **Command line** — `-Experience=B_MyExperience`
5. **World Settings** — `ALyraWorldSettings::DefaultGameplayExperience`
6. **Dedicated server config** — server-specific default
7. **Fallback** — `B_LyraDefaultExperience`

### User-Facing Experience Definition

`ULyraUserFacingExperienceDefinition` pairs a map with an experience for the player-facing UI:

```
UserFacingExperience
  ├── MapID (FPrimaryAssetId)        # Which map to load
  ├── ExperienceID (FPrimaryAssetId) # Which experience to activate
  ├── Title / Subtitle / Description # Display text
  ├── Icon                           # Menu thumbnail
  ├── LoadingScreenWidget            # Loading screen class
  ├── MaxPlayerCount                 # Lobby size
  └── bShowAsReplay                  # Replay capability flag
```

---

## ALyraWorldSettings

Custom world settings class (`LyraWorldSettings.h`) used by all Lyra maps:

- **DefaultGameplayExperience** — `EditDefaultsOnly`, cannot be set from Python at runtime
- **ForceStandaloneNetMode** — editor flag to force PIE to standalone (useful for frontend maps)
- **CheckForErrors()** — validates maps use `ALyraPlayerStart` instead of generic `APlayerStart`

Configured globally in DefaultEngine.ini:
```ini
[/Script/Engine.Engine]
WorldSettingsClassName=/Script/LyraGame.LyraWorldSettings
```

---

## Streaming Sub-Level Organization (Non-World-Partition)

For levels NOT using World Partition, organize sub-levels by purpose:

```
L_MyLevel (Persistent)          # Always loaded — core gameplay actors, level logic
  ├── L_MyLevel_Geo_Section01   # Static geometry chunk — distance-streamed
  ├── L_MyLevel_Geo_Section02   # Static geometry chunk — distance-streamed
  ├── L_MyLevel_Lighting        # Lighting actors — always loaded or distance-streamed
  ├── L_MyLevel_Audio           # Ambient sound actors — distance-streamed
  ├── L_MyLevel_Gameplay        # Interactive actors — blueprint-streamed with triggers
  └── L_MyLevel_FX              # Particle systems, VFX — distance-streamed
```

### Sub-Level Naming

- Use the parent level name as prefix: `L_Expanse_Geo_01`
- Purpose suffix: `_Geo_`, `_Lighting_`, `_Audio_`, `_Gameplay_`, `_FX_`
- Section numbers for spatial splits: `_01`, `_02`, `_North`, `_South`

### Streaming Rules

| Sub-Level Type | Streaming Method | Notes |
|----------------|-----------------|-------|
| Persistent | Always Loaded | Core gameplay, spawn points, triggers |
| Geo_* | Distance-based | Static meshes, terrain |
| Lighting_* | Always Loaded | Critical for visual consistency |
| Audio_* | Distance-based | Ambient sounds, reverb volumes |
| Gameplay_* | Blueprint / Trigger | Interactive objects, NPCs, quest items |
| FX_* | Distance-based | Particle effects, decals |

---

## World Partition Map Organization

For World Partition levels, the streaming is automatic (grid-based), but organization still matters:

### External Actor Files

```
Content/
  Maps/
    L_OpenWorld.umap                    # World settings + partition config only
  __ExternalActors__/
    Maps/
      L_OpenWorld/
        A/B/C/ActorHash1.uasset       # Individual actor files (hash-based)
        D/E/F/ActorHash2.uasset
  __ExternalObjects__/
    Maps/
      L_OpenWorld/
        ...                            # External object files
```

- Never manually move/rename files under `__ExternalActors__/`
- The `.umap` file is lightweight — only World Settings and partition config
- Check out individual actor files in VCS, not the whole level

### Data Layers for Logical Organization

Use Data Layers instead of sub-levels for conditional content:

| Layer Name | Type | Use Case |
|------------|------|----------|
| `DayTime` | Runtime | Daytime lighting, foliage, NPCs |
| `NightTime` | Runtime | Night lighting, enemies, effects |
| `Quest_MainStory` | Runtime | Main quest actors, triggers |
| `Quest_Side_01` | Runtime | Side quest content |
| `Destructible` | Runtime | Pre/post-destruction states |
| `Debug` | Editor | Debug visualization, test actors |

---

## GameFeature Plugin Map Patterns

Each GameFeature plugin containing maps follows this structure:

```
Plugins/GameFeatures/ShooterMaps/
  Content/
    Maps/
      L_Expanse.umap           # Gameplay map
    System/
      Experiences/
        B_ShooterExperience.uasset  # Experience for this map set
  Config/
    Tags/                       # Plugin-specific GameplayTags
  ShooterMaps.uplugin
```

### Plugin Map Rules

- Maps in plugins must be registered for cooking (either via Experience reference chain or explicit `AlwaysCook`)
- Plugin maps reference experiences in the same plugin or in a dependency plugin
- Keep map-specific assets (lighting presets, skybox textures) in the same plugin
- The plugin `.uplugin` must have `CanContainContent: true`

---

## Map Travel & Level Loading

### Server Travel (Map Switching)

```cpp
// Lyra pattern: ServerTravel with seamless travel
UWorld* World = GetWorld();
FURL TravelURL;
TravelURL.Map = TEXT("/Game/Maps/L_NewMap");
TravelURL.AddOption(TEXT("Experience=B_ShooterExperience"));
World->ServerTravel(TravelURL.ToString(), false /* bAbsolute */);
```

### Seamless Travel

- Preserves player connections across level transitions
- `ALyraGameState::SeamlessTravelTransitionCheckpoint` cleans up inactive players/bots
- Configure `TransitionMap` in `DefaultEngine.ini` for intermediate loading level
- Disabled by default in Lyra (commented out in config)

### Experience Loading During Travel

1. New map loads → `ALyraGameMode` spawns
2. Game mode resolves experience (see resolution order above)
3. `ULyraExperienceManagerComponent` begins loading: `Unloaded → Loading → LoadingGameFeatures → ExecutingActions → Loaded`
4. GameFeature plugins activate, abilities/input/UI granted to players
5. Pawns spawn with configured PawnData

---

## Validation & Best Practices

### Map Validation (Lyra)

- `ALyraWorldSettings::CheckForErrors()` warns if generic `APlayerStart` found (should be `ALyraPlayerStart`)
- `ContentValidationCommandlet` validates asset integrity at build time
- Maps must have at least one `ALyraPlayerStart`

### Map Organization Checklist

- [ ] Map has `L_` prefix
- [ ] World Settings has DefaultGameplayExperience set
- [ ] Uses `ALyraPlayerStart` (not generic `APlayerStart`)
- [ ] Frontend maps are always-cooked in `DefaultGame.ini`
- [ ] GameFeature maps are in their plugin's `Content/Maps/`
- [ ] Sub-levels follow naming convention (`_Geo_`, `_Lighting_`, etc.)
- [ ] Kill-Z volume below playable area
- [ ] NavMesh covers all walkable surfaces
- [ ] Map registered in primary asset type scanning paths

### Anti-Patterns

- **Hardcoded map paths in C++** — use Experience system or config-driven references
- **Frontend logic in gameplay maps** — keep menu/lobby in dedicated frontend maps
- **Missing World Settings experience** — map loads with fallback, losing intended gameplay
- **Sub-levels with gameplay actors set to distance-streaming** — can softlock if unloaded
- **Huge monolithic maps without World Partition** — poor VCS workflow, long save times
- **Level Blueprint for cross-level logic** — use GameMode/GameState/Subsystems instead
