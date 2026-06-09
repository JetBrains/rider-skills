# UE Python API — ApexDestruction Module

**13 types** from the `ApexDestruction` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DestructibleAdvancedParameters`, `DestructibleDamageParameters`, `DestructibleDebrisParameters`, `DestructibleDepthParameters`, `DestructibleParameters`, `DestructibleParametersFlag`, `DestructibleSpecialHierarchyDepths`, `DestructibleActor`, `DestructibleComponent`, `DestructibleMesh`, `ImpactDamageOverride`, `ActorFractureSignature`, `ComponentFractureSignature`

---

## Classes

### `unreal.DestructibleAdvancedParameters`
Inherits: `StructBase` | Header: `DestructibleMesh.h`

Parameters that are less-often used.

### `unreal.DestructibleDamageParameters`
Inherits: `StructBase` | Header: `DestructibleMesh.h`

Parameters that pertain to chunk damage.

### `unreal.DestructibleDebrisParameters`
Inherits: `StructBase` | Header: `DestructibleMesh.h`

Parameters that pertain to chunk debris-level settings.

### `unreal.DestructibleDepthParameters`
Inherits: `StructBase` | Header: `DestructibleMesh.h`

Properties that may be set for all chunks at a particular depth in the fracture hierarchy.

### `unreal.DestructibleParameters`
Inherits: `StructBase` | Header: `DestructibleMesh.h`

Parameters that apply to a destructible actor.

### `unreal.DestructibleParametersFlag`
Inherits: `StructBase` | Header: `DestructibleMesh.h`

Flags that apply to a destructible actor.

### `unreal.DestructibleSpecialHierarchyDepths`
Inherits: `StructBase` | Header: `DestructibleMesh.h`

Special hierarchy depths for various behaviors.

### `unreal.DestructibleActor`
Inherits: `Actor` | Header: `DestructibleActor.h`

Destructible Actor

**Properties** (3):
  - `affect_navigation`: `bool` — [Read-Write] (bool)
  - `destructible_component`: `DestructibleComponent` [Read-Only] — [Read-Only] (DestructibleComponent)
  - `on_actor_fracture`: `ActorFractureSignature` — [Read-Write] (ActorFractureSignature)

### `unreal.DestructibleComponent`
Inherits: `SkinnedMeshComponent` | Header: `DestructibleComponent.h`

Destructible Component

**Methods** (2):
  - `apply_damage(damage_amount, hit_location, impulse_dir, impulse_strength)` -> `None` — Take damage
  - `apply_radius_damage(base_damage, hurt_origin, damage_radius, impulse_strength, full_damage)` -> `None` — Take radius damage

**Properties** (6):
  - `destructible_mesh`: `DestructibleMesh` — [Read-Write]
deprecated: Property âDestructibleMeshâ is deprecated. (DestructibleMesh)
  - `enable_hard_sleeping`: `bool` — [Read-Write] Enable âhard sleepingâ for destruction-generated PxActors.  This means that they tu...
  - `fracture_effect_override`: `bool` — [Read-Write] If set, use this actorâs fracture effects instead of the assetâs fracture effects. ...
  - `fracture_effects`: `None` [Read-Only] — [Read-Only] Fracture effects for each fracture level. Used only if Fracture Effect Override is set. ...
  - `large_chunk_threshold`: `float` — [Read-Write] The minimum size required to treat chunks as Large. (float)
  - `on_component_fracture`: `ComponentFractureSignature` — [Read-Write] Called when a component is touched (ComponentFractureSignature)

### `unreal.DestructibleMesh`
Inherits: `SkeletalMesh` | Header: `DestructibleMesh.h`

Holds an APEX destructible asset as well as an associated USkeletalMesh.

### `unreal.ImpactDamageOverride`
Inherits: `EnumBase` | Header: `DestructibleMesh.h`

Chunks up to the depth DefaultImpactDamageDepth will take impact damage, unless IDO_On or IDO_Off is chosen.

**Properties** (3):
  - `IDO_NONE`: `ImpactDamageOverride = Ellipsis` — 0
  - `IDO_OFF`: `ImpactDamageOverride = Ellipsis` — 2
  - `IDO_ON`: `ImpactDamageOverride = Ellipsis` — 1

### `unreal.ActorFractureSignature`
Inherits: `MulticastDelegateBase` | Header: `DestructibleActor.h`

Delegate for notification when fracture occurs

### `unreal.ComponentFractureSignature`
Inherits: `MulticastDelegateBase` | Header: `DestructibleComponent.h`

Delegate for notification when fracture occurs
