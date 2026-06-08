# UE Python API — AnimationSharing Module

**11 types** from the `AnimationSharing` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimationSetup`, `AnimationSharingScalability`, `AnimationStateEntry`, `PerSkeletonAnimationSharingSetup`, `AnimationSharingManager`, `AnimationSharingSetup`, `AnimationSharingStateProcessor`, `AnimSharingAdditiveInstance`, `AnimSharingInstance`, `AnimSharingStateInstance`, `AnimSharingTransitionInstance`

---

## Classes

### `unreal.AnimationSetup`
Inherits: `StructBase` | Header: `AnimationSharingTypes.h`

Animation Setup

### `unreal.AnimationSharingScalability`
Inherits: `StructBase` | Header: `AnimationSharingTypes.h`

Animation Sharing Scalability

### `unreal.AnimationStateEntry`
Inherits: `StructBase` | Header: `AnimationSharingTypes.h`

Animation State Entry

### `unreal.PerSkeletonAnimationSharingSetup`
Inherits: `StructBase` | Header: `AnimationSharingTypes.h`

Per Skeleton Animation Sharing Setup

### `unreal.AnimationSharingManager`
Inherits: `Object` | Header: `AnimationSharingManager.h`

Animation Sharing Manager

**Methods** (4):
  - `animation_sharing_enabled()` -> `bool` [classmethod] — Returns whether or not the animation sharing is enabled
  - `create_animation_sharing_manager(world_context_object, setup)` -> `bool` [classmethod] — Create an Animation Sharing Manager using the provided Setup
  - `get_animation_sharing_manager(world_context_object)` -> `AnimationSharingManager` [classmethod] — Returns the AnimationSharing Manager, nullptr if none was set up
  - `register_actor_with_skeleton_bp(actor, sharing_skeleton)` -> `None` — Register an Actor with this Animation Sharing manager, according to the SharingSkeleton

### `unreal.AnimationSharingSetup`
Inherits: `Object` | Header: `AnimationSharingSetup.h`

The Animation Sharing Setup asset contains all the information that will be shared across the specified Actors

### `unreal.AnimationSharingStateProcessor`
Inherits: `Object` | Header: `AnimationSharingTypes.h`

Animation Sharing State Processor

**Methods** (2):
  - `get_animation_state_enum()` -> `Enum` — Get Animation State Enum
  - `process_actor_state(actor, current_state, should_process=bool)` — Process Actor State

### `unreal.AnimSharingAdditiveInstance`
Inherits: `AnimInstance` | Header: `AnimationSharingInstances.h`

Anim Sharing Additive Instance

**Properties** (4):
  - `additive_animation`: `AnimSequence` [Read-Only] — [Read-Only] (AnimSequence)
  - `alpha`: `float` [Read-Only] — [Read-Only] (float)
  - `base_component`: `SkeletalMeshComponent` [Read-Only] — [Read-Only] (SkeletalMeshComponent)
  - `state_bool`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.AnimSharingInstance`
Inherits: `Object` | Header: `AnimationSharingManager.h`

Anim Sharing Instance

### `unreal.AnimSharingStateInstance`
Inherits: `AnimInstance` | Header: `AnimationSharingInstances.h`

Anim Sharing State Instance

**Methods** (1):
  - `get_instanced_actors()` -> `Array [ Actor ]` — Get Instanced Actors

**Properties** (4):
  - `animation_to_play`: `AnimSequence` [Read-Only] — [Read-Only] (AnimSequence)
  - `permutation_time_offset`: `float` [Read-Only] — [Read-Only] (float)
  - `play_rate`: `float` [Read-Only] — [Read-Only] (float)
  - `state_bool`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.AnimSharingTransitionInstance`
Inherits: `AnimInstance` | Header: `AnimationSharingInstances.h`

Anim Sharing Transition Instance

**Properties** (4):
  - `blend_bool`: `bool` [Read-Only] — [Read-Only] (bool)
  - `blend_time`: `float` [Read-Only] — [Read-Only] (float)
  - `from_component`: `SkeletalMeshComponent` [Read-Only] — [Read-Only] (SkeletalMeshComponent)
  - `to_component`: `SkeletalMeshComponent` [Read-Only] — [Read-Only] (SkeletalMeshComponent)
