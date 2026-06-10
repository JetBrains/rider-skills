# Baked Generated Mesh (BGM) System

## Overview

UE5's `GeneratedDynamicMeshActor` (GeometryScripting plugin) enables Blueprint-based parametric level construction tools with a design-time → production bake workflow.

## Architecture

```
AGeneratedDynamicMeshActor (Engine C++)
  └── DynamicMeshComponent (root)
  └── OnRebuildGeneratedMesh (Blueprint override)
  └── BakedGeneratedMeshActor (Blueprint layer — adds State + BakedMesh)
       └── Concrete tool BPs (Panel, Window, Stairs, etc.)
```

## GeneratedDynamicMeshActor Base Class

| Property | Purpose |
|----------|---------|
| `DynamicMeshComponent` | Root component holding generated mesh |
| `ResetOnRebuild` | Clear mesh before rebuild |
| `Frozen` | Prevent auto-rebuild |
| `EnableComputeMeshPool` | GPU-accelerated mesh ops |
| `EnableAutoLODGeneration` | Auto LOD support |
| `NumProgressSteps` | Steps for progress bar |
| `ProgressMessage` | Rebuild status text |

| Method | Purpose |
|--------|---------|
| `OnRebuildGeneratedMesh` | Override in BP to generate geometry |
| `MarkForMeshRebuild()` | Trigger regeneration |
| `CopyPropertiesToStaticMesh()` | Bake to static mesh |
| `CopyPropertiesFromStaticMesh()` | Import from static mesh |
| `AllocateComputeMesh()` / `ReleaseComputeMesh()` | Compute mesh pooling |

## BGM Framework Layer (Blueprint)

### BakedGeneratedMeshActor
Extends GeneratedDynamicMeshActor with:
- `State` (Enum): `LIVE` = actively regenerating | other values = baked/frozen
- `BakedMesh` (StaticMeshComponent): Stores baked result

### BakedStaticMeshActor
Extends StaticMeshActor — lightweight baked output.

### GeneratedMeshColdStorage
EditorUtilityActor that stores source mesh data for later unbaking.

## Bake Workflow

```
1. DESIGN — Place tool BPs, tweak parameters, mesh regenerates live
2. BAKE   — Right-click → SwapGeneratedActor_ToSM
            Dynamic mesh → StaticMesh conversion
            Actor replaced with BakedStaticMeshActor
3. SHIP   — Baked StaticMeshActors are lightweight for production
4. EDIT   — Right-click baked → SwapGeneratedActor_FromSM
            Retrieves source from ColdStorage, back to editable
```

### Editor Action Utilities (right-click context menu)
| Action | Purpose |
|--------|---------|
| `SwapGeneratedActor_ToSM` | Bake: dynamic → static mesh |
| `SwapGeneratedActor_FromSM` | Unbake: static → editable dynamic |
| `FindSourceMesh` | Locate source for baked actor |
| `SyncSourceKey` | Sync keys between live/baked |

## Common Tool Patterns

### Wall with Window
Parameters: `WallWidth`, `WallHeight`, `WallThickness`, `Radius`, `Steps`, `WindowType` enum

### Modular Panel
Parameters: `PanelType` enum, `CornerRadius`, pre-made mesh pieces (bevel variants, frame curves)

### Parametric Stairs
Parameters: `StepHeight`, `ConstructionType` enum, `RailingType` enum, `Material`

### Repeater (Linear Array)
Parameters: `Width`, `Height`, `Depth`, `Count`, `Spacing`, `Material`

### Corner Extrude
Parameters: `Radius`, `Angle`, `Material`

## Python Interaction

BP variables exposed via construction script `InstanceEditable` are accessible through `get_editor_property`/`set_editor_property` with exact property names:
```python
import unreal
esl = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
bp = unreal.EditorAssetLibrary.load_asset("/Game/Tools/MyWallTool")
actor = esl.spawn_actor_from_class(bp.generated_class(), unreal.Vector(0,0,0))
# Read/write BP variables
width = actor.get_editor_property("WallWidth")
actor.set_editor_property("WallWidth", 800.0)
```

Note: BP variables are NOT visible via CDO Python reflection (`dir(cdo)`) — they only work via `get_editor_property` with the exact CamelCase name.

## World Partition Compatibility

BGM tools work with WP maps — actors stored as external `.uasset` files. Use `WorldPartitionBlueprintLibrary.pin_actors()` to load them for inspection.
