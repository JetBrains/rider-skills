# UE Python API — MotionWarping Module

**31 types** from the `MotionWarping` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MotionWarpingTarget`, `MotionWarpingWindowData`, `SwitchOffConditionData`, `AnimNotifyState_MotionWarping`, `AttributeBasedRootMotionComponent`, `MotionWarpingComponent`, `MotionWarpingSwitchOffAngleToTargetCondition`, `MotionWarpingSwitchOffBlueprintableCondition`, `MotionWarpingSwitchOffCompositeCondition`, `MotionWarpingSwitchOffCondition`, `MotionWarpingSwitchOffDistanceCondition`, `MotionWarpingUtilities`, `RootMotionModifier`, `RootMotionModifier_AdjustmentBlendWarp`, `RootMotionModifier_Scale`, `RootMotionModifier_SimpleWarp`, `RootMotionModifier_SkewWarp`, `RootMotionModifier_Warp`, `AttributeBasedRootMotionMode`, `MotionWarpRotationMethod`, ... (31 total)

---

## Classes

### `unreal.MotionWarpingTarget`
Inherits: `StructBase` | Header: `RootMotionModifier.h`

Represents a point of alignment in the world

**Properties** (10):
  - `avatar_actor`: `Actor` — [Read-Write] Optional Actor that uses this warping target. Used for offset calculation of target tra...
  - `bone_name`: `Name` — [Read-Write] Optional bone name in the component used to calculate the final target transform (Name)
  - `component`: `SceneComponent` — [Read-Write] Optional component used to calculate the final target transform (SceneComponent)
  - `follow_component`: `bool` — [Read-Write] Whether the target transform calculated from a component and an optional bone should be...
  - `location`: `Vector` — [Read-Write] When the warp target is created from a component this stores the location of the compon...
  - `location_offset`: `Vector` — [Read-Write] Optional static location offset. Only relevant when the warp target is created from a c...
  - `location_offset_direction`: `WarpTargetLocationOffsetDirection` — [Read-Write] Direction of offset context vector (WarpTargetLocationOffsetDirection)
  - `name`: `Name` — [Read-Write] Unique name for this warp target (Name)
  - `rotation`: `Rotator` — [Read-Write] When the warp target is created from a component this stores the rotation of the compon...
  - `rotation_offset`: `Rotator` — [Read-Write] Optional static rotation offset. Only relevant when the warp target is created from a c...

### `unreal.MotionWarpingWindowData`
Inherits: `StructBase` | Header: `MotionWarpingComponent.h`

Motion Warping Window Data

**Properties** (3):
  - `anim_notify`: `AnimNotifyState_MotionWarping` — [Read-Write] (AnimNotifyState_MotionWarping)
  - `end_time`: `float` — [Read-Write] (float)
  - `start_time`: `float` — [Read-Write] (float)

### `unreal.SwitchOffConditionData`
Inherits: `StructBase` | Header: `MotionWarpingSwitchOffCondition.h`

Switch Off Condition Data

**Properties** (2):
  - `switch_off_conditions`: `None` — [Read-Write] (Array[MotionWarpingSwitchOffCondition])
  - `warp_target_name`: `Name` — [Read-Write] (Name)

### `unreal.AnimNotifyState_MotionWarping`
Inherits: `AnimNotifyState` | Header: `AnimNotifyState_MotionWarping.h`

AnimNotifyState used to define a motion warping window in the animation

**Methods** (4):
  - `add_root_motion_modifier(motion_warping_comp, animation, start_time, end_time)` -> `RootMotionModifier` — Creates a root motion modifier from the config class defined in the notify
  - `on_warp_begin(motion_warping_comp, modifier)` -> `None` — On Warp Begin
  - `on_warp_end(motion_warping_comp, modifier)` -> `None` — On Warp End
  - `on_warp_update(motion_warping_comp, modifier)` -> `None` — On Warp Update

**Properties** (1):
  - `root_motion_modifier`: `RootMotionModifier` [Read-Only] — [Read-Only]
TODO:: Prevent notify callbacks and add comments explaining why we donât use those her...

### `unreal.AttributeBasedRootMotionComponent`
Inherits: `ActorComponent` | Header: `AttributeBasedRootMotionComponent.h`

Attribute Based Root Motion Component

**Properties** (1):
  - `enable_root_motion`: `bool` — [Read-Write] (bool)

### `unreal.MotionWarpingComponent`
Inherits: `ActorComponent` | Header: `MotionWarpingComponent.h`

Motion Warping Component

**Methods** (10):
  - `add_or_update_warp_target(warp_target)` -> `None` — Adds or update a warp target
  - `add_or_update_warp_target_from_component(warp_target_name, component, bone_name, follow_component, location_offset_direction = WarpTargetLocationOffsetDirection.TARGETS_FORWARD_VECTOR, location_offset = [0.000000,0.000000,0.000000], rotation_offset = [0.000000,0.000000,0.000000])` -> `None` — Create and adds or update a target associated with a specified name
  - `add_or_update_warp_target_from_location(warp_target_name, target_location)` -> `None` — Create and adds or update a target associated with a specified name
  - `add_or_update_warp_target_from_location_and_rotation(warp_target_name, target_location, target_rotation)` -> `None` — Create and adds or update a target associated with a specified name
  - `add_or_update_warp_target_from_transform(warp_target_name, target_transform)` -> `None` — Create and adds or update a target associated with a specified name
  - `add_switch_off_condition(warp_target_name, condition)` -> `None` — Add Switch Off Condition
  - `disable_all_root_motion_modifiers()` -> `None` — Mark all the modifiers as Disable
  - `remove_all_warp_targets()` -> `int32` — Removes all warp targets
  - `remove_warp_target(warp_target_name)` -> `int32` — Removes the warp target associated with the specified key
  - `remove_warp_targets(warp_target_names)` -> `int32` — Removes multiple warp targets

**Properties** (2):
  - `on_pre_update`: `MotionWarpingPreUpdate` — [Read-Write] Event called before Root Motion Modifiers are updated (MotionWarpingPreUpdate)
  - `search_for_windows_in_anims_within_montages`: `bool` — [Read-Write] Whether to look inside animations within montage when looking for warping windows (bool...

### `unreal.MotionWarpingSwitchOffAngleToTargetCondition`
Inherits: `MotionWarpingSwitchOffCondition` | Header: `MotionWarpingSwitchOffCondition.h`

Motion Warping Switch Off Angle to Target Condition

**Methods** (1):
  - `create_switch_off_angle_to_target_condition(owner_actor, effect, operator, angle, ignore_z_axis, use_warp_target_as_target_location=True, owner_actor=Actor)` [classmethod] — Creates Switch Off Angle To Target Condition that checks angle between Owner Actor and Target Location. If Use Warp Targ...

### `unreal.MotionWarpingSwitchOffBlueprintableCondition`
Inherits: `MotionWarpingSwitchOffCondition` | Header: `MotionWarpingSwitchOffCondition.h`

Motion Warping Switch Off Blueprintable Condition

**Methods** (3):
  - `bp_check(owner_actor, target_actor, target_location, use_warp_target_as_target_location)` -> `bool` — BP Check
  - `bp_extra_debug_info(owner_actor, target_actor, target_location, use_warp_target_as_target_location)` -> `str` — BP Extra Debug Info
  - `create_switch_off_blueprintable_condition(owner_actor, effect, blueprintable_condition, use_warp_target_as_target_location=True, owner_actor=Actor)` [classmethod] — Creates Switch Off Blueprintable Condition from WarpingSwitchOffBlueprintableCondition subclass.

### `unreal.MotionWarpingSwitchOffCompositeCondition`
Inherits: `MotionWarpingSwitchOffCondition` | Header: `MotionWarpingSwitchOffCondition.h`

Motion Warping Switch Off Composite Condition

**Methods** (1):
  - `create_switch_off_composite_condition(owner_actor, effect, switch_off_condition_a, logic_operator, switch_off_condition_b, use_warp_target_as_target_location=True, owner_actor=Actor, switch_off_condition_a=MotionWarpingSwitchOffCondition, switch_off_condition_b=MotionWarpingSwitchOffCondition)` [classmethod] — Creates Switch Off Composite Condition that lets you combine different switch off conditions with logic AND/OR operators...

### `unreal.MotionWarpingSwitchOffCondition`
Inherits: `Object` | Header: `MotionWarpingSwitchOffCondition.h`

Motion Warping Switch Off Condition

### `unreal.MotionWarpingSwitchOffDistanceCondition`
Inherits: `MotionWarpingSwitchOffCondition` | Header: `MotionWarpingSwitchOffCondition.h`

Motion Warping Switch Off Distance Condition

**Methods** (1):
  - `create_switch_off_distance_condition(owner_actor, effect, operator, distance, inb_use_warp_target_as_target_location=True, owner_actor=Actor)` [classmethod] — Creates Switch Off Distance Condition that checks distance between Owner Actor and Target Location. If Use Warp Target L...

### `unreal.MotionWarpingUtilities`
Inherits: `BlueprintFunctionLibrary` | Header: `MotionWarpingComponent.h`

Motion Warping Utilities

**Methods** (4):
  - `extract_bone_transform_from_animation_at_time(anim_instance, animation, time, extract_root_motion, bone_name, local_space)` -> `Transform` [classmethod] — Extract bone transform from animation at a given time
  - `extract_root_motion_from_animation(animation, start_time, end_time)` -> `Transform` [classmethod] — Extract Root Motion transform from a contiguous position range
  - `get_motion_warping_windows_for_warp_target_from_animation(animation, warp_target_name)` -> `Array [ MotionWarpingWindowData ]` [classmethod]
  - `get_motion_warping_windows_from_animation(animation)` -> `Array [ MotionWarpingWindowData ]` [classmethod]

### `unreal.RootMotionModifier`
Inherits: `Object` | Header: `RootMotionModifier.h`

URootMotionModifier

**Properties** (9):
  - `actual_start_time`: `float` [Read-Only] — [Read-Only] Actual playback time when the modifier becomes active (float)
  - `animation`: `AnimSequenceBase` [Read-Only] — [Read-Only] Source of the root motion we are warping (AnimSequenceBase)
  - `current_position`: `float` [Read-Only] — [Read-Only] Current playback time of the animation (float)
  - `end_time`: `float` [Read-Only] — [Read-Only] End time of the warping window (float)
  - `previous_position`: `float` [Read-Only] — [Read-Only] Previous playback time of the animation (float)
  - `start_time`: `float` [Read-Only] — [Read-Only] Start time of the warping window (float)
  - `start_transform`: `Transform` [Read-Only] — [Read-Only] Character owner transform at the time this modifier becomes active (Transform)
  - `total_root_motion_within_window`: `Transform` [Read-Only] — [Read-Only] Total root motion within the warping window (Transform)
  - `weight`: `float` [Read-Only] — [Read-Only] Current blend weight of the animation (float)

### `unreal.RootMotionModifier_AdjustmentBlendWarp`
Inherits: `RootMotionModifier_Warp` | Header: `RootMotionModifier_AdjustmentBlendWarp.h`

EXPERIMENTAL: Marked with âhidedropdownâ to prevent it from showing up in the UI since it is not ready for production.

**Properties** (2):
  - `ik_bones`: `None` — [Read-Write] (Array[Name])
  - `warp_ik_bones`: `bool` — [Read-Write] (bool)

### `unreal.RootMotionModifier_Scale`
Inherits: `RootMotionModifier` | Header: `RootMotionModifier.h`

URootMotionModifier_Scale

**Methods** (1):
  - `add_root_motion_modifier_scale(motion_warping_comp, animation, start_time, end_time, scale = [1.000000,1.000000,1.000000])` -> `RootMotionModifier_Scale` [classmethod] — Add Root Motion Modifier Scale

**Properties** (1):
  - `scale`: `Vector` — [Read-Write] Vector used to scale each component of the translation (Vector)

### `unreal.RootMotionModifier_SimpleWarp`
Inherits: `RootMotionModifier_Warp` | Header: `RootMotionModifier.h`

URootMotionModifier_SimpleWarp. DEPRECATED in favor of URootMotionModifier_SkewWarp (kept for reference)

### `unreal.RootMotionModifier_SkewWarp`
Inherits: `RootMotionModifier_Warp` | Header: `RootMotionModifier_SkewWarp.h`

Root Motion Modifier Skew Warp

**Methods** (1):
  - `add_root_motion_modifier_skew_warp(motion_warping_comp, animation, start_time, end_time, warp_target_name, warp_point_anim_provider, warp_point_anim_transform, warp_point_anim_bone_name, warp_translation = True, ignore_z_axis = True, warp_rotation = True, rotation_type = MotionWarpRotationType.DEFAULT, rotation_method = MotionWarpRotationMethod.SLERP, warp_rotation_time_multiplier = 1.000000, warp_max_rotation_rate = 0.000000)` -> `RootMotionModifier_SkewWarp` [classmethod] — Add Root Motion Modifier Skew Warp

**Properties** (1):
  - `max_speed_clamp_ratio`: `float` — [Read-Write] Allows to set maximum warp translation speed clamp ratio.
Ratio is relative to the orig...

### `unreal.RootMotionModifier_Warp`
Inherits: `RootMotionModifier` | Header: `RootMotionModifier.h`

Root Motion Modifier Warp

**Properties** (15):
  - `add_translation_easing_curve`: `CurveFloat` — [Read-Write] Custom curve used to add translation when there is none to warp. Only relevant when Add...
  - `add_translation_easing_func`: `AlphaBlendOption` — [Read-Write] Easing function used when adding translation. Only relevant when there is no translatio...
  - `ignore_z_axis`: `bool` — [Read-Write] Whether to ignore the Z component of the translation. Z motion will remain untouched (b...
  - `rotation_method`: `MotionWarpRotationMethod` — [Read-Write] The method of rotation to use (MotionWarpRotationMethod)
  - `rotation_type`: `MotionWarpRotationType` — [Read-Write] Whether rotation should be warp to match the rotation of the sync point or to face the ...
  - `subtract_remaining_root_motion`: `bool` — [Read-Write] Should root motion after this notify state be subtracted from warp target transform.
Th...
  - `warp_max_rotation_rate`: `float` — [Read-Write] Maximum rotation rate in degrees/sec. Will be the value used in constant rotation rate ...
  - `warp_point_anim_bone_name`: `Name` — [Read-Write]
TODO:: Hide from the UI when Target != Bone (Name)
  - `warp_point_anim_provider`: `WarpPointAnimProvider` — [Read-Write] (WarpPointAnimProvider)
  - `warp_point_anim_transform`: `Transform` — [Read-Write]
TODO:: Hide from the UI when Target != Static (Transform)
  - `warp_rotation`: `bool` — [Read-Write] Whether to warp the rotation component of the root motion (bool)
  - `warp_rotation_time_multiplier`: `float` — [Read-Write] Allow to modify how fast the rotation is warped.
e.g if the window duration is 2sec and...
  - `warp_target_name`: `Name` — [Read-Write] Name used to find the warp target for this modifier (Name)
  - `warp_to_feet_location`: `bool` — [Read-Write] Whether we warp the actors location or their foot location to the warp target (bool)
  - `warp_translation`: `bool` — [Read-Write] Whether to warp the translation component of the root motion (bool)

### `unreal.AttributeBasedRootMotionMode`
Inherits: `EnumBase` | Header: `AttributeBasedRootMotionComponent.h`

EAttribute Based Root Motion Mode

**Properties** (2):
  - `APPLY_DELTA`: `AttributeBasedRootMotionMode = Ellipsis` — 0
  - `APPLY_VELOCITY`: `AttributeBasedRootMotionMode = Ellipsis` — 1

### `unreal.MotionWarpRotationMethod`
Inherits: `EnumBase` | Header: `RootMotionModifier.h`

EMotion Warp Rotation Method

**Properties** (4):
  - `CONSTANT_RATE`: `MotionWarpRotationMethod = Ellipsis` — Rotate with a constant rotation rate 2
  - `SCALE`: `MotionWarpRotationMethod = Ellipsis` — Scale rotation in a way that by the end of the anim notify state the ownerâs rotation matches the ...
  - `SLERP`: `MotionWarpRotationMethod = Ellipsis` — Rotate with spherical linear interpolation 0
  - `SLERP_WITH_CLAMPED_RATE`: `MotionWarpRotationMethod = Ellipsis` — Rotate with spherical linear interpolation, not exceeding a max rotation rate 1

### `unreal.MotionWarpRotationType`
Inherits: `EnumBase` | Header: `RootMotionModifier.h`

EMotion Warp Rotation Type

**Properties** (3):
  - `DEFAULT`: `MotionWarpRotationType = Ellipsis` — Character rotates to match the rotation of the sync point 0
  - `FACING`: `MotionWarpRotationType = Ellipsis` — Character rotates to face the sync point 1
  - `OPPOSITE_DEFAULT`: `MotionWarpRotationType = Ellipsis` — Character rotates to match the rotation of the sync point, rotated by half of full angle around up a...

### `unreal.RootMotionModifierState`
Inherits: `EnumBase` | Header: `RootMotionModifier.h`

The possible states of a Root Motion Modifier

**Properties** (4):
  - `ACTIVE`: `RootMotionModifierState = Ellipsis` — The modifier is active and currently affecting the final root motion 1
  - `DISABLED`: `RootMotionModifierState = Ellipsis` — The modifier will remain in the list (as long as the window is active) but will not modify the root ...
  - `MARKED_FOR_REMOVAL`: `RootMotionModifierState = Ellipsis` — The modifier has been marked for removal. Usually because the warping window is done 2
  - `WAITING`: `RootMotionModifierState = Ellipsis` — The modifier is waiting for the animation to hit the warping window 0

### `unreal.SwitchOffConditionAngleOp`
Inherits: `EnumBase` | Header: `MotionWarpingSwitchOffCondition.h`

ESwitch Off Condition Angle Op

**Properties** (2):
  - `GREATER_THAN`: `SwitchOffConditionAngleOp = Ellipsis` — 1
  - `LESS_THAN`: `SwitchOffConditionAngleOp = Ellipsis` — 0

### `unreal.SwitchOffConditionCompositeOp`
Inherits: `EnumBase` | Header: `MotionWarpingSwitchOffCondition.h`

ESwitch Off Condition Composite Op

**Properties** (2):
  - `AND`: `SwitchOffConditionCompositeOp = Ellipsis` — 1
  - `OR`: `SwitchOffConditionCompositeOp = Ellipsis` — 0

### `unreal.SwitchOffConditionDistanceAxesType`
Inherits: `EnumBase` | Header: `MotionWarpingSwitchOffCondition.h`

ESwitch Off Condition Distance Axes Type

**Properties** (3):
  - `ALL_AXES`: `SwitchOffConditionDistanceAxesType = Ellipsis` — 0
  - `IGNORE_Z_AXIS`: `SwitchOffConditionDistanceAxesType = Ellipsis` — 1
  - `ONLY_Z_AXIS`: `SwitchOffConditionDistanceAxesType = Ellipsis` — 2

### `unreal.SwitchOffConditionDistanceOp`
Inherits: `EnumBase` | Header: `MotionWarpingSwitchOffCondition.h`

ESwitch Off Condition Distance Op

**Properties** (2):
  - `GREATER_THAN`: `SwitchOffConditionDistanceOp = Ellipsis` — 1
  - `LESS_THAN`: `SwitchOffConditionDistanceOp = Ellipsis` — 0

### `unreal.SwitchOffConditionEffect`
Inherits: `EnumBase` | Header: `MotionWarpingSwitchOffCondition.h`

Result of switch off condition.

**Properties** (4):
  - `CANCEL_FOLLOW`: `SwitchOffConditionEffect = Ellipsis` — Changes associated motion warping target from component to a location of this component
in the frame...
  - `CANCEL_WARPING`: `SwitchOffConditionEffect = Ellipsis` — Removes associated motion warping target 1
  - `PAUSE_ROOT_MOTION`: `SwitchOffConditionEffect = Ellipsis` — During time slot in the animation, where switch off condition is true, play the animation in place 3
  - `PAUSE_WARPING`: `SwitchOffConditionEffect = Ellipsis` — During time slot in the animation, where switch off condition is true, only play root motion, withou...

### `unreal.WarpPointAnimProvider`
Inherits: `EnumBase` | Header: `RootMotionModifier.h`

Method used to extract the warp point from the animation

**Properties** (3):
  - `BONE`: `WarpPointAnimProvider = Ellipsis` — Warp point defined by a bone 2
  - `NONE`: `WarpPointAnimProvider = Ellipsis` — No warp point is provided 0
  - `STATIC`: `WarpPointAnimProvider = Ellipsis` — Warp point defined by a âhard-codedâ transform  user can enter through the warping notify 1

### `unreal.WarpTargetLocationOffsetDirection`
Inherits: `EnumBase` | Header: `RootMotionModifier.h`

EWarp Target Location Offset Direction

**Properties** (3):
  - `TARGETS_FORWARD_VECTOR`: `WarpTargetLocationOffsetDirection = Ellipsis` — Location Offsetâs X is target componentâs forward vector. 0
  - `VECTOR_FROM_TARGET_TO_OWNER`: `WarpTargetLocationOffsetDirection = Ellipsis` — Location Offsetâs X is vector from owner to target. 1
  - `WORLD_SPACE`: `WarpTargetLocationOffsetDirection = Ellipsis` — Location Offsetâs X is world space X. 2

### `unreal.MotionWarpingPreUpdate`
Inherits: `MulticastDelegateBase` | Header: `MotionWarpingComponent.h`

Motion Warping Pre Update Delegate Signature

### `unreal.OnRootMotionModifierDelegate`
Inherits: `DelegateBase` | Header: `RootMotionModifier.h`

On Root Motion Modifier Delegate Delegate Signature
