# Content Organization & Asset Naming Conventions

## Lyra Content Directory Structure (Reference Pattern)

```
Content/
  Audio/                    # Music, SFX, control buses, modulation
  Blueprints/               # General-purpose Blueprint actors
  Characters/
    Heroes/
      Mannequin/
        Animations/         # Per-character animation assets
        Meshes/
        Materials/
        RigPoses/
      EmptyPawnData/        # Fallback/default pawn data
  ContextEffects/           # Surface-based feedback (footsteps, impacts)
  Effects/                  # Niagara systems, VFX
  Environments/             # Level environment assets (rocks, foliage, etc.)
  GameplayCueNotifies/      # GAS gameplay cue categories
  GameplayEffects/          # Attribute effects, buffs
  Input/                    # Input configs, context mappings
  Maps/                     # Gameplay level files
  Materials/                # Shared material libraries
  PhysicsMaterials/         # Physics surface definitions
  System/
    DefaultEditorMap/       # Editor startup map
    Experiences/            # Experience Definitions (B_LyraDefaultExperience)
    FrontEnd/Maps/          # Main menu / loading screen maps
    Playlists/              # User-facing experience definitions
    Teams/                  # Team display data
  Textures/                 # Shared texture assets
  Tools/                    # Procedural generation BPs, helper actors
  Triggers/                 # Trigger system actors
  UI/                       # Widgets, UI materials, icons
  Weapons/
    Shotgun/
      Mesh/
      Textures/
      Materials/
    Rifle/
      ...
```

### Key Takeaways

- **Organize by feature, not by type** — all Rifle assets live under `Weapons/Rifle/`, not scattered across `Meshes/`, `Materials/`, `Sounds/`
- **System/ for framework-level assets** — Experiences, playlists, frontend, teams
- **Shared libraries at top level** — `Materials/`, `Textures/`, `Effects/` for cross-feature assets
- **No deep nesting** — 2-3 levels max before reaching leaf assets

---

## Asset Naming Conventions

### Standard Prefixes

| Prefix | Asset Type | Example |
|--------|-----------|---------|
| `B_` | Blueprint | `B_LyraGameMode`, `B_Hero_Mannequin` |
| `W_` | Widget / UMG | `W_SettingsPanel`, `W_LoadingScreen` |
| `WBP_` | Widget Blueprint | `WBP_HealthBar` |
| `DT_` | DataTable | `DT_SaveActions` |
| `DA_` | DataAsset | `DA_Rifle_Definition` |
| `GE_` | GameplayEffect | `GE_Warmup`, `GE_Stat_FireRange` |
| `GA_` | GameplayAbility | `GA_Hero_Jump`, `GA_Weapon_Fire` |
| `CM_` | Camera Mode | `CM_ArenaFramingCamera` |
| `M_` | Material | `M_UI_Throbber_Base` |
| `MI_` | Material Instance | `MI_GroundFloor` |
| `MF_` | Material Function | `MF_WorldAlignedBlend` |
| `PM_` | Physics Material | `PM_Character`, `PM_Glass` |
| `SM_` | Static Mesh | `SM_StairStep` |
| `SK_` | Skeletal Mesh | `SK_Mannequin` |
| `T_` | Texture | `T_GammaTestImage` |
| `L_` | Level / Map | `L_LyraFrontEnd`, `L_IslandGraybox` |
| `SFX_` | Sound Effect | `SFX_Rifle_Fire` |
| `NS_` | Niagara System | `NS_MuzzleFlash` |
| `ABP_` | Animation Blueprint | `ABP_Mannequin` |
| `AM_` | Anim Montage | `AM_Rifle_Fire` |
| `AS_` | Anim Sequence | `AS_Idle_Rifle` |
| `CT_` | Curve Table | `CT_DamageDropoff` |
| `Enum_` | Enum DataAsset | `Enum_PanelType` |
| `BFL_` | Blueprint Function Library | `BFL_MathHelpers` |
| `BI_` | Blueprint Interface | `BI_Interactable` |

### Naming Rules

1. **PascalCase** for asset names: `B_LyraGameMode`, not `b_lyra_game_mode`
2. **Prefix always first**, then category/owner, then descriptive name
3. **No spaces** — use underscores as separators
4. **Suffixes for variants**: `_Base`, `_Inst`, `_01`, `_Child`
5. **Match folder context** — asset in `Weapons/Rifle/` doesn't need "Rifle" in every sub-asset name

---

## GameFeature Plugin Content Organization

Each GameFeature plugin is self-contained:

```
Plugins/GameFeatures/ShooterCore/
  Content/
    Camera/                 # Camera mode definitions
    Game/                   # Game mode components, ability sets, data assets
    Input/                  # Input configurations, action maps
    Maps/                   # Game-specific maps
    System/Experiences/     # Experience definitions for this feature
    Weapons/                # Weapon BPs, abilities, assets
  Config/
    Tags/                   # Plugin-specific GameplayTags
  Source/
    ShooterCoreRuntime/
      Public/
      Private/
  ShooterCore.uplugin
```

### Plugin Content Rules

- **Self-contained** — plugin content should not reference assets in other plugins
- **Core game content stays in `/Game/`** — shared characters, base materials, system assets
- **Plugin-specific content in plugin `/Content/`** — variant weapons, mode-specific UI, etc.
- **Cross-plugin sharing via DataAssets** — use soft references, never hard-reference across plugin boundaries
- **ExplicitlyLoaded: true, EnabledByDefault: false** — mandatory for GameFeature plugins

---

## Primary Asset Type Configuration

Lyra registers primary asset types in `DefaultGame.ini` under `[/Script/Engine.AssetManagerSettings]`:

| Type | Directory | Cook Rule | Purpose |
|------|-----------|-----------|---------|
| `Map` | `/Game/Maps/` | `AlwaysCook` specific maps | Gameplay levels |
| `LyraGameData` | `/Game/` (singleton) | `AlwaysCook` | Global game config |
| `LyraExperienceDefinition` | `/Game/System/Experiences/` | `AlwaysCook` | Experience bundles |
| `LyraUserFacingExperienceDefinition` | `/Game/System/Playlists/` | `AlwaysCook` | Player-visible mode list |
| `LyraExperienceActionSet` | (any) | `AlwaysCook` | Modular action bundles |
| `GameFeatureData` | `/Game/Unused/` | (default) | GameFeature metadata |
| `PrimaryAssetLabel` | (any) | (default) | Chunking / organization |

### Always-Cooked Assets

These are explicitly listed to ensure they ship regardless of reference chains:
- `/Game/System/FrontEnd/Maps/L_LyraFrontEnd` — main menu
- `/Game/System/DefaultEditorMap/L_DefaultEditorOverview` — editor startup

### Custom Asset Manager

Lyra uses `ULyraAssetManager` (configured in `DefaultEngine.ini`):
```ini
[/Script/Engine.Engine]
AssetManagerClassName=/Script/LyraGame.LyraAssetManager
```

Key config:
```ini
[/Script/LyraGame.LyraAssetManager]
LyraGameDataPath=/Game/DefaultGameData.DefaultGameData
DefaultPawnData=/Game/Characters/Heroes/EmptyPawnData/DefaultPawnData_EmptyPawn
```

---

## Data-Driven Asset Composition Pattern

Lyra composes gameplay through DataAsset chains rather than hardcoded references:

```
Experience Definition
  ├── GameFeature plugins to enable (strings)
  ├── Default PawnData (DataAsset)
  │     ├── Pawn class
  │     ├── Ability Sets[] (DataAsset)
  │     │     ├── Gameplay Abilities[]
  │     │     ├── Gameplay Effects[]
  │     │     └── Attribute Sets[]
  │     ├── Input Config
  │     ├── Tag Relationship Mapping
  │     └── Default Camera Mode
  ├── Actions[] (GameFeatureActions)
  └── Action Sets[] (DataAsset bundles)
```

### Equipment / Inventory DataAsset Chain

```
Inventory Item Definition
  ├── Fragments[]
  │     ├── EquippableItem → Equipment Definition
  │     │     ├── Instance class
  │     │     ├── Ability Sets to grant[]
  │     │     └── Actors to spawn[] (weapon mesh, etc.)
  │     ├── QuickBarIcon (UI display)
  │     ├── PickupIcon (world pickup display)
  │     ├── SetStats (attribute modifications)
  │     └── ReticleConfig (weapon reticle)
```

### Pickup DataAsset Chain

```
Pickup Definition
  ├── Inventory Item Definition (class ref)
  ├── Display mesh
  ├── Pickup sound / Niagara effect
  └── Respawn cooldown
```

---

## Content Organization Decision Framework

### By Feature (Recommended for Most Projects)

```
Content/
  Weapons/Rifle/      # ALL rifle assets together
  Characters/Hero/    # ALL hero assets together
  Vehicles/Tank/      # ALL tank assets together
```

**When**: Team organized by feature, assets have clear ownership, 4+ developers.

### By Type (Small Projects Only)

```
Content/
  Meshes/
  Materials/
  Textures/
  Blueprints/
```

**When**: Solo developer, small project, or prototype. Switch to by-feature before shipping.

### Hybrid (Lyra's Approach)

```
Content/
  Weapons/         # Feature-organized: self-contained
  Characters/      # Feature-organized: self-contained
  Materials/       # Type-organized: shared across features
  Textures/        # Type-organized: shared across features
  Effects/         # Type-organized: shared across features
  System/          # Framework: experiences, playlists, teams
```

**When**: Mix of feature-specific and shared assets. Best for medium-to-large projects.

---

## Anti-Patterns

- **Flat Content root** — dumping all assets in `/Game/` with no folders
- **Deep nesting** — `/Game/Assets/Gameplay/Weapons/Ranged/Rifle/Models/LOD0/` (too many levels)
- **Duplicate assets across plugins** — copy-pasting instead of referencing shared content
- **Hard references across plugin boundaries** — creates hidden load-order dependencies
- **No primary asset types configured** — Asset Manager can't scan, cook, or manage assets efficiently
- **Inconsistent naming** — mixing `BP_`, `B_`, `Blueprint_` prefixes for the same type
- **Assets in the wrong plugin** — putting variant content in the core game instead of its GameFeature plugin

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `search_assets` | Audit assets by path prefix or base class | `search_assets(packagePath="/Game/", baseClass="Blueprint")` — find all Blueprints directly in `/Game/` (flat root anti-pattern) |
| `list_directory_tree` | Visualize the asset directory structure | Confirm folder hierarchy matches the convention table before committing a content reorganization |
| `ue_execute_python` | Batch-rename or batch-move assets | Run `EditorAssetLibrary.rename_asset()` or `make_directory()` loops to apply naming convention fixes across hundreds of assets |
| `get_asset_properties` | Read Primary Asset ID configuration | Verify `PrimaryAssetType` and `PrimaryAssetId` fields on data assets to confirm Asset Manager scanning is correct |
