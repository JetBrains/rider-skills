# UE Python API — AnimationModifierLibrary Module

**18 types** from the `AnimationModifierLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BoneReferencePair`, `EncodeRootBoneWeightedBone`, `EncodeRootBoneWeightedBoneAxis`, `FootDefinition`, `CopyBonesModifier`, `EncodeRootBoneModifier`, `FootstepAnimEventsModifier`, `MirrorModifier`, `MotionExtractorModifier`, `MotionExtractorUtilityLibrary`, `ReOrientRootBoneModifier`, `ZeroOutRootBoneModifier`, `DetectionTechnique`, `EncodeRootBoneAxis`, `MotionExtractor_Axis`, `MotionExtractor_MathOperation`, `MotionExtractor_MotionType`, `MotionExtractor_Space`

---

## Classes

### `unreal.BoneReferencePair`
Inherits: `StructBase` | Header: `CopyBonesModifier.h`

Bone Reference Pair

### `unreal.EncodeRootBoneWeightedBone`
Inherits: `StructBase` | Header: `EncodeRootBoneModifier.h`

Encode Root Bone Weighted Bone

### `unreal.EncodeRootBoneWeightedBoneAxis`
Inherits: `EncodeRootBoneWeightedBone` | Header: `EncodeRootBoneModifier.h`

Encode Root Bone Weighted Bone Axis

### `unreal.FootDefinition`
Inherits: `StructBase` | Header: `FootstepAnimEventsModifier.h`

Foot Definition

**Properties** (1):
  - `reference_bone_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.CopyBonesModifier`
Inherits: `AnimationModifier` | Header: `CopyBonesModifier.h`

Animation Modifier to copy the transform of âSourceBone(s)â to âTargetBone(s)â

**Properties** (2):
  - `bone_pairs`: `None` [Read-Only] — [Read-Only] Source and Target bone pairs (Array[BoneReferencePair])
  - `bone_pose_space`: `AnimPoseSpaces` [Read-Only] — [Read-Only] Space to convert SourceBone transforms into before copying them to TargetBone (AnimPoseS...

### `unreal.EncodeRootBoneModifier`
Inherits: `AnimationModifier` | Header: `EncodeRootBoneModifier.h`

Encode Root Bone Modifier

### `unreal.FootstepAnimEventsModifier`
Inherits: `AnimationModifier` | Header: `FootstepAnimEventsModifier.h`

Generates animation notifies and/or sync markers for any specified bone(s)

**Properties** (5):
  - `foot_definitions`: `None` [Read-Only] — [Read-Only] Foot bone(s) to be processed (Array[FootDefinition])
  - `ground_threshold`: `float` [Read-Only] — [Read-Only] Threshold for determining if a foot bone position can be considered to be on the ground ...
  - `sample_rate`: `int` [Read-Only] — [Read-Only] Rate used to sample the animation (int32)
  - `should_remove_pre_existing_notifies_or_sync_markers`: `bool` [Read-Only] — [Read-Only] If true, applying the anim modifier becomes a destructive action, meaning that any exist...
  - `speed_threshold`: `float` [Read-Only] — [Read-Only] Threshold to start finding the smallest foot bone translation speed. Note that the foot ...

### `unreal.MirrorModifier`
Inherits: `AnimationModifier` | Header: `MirrorModifier.h`

Animation Modifier to mirror an animation using a mirror data table

### `unreal.MotionExtractorModifier`
Inherits: `AnimationModifier` | Header: `MotionExtractorModifier.h`

Extracts motion from a bone in the animation and bakes it into a curve

**Properties** (13):
  - `absolute_value`: `bool` — [Read-Write] Whether to convert the final value to absolute (positive) (bool)
  - `axis`: `MotionExtractor_Axis` — [Read-Write] Axis to get the value from (MotionExtractor_Axis)
  - `bone_name`: `Name` — [Read-Write] Bone we are going to generate the curve from (Name)
  - `custom_curve_name`: `Name` — [Read-Write] Custom name for the curve we are going to generate. (Name)
  - `math_operation`: `MotionExtractor_MathOperation` — [Read-Write] Optional math operation to apply on the extracted value before add it to the generated ...
  - `modifier`: `float` — [Read-Write] Right operand for the math operation selected (float)
  - `motion_type`: `MotionExtractor_MotionType` — [Read-Write] Type of motion to extract (MotionExtractor_MotionType)
  - `normalize`: `bool` — [Read-Write] Whether we want a normalized value (0 - 1) (bool)
  - `relative_to_bone_name`: `Name` — [Read-Write] Bone which weâll use as the reference frame to generate this curve from. Space must b...
  - `relative_to_first_frame`: `bool` — [Read-Write] Whether to extract the bone transforms relative to the first frame in the animation (bo...
  - `remove_curve_on_revert`: `bool` — [Read-Write] Whether we want to remove the curve when we revert or re-apply modifier
Disabling this ...
  - `space`: `MotionExtractor_Space` — [Read-Write] Reference frame/space to use when extracting the bone pose. (MotionExtractor_Space)
  - `use_custom_curve_name`: `bool` — [Read-Write] Whether we want to specify a custom name for the curve. If false, the name of the curve...

### `unreal.MotionExtractorUtilityLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MotionExtractorUtilities.h`

Motion Extractor Utility Library

**Methods** (4):
  - `generate_curve_name(bone_name, motion_type, axis)` -> `Name` [classmethod] — Generates a curve name based on input settings.
  - `get_desired_value(bone_transform, last_bone_transform, delta_time, motion_type, axis)` -> `float` [classmethod] — Returns the desired value from the extracted poses based on input settings.
  - `get_moving_ranges_from_root_motion(anim_sequence, stop_speed_threshold = 10.000000, sample_rate = 120.000000)` -> `Array [ Vector2D ]` [classmethod] — Returns the ranges (X/Start to Y/End) in the specified animation sequence where the animation is considered moving.
  - `get_stopped_ranges_from_root_motion(anim_sequence, stop_speed_threshold = 10.000000, sample_rate = 120.000000)` -> `Array [ Vector2D ]` [classmethod] — Returns the ranges (X/Start to Y/End) in the specified animation sequence where the animation is considered stopped.

### `unreal.ReOrientRootBoneModifier`
Inherits: `AnimationModifier` | Header: `ReOrientRootBoneModifier.h`

Reorient root bone in the animation while maintaining mesh position and rotation

**Properties** (1):
  - `rotator`: `Rotator` [Read-Only] — [Read-Only] Rotation to apply to the root (Rotator)

### `unreal.ZeroOutRootBoneModifier`
Inherits: `AnimationModifier` | Header: `ZeroOutRootBoneModifier.h`

**Properties** (2):
  - `clip_end_frames_with_no_motion`: `bool` [Read-Only] — [Read-Only] Clip frames at the end of the animation that have no root motion. (bool)
  - `clip_start_frames_with_no_motion`: `bool` [Read-Only] — [Read-Only] Clip frames at the start of the animation that have no root motion. (bool)

### `unreal.DetectionTechnique`
Inherits: `EnumBase` | Header: `FootstepAnimEventsModifier.h`

Detection method used for placing a notify / marker in the track

**Properties** (3):
  - `FOOT_BONE_REACHES_GROUND`: `DetectionTechnique = Ellipsis` — Create anim event when foot bone reaches the ground level within a given threshold. Note that this w...
  - `FOOT_BONE_SPEED`: `DetectionTechnique = Ellipsis` — Create anim event when foot bone translation speed is below a given threshold and nearly zero. Note ...
  - `PASS_THROUGH_REFERENCE_BONE`: `DetectionTechnique = Ellipsis` — Create anim event when foot bone passes through a given reference bone. Note that the translation ve...

### `unreal.EncodeRootBoneAxis`
Inherits: `EnumBase` | Header: `EncodeRootBoneModifier.h`

EEncode Root Bone Axis

**Properties** (3):
  - `X`: `EncodeRootBoneAxis = Ellipsis` — 0
  - `Y`: `EncodeRootBoneAxis = Ellipsis` — 1
  - `Z`: `EncodeRootBoneAxis = Ellipsis` — 2

### `unreal.MotionExtractor_Axis`
Inherits: `EnumBase` | Header: `MotionExtractorTypes.h`

Axis to get the final value from

**Properties** (7):
  - `X`: `MotionExtractor_Axis = Ellipsis` — 0
  - `XY`: `MotionExtractor_Axis = Ellipsis` — 3
  - `XYZ`: `MotionExtractor_Axis = Ellipsis` — 6
  - `XZ`: `MotionExtractor_Axis = Ellipsis` — 4
  - `Y`: `MotionExtractor_Axis = Ellipsis` — 1
  - `YZ`: `MotionExtractor_Axis = Ellipsis` — 5
  - `Z`: `MotionExtractor_Axis = Ellipsis` — 2

### `unreal.MotionExtractor_MathOperation`
Inherits: `EnumBase` | Header: `MotionExtractorTypes.h`

Math operations that can be applied to the extracted value before add it to the curve

**Properties** (5):
  - `ADDITION`: `MotionExtractor_MathOperation = Ellipsis` — 1
  - `DIVISION`: `MotionExtractor_MathOperation = Ellipsis` — 3
  - `MULTIPLICATION`: `MotionExtractor_MathOperation = Ellipsis` — 4
  - `NONE`: `MotionExtractor_MathOperation = Ellipsis` — 0
  - `SUBTRACTION`: `MotionExtractor_MathOperation = Ellipsis` — 2

### `unreal.MotionExtractor_MotionType`
Inherits: `EnumBase` | Header: `MotionExtractorTypes.h`

Type of motion to extract

**Properties** (5):
  - `ROTATION`: `MotionExtractor_MotionType = Ellipsis` — 2
  - `ROTATION_SPEED`: `MotionExtractor_MotionType = Ellipsis` — 16
  - `SCALE`: `MotionExtractor_MotionType = Ellipsis` — 4
  - `TRANSLATION`: `MotionExtractor_MotionType = Ellipsis` — 1
  - `TRANSLATION_SPEED`: `MotionExtractor_MotionType = Ellipsis` — 8

### `unreal.MotionExtractor_Space`
Inherits: `EnumBase` | Header: `MotionExtractorTypes.h`

Reference frame/space to use when calculating motion

**Properties** (3):
  - `COMPONENT_SPACE`: `MotionExtractor_Space = Ellipsis` — 0
  - `LOCAL_SPACE`: `MotionExtractor_Space = Ellipsis` — 1
  - `RELATIVE_TO_BONE`: `MotionExtractor_Space = Ellipsis` — 2
