# UE Python API — EvaluationNotifiesRuntime Module

**9 types** from the `EvaluationNotifiesRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AlignmentSteeringSettings`, `AlignmentWarpCurve`, `AnimNode_EvaluationNotifies`, `NotifyState_Alignment`, `NotifyState_AlignmentBase`, `NotifyState_AlignToGround`, `NotifyState_TwoBoneIK`, `AlignmentUpdateMode`, `AlignmentWeightCurveType`

---

## Classes

### `unreal.AlignmentSteeringSettings`
Inherits: `StructBase` | Header: `AnimNotifyState_Alignment.h`

Alignment Steering Settings

### `unreal.AlignmentWarpCurve`
Inherits: `StructBase` | Header: `AnimNotifyState_Alignment.h`

Alignment Warp Curve

### `unreal.AnimNode_EvaluationNotifies`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_EvaluationNotifies.h`

add procedural delta to the root motion attribute

**Properties** (5):
  - `current_anim_asset`: `AnimationAsset` — [Read-Write] Animation Asset for incorporating root motion data. If CurrentAnimAsset is set, and the...
  - `current_anim_asset_mirrored`: `bool` — [Read-Write] Is the current anim asset mirrored (bool)
  - `current_anim_asset_time`: `float` — [Read-Write] Current playback time in seconds of the CurrentAnimAsset (float)
  - `mirror_data_table`: `MirrorDataTable` — [Read-Write] If bMirrored is set, MirrorDataTable will be used for mirroring the CurrentAnimAsset du...
  - `named_transforms`: `None` — [Read-Write] Current playback time in seconds of the CurrentAnimAsset (Map[Name,Transform])

### `unreal.NotifyState_Alignment`
Inherits: `NotifyState_AlignmentBase` | Header: `AnimNotifyState_Alignment.h`

Notify State Alignment

**Methods** (1):
  - `set_transform_name(new_name)` -> `None` — Set Transform Name

### `unreal.NotifyState_AlignmentBase`
Inherits: `AnimNotifyState` | Header: `AnimNotifyState_Alignment.h`

Notify State Alignment Base

**Methods** (1):
  - `set_align_offset(new_transform)` -> `None` — For automating setting the AlignOffset at the end of the NotifyState

### `unreal.NotifyState_AlignToGround`
Inherits: `NotifyState_AlignmentBase` | Header: `AnimNotifyState_Alignment.h`

Notify State Align to Ground

### `unreal.NotifyState_TwoBoneIK`
Inherits: `AnimNotifyState` | Header: `AnimNotifyState_TwoBoneIK.h`

Notify State Two Bone IK

**Properties** (3):
  - `effector_location`: `Vector` [Read-Only] — [Read-Only] Effector Location. Target Location to reach. (Vector)
  - `effector_location_transform_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `joint_target_location`: `Vector` [Read-Only] — [Read-Only] Joint Target Location. Location used to orient Joint bone. * (Vector)

### `unreal.AlignmentUpdateMode`
Inherits: `EnumBase` | Header: `AnimNotifyState_Alignment.h`

EAlignment Update Mode

**Properties** (2):
  - `RELATIVE`: `AlignmentUpdateMode = Ellipsis` — each frame, apply the root motion from the alignment path relative to the previous frame 1
  - `WORLD`: `AlignmentUpdateMode = Ellipsis` — each frame, apply root motion to get to the expected part of the alignment path in wold space 0

### `unreal.AlignmentWeightCurveType`
Inherits: `EnumBase` | Header: `AnimNotifyState_Alignment.h`

EAlignment Weight Curve Type

**Properties** (8):
  - `DO_NOT_WARP`: `AlignmentWeightCurveType = Ellipsis` — 7
  - `EASE_IN`: `AlignmentWeightCurveType = Ellipsis` — 3
  - `EASE_IN_OUT`: `AlignmentWeightCurveType = Ellipsis` — 5
  - `EASE_OUT`: `AlignmentWeightCurveType = Ellipsis` — 4
  - `FROM_ROOT_MOTION_ROTATION`: `AlignmentWeightCurveType = Ellipsis` — 1
  - `FROM_ROOT_MOTION_TRANSLATION`: `AlignmentWeightCurveType = Ellipsis` — 0
  - `INSTANT`: `AlignmentWeightCurveType = Ellipsis` — 6
  - `LINEAR`: `AlignmentWeightCurveType = Ellipsis` — 2
