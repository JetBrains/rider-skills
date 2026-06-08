---
name: ue:level-design
description: "Use when user asks to create levels, set up landscapes, configure World Partition, manage streaming levels, place lighting, set up fog/sky/atmosphere, create sub-levels, or automate level layout tasks. DO NOT TRIGGER for placing individual actors (use ue:editor), material work (use ue:material), C++ code (use ue:coder), or building/packaging (use ue:builder)."
allowed-tools: Bash, Read, Write
argument-hint: "[level design task]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Level Design Skill

Automate Unreal Engine level creation, landscape setup, lighting, atmosphere, World Partition configuration, and streaming level management through a running Unreal Editor instance.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — level type, World Partition vs streaming, landscape needs, target platform
2. **Create level** — new level or configure existing; set up World Partition if needed
3. **Configure** — atmosphere, sky, lighting, fog, landscape, post-process
4. **Save level** — save the level and all modified assets to disk before validation
5. **Validate** — build lighting, run map check, test in PIE
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

---

## CRITICAL -- Mistakes That Waste Hours

These ten rules prevent the most common and costly failures in level design automation. Violating any of them can cause crashes, data corruption, or hours of wasted iteration time.

### Rule 1: Level switching scripts MUST use --isolated flag via ue:console

When switching between levels or loading new maps, always pass `--isolated` to ue:console. After a level switch, all cached `UWorld`, `ULevel`, and `ALevelScriptActor` references become dangling pointers. Accessing a stale `UWorld` ref will hard-crash the editor with no useful callstack. The `--isolated` flag forces a fresh Python interpreter context per invocation, ensuring no stale references survive across level transitions.

```
# WRONG -- stale UWorld ref from previous execution context
/ue:console --script 'unreal.EditorLevelLibrary.load_level("/Game/Maps/NewMap")'
/ue:console --script 'print(unreal.EditorLevelLibrary.get_editor_world().get_name())'

# RIGHT -- isolated execution context after level switch
/ue:console --isolated --script 'unreal.EditorLevelLibrary.load_level("/Game/Maps/NewMap")'
/ue:console --isolated --script 'print(unreal.EditorLevelLibrary.get_editor_world().get_name())'
```

### Rule 2: World Partition requires One File Per Actor (OFPA)

Enabling World Partition on a level automatically requires OFPA. You cannot partially adopt World Partition. If you enable it on an existing level that was not created with OFPA, all actors must be migrated. This is a one-way operation. Always create a backup before converting an existing level. Use `WorldPartitionConvertCommandlet` for migration, never attempt manual conversion.

### Rule 3: Landscape heightmap resolution must match component count exactly

The heightmap resolution formula is: `(ComponentSizeQuads * NumComponents + 1) x (ComponentSizeQuads * NumComponents + 1)`. If the imported heightmap does not match this resolution exactly, the engine will silently resample the data, causing subtle terrain corruption that only becomes visible after painting or at runtime LOD transitions. Always calculate the expected resolution before importing.

### Rule 4: Streaming level load is async

After calling `load_stream_level` or `LoadStreamLevel`, the level is NOT immediately available. Checking actors or geometry immediately after the load call will return incomplete or empty results. You must either poll `GetStreamingLevel()->IsLevelLoaded()` or use a latent action / callback delegate. In automation scripts, insert a polling loop with a timeout rather than assuming instant availability.

### Rule 5: Lighting needs Build before it looks correct

Unlit or "Preview" quality lighting in the viewport is not representative of final output. Automated scripts that screenshot or validate lighting results must call `Build Lighting Only` first. Preview lighting uses a fast approximation that misses bounce lighting, shadow penumbras, and volumetric effects entirely. Never judge lighting quality from preview mode.

### Rule 6: Sub-levels with gameplay actors must be Always Loaded or have trigger volumes

If a sub-level contains gameplay-critical actors (spawn points, triggers, quest NPCs) and is set to Blueprint or distance-based streaming, those actors literally do not exist when the sub-level is unloaded. Players can softlock if a required actor is in an unloaded sub-level. Always mark such sub-levels as "Always Loaded" or ensure streaming trigger volumes guarantee they load before the player can reach the relevant gameplay area.

### Rule 7: NavMesh does not span across streaming level boundaries by default

Navigation mesh is built per-level. When using streaming sub-levels, AI agents cannot pathfind across level boundaries unless you explicitly enable `Runtime Generation` on the NavMesh and set the `Navigation System` to support dynamic updates. For World Partition, use `NavigationDataChunkActor` to ensure nav data streams alongside geometry.

### Rule 8: Level Blueprint is per-level and does not transfer across sub-levels

Logic placed in a Level Blueprint only executes for that specific level or sub-level. It does not propagate to child sub-levels or persist across level transitions. For cross-level logic (day/night cycles, global events, persistent state), use `GameMode`, `GameState`, or a `GameInstance` subsystem. Reserve Level Blueprints strictly for level-specific setup that has no cross-level dependencies.

### Rule 9: WorldSettings GameMode property is `default_game_mode`

When setting a level's GameMode override via Python, the property is `default_game_mode`, NOT `game_mode_override` or `GameModeOverride`:

```python
world = unreal.EditorLevelLibrary.get_editor_world()
ws = world.get_world_settings()
gm_class = unreal.load_asset('/Game/BP_MyGameMode').generated_class()
ws.set_editor_property('default_game_mode', gm_class)
```

### Rule 10: LevelEditorSubsystem.get_world() may return None after level load

In `--isolated` execution mode (required for level switching), `unreal.get_editor_subsystem(unreal.LevelEditorSubsystem).get_world()` may return `None` immediately after a `load_level()` or `new_level()` call.

**Workaround:** Use the deprecated but reliable `unreal.EditorLevelLibrary.get_editor_world()` when you need the world reference in the same script or immediately after a level switch:

```python
import warnings
warnings.filterwarnings('ignore', category=DeprecationWarning)
world = unreal.EditorLevelLibrary.get_editor_world()
```

---

## Transport Layer

This skill executes Python in a running Unreal Editor via **/ue:console**. See the ue:console skill for the full transport API (flags, response format, shell quoting rules, error recovery).

Key modes used by this skill: `--script`, `--file`, `--isolated`, `--health`, `--play`, `--stop`.

**IMPORTANT:** Level switching (`new_level`, `load_level`) requires `--isolated` mode to prevent stale `UWorld` references. Heredoc piping is NOT supported — always use `--script` or `--file`.

---

## Common Operations

### Create a New Empty Level

**IMPORTANT: Always load (open) a newly created level after creation.** The editor does not automatically switch to a new level. If you skip this step, subsequent operations (placing actors, setting World Settings) will modify the previously open level, not the new one.

```python
import unreal

# Preferred: use LevelEditorSubsystem.new_level() which creates AND opens in one step
editor_subsystem = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem)
success = editor_subsystem.new_level("/Game/Maps/MyNewLevel")
# Save immediately
unreal.EditorAssetLibrary.save_asset("/Game/Maps/MyNewLevel")
```

Alternative (create without opening, then load separately):
```python
import unreal

asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
level_factory = unreal.WorldFactory()
level_factory.world_type = unreal.WorldType.EDITOR
asset_tools.create_asset("MyNewLevel", "/Game/Maps", unreal.World, level_factory)
# MUST open it -- use --isolated for subsequent commands
unreal.EditorLevelLibrary.load_level("/Game/Maps/MyNewLevel")
```

### Create Level from Template

```python
import unreal

editor_asset_lib = unreal.EditorAssetLibrary
# Duplicate an existing template level
editor_asset_lib.duplicate_asset("/Game/Maps/Template_Outdoor", "/Game/Maps/MyLevel")
unreal.EditorLevelLibrary.load_level("/Game/Maps/MyLevel")
```

### Add a Streaming Sub-Level

```python
import unreal

levels = unreal.EditorLevelUtils
new_sublevel = levels.add_level_to_world(
    unreal.EditorLevelLibrary.get_editor_world(),
    "/Game/Maps/SubLevels/Gameplay_01",
    unreal.LevelStreamingDynamic
)
```

### Create Landscape

```python
import unreal

# Spawn landscape with default flat terrain
landscape = unreal.EditorLevelLibrary.spawn_actor_from_class(
    unreal.Landscape, unreal.Vector(0, 0, 0)
)
```

### Set Up Basic Lighting and Atmosphere

```python
import unreal
el = unreal.EditorLevelLibrary

# Directional light (sun)
sun = el.spawn_actor_from_class(unreal.DirectionalLight, unreal.Vector(0, 0, 500))
sun.set_actor_rotation(unreal.Rotator(-50, -30, 0), False)

# Sky atmosphere
el.spawn_actor_from_class(unreal.SkyAtmosphere, unreal.Vector(0, 0, 0))

# Volumetric cloud
el.spawn_actor_from_class(unreal.VolumetricCloud, unreal.Vector(0, 0, 0))

# Sky light
skylight = el.spawn_actor_from_class(unreal.SkyLight, unreal.Vector(0, 0, 500))

# Exponential height fog
el.spawn_actor_from_class(unreal.ExponentialHeightFog, unreal.Vector(0, 0, 200))
```

### Configure Post-Process Volume

```python
import unreal
el = unreal.EditorLevelLibrary

ppv = el.spawn_actor_from_class(unreal.PostProcessVolume, unreal.Vector(0, 0, 0))
ppv.unbound = True  # Affects entire level
settings = ppv.settings
settings.override_auto_exposure_method = True
settings.auto_exposure_method = unreal.AutoExposureMethod.AEM_MANUAL
settings.override_auto_exposure_bias = True
settings.auto_exposure_bias = 1.0
```

---

## Knowledge Files

| File | Topics |
|------|--------|
| `knowledge/world-partition.md` | World Partition, OFPA, data layers, runtime grids, HLODs, level instances, minimap, migration from World Composition |
| `knowledge/landscape.md` | Landscape creation, heightmaps, layers, materials, foliage, grass system, splines, LOD, component sizing |
| `knowledge/lighting-atmosphere.md` | Directional light, sky atmosphere, volumetric clouds, fog, skylights, light types, Lumen GI, baked lighting, reflections, post-process, time-of-day |
| `knowledge/level-organization.md` | Map naming, directory structure, Experience-map connection, streaming sub-level patterns, World Partition file layout, GameFeature plugin maps, map travel |

---

## Workflow Patterns

### New Open World Level Setup (Recommended Order)

1. Create the level with World Partition enabled
2. Configure World Partition grid (cell size, loading range)
3. Create landscape (calculate resolution first)
4. Set up atmosphere (sky atmosphere, volumetric clouds)
5. Place directional light (sun) and configure sky light
6. Add exponential height fog
7. Create post-process volume (unbound)
8. Configure HLOD layers
9. Build lighting
10. Save

### Streaming Sub-Level Organization (Non-World-Partition)

Organize sub-levels by purpose:
- `Persistent` -- always loaded, contains core gameplay actors and level logic
- `Geo_*` -- static geometry chunks, distance-streamed
- `Lighting_*` -- lighting actors, always loaded or distance-streamed
- `Audio_*` -- ambient sound actors, distance-streamed
- `Gameplay_*` -- interactive actors, blueprint-streamed with trigger volumes
- `FX_*` -- particle systems and visual effects, distance-streamed

### Level Validation Checklist

Before considering a level automation task complete:
1. The created/modified level is **loaded (open) in the editor** — verify you are editing the right level
2. All streaming sub-levels load without errors
3. NavMesh covers all walkable surfaces (rebuild if needed)
4. Lighting is built (not preview)
5. No overlapping blocking volumes with gaps
6. Player start exists and is in a valid location
7. Kill-z volume exists below the playable area
8. **Run PIE** (via `/ue:console --play`) to let the user verify the result — this is the default behavior unless user says otherwise
