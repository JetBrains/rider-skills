# UE Python API — AnimationWarpingRuntime Module

**22 types** from the `AnimationWarpingRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_FootPlacement`, `AnimNode_OffsetRootBone`, `AnimNode_OrientationWarping`, `AnimNode_OverrideRootMotion`, `AnimNode_SlopeWarping`, `AnimNode_Steering`, `AnimNode_StrideWarping`, `AnimNode_WarpTest`, `FootPlacemenLegDefinition`, `FootPlacementInterpolationSettings`, `FootPlacementPelvisSettings`, `FootPlacementPlantSettings`, `FootPlacementTraceSettings`, `SlopeWarpingFootDefinition`, `StrideWarpingFootDefinition`, `AnimationWarpingLibrary`, `ActorMovementCompensationMode`, `FootPlacementLockType`, `OffsetRootBone_CollisionTestingMode`, `OffsetRootBoneMode`, ... (22 total)

---

## Classes

### `unreal.AnimNode_FootPlacement`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_FootPlacement.h`

Anim Node Foot Placement

**Properties** (4):
  - `interpolation_settings`: `FootPlacementInterpolationSettings` — [Read-Write] (FootPlacementInterpolationSettings)
  - `pelvis_settings`: `FootPlacementPelvisSettings` — [Read-Write] (FootPlacementPelvisSettings)
  - `plant_settings`: `FootPlacementPlantSettings` — [Read-Write] (FootPlacementPlantSettings)
  - `trace_settings`: `FootPlacementTraceSettings` — [Read-Write] (FootPlacementTraceSettings)

### `unreal.AnimNode_OffsetRootBone`
Inherits: `AnimNode_Base` | Header: `AnimNode_OffsetRootBone.h`

Anim Node Offset Root Bone

**Properties** (1):
  - `source`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_OrientationWarping`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_OrientationWarping.h`

Maintains a look at direction for the upper body (orientation), while rotating the lower body to match capsule velocity direction Does nothing if the root motion velocity direction matches the desired...

**Properties** (11):
  - `current_anim_asset`: `AnimationAsset` — [Read-Write] Experimental. Animation Asset for incorporating root motion data. If âTargetTimeâ i...
  - `current_anim_asset_time`: `float` — [Read-Write] Experimental. Current playback time in seconds of the CurrentAnimAsset (float)
  - `locomotion_angle`: `float` — [Read-Write] The character locomotion angle (in degrees) relative to the specified RotationAxis
This...
  - `locomotion_angle_delta_threshold`: `float` — [Read-Write] Specifies an angle threshold to prevent erroneous over-rotation of the character, disab...
  - `locomotion_direction`: `Vector` — [Read-Write] The character movement direction vector in world space
When set, this vector is used to...
  - `manual_root_motion_velocity`: `Vector` — [Read-Write] (Vector)
  - `min_root_motion_speed_threshold`: `float` — [Read-Write] Minimum root motion speed required to apply orientation warping
This is useful to preve...
  - `orientation_angle`: `float` — [Read-Write] The desired orientation angle (in degrees) to warp by relative to the specified Rotatio...
  - `target_time`: `float` — [Read-Write] Experimental. Orientation warping should do nothing if root motion velocity directions ...
  - `warping_space`: `OrientationWarpingSpace` — [Read-Write] (OrientationWarpingSpace)
  - `warping_space_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.AnimNode_OverrideRootMotion`
Inherits: `AnimNode_Base` | Header: `AnimNode_OverrideRootMotion.h`

Anim Node Override Root Motion

**Properties** (1):
  - `source`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.AnimNode_SlopeWarping`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_SlopeWarping.h`

Anim Node Slope Warping

### `unreal.AnimNode_Steering`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_Steering.h`

Add procedural delta to the root motion attribute This is done via 2 techniques:

**Properties** (8):
  - `animated_target_time`: `float` — [Read-Write] The number of seconds in the future to sample the root motion to know how much this ani...
  - `current_anim_asset`: `AnimationAsset` — [Read-Write] Animation Asset for incorporating root motion data. If CurrentAnimAsset is set, and the...
  - `current_anim_asset_time`: `float` — [Read-Write] Current playback time in seconds of the CurrentAnimAsset (float)
  - `mirror_data_table`: `MirrorDataTable` — [Read-Write] If bMirrored is set, MirrorDataTable will be used for mirroring the CurrentAnimAsset du...
  - `mirrored`: `bool` — [Read-Write] True if input animation is mirrored (bool)
  - `procedural_target_time`: `float` — [Read-Write] The number of seconds in the future before we should roughly attempt reach the TargetOr...
  - `target_orientation`: `Quat` — [Read-Write] The Orientation to steer towards (Quat)
  - `target_time`: `float` — [Read-Write]
deprecated: Use Procedural target time for the correction time scale and AnimatedTarget...

### `unreal.AnimNode_StrideWarping`
Inherits: `AnimNode_SkeletalControlBase` | Header: `AnimNode_StrideWarping.h`

Anim Node Stride Warping

**Properties** (6):
  - `floor_normal_direction`: `WarpingVectorValue` — [Read-Write] Floor normal direction, this value will internally convert into a corresponding Compone...
  - `gravity_direction`: `WarpingVectorValue` — [Read-Write] Gravity direction, this value will internally convert into a corresponding Component-sp...
  - `locomotion_speed`: `float` — [Read-Write] Locomotion speed, specifying the current speed of the character
This will be used in th...
  - `min_root_motion_speed_threshold`: `float` — [Read-Write] Minimum root motion speed required to apply stride warping
This is useful to prevent un...
  - `stride_direction`: `Vector` — [Read-Write] Component-space stride direction
Example: A value of <1,0,0> will warp the leg stride a...
  - `stride_scale`: `float` — [Read-Write] Stride scale, specifying the amount of warping applied to the foot definitions
Example:...

### `unreal.AnimNode_WarpTest`
Inherits: `AnimNode_Base` | Header: `AnimNode_WarpTest.h`

Anim Node Warp Test

**Properties** (1):
  - `source`: `PoseLink` — [Read-Write] (PoseLink)

### `unreal.FootPlacemenLegDefinition`
Inherits: `StructBase` | Header: `AnimNode_FootPlacement.h`

Foot Placemen Leg Definition

### `unreal.FootPlacementInterpolationSettings`
Inherits: `StructBase` | Header: `AnimNode_FootPlacement.h`

Foot Placement Interpolation Settings

### `unreal.FootPlacementPelvisSettings`
Inherits: `StructBase` | Header: `AnimNode_FootPlacement.h`

Foot Placement Pelvis Settings

### `unreal.FootPlacementPlantSettings`
Inherits: `StructBase` | Header: `AnimNode_FootPlacement.h`

Foot Placement Plant Settings

### `unreal.FootPlacementTraceSettings`
Inherits: `StructBase` | Header: `AnimNode_FootPlacement.h`

Foot Placement Trace Settings

### `unreal.SlopeWarpingFootDefinition`
Inherits: `StructBase` | Header: `AnimNode_SlopeWarping.h`

Per foot definitions

### `unreal.StrideWarpingFootDefinition`
Inherits: `StructBase` | Header: `AnimNode_StrideWarping.h`

Foot definition specifying the IK/FK foot bones and Thigh bone

### `unreal.AnimationWarpingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimationWarpingLibrary.h`

Exposes operations related to Animation Warping

**Methods** (2):
  - `get_curve_value_from_animation(animation, curve_name, time)` -> `float or None` [classmethod] — Helper function to extract the value of a curve in an animation at a given time
  - `get_offset_root_transform(node)` -> `Transform` [classmethod] — Get the current world space transform from the offset root bone animgraph node

### `unreal.ActorMovementCompensationMode`
Inherits: `EnumBase` | Header: `AnimNode_FootPlacement.h`

EActor Movement Compensation Mode

**Properties** (3):
  - `COMPONENT_SPACE`: `ActorMovementCompensationMode = Ellipsis` — Keep pelvis component-space and follow along all of the actorâs vertical ground movement. Use when...
  - `SUDDEN_MOTION_ONLY`: `ActorMovementCompensationMode = Ellipsis` — Keep pelvis component-space, but hold world-space transform when the actor does sudden changes (i.e....
  - `WORLD_SPACE`: `ActorMovementCompensationMode = Ellipsis` — Hold pelvis world-space and ignore the actorâs vertical ground movement. Let springs interpolate t...

### `unreal.FootPlacementLockType`
Inherits: `EnumBase` | Header: `AnimNode_FootPlacement.h`

EFoot Placement Lock Type

**Properties** (4):
  - `LOCK_ROTATION`: `FootPlacementLockType = Ellipsis` — Foot is fully locked. Useful for bigger/mechanical creatures 3
  - `PIVOT_AROUND_ANKLE`: `FootPlacementLockType = Ellipsis` — Foot can lock, and will pivot around the ankle/foot bone. 2
  - `PIVOT_AROUND_BALL`: `FootPlacementLockType = Ellipsis` — Foot can lock, and will pivot around its ball/toes. 1
  - `UNLOCKED`: `FootPlacementLockType = Ellipsis` — Foot is unlocked but free to move 0

### `unreal.OffsetRootBone_CollisionTestingMode`
Inherits: `EnumBase` | Header: `AnimNode_OffsetRootBone.h`

EOffset Root Bone Collision Testing Mode

**Properties** (3):
  - `DISABLED`: `OffsetRootBone_CollisionTestingMode = Ellipsis` — No Collision testing 0
  - `PLANAR_COLLISION`: `OffsetRootBone_CollisionTestingMode = Ellipsis` — Slide along a plane based on shape cast contact point 2
  - `SHRINK_MAX_TRANSLATION`: `OffsetRootBone_CollisionTestingMode = Ellipsis` — Reduce effective Max Translation offset to prevent penetration with nearby obstacles 1

### `unreal.OffsetRootBoneMode`
Inherits: `EnumBase` | Header: `AnimNode_OffsetRootBone.h`

EOffset Root Bone Mode

**Properties** (6):
  - `ACCUMULATE`: `OffsetRootBoneMode = Ellipsis` — Accumulate the mesh componentâs movement into the offset.
In this mode, if the mesh component move...
  - `INTERPOLATE`: `OffsetRootBoneMode = Ellipsis` — Continuously interpolate the offset out
In this mode, if the mesh component moves
The root will stay...
  - `LOCK_OFFSET_AND_CONSUME_ANIMATION`: `OffsetRootBoneMode = Ellipsis` — Stops accumulating the mesh componentâs movement delta into the root offset
In this mode, whatever...
  - `LOCK_OFFSET_AND_IGNORE_ANIMATION`: `OffsetRootBoneMode = Ellipsis` — Stops accumulating the mesh componentâs movement delta into the root offset
In this mode, whatever...
  - `LOCK_OFFSET_INCREASE_AND_CONSUME_ANIMATION`: `OffsetRootBoneMode = Ellipsis` — Stops accumulating the mesh componentâs movement delta into the root offset
In this mode, whatever...
  - `RELEASE`: `OffsetRootBoneMode = Ellipsis` — Release the offset and stop accumulating the mesh componentâs movement delta.
In this mode we will...

### `unreal.OrientationWarpingSpace`
Inherits: `EnumBase` | Header: `AnimNode_OrientationWarping.h`

EOrientation Warping Space

**Properties** (3):
  - `COMPONENT_TRANSFORM`: `OrientationWarpingSpace = Ellipsis` — apply warping relative to current component transform 0
  - `CUSTOM_TRANSFORM`: `OrientationWarpingSpace = Ellipsis` — Provide a custom transform pin 2
  - `ROOT_BONE_TRANSFORM`: `OrientationWarpingSpace = Ellipsis` — Apply warping relative to previous frameâs root bone transform. Use this mode when using an Offset...

### `unreal.PelvisHeightMode`
Inherits: `EnumBase` | Header: `AnimNode_FootPlacement.h`

EPelvis Height Mode

**Properties** (3):
  - `ALL_LEGS`: `PelvisHeightMode = Ellipsis` — Consider all legs for pelvis height, whether theyâre planted or not
Generally good for flat/not to...
  - `ALL_PLANTED_FEET`: `PelvisHeightMode = Ellipsis` — Consider only the planted feet when calculating pelvis height
Generally good we pelvis height to be ...
  - `FRONT_PLANTED_FEET_UPHILL_FRONT_FEET_DOWNHILL`: `PelvisHeightMode = Ellipsis` — When moving uphill, use the front foot, as long as itâs planted.
Itâs recommended to also enable...
