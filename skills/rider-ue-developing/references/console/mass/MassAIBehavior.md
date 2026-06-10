# UE Python API — MassAIBehavior Module

**9 types** from the `MassAIBehavior` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MassLookAtPriority`, `MassLookAtRequestHandle`, `MassLookAtSubsystem`, `MassLookAtTargetTrait`, `MassLookAtTrait`, `MassStateTreeSchema`, `MassStateTreeTrait`, `MassZoneGraphAnnotationTrait`, `MassLookAtInterpolationSpeed`

---

## Classes

### `unreal.MassLookAtPriority`
Inherits: `StructBase` | Header: `MassLookAtTypes.h`

Struct used as a priority selector exposed to the Editor

### `unreal.MassLookAtRequestHandle`
Inherits: `StructBase` | Header: `MassLookAtSubsystem.h`

Mass Look at Request Handle

### `unreal.MassLookAtSubsystem`
Inherits: `MassTickableSubsystemBase` | Header: `MassLookAtSubsystem.h`

Subsystem that keeps track of the LookAt targets

**Methods** (4):
  - `create_look_at_actor_request(viewer_actor, priority, target_actor, interpolation_speed = MassLookAtInterpolationSpeed.REGULAR, custom_interpolation_speed = 1.500000)` -> `MassLookAtRequestHandle` — Creates a new LookAt request using the provided parameters for the mass entity associated to âViewerActorâ, if any.
  - `create_look_at_position_request(viewer_actor, priority, target_location, interpolation_speed = MassLookAtInterpolationSpeed.REGULAR, custom_interpolation_speed = 1.500000)` -> `MassLookAtRequestHandle` — Creates a new LookAt request using the provided parameters for the mass entity associated to âViewerActorâ, if any.
  - `create_request(viewer_actor: Actor, priority: MassLookAtPriority, target_location: Vector, interpolation_speed: MassLookAtInterpolationSpeed = Ellipsis, custom_interpolation_speed: float = 1.5)` -> `MassLookAtRequestHandle` — deprecated: âcreate_requestâ was renamed to âcreate_look_at_position_requestâ.
  - `delete_request(request_handle)` -> `None` — Removes given request from the active LookAt requests. Method will log an error if it fails (e.g., invalid request handl...

### `unreal.MassLookAtTargetTrait`
Inherits: `MassEntityTraitBase` | Header: `MassLookAtTargetTrait.h`

Mass Look at Target Trait

### `unreal.MassLookAtTrait`
Inherits: `MassEntityTraitBase` | Header: `MassLookAtTrait.h`

Mass Look at Trait

### `unreal.MassStateTreeSchema`
Inherits: `StateTreeSchema` | Header: `MassStateTreeSchema.h`

StateTree for Mass behaviors.

### `unreal.MassStateTreeTrait`
Inherits: `MassEntityTraitBase` | Header: `MassStateTreeTrait.h`

Feature that adds StateTree execution functionality to a mass agent.

### `unreal.MassZoneGraphAnnotationTrait`
Inherits: `MassEntityTraitBase` | Header: `MassZoneGraphAnnotationTrait.h`

Mass Zone Graph Annotation Trait

### `unreal.MassLookAtInterpolationSpeed`
Inherits: `EnumBase` | Header: `MassLookAtTypes.h`

Enum representing the different interpolation speeds that can be used when assigning new LookAt targets

**Properties** (5):
  - `CUSTOM`: `MassLookAtInterpolationSpeed = Ellipsis` — 4
  - `FAST`: `MassLookAtInterpolationSpeed = Ellipsis` — 1
  - `INSTANT`: `MassLookAtInterpolationSpeed = Ellipsis` — 0
  - `REGULAR`: `MassLookAtInterpolationSpeed = Ellipsis` — 2
  - `SLOW`: `MassLookAtInterpolationSpeed = Ellipsis` — 3
