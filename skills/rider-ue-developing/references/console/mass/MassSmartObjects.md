# UE Python API — MassSmartObjects Module

**6 types** from the `MassSmartObjects` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MassSmartObjectCandidateSlots`, `SmartObjectAnnotationData`, `SmartObjectLaneLocation`, `SmartObjectLaneLocationIndices`, `MassSmartObjectUserTrait`, `SmartObjectZoneAnnotations`

---

## Classes

### `unreal.MassSmartObjectCandidateSlots`
Inherits: `StructBase` | Header: `MassSmartObjectRequest.h`

Struct that holds status and results of a candidate finder request

### `unreal.SmartObjectAnnotationData`
Inherits: `StructBase` | Header: `SmartObjectZoneAnnotations.h`

Per ZoneGraphData smart object look up data.

### `unreal.SmartObjectLaneLocation`
Inherits: `StructBase` | Header: `SmartObjectZoneAnnotations.h`

Struct to keep track of a SmartObject entry point on a given lane.

### `unreal.SmartObjectLaneLocationIndices`
Inherits: `StructBase` | Header: `SmartObjectZoneAnnotations.h`

Struct to store indices to all entry points on a given lane. Used as a container wrapper to be able to use in a TMap.

### `unreal.MassSmartObjectUserTrait`
Inherits: `MassEntityTraitBase` | Header: `MassSmartObjectUserTrait.h`

Trait to allow an entity to interact with SmartObjects

### `unreal.SmartObjectZoneAnnotations`
Inherits: `ZoneGraphAnnotationComponent` | Header: `SmartObjectZoneAnnotations.h`

ZoneGraph annotations for smart objects
