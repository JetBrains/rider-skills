# UE Python API — MassRepresentation Module

**14 types** from the `MassRepresentation` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MassDistanceLODParameters`, `MassRepresentationParameters`, `MassStaticMeshInstanceVisualizationMeshDesc`, `MassVisualizationLODParameters`, `StaticMeshInstanceVisualizationDesc`, `StaticMeshInstanceVisualizationDescHandle`, `MassDistanceVisualizationTrait`, `MassMovableVisualizationTrait`, `MassStationaryDistanceVisualizationTrait`, `MassStationaryVisualizationTrait`, `MassVisualizationComponent`, `MassVisualizationTrait`, `MassVisualizer`, `MassRepresentationType`

---

## Classes

### `unreal.MassDistanceLODParameters`
Inherits: `MassConstSharedFragment` | Header: `MassRepresentationFragments.h`

### `unreal.MassRepresentationParameters`
Inherits: `MassConstSharedFragment` | Header: `MassRepresentationFragments.h`

Mass Representation Parameters

### `unreal.MassStaticMeshInstanceVisualizationMeshDesc`
Inherits: `StructBase` | Header: `MassRepresentationTypes.h`

Mass Static Mesh Instance Visualization Mesh Desc

### `unreal.MassVisualizationLODParameters`
Inherits: `MassConstSharedFragment` | Header: `MassRepresentationFragments.h`

Mass Visualization LODParameters

### `unreal.StaticMeshInstanceVisualizationDesc`
Inherits: `TableRowBase` | Header: `MassRepresentationTypes.h`

Static Mesh Instance Visualization Desc

### `unreal.StaticMeshInstanceVisualizationDescHandle`
Inherits: `StructBase` | Header: `MassRepresentationTypes.h`

Handle for FStaticMeshInstanceVisualizationDescâs registered with UMassRepresentationSubsystem

### `unreal.MassDistanceVisualizationTrait`
Inherits: `MassEntityTraitBase` | Header: `MassDistanceVisualizationTrait.h`

This class has been soft-deprecated. Use MassStationaryVisualizationTrait or MassMovableVisualizationTrait

### `unreal.MassMovableVisualizationTrait`
Inherits: `MassVisualizationTrait` | Header: `MassMovableVisualizationTrait.h`

Mass Movable Visualization Trait

### `unreal.MassStationaryDistanceVisualizationTrait`
Inherits: `MassDistanceVisualizationTrait` | Header: `MassStationaryDistanceVisualizationTrait.h`

Mass Stationary Distance Visualization Trait

### `unreal.MassStationaryVisualizationTrait`
Inherits: `MassVisualizationTrait` | Header: `MassStationaryVisualizationTrait.h`

Mass Stationary Visualization Trait

### `unreal.MassVisualizationComponent`
Inherits: `ActorComponent` | Header: `MassVisualizationComponent.h`

This component handles all the static mesh instances for a MassRepresentationProcessor and is an actor component off a MassVisualizer actor. Meant to be created at runtime and owned by an MassVisualiz...

### `unreal.MassVisualizationTrait`
Inherits: `MassEntityTraitBase` | Header: `MassVisualizationTrait.h`

This class has been soft-deprecated. Use MassStationaryVisualizationTrait or MassMovableVisualizationTrait

### `unreal.MassVisualizer`
Inherits: `Actor` | Header: `MassVisualizer.h`

Actor holding the mass visual component responsible to handle the representation of the mass agent as the static mesh instances There may be a separate instance of these for different types of Agents ...

### `unreal.MassRepresentationType`
Inherits: `EnumBase` | Header: `MassRepresentationTypes.h`

EMass Representation Type

**Properties** (4):
  - `HIGH_RES_SPAWNED_ACTOR`: `MassRepresentationType = Ellipsis` — 0
  - `LOW_RES_SPAWNED_ACTOR`: `MassRepresentationType = Ellipsis` — 1
  - `NONE`: `MassRepresentationType = Ellipsis` — 3
  - `STATIC_MESH_INSTANCE`: `MassRepresentationType = Ellipsis` — 2
