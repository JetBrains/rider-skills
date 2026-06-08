# UE Python API — MetaHumanCharacterEditor Module

**8 types** from the `MetaHumanCharacterEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanCharacterSkinMaterialOverrideRow`, `MetaHumanTemplateAnimationRow`, `MetaHumanCharacterAnimInstance`, `MetaHumanCharacterEditorActor`, `MetaHumanCharacterEnvironmentBackground`, `MetaHumanCharacterEnvironmentLightRig`, `MetaHumanCharacterFactoryNew`, `MetaHumanInvisibleDrivingActor`

---

## Classes

### `unreal.MetaHumanCharacterSkinMaterialOverrideRow`
Inherits: `TableRowBase` | Header: `MetaHumanCharacterSkinMaterials.h`

MetaHuman Character Skin Material Override Row

### `unreal.MetaHumanTemplateAnimationRow`
Inherits: `TableRowBase` | Header: `SMetaHumanCharacterEditorPreviewSettingsView.h`

MetaHuman Template Animation Row

**Properties** (2):
  - `body_animation`: `AnimSequence` — [Read-Write] (AnimSequence)
  - `face_animation`: `AnimSequence` — [Read-Write] (AnimSequence)

### `unreal.MetaHumanCharacterAnimInstance`
Inherits: `AnimInstance` | Header: `MetaHumanCharacterAnimInstance.h`

MetaHuman Character Anim Instance

**Properties** (8):
  - `current_play_time`: `float` — [Read-Write] (float)
  - `is_animation_playing`: `bool` — [Read-Write] (bool)
  - `is_paused`: `bool` — [Read-Write] (bool)
  - `is_scrubbing`: `bool` — [Read-Write] (bool)
  - `number_of_keys`: `int` — [Read-Write] (int32)
  - `play_rate`: `float` — [Read-Write] (float)
  - `primary_animation`: `AnimSequence` — [Read-Write] (AnimSequence)
  - `secondary_animation`: `AnimSequence` — [Read-Write] (AnimSequence)

### `unreal.MetaHumanCharacterEditorActor`
Inherits: `Actor` | Header: `MetaHumanCharacterEditorActor.h`

A simple actor that represents a MetaHuman in the Character Editor Viewport.

**Properties** (6):
  - `body_component`: `SkeletalMeshComponent` [Read-Only] — [Read-Only] (SkeletalMeshComponent)
  - `character_instance`: `MetaHumanCharacterInstance` [Read-Only] — [Read-Only] (MetaHumanCharacterInstance)
  - `face_component`: `SkeletalMeshComponent` [Read-Only] — [Read-Only] (SkeletalMeshComponent)
  - `ik_retargeter`: `IKRetargeter` [Read-Only] — [Read-Only] IK retargeter used by the retarget component. (IKRetargeter)
  - `lod_sync_component`: `LODSyncComponent` [Read-Only] — [Read-Only] (LODSyncComponent)
  - `retarget_component`: `RetargetComponent` [Read-Only] — [Read-Only] Retarget component used to read poses from another actorâs skeletal mesh to retarget i...

### `unreal.MetaHumanCharacterEnvironmentBackground`
Inherits: `Interface` | Header: `MetaHumanCharacterEnvironmentLightRig.h`

MetaHuman Character Environment Background

**Methods** (1):
  - `set_background_color(background_color)` -> `None` — Set Background Color

### `unreal.MetaHumanCharacterEnvironmentLightRig`
Inherits: `Interface` | Header: `MetaHumanCharacterEnvironmentLightRig.h`

MetaHuman Character Environment Light Rig

**Methods** (1):
  - `set_rotation(rotation)` -> `None` — Sets the rotation of the light rig

### `unreal.MetaHumanCharacterFactoryNew`
Inherits: `Factory` | Header: `MetaHumanCharacterFactoryNew.h`

MetaHuman Character Factory New

### `unreal.MetaHumanInvisibleDrivingActor`
Inherits: `SkeletalMeshActor` | Header: `MetaHumanInvisibleDrivingActor.h`

MetaHuman Invisible Driving Actor
