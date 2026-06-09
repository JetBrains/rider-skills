# UE Python API — MassActors Module

**7 types** from the `MassActors` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MassActorPoolableInterface`, `MassAgentCapsuleCollisionSyncTrait`, `MassAgentComponent`, `MassAgentFeetLocationSyncTrait`, `MassAgentMovementSyncTrait`, `MassAgentOrientationSyncTrait`, `MassAgentSyncTrait`

---

## Classes

### `unreal.MassActorPoolableInterface`
Inherits: `Interface` | Header: `MassActorPoolableInterface.h`

Mass Actor Poolable Interface

**Methods** (3):
  - `can_be_pooled()` -> `bool` — Can be Pooled
  - `prepare_for_game()` -> `None` — Prepare for Game
  - `prepare_for_pooling()` -> `None` — Prepare for Pooling

### `unreal.MassAgentCapsuleCollisionSyncTrait`
Inherits: `MassAgentSyncTrait` | Header: `MassAgentTraits.h`

The trait initializes the entity with actor capsule componentâs radius. In addition, if bSyncTransform is true the trait keeps actor capsule componentâs and entityâs transforms in sync.

### `unreal.MassAgentComponent`
Inherits: `ActorComponent` | Header: `MassAgentComponent.h`

There are two primary use cases for this component: 1. If placed on an AActor blueprint it lets the user specify additional fragments that will be created for

**Methods** (3):
  - `disable()` -> `None` — Registers the component with the owner effectively turning it off
  - `enable()` -> `None` — Registers the component with the owner effectively turning it on. Calling it multiple times wonât break anything
  - `kill_entity(destroy_actor)` -> `None` — Kill Entity

### `unreal.MassAgentFeetLocationSyncTrait`
Inherits: `MassAgentSyncTrait` | Header: `MassAgentTraits.h`

Mass Agent Feet Location Sync Trait

### `unreal.MassAgentMovementSyncTrait`
Inherits: `MassAgentSyncTrait` | Header: `MassAgentTraits.h`

Mass Agent Movement Sync Trait

### `unreal.MassAgentOrientationSyncTrait`
Inherits: `MassAgentSyncTrait` | Header: `MassAgentTraits.h`

Mass Agent Orientation Sync Trait

### `unreal.MassAgentSyncTrait`
Inherits: `MassEntityTraitBase` | Header: `MassAgentTraits.h`

Mass Agent Sync Trait
