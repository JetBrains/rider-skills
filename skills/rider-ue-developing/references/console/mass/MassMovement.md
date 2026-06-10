# UE Python API — MassMovement Module

**7 types** from the `MassMovement` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MassMovementParameters`, `MassMovementStyleParameters`, `MassMovementStyleRef`, `MassMovementStyleSpeedParameters`, `MassMovementTrait`, `MassSimpleMovementTrait`, `MassVelocityRandomizerTrait`

---

## Classes

### `unreal.MassMovementParameters`
Inherits: `MassConstSharedFragment` | Header: `MassMovementFragments.h`

Parameters describing how this mass agent should move

### `unreal.MassMovementStyleParameters`
Inherits: `StructBase` | Header: `MassMovementTypes.h`

Movement style parameters. A movement style abstracts movement properties for specific style. Behaviors can refer to specific styles when handling speeds.

### `unreal.MassMovementStyleRef`
Inherits: `StructBase` | Header: `MassMovementTypes.h`

Reference to movement style in MassMovementSettings.

### `unreal.MassMovementStyleSpeedParameters`
Inherits: `StructBase` | Header: `MassMovementTypes.h`

Movement style consists of multiple speeds which are assigned to agents based on agents unique ID. Same speed is assigned consistently for the same ID.

### `unreal.MassMovementTrait`
Inherits: `MassEntityTraitBase` | Header: `MassMovementTrait.h`

Mass Movement Trait

### `unreal.MassSimpleMovementTrait`
Inherits: `MassEntityTraitBase` | Header: `MassSimpleMovementTrait.h`

Mass Simple Movement Trait

### `unreal.MassVelocityRandomizerTrait`
Inherits: `MassEntityTraitBase` | Header: `MassVelocityRandomizerTrait.h`

Mass Velocity Randomizer Trait
