# UE Python API — GameplayAbilities Module

**234 types** from the `GameplayAbilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AbilityEndedData`, `AbilityTriggerData`, `ActiveGameplayCue`, `ActiveGameplayCueContainer`, `ActiveGameplayEffect`, `ActiveGameplayEffectHandle`, `AttributeBasedFloat`, `AttributeDefaults`, `AttributeMetaData`, `ConditionalGameplayEffect`, `CustomCalculationBasedFloat`, `GameplayAbilityActivationInfo`, `GameplayAbilityActorInfo`, `GameplayAbilitySpec`, `GameplayAbilitySpecContainer`, `GameplayAbilitySpecDef`, `GameplayAbilitySpecHandle`, `GameplayAbilityTargetData`, `GameplayAbilityTargetData_ActorArray`, `GameplayAbilityTargetData_LocationInfo`, ... (234 total)

---

## Classes

### `unreal.AbilityEndedData`
Inherits: `StructBase` | Header: `GameplayAbilityTypes.h`

Ability Ended Data

### `unreal.AbilityTriggerData`
Inherits: `StructBase` | Header: `GameplayAbility.h`

Structure that defines how an ability will be triggered by external events

### `unreal.ActiveGameplayCue`
Inherits: `FastArraySerializerItem` | Header: `GameplayCueInterface.h`

Active Gameplay Cue

### `unreal.ActiveGameplayCueContainer`
Inherits: `FastArraySerializer` | Header: `GameplayCueInterface.h`

Active Gameplay Cue Container

### `unreal.ActiveGameplayEffect`
Inherits: `FastArraySerializerItem` | Header: `GameplayEffect.h`

### `unreal.ActiveGameplayEffectHandle`
Inherits: `StructBase` | Header: `ActiveGameplayEffectHandle.h`

**Methods** (2):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:

### `unreal.AttributeBasedFloat`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Struct representing a float whose magnitude is dictated by a backing attribute and a calculation policy, follows basic form of: (Coefficient * (PreMultiplyAdditiveValue + [Evalâd Attribute Value Acc...

### `unreal.AttributeDefaults`
Inherits: `StructBase` | Header: `GameplayAbilityTypes.h`

Used to initialize default values for attributes

### `unreal.AttributeMetaData`
Inherits: `TableRowBase` | Header: `AttributeSet.h`

DataTable that allows us to define meta data about attributes. Still a work in progress.

**Properties** (4):
  - `base_value`: `float` [Read-Only] — [Read-Only] (float)
  - `can_stack`: `bool` [Read-Only] — [Read-Only] (bool)
  - `max_value`: `float` [Read-Only] — [Read-Only] (float)
  - `min_value`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.ConditionalGameplayEffect`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Struct for gameplay effects that apply only if another gameplay effect (or execution) was successfully applied.

**Properties** (2):
  - `effect_class`: `Class` [Read-Only] — [Read-Only] gameplay effect that will be applied to the target (type(Class))
  - `required_source_tags`: `GameplayTagContainer` [Read-Only] — [Read-Only] Tags that the source must have for this GE to apply.  If this is blank, then there are n...

### `unreal.CustomCalculationBasedFloat`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Structure to encapsulate magnitudes that are calculated via custom calculation

### `unreal.GameplayAbilityActivationInfo`
Inherits: `StructBase` | Header: `GameplayAbilitySpec.h`

FGameplayAbilityActivationInfo

**Properties** (1):
  - `activation_mode`: `GameplayAbilityActivationMode` [Read-Only] — [Read-Only] Activation status of this ability (GameplayAbilityActivationMode)

### `unreal.GameplayAbilityActorInfo`
Inherits: `StructBase` | Header: `GameplayAbilityTypes.h`

FGameplayAbilityActorInfo

**Properties** (8):
  - `ability_system_component`: `AbilitySystemComponent` [Read-Only] — [Read-Only] Ability System component associated with the owner actor, shouldnât be null (AbilitySy...
  - `affected_anim_instance_tag`: `Name` [Read-Only] — [Read-Only] The linked Anim Instance that this component will play montages in. Use NAME_None for th...
  - `anim_instance`: `AnimInstance` [Read-Only] — [Read-Only] Anim instance of the avatar actor. Often null (AnimInstance)
  - `avatar_actor`: `Actor` [Read-Only] — [Read-Only] The physical representation of the owner, used for targeting and animation. This will of...
  - `movement_component`: `MovementComponent` [Read-Only] — [Read-Only] Movement component of the avatar actor. Often null (MovementComponent)
  - `owner_actor`: `Actor` [Read-Only] — [Read-Only] The actor that owns the abilities, shouldnât be null (Actor)
  - `player_controller`: `PlayerController` [Read-Only] — [Read-Only] PlayerController associated with the owning actor. This will often be null! (PlayerContr...
  - `skeletal_mesh_component`: `SkeletalMeshComponent` [Read-Only] — [Read-Only] Skeletal mesh of the avatar actor. Often null (SkeletalMeshComponent)

### `unreal.GameplayAbilitySpec`
Inherits: `FastArraySerializerItem` | Header: `GameplayAbilitySpec.h`

An activatable ability spec, hosted on the ability system component. This defines both what the ability is (what class, what level, input binding etc) and also holds runtime state that must be kept ou...

### `unreal.GameplayAbilitySpecContainer`
Inherits: `FastArraySerializer` | Header: `GameplayAbilitySpec.h`

Fast serializer wrapper for above struct

### `unreal.GameplayAbilitySpecDef`
Inherits: `StructBase` | Header: `GameplayAbilitySpec.h`

This is data that can be used to create an FGameplayAbilitySpec. Has some data that is only relevant when granted by a GameplayEffect

### `unreal.GameplayAbilitySpecHandle`
Inherits: `StructBase` | Header: `GameplayAbilitySpecHandle.h`

Handle that points to a specific granted ability. These are globally unique

**Methods** (2):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:

### `unreal.GameplayAbilityTargetData`
Inherits: `StructBase` | Header: `GameplayAbilityTargetTypes.h`

A generic structure for targeting data. We want generic functions to produce this data and other generic functions to consume this data.

### `unreal.GameplayAbilityTargetData_ActorArray`
Inherits: `GameplayAbilityTargetData` | Header: `GameplayAbilityTargetTypes.h`

Target data with a source location and a list of targeted actors, makes sense for AOE attacks

**Properties** (1):
  - `source_location`: `GameplayAbilityTargetingLocationInfo` — [Read-Write] We could be selecting this group of actors from any type of location, so use a generic ...

### `unreal.GameplayAbilityTargetData_LocationInfo`
Inherits: `GameplayAbilityTargetData` | Header: `GameplayAbilityTargetTypes.h`

Target data with just a source and target location in space

**Properties** (2):
  - `source_location`: `GameplayAbilityTargetingLocationInfo` — [Read-Write] Generic location data for source (GameplayAbilityTargetingLocationInfo)
  - `target_location`: `GameplayAbilityTargetingLocationInfo` — [Read-Write] Generic location data for target (GameplayAbilityTargetingLocationInfo)

### `unreal.GameplayAbilityTargetData_SingleTargetHit`
Inherits: `GameplayAbilityTargetData` | Header: `GameplayAbilityTargetTypes.h`

Target data with a single hit result, data is packed into the hit result

### `unreal.GameplayAbilityTargetDataHandle`
Inherits: `StructBase` | Header: `GameplayAbilityTargetTypes.h`

### `unreal.GameplayAbilityTargetingLocationInfo`
Inherits: `StructBase` | Header: `GameplayAbilityTargetTypes.h`

Structure that stores a location in one of several different formats

**Properties** (6):
  - `literal_transform`: `Transform` — [Read-Write] A literal world transform can be used, if one has been calculated outside of the actor ...
  - `location_type`: `GameplayAbilityTargetingLocationType` — [Read-Write] Type of location used - will determine what data is transmitted over the network and wh...
  - `source_ability`: `GameplayAbility` — [Read-Write] Ability that will be using the targeting data (GameplayAbility)
  - `source_actor`: `Actor` — [Read-Write] A source actor is needed for Actor-based targeting, but not for Socket-based targeting....
  - `source_component`: `MeshComponent` — [Read-Write] Socket-based targeting requires a skeletal mesh component to check for the named socket...
  - `source_socket_name`: `Name` — [Read-Write] If SourceComponent is valid, this is the name of the socket transform that will be used...

### `unreal.GameplayAttribute`
Inherits: `StructBase` | Header: `AttributeSet.h`

Describes a FGameplayAttributeData or float property inside an attribute set. Using this provides editor UI and helper functions

**Properties** (1):
  - `attribute_name`: `str` [Read-Only] — [Read-Only] Name of the attribute, usually the same as property name (str)

### `unreal.GameplayAttributeData`
Inherits: `StructBase` | Header: `AttributeSet.h`

Place in an AttributeSet to create an attribute that can be accesed using FGameplayAttribute. It is strongly encouraged to use this instead of raw float attributes

**Properties** (2):
  - `base_value`: `float` [Read-Only] — [Read-Only] (float)
  - `current_value`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.GameplayCueNotify_BurstEffects`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_BurstEffects

**Properties** (7):
  - `burst_camera_lens_effect`: `GameplayCueNotify_CameraLensEffectInfo` [Read-Only] — [Read-Only] Camera lens effect to be played on gameplay cue execution.  This should never use a loop...
  - `burst_camera_shake`: `GameplayCueNotify_CameraShakeInfo` [Read-Only] — [Read-Only] Camera shake to be played on gameplay cue execution.  This should never use a looping ef...
  - `burst_decal`: `GameplayCueNotify_DecalInfo` [Read-Only] — [Read-Only] Decal to be spawned on gameplay cue execution.  Actor should have fade out time or overr...
  - `burst_device_property_effect`: `GameplayCueNotify_InputDevicePropertyInfo` [Read-Only] — [Read-Only] Input device properties to be applied on gameplay cue execution (GameplayCueNotify_Input...
  - `burst_force_feedback`: `GameplayCueNotify_ForceFeedbackInfo` [Read-Only] — [Read-Only] Force feedback to be played on gameplay cue execution.  This should never use a looping ...
  - `burst_particles`: `None` [Read-Only] — [Read-Only] Particle systems to be spawned on gameplay cue execution.  These should never use loopin...
  - `burst_sounds`: `None` [Read-Only] — [Read-Only] Sound to be played on gameplay cue execution.  These should never use looping effects! (...

### `unreal.GameplayCueNotify_CameraLensEffectInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_CameraLensEffectInfo

**Properties** (8):
  - `camera_lens_effect`: `Class` [Read-Only] — [Read-Only] Camera lens effect to play. (type(Class))
  - `override_placement_info`: `bool` [Read-Only] — [Read-Only] If enabled, use the placement info override and not the default one. (bool)
  - `override_spawn_condition`: `bool` [Read-Only] — [Read-Only] If enabled, use the spawn condition override and not the default one. (bool)
  - `placement_info_override`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Defines how the camera lens effect will be placed. (GameplayCueNotify_PlacementInfo)
  - `play_in_world`: `bool` [Read-Only] — [Read-Only] If enabled, the camera lens effect will be played in the world and affect all players. (...
  - `spawn_condition_override`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Condition to check before playing the camera lens effect. (GameplayCueNotify_SpawnCondit...
  - `world_inner_radius`: `float` [Read-Only] — [Read-Only] Players inside this radius get the full intensity camera lens effect. (float)
  - `world_outer_radius`: `float` [Read-Only] — [Read-Only] Players outside this radius do not get the camera lens effect applied. (float)

### `unreal.GameplayCueNotify_CameraShakeInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_CameraShakeInfo

**Properties** (11):
  - `camera_shake`: `Class` [Read-Only] — [Read-Only] Camera shake to play. (type(Class))
  - `override_placement_info`: `bool` [Read-Only] — [Read-Only] If enabled, use the placement info override and not the default one. (bool)
  - `override_spawn_condition`: `bool` [Read-Only] — [Read-Only] If enabled, use the spawn condition override and not the default one. (bool)
  - `placement_info_override`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Defines how the camera shake will be placed. (GameplayCueNotify_PlacementInfo)
  - `play_in_world`: `bool` [Read-Only] — [Read-Only] If enabled, the camera shake will be played in the world and affect all players. (bool)
  - `play_space`: `GameplayCueNotify_EffectPlaySpace` [Read-Only] — [Read-Only] What coordinate space to play the camera shake relative to. (GameplayCueNotify_EffectPla...
  - `shake_scale`: `float` [Read-Only] — [Read-Only] Scale applied to the camera shake. (float)
  - `spawn_condition_override`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Condition to check before playing the camera shake. (GameplayCueNotify_SpawnCondition)
  - `world_falloff_exponent`: `float` [Read-Only] — [Read-Only] Exponent that describes the shake intensity falloff curve between the inner and outer ra...
  - `world_inner_radius`: `float` [Read-Only] — [Read-Only] Players inside this radius get the full intensity camera shake. (float)
  - `world_outer_radius`: `float` [Read-Only] — [Read-Only] Players outside this radius do not get the camera shake applied. (float)

### `unreal.GameplayCueNotify_DecalInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_DecalInfo

**Properties** (9):
  - `decal_material`: `MaterialInterface` [Read-Only] — [Read-Only] Decal material to spawn. (MaterialInterface)
  - `decal_size`: `Vector` [Read-Only] — [Read-Only] Decal size in local space (does not include the component scale). (Vector)
  - `fade_out_duration`: `float` [Read-Only] — [Read-Only] Sets how long it takes for decal actor to fade out.  Will override setting in class. (fl...
  - `fade_out_start_delay`: `float` [Read-Only] — [Read-Only] Sets when the decal actor will start fading out.  Will override setting in class. (float...
  - `override_fade_out`: `bool` [Read-Only] — [Read-Only] If enabled, override default decal actor fade out values. (bool)
  - `override_placement_info`: `bool` [Read-Only] — [Read-Only] If enabled, use the placement info override and not the default one. (bool)
  - `override_spawn_condition`: `bool` [Read-Only] — [Read-Only] If enabled, use the spawn condition override and not the default one. (bool)
  - `placement_info_override`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Defines how the decal will be placed. (GameplayCueNotify_PlacementInfo)
  - `spawn_condition_override`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Condition to check before spawning the decal. (GameplayCueNotify_SpawnCondition)

### `unreal.GameplayCueNotify_ForceFeedbackInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_ForceFeedbackInfo

**Properties** (10):
  - `force_feedback_effect`: `ForceFeedbackEffect` [Read-Only] — [Read-Only] Force feedback effect to play. (ForceFeedbackEffect)
  - `force_feedback_tag`: `Name` [Read-Only] — [Read-Only] Tag used to identify the force feedback effect so it can later be canceled.
Warning: If ...
  - `is_looping`: `bool` [Read-Only] — [Read-Only] If enabled, the force feedback will be set to loop. (bool)
  - `override_placement_info`: `bool` [Read-Only] — [Read-Only] If enabled, use the placement info override and not the default one. (bool)
  - `override_spawn_condition`: `bool` [Read-Only] — [Read-Only] If enabled, use the spawn condition override and not the default one. (bool)
  - `placement_info_override`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Defines how the force feedback will be placed. (GameplayCueNotify_PlacementInfo)
  - `play_in_world`: `bool` [Read-Only] — [Read-Only] If enabled, the force feedback will be played in the world and affect all players. (bool...
  - `spawn_condition_override`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Condition to check before playing the force feedback. (GameplayCueNotify_SpawnCondition)
  - `world_attenuation`: `ForceFeedbackAttenuation` [Read-Only] — [Read-Only] How the force feedback is attenuated over distance when played in world. (ForceFeedbackA...
  - `world_intensity`: `float` [Read-Only] — [Read-Only] Multiplier applied to the force feedback when played in world. (float)

### `unreal.GameplayCueNotify_InputDevicePropertyInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_InputDevicePropertyInfo

**Properties** (1):
  - `device_properties`: `None` [Read-Only] — [Read-Only] Input Device properties to apply (Array[type(Class)])

### `unreal.GameplayCueNotify_LoopingEffects`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_LoopingEffects

**Properties** (6):
  - `looping_camera_lens_effect`: `GameplayCueNotify_CameraLensEffectInfo` [Read-Only] — [Read-Only] Camera lens effect to be played on gameplay cue loop start. (GameplayCueNotify_CameraLen...
  - `looping_camera_shake`: `GameplayCueNotify_CameraShakeInfo` [Read-Only] — [Read-Only] Camera shake to be played on gameplay cue loop start. (GameplayCueNotify_CameraShakeInfo...
  - `looping_force_feedback`: `GameplayCueNotify_ForceFeedbackInfo` [Read-Only] — [Read-Only] Force feedback to be played on gameplay cue loop start. (GameplayCueNotify_ForceFeedback...
  - `looping_input_device_property_effect`: `GameplayCueNotify_InputDevicePropertyInfo` [Read-Only] — [Read-Only] Input device properties to be applied on gameplay cue loop start. (GameplayCueNotify_Inp...
  - `looping_particles`: `None` [Read-Only] — [Read-Only] Particle systems to be spawned on gameplay cue loop start. (Array[GameplayCueNotify_Part...
  - `looping_sounds`: `None` [Read-Only] — [Read-Only] Sound to be played on gameplay cue loop start. (Array[GameplayCueNotify_SoundInfo])

### `unreal.GameplayCueNotify_ParticleInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_ParticleInfo

**Properties** (6):
  - `cast_shadow`: `bool` [Read-Only] — [Read-Only] If enabled, this particle system will cast a shadow. (bool)
  - `niagara_system`: `NiagaraSystem` [Read-Only] — [Read-Only] Niagara FX system to spawn. (NiagaraSystem)
  - `override_placement_info`: `bool` [Read-Only] — [Read-Only] If enabled, use the placement info override and not the default one. (bool)
  - `override_spawn_condition`: `bool` [Read-Only] — [Read-Only] If enabled, use the spawn condition override and not the default one. (bool)
  - `placement_info_override`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Defines how the particle system will be placed. (GameplayCueNotify_PlacementInfo)
  - `spawn_condition_override`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Condition to check before spawning the particle system. (GameplayCueNotify_SpawnConditio...

### `unreal.GameplayCueNotify_PlacementInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_PlacementInfo

**Properties** (7):
  - `attach_policy`: `GameplayCueNotify_AttachPolicy` [Read-Only] — [Read-Only] Whether to attach to the target actor or not attach. (GameplayCueNotify_AttachPolicy)
  - `attachment_rule`: `AttachmentRule` [Read-Only] — [Read-Only] How the transform is handled when attached. (AttachmentRule)
  - `override_rotation`: `bool` [Read-Only] — [Read-Only] If enabled, will always spawn using rotation override. (bool)
  - `override_scale`: `bool` [Read-Only] — [Read-Only] If enabled, will always spawn using the scale override. (bool)
  - `rotation_override`: `Rotator` [Read-Only] — [Read-Only] If enabled, will always spawn using rotation override.
This will also set the rotation t...
  - `scale_override`: `Vector` [Read-Only] — [Read-Only] If enabled, will always spawn using scale override.
This will also set the scale to be a...
  - `socket_name`: `Name` [Read-Only] — [Read-Only] Targetâs socket (or bone) used for location and rotation.  If âNoneâ, it uses the ...

### `unreal.GameplayCueNotify_SoundInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_SoundInfo

**Properties** (10):
  - `looping_fade_out_duration`: `float` [Read-Only] — [Read-Only] How long it should take to fade out.  Only used on looping gameplay cues. (float)
  - `looping_fade_volume_level`: `float` [Read-Only] — [Read-Only] The volume level you want the sound to fade out to over the âLooping Fade Out Duration...
  - `override_placement_info`: `bool` [Read-Only] — [Read-Only] If enabled, use the placement info override and not the default one. (bool)
  - `override_spawn_condition`: `bool` [Read-Only] — [Read-Only] If enabled, use the spawn condition override and not the default one. (bool)
  - `placement_info_override`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Defines how the sound will be placed. (GameplayCueNotify_PlacementInfo)
  - `sound`: `SoundBase` [Read-Only] — [Read-Only] Sound to play. (SoundBase)
  - `sound_cue`: `SoundBase` — [Read-Write]
deprecated: 5.0 - SoundCue is deprecated. Instead use the Sound property. The type is U...
  - `sound_parameter_interface_info`: `GameplayCueNotify_SoundParameterInterfaceInfo` [Read-Only] — [Read-Only] Defines how to interface with the sound. (GameplayCueNotify_SoundParameterInterfaceInfo)
  - `spawn_condition_override`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Condition to check before playing the sound. (GameplayCueNotify_SpawnCondition)
  - `use_sound_parameter_interface`: `bool` [Read-Only] — [Read-Only] If enabled, use the placement info override and not the default one. (bool)

### `unreal.GameplayCueNotify_SoundParameterInterfaceInfo`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_SoundParameterInterfaceInfo

**Properties** (1):
  - `stop_trigger_name`: `Name` [Read-Only] — [Read-Only] The name of the stop trigger set via the parameter interface (Name)

### `unreal.GameplayCueNotify_SpawnCondition`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_SpawnCondition

**Properties** (5):
  - `allowed_surface_types`: `None` [Read-Only] — [Read-Only] The gameplay cue effects will only spawn if the surface type is in this list.
An empty l...
  - `chance_to_play`: `float` [Read-Only] — [Read-Only] Random chance to play the effects.  (1.0 = always play,  0.0 = never play) (float)
  - `locally_controlled_policy`: `GameplayCueNotify_LocallyControlledPolicy` [Read-Only] — [Read-Only] Locally controlled policy used to determine if the gameplay cue effects should spawn. (G...
  - `locally_controlled_source`: `GameplayCueNotify_LocallyControlledSource` [Read-Only] — [Read-Only] Source actor to use when determining if it is locally controlled. (GameplayCueNotify_Loc...
  - `rejected_surface_types`: `None` [Read-Only] — [Read-Only] The gameplay cue effects will only spawn if the surface type is NOT in this list.
An emp...

### `unreal.GameplayCueNotify_SpawnResult`
Inherits: `StructBase` | Header: `GameplayCueNotifyTypes.h`

FGameplayCueNotify_SpawnResult

**Properties** (6):
  - `audio_components`: `None` [Read-Only] — [Read-Only] List of audio components spawned.  There may be null pointers here as it matches the def...
  - `camera_lens_effects`: `None` [Read-Only] — [Read-Only] List of camera len effects spawned.  There will be one camera lens effect per local play...
  - `camera_shakes`: `None` [Read-Only] — [Read-Only] List of camera shakes played.  There will be one camera shake per local player controlle...
  - `decal_component`: `DecalComponent` [Read-Only] — [Read-Only] Spawned decal component.  This may be null. (DecalComponent)
  - `force_feedback_component`: `ForceFeedbackComponent` [Read-Only] — [Read-Only] Force feedback component that was spawned.  This is only valid when force feedback is se...
  - `fx_system_components`: `None` [Read-Only] — [Read-Only] List of FX components spawned.  There may be null pointers here as it matches the define...

### `unreal.GameplayCueParameters`
Inherits: `StructBase` | Header: `GameplayEffectTypes.h`

Metadata about a gameplay cue execution

**Properties** (17):
  - `ability_level`: `int` — [Read-Write] If originating from an ability, this will be the level of that ability (int32)
  - `aggregated_source_tags`: `GameplayTagContainer` — [Read-Write] The aggregated source tags taken from the effect spec (GameplayTagContainer)
  - `aggregated_target_tags`: `GameplayTagContainer` — [Read-Write] The aggregated target tags taken from the effect spec (GameplayTagContainer)
  - `effect_causer`: `Actor` — [Read-Write] The physical actor that actually did the damage, can be a weapon or projectile (Actor)
  - `effect_context`: `GameplayEffectContextHandle` — [Read-Write] Effect context, contains information about hit result, etc (GameplayEffectContextHandle...
  - `gameplay_effect_level`: `int` — [Read-Write] If originating from a GameplayEffect, the level of that GameplayEffect (int32)
  - `instigator`: `Actor` — [Read-Write] Instigator actor, the actor that owns the ability system component (Actor)
  - `location`: `Vector_NetQuantize10` — [Read-Write] Location cue took place at (Vector_NetQuantize10)
  - `matched_tag_name`: `GameplayTag` — [Read-Write] The tag name that matched this specific gameplay cue handler (GameplayTag)
  - `normal`: `Vector_NetQuantizeNormal` — [Read-Write] Normal of impact that caused cue (Vector_NetQuantizeNormal)
  - `normalized_magnitude`: `float` — [Read-Write] Magnitude of source gameplay effect, normalzed from 0-1. Use this for âhow strong is ...
  - `original_tag`: `GameplayTag` — [Read-Write] The original tag of the gameplay cue (GameplayTag)
  - `physical_material`: `PhysicalMaterial` — [Read-Write] PhysMat of the hit, if there was a hit. (PhysicalMaterial)
  - `raw_magnitude`: `float` — [Read-Write] Raw final magnitude of source gameplay effect. Use this is you need to display numbers ...
  - `replicate_location_when_using_minimal_rep_proxy`: `bool` — [Read-Write] If weâre using a minimal replication proxy, should we replicate location for this cue...
  - `source_object`: `Object` — [Read-Write] Object this effect was created from, can be an actor or static object. Useful to bind a...
  - `target_attach_component`: `SceneComponent` — [Read-Write] Could be used to say âattach FX to this component alwaysâ (SceneComponent)

### `unreal.GameplayCueTag`
Inherits: `StructBase` | Header: `GameplayCueInterface.h`

Wrapper struct around a gameplaytag with the GameplayCue category. This also allows for a details customization

**Properties** (1):
  - `gameplay_cue_tag`: `GameplayTag` — [Read-Write] (GameplayTag)

### `unreal.GameplayEffectAttributeCaptureDefinition`
Inherits: `StructBase` | Header: `GameplayEffectAttributeCaptureDefinition.h`

Struct defining gameplay attribute capture options for gameplay effects

### `unreal.GameplayEffectContextHandle`
Inherits: `StructBase` | Header: `GameplayEffectTypes.h`

Handle that wraps a FGameplayEffectContext or subclass, to allow it to be polymorphic and replicate properly

### `unreal.GameplayEffectCue`
Inherits: `StructBase` | Header: `GameplayEffect.h`

### `unreal.GameplayEffectCustomExecutionOutput`
Inherits: `StructBase` | Header: `GameplayEffectExecutionCalculation.h`

Struct representing the output of a custom gameplay effect execution.

### `unreal.GameplayEffectCustomExecutionParameters`
Inherits: `StructBase` | Header: `GameplayEffectExecutionCalculation.h`

Struct representing parameters for a custom gameplay effect execution. Should not be held onto via reference, used just for the scope of the execution

### `unreal.GameplayEffectExecutionDefinition`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Struct representing the definition of a custom execution for a gameplay effect. Custom executions run special logic from an outside class each time the gameplay effect executes.

### `unreal.GameplayEffectExecutionScopedModifierInfo`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Struct representing modifier info used exclusively for âscopedâ executions that happen instantaneously. These are folded into a calculation only for the extent of the calculation and never permane...

### `unreal.GameplayEffectModifierMagnitude`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Struct representing the magnitude of a gameplay effect modifier, potentially calculated in numerous different ways

### `unreal.GameplayEffectQuery`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Every set condition within this query must match in order for the query to match. i.e. individual query elements are ANDed together.

**Properties** (8):
  - `custom_match_delegate_bp`: `ActiveGameplayEffectQueryCustomMatch_Dynamic` — [Read-Write] BP-exposed delegate for providing custom matching conditions. (ActiveGameplayEffectQuer...
  - `effect_definition`: `Class` — [Read-Write] Matches on GameplayEffects with this definition (type(Class))
  - `effect_source`: `Object` — [Read-Write] Matches on GameplayEffects which come from this source (Object)
  - `effect_tag_query`: `GameplayTagQuery` — [Read-Write] Query that is matched against tags this GE has (GameplayTagQuery)
  - `modifying_attribute`: `GameplayAttribute` — [Read-Write] Matches on GameplayEffects which modify given attribute. (GameplayAttribute)
  - `owning_tag_query`: `GameplayTagQuery` — [Read-Write] Query that is matched against tags this GE gives (GameplayTagQuery)
  - `source_aggregate_tag_query`: `GameplayTagQuery` — [Read-Write] Query that is matched against all tags the source of this GE has (GameplayTagQuery)
  - `source_tag_query`: `GameplayTagQuery` — [Read-Write] Query that is matched against spec tags the source of this GE has (GameplayTagQuery)

### `unreal.GameplayEffectRemovalInfo`
Inherits: `StructBase` | Header: `GameplayEffectTypes.h`

Data struct for containing information pertinent to GameplayEffects as they are removed

**Properties** (3):
  - `effect_context`: `GameplayEffectContextHandle` [Read-Only] — [Read-Only] Actor this gameplay effect was targeting. (GameplayEffectContextHandle)
  - `premature_removal`: `bool` [Read-Only] — [Read-Only] True when the gameplay effectâs duration has not expired, meaning the gameplay effect ...
  - `stack_count`: `int` [Read-Only] — [Read-Only] Number of Stacks this gameplay effect had before it was removed. (int32)

### `unreal.GameplayEffectSpec`
Inherits: `StructBase` | Header: `GameplayEffect.h`

### `unreal.GameplayEffectSpecHandle`
Inherits: `StructBase` | Header: `GameplayEffectTypes.h`

Allows blueprints to generate a GameplayEffectSpec once and then reference it by handle, to apply it multiple times/multiple targets.

### `unreal.GameplayEventData`
Inherits: `StructBase` | Header: `GameplayAbilityTypes.h`

Metadata for a tag-based Gameplay Event, that can activate other abilities or run ability-specific logic

**Properties** (10):
  - `context_handle`: `GameplayEffectContextHandle` — [Read-Write] Polymorphic context information (GameplayEffectContextHandle)
  - `event_magnitude`: `float` — [Read-Write] The magnitude of the triggering event (float)
  - `event_tag`: `GameplayTag` — [Read-Write] Tag of the event that triggered this (GameplayTag)
  - `instigator`: `Actor` — [Read-Write] The instigator of the event (Actor)
  - `instigator_tags`: `GameplayTagContainer` — [Read-Write] Tags that the instigator has (GameplayTagContainer)
  - `optional_object`: `Object` — [Read-Write] An optional ability-specific object to be passed though the event (Object)
  - `optional_object2`: `Object` — [Read-Write] A second optional ability-specific object to be passed though the event (Object)
  - `target`: `Actor` — [Read-Write] The target of the event (Actor)
  - `target_data`: `GameplayAbilityTargetDataHandle` — [Read-Write] The polymorphic target information for the event (GameplayAbilityTargetDataHandle)
  - `target_tags`: `GameplayTagContainer` — [Read-Write] Tags that the target has (GameplayTagContainer)

### `unreal.GameplayModEvaluationChannelSettings`
Inherits: `StructBase` | Header: `GameplayEffectTypes.h`

Struct representing evaluation channel settings for a gameplay modifier

### `unreal.GameplayModifierEvaluatedData`
Inherits: `StructBase` | Header: `GameplayEffectTypes.h`

Data that describes what happened in an attribute modification. This is passed to ability set callbacks

### `unreal.GameplayModifierInfo`
Inherits: `StructBase` | Header: `GameplayEffect.h`

### `unreal.GameplayTagChangedEventWrapperSpecHandle`
Inherits: `StructBase` | Header: `AbilitySystemBlueprintLibrary.h`

Handle to a event wrapper listening for gameplay tag change(s) via one of the BindEventWrapper<to gameplay tag(s)> methods on the AbilitySystemLibrary

### `unreal.GameplayTagRequirements`
Inherits: `StructBase` | Header: `GameplayEffectTypes.h`

Encapsulate require and ignore tags

**Properties** (3):
  - `ignore_tags`: `GameplayTagContainer` — [Read-Write] None of these tags may be present (GameplayTagContainer)
  - `require_tags`: `GameplayTagContainer` — [Read-Write] All of these tags must be present (GameplayTagContainer)
  - `tag_query`: `GameplayTagQuery` — [Read-Write] Build up a more complex query that canât be expressed with RequireTags/IgnoreTags alo...

### `unreal.GameplayTargetDataFilter`
Inherits: `StructBase` | Header: `GameplayAbilityTargetDataFilter.h`

Simple actor target filter, games can subclass this

**Properties** (3):
  - `required_actor_class`: `Class` — [Read-Write] Subclass actors must be to pass the filter. (type(Class))
  - `reverse_filter`: `bool` — [Read-Write] Reverses the meaning of the filter, so it will exclude all actors that pass. (bool)
  - `self_filter`: `TargetDataFilterSelf` — [Read-Write] Filter based on whether or not this actor is âself.â (TargetDataFilterSelf)

### `unreal.GameplayTargetDataFilterHandle`
Inherits: `StructBase` | Header: `GameplayAbilityTargetDataFilter.h`

Polymorphic handle to filter structure that handles checking if actors should be targeted

### `unreal.InheritedTagContainer`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Structure that is used to combine tags from parent and child blueprints in a safe way

**Properties** (3):
  - `added`: `GameplayTagContainer` [Read-Only] — [Read-Only] Tags that I have (in addition to my parentâs tags) (GameplayTagContainer)
  - `combined_tags`: `GameplayTagContainer` [Read-Only] — [Read-Only] CombinedTags = Inherited - Removed + Added (GameplayTagContainer)
  - `removed`: `GameplayTagContainer` [Read-Only] — we cannot use this to remove a tag that exists on a target. It only modifies the result of CombinedT...

### `unreal.MovieSceneGameplayCueKey`
Inherits: `StructBase` | Header: `MovieSceneGameplayCueSections.h`

Movie Scene Gameplay Cue Key

### `unreal.ScalableFloat`
Inherits: `StructBase` | Header: `ScalableFloat.h`

Generic numerical value in the form Value * Curve[Level]

**Properties** (3):
  - `curve`: `CurveTableRowHandle` — [Read-Write] Curve that is evaluated at a specific level. If found, it is multipled by Value (CurveT...
  - `registry_type`: `DataRegistryType` — [Read-Write] Name of Data Registry containing curve to use. If set the RowName inside Curve is used ...
  - `value`: `float` — [Read-Write] Raw value, is multiplied by curve (float)

### `unreal.SetByCallerFloat`
Inherits: `StructBase` | Header: `GameplayEffect.h`

Struct for holding SetBytCaller data

### `unreal.WorldReticleParameters`
Inherits: `StructBase` | Header: `GameplayAbilityWorldReticle.h`

World Reticle Parameters

**Properties** (1):
  - `aoe_scale`: `Vector` — [Read-Write] (Vector)

### `unreal.AbilityAsync`
Inherits: `CancellableAsyncAction` | Header: `AbilityAsync.h`

AbilityAsync is a base class for ability-specific BlueprintAsyncActions. These are similar to ability tasks, but they can be executed from any blueprint like an actor and are not tied to a specific ab...

**Methods** (1):
  - `end_action()` -> `None` — Explicitly end the action, will disable any callbacks and allow action to be destroyed

### `unreal.AbilityAsync_WaitAttributeChanged`
Inherits: `AbilityAsync` | Header: `AbilityAsync_WaitAttributeChanged.h`

Ability Async Wait Attribute Changed

**Properties** (1):
  - `changed`: `AsyncWaitAttributeChangedDelegate` — [Read-Write] (AsyncWaitAttributeChangedDelegate)

### `unreal.AbilityAsync_WaitGameplayEffectApplied`
Inherits: `AbilityAsync` | Header: `AbilityAsync_WaitGameplayEffectApplied.h`

This action listens for specific gameplay effect applications based off specified tags. Effects themselves are not replicated; rather the tags they grant, the attributes they change, and the gameplay ...

**Properties** (1):
  - `on_applied`: `OnAppliedDelegate` — [Read-Write] (OnAppliedDelegate)

### `unreal.AbilityAsync_WaitGameplayEvent`
Inherits: `AbilityAsync` | Header: `AbilityAsync_WaitGameplayEvent.h`

Ability Async Wait Gameplay Event

**Properties** (1):
  - `event_received`: `EventReceivedDelegate` — [Read-Write] (EventReceivedDelegate)

### `unreal.AbilityAsync_WaitGameplayTag`
Inherits: `AbilityAsync` | Header: `AbilityAsync_WaitGameplayTag.h`

Ability Async Wait Gameplay Tag

### `unreal.AbilityAsync_WaitGameplayTagAdded`
Inherits: `AbilityAsync_WaitGameplayTag` | Header: `AbilityAsync_WaitGameplayTag.h`

Ability Async Wait Gameplay Tag Added

**Properties** (1):
  - `added`: `AsyncWaitGameplayTagDelegate` — [Read-Write] (AsyncWaitGameplayTagDelegate)

### `unreal.AbilityAsync_WaitGameplayTagCountChanged`
Inherits: `AbilityAsync` | Header: `AbilityAsync_WaitGameplayTagCountChanged.h`

Ability Async Wait Gameplay Tag Count Changed

**Properties** (1):
  - `tag_count_changed`: `AsyncWaitGameplayTagCountDelegate` — [Read-Write] (AsyncWaitGameplayTagCountDelegate)

### `unreal.AbilityAsync_WaitGameplayTagQuery`
Inherits: `AbilityAsync` | Header: `AbilityAsync_WaitGameplayTagQuery.h`

This class defines an async node to wait on a gameplay tag query.

**Properties** (1):
  - `triggered`: `AsyncWaitGameplayTagQueryDelegate` — [Read-Write] This delegate will be triggered when the trigger condition has been met. (AsyncWaitGame...

### `unreal.AbilityAsync_WaitGameplayTagRemoved`
Inherits: `AbilityAsync_WaitGameplayTag` | Header: `AbilityAsync_WaitGameplayTag.h`

Ability Async Wait Gameplay Tag Removed

**Properties** (1):
  - `removed`: `AsyncWaitGameplayTagDelegate` — [Read-Write] (AsyncWaitGameplayTagDelegate)

### `unreal.AbilitySystemCheatManagerExtension`
Inherits: `CheatManagerExtension` | Header: `AbilitySystemCheatManagerExtension.h`

Cheats related to GAS

### `unreal.AbilitySystemComponent`
Inherits: `GameplayTasksComponent` | Header: `AbilitySystemComponent.h`

The core ActorComponent for interfacing with the GameplayAbilities System

**Methods** (52):
  - `apply_gameplay_effect_spec_to_self(spec_handle)` -> `ActiveGameplayEffectHandle` — Applies a previously created gameplay effect spec to this component
  - `apply_gameplay_effect_spec_to_target(spec_handle, target)` -> `ActiveGameplayEffectHandle` — Applies a previously created gameplay effect spec to a target
  - `apply_gameplay_effect_to_self(gameplay_effect_class, level, effect_context)` -> `ActiveGameplayEffectHandle` — Apply a gameplay effect to self
  - `apply_gameplay_effect_to_target(gameplay_effect_class, target, level, context)` -> `ActiveGameplayEffectHandle` — Apply a gameplay effect to passed in target
  - `clear_ability(handle)` -> `None` — Removes the specified ability. This will be ignored if the actor is not authoritative.
  - `clear_all_abilities()` -> `None` — Wipes all âgivenâ abilities. This will be ignored if the actor is not authoritative.
  - `clear_all_abilities_with_input_id(input_id = 0)` -> `None` — Clears all abilities bound to a given Input ID This will be ignored if the actor is not authoritative
  - `find_all_abilities_matching_query(query)` -> `Array [ GameplayAbilitySpecHandle ]` — Returns an array with all abilities that match the provided Gameplay Tag Query
  - `find_all_abilities_with_input_id(input_id = 0)` -> `Array [ GameplayAbilitySpecHandle ]` — Returns an array with all abilities bound to an Input ID value
  - `find_all_abilities_with_tags(tags, exact_match = True)` -> `Array [ GameplayAbilitySpecHandle ]` — Returns an array with all abilities that match the provided tags
  - `get_active_effects(query)` -> `Array [ ActiveGameplayEffectHandle ]` — Returns list of active effects, for a query
  - `get_active_effects_with_all_tags(tags)` -> `Array [ ActiveGameplayEffectHandle ]` — Returns list of active effects that have all of the passed in tags
  - `get_all_abilities()` -> `Array [ GameplayAbilitySpecHandle ]` — Returns an array with all granted ability handles NOTE: currently this doesnât include abilities that are mid-activati...
  - `get_all_attributes()` -> `Array [ GameplayAttribute ]` — Returns a list of all attributes for this abilty system component
  - `get_attribute_set(attribute_set_class)` -> `AttributeSet` — Returns a reference to the Attribute Set instance, if one exists in this component
  - `get_effect_context()` -> `GameplayEffectContextHandle` — deprecated: âget_effect_contextâ was renamed to âmake_effect_contextâ.
  - `get_gameplay_attribute_value(found=bool)` — Returns the current value of the given gameplay attribute, or zero if the attribute is not found. NOTE: This doesnât t...
  - `get_gameplay_effect_count(source_gameplay_effect, optional_instigator_filter_component, enforce_on_going_check = True)` -> `int32` — Get the count of the specified source effect on the ability system component. For non-stacking effects, this is the sum ...
  - `get_gameplay_effect_count_if_loaded(soft_source_gameplay_effect, optional_instigator_filter_component, enforce_on_going_check = True)` -> `int32` — Get the count of the specified source effect on the ability system component. For non-stacking effects, this is the sum ...
  - `get_gameplay_effect_magnitude(handle, attribute)` -> `float` — Raw accessor to ask the magnitude of a gameplay effect, not necessarily always correct. How should outside code (UI, etc...
  - `get_gameplay_tag_count(gameplay_tag)` -> `int32` — Returns the current count of the given gameplay tag. This includes both loose tags, and tags granted by gameplay effects...
  - `get_user_ability_activation_inhibited()` -> `bool` — This is meant to be used to inhibit activating an ability from an input perspective. (E.g., the menu is pulled up, anoth...
  - `give_ability(ability_class, level = 0, input_id = -1)` -> `GameplayAbilitySpecHandle` — Grants a Gameplay Ability and returns its handle. This will be ignored if the actor is not authoritative.
  - `give_ability_and_activate_once(ability_class, level = 0, input_id = -1)` -> `GameplayAbilitySpecHandle` — Grants a Gameplay Ability, activates it once, and removes it. This will be ignored if the actor is not authoritative.
  - `has_all_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against all of the specified tags (expands to include parents of asset...
  - `has_any_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against any of the specified tags (expands to include parents of asset...
  - `has_matching_gameplay_tag(tag_to_check)` -> `bool` — Check if the asset has a gameplay tag that matches against the specified tag (expands to include parents of asset tags)
  - `init_stats(attributes, data_table)` -> `None` — K2 Init Stats
  - `input_cancel()` -> `None` — Sends a local player Input Cancel event, notifying abilities
  - `input_confirm()` -> `None` — Sends a local player Input Confirm event, notifying abilities
  - `is_gameplay_cue_active(gameplay_cue_tag)` -> `bool` — Allows polling to see if a GameplayCue is active. We expect most GameplayCue handling to be event based, but some cases ...
  - `make_effect_context()` -> `GameplayEffectContextHandle` — Create an EffectContext for the owner of this AbilitySystemComponent
  - `make_outgoing_spec(gameplay_effect_class, level, context)` -> `GameplayEffectSpecHandle` — Get an outgoing GameplayEffectSpec that is ready to be applied to other things.
  - `press_input_id(input_id)` -> `None`
  - `release_input_id(input_id)` -> `None` — Sends a local player Input Released event with the provided Input ID, notifying any bound abilities
  - `remove_active_effects_with_applied_tags(tags)` -> `int32` — Removes all active effects that apply any of the tags in Tags
  - `remove_active_effects_with_granted_tags(tags)` -> `int32` — Removes all active effects that grant any of the tags in Tags
  - `remove_active_effects_with_source_tags(tags)` -> `int32` — Removes all active effects with captured source tags that contain any of the tags in Tags
  - `remove_active_effects_with_tags(tags)` -> `int32` — Removes all active effects that contain any of the tags in Tags
  - `remove_active_gameplay_effect(handle, stacks_to_remove = -1)` -> `bool` — Removes the specified GameplayEffect by Handle.
  - `remove_active_gameplay_effect_by_source_effect(gameplay_effect, instigator_ability_system_component, stacks_to_remove = -1)` -> `None` — Remove active gameplay effects whose backing definition are the specified gameplay effect class
  - `set_active_gameplay_effect_level(active_handle, new_level)` -> `None` — Updates the level of an already applied gameplay effect. The intention is that this is âseemlessâ and doesnt behave ...
  - `set_active_gameplay_effect_level_using_query(query, new_level)` -> `None` — Updates the level of an already applied gameplay effect. The intention is that this is âseemlessâ and doesnt behave ...
  - `set_user_ability_activation_inhibited(new_inhibit)` -> `None` — Disable or Enable a local user from being able to activate abilities. This should only be used for input/UI etc related ...
  - `target_cancel()` -> `None` — Any active targeting actors will be stopped and canceled, not returning any targeting data
  - `target_confirm()` -> `None` — Any active targeting actors will be told to stop and return current targeting data
  - `try_activate_abilities_by_tag(gameplay_tag_container, allow_remote_activation = True)` -> `bool` — Attempts to activate every gameplay ability that matches the given tag and DoesAbilitySatisfyTagRequirements(). Returns ...
  - `try_activate_ability(ability_to_activate, allow_remote_activation = True)` -> `bool` — Attempts to activate the given ability, will check costs and requirements before doing so. Returns true if it thinks it ...
  - `try_activate_ability_by_class(ability_to_activate, allow_remote_activation = True)` -> `bool` — Attempts to activate the ability that is passed in. This will check costs and requirements before doing so. Returns true...
  - `try_activate_ability_by_tag(gameplay_tag_container: GameplayTagContainer, allow_remote_activation: bool = True)` -> `bool` — deprecated: âtry_activate_ability_by_tagâ was renamed to âtry_activate_abilities_by_tagâ.
  - `update_active_gameplay_effect_set_by_caller_magnitude(active_handle, set_by_caller_tag, new_value)` -> `None` — Dynamically update the set-by-caller magnitude for an active gameplay effect
  - `update_active_gameplay_effect_set_by_caller_magnitudes(active_handle, new_set_by_caller_values)` -> `None` — Dynamically update multiple set-by-caller magnitudes for an active gameplay effect

**Properties** (2):
  - `activatable_abilities`: `GameplayAbilitySpecContainer` — -This will include CDOs for non instanced abilities and per-execution instanced abilities.
-Actor-in...
  - `affected_anim_instance_tag`: `Name` — [Read-Write] The linked Anim Instance that this component will play montages in. Use NAME_None for t...

### `unreal.AbilitySystemDebugHUD`
Inherits: `HUD` | Header: `AbilitySystemDebugHUD.h`

Ability System Debug HUD

### `unreal.AbilitySystemLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AbilitySystemBlueprintLibrary.h`

Blueprint library for ability system. Many of these functions are useful to call from native as well

**Methods** (98):
  - `ability_target_data_from_actor(actor)` -> `GameplayAbilityTargetDataHandle` [classmethod] — Creates single actor target data
  - `ability_target_data_from_actor_array(actor_array, one_target_per_handle)` -> `GameplayAbilityTargetDataHandle` [classmethod] — Creates actor array target data
  - `ability_target_data_from_hit_result(hit_result)` -> `GameplayAbilityTargetDataHandle` [classmethod] — Creates a target data with a single hit result
  - `ability_target_data_from_locations(source_location, target_location)` -> `GameplayAbilityTargetDataHandle` [classmethod] — Creates a target data with a source and destination location
  - `add_asset_tag(spec_handle, new_gameplay_tag)` -> `GameplayEffectSpecHandle` [classmethod] — Adds NewGameplayTag to this instance of the effect
  - `add_asset_tags(spec_handle, new_gameplay_tags)` -> `GameplayEffectSpecHandle` [classmethod] — Adds NewGameplayTags to this instance of the effect
  - `add_granted_tag(spec_handle, new_gameplay_tag)` -> `GameplayEffectSpecHandle` [classmethod] — This instance of the effect will now grant NewGameplayTag to the object that this effect is applied to
  - `add_granted_tags(spec_handle, new_gameplay_tags)` -> `GameplayEffectSpecHandle` [classmethod] — This instance of the effect will now grant NewGameplayTags to the object that this effect is applied to
  - `add_linked_gameplay_effect(spec_handle, linked_gameplay_effect)` -> `GameplayEffectSpecHandle` [classmethod] — Add Linked Gameplay Effect deprecated: Function âAddLinkedGameplayEffectâ is deprecated.
  - `add_linked_gameplay_effect_spec(spec_handle, linked_gameplay_effect_spec)` -> `GameplayEffectSpecHandle` [classmethod] — Add Linked Gameplay Effect Spec deprecated: Function âAddLinkedGameplayEffectSpecâ is deprecated.
  - `add_loose_gameplay_tags(actor, gameplay_tags, should_replicate = False)` -> `bool` [classmethod] — Manually adds a set of tags to a given actor, and optionally replicates them.
  - `append_target_data_handle(target_handle, handle_to_add)` -> `GameplayAbilityTargetDataHandle` [classmethod] — Copies targets from HandleToAdd to TargetHandle
  - `assign_set_by_caller_magnitude(spec_handle, data_name, magnitude)` -> `GameplayEffectSpecHandle` [classmethod] — Sets a raw name Set By Caller magnitude value, the tag version should normally be used
  - `assign_tag_set_by_caller_magnitude(spec_handle, data_tag, magnitude)` -> `GameplayEffectSpecHandle` [classmethod] — Sets a gameplay tag Set By Caller magnitude value
  - `bind_event_wrapper_to_any_of_gameplay_tag_container_changed(ability_system_component, tag_container, gameplay_tag_changed_event_wrapper_delegate, execute_immediately_if_tag_applied = True, tag_listening_policy = GameplayTagEventType.NEW_OR_REMOVED)` -> `GameplayTagChangedEventWrapperSpecHandle` [classmethod] — Binds to changes in the given TagContainer on the given ASCâs owned tags. Cache off the returned handle and call one o...
  - `bind_event_wrapper_to_any_of_gameplay_tags_changed(ability_system_component, tags, gameplay_tag_changed_event_wrapper_delegate, execute_immediately_if_tag_applied = True, tag_listening_policy = GameplayTagEventType.NEW_OR_REMOVED)` -> `GameplayTagChangedEventWrapperSpecHandle` [classmethod] — Binds to changes in the given Tags on the given ASCâs owned tags. Cache off the returned handle and call one of the â...
  - `bind_event_wrapper_to_gameplay_tag_changed(ability_system_component, tag, gameplay_tag_changed_event_wrapper_delegate, execute_immediately_if_tag_applied = True, tag_listening_policy = GameplayTagEventType.NEW_OR_REMOVED)` -> `GameplayTagChangedEventWrapperSpecHandle` [classmethod] — Binds to changes in the given Tag on the given ASCâs owned tags. Cache off the returned handle and call one of the â...
  - `clone_spec_handle(new_instigator, effect_causer, gameplay_effect_spec_handle_clone)` -> `GameplayEffectSpecHandle` [classmethod] — Create a spec handle, cloning another
  - `conv_scalable_float_to_double(input, level = 0.000000)` -> `double` [classmethod] — Converts the given Scalable float to the value at the given level.
  - `conv_scalable_float_to_float(input, level = 0.000000)` -> `float` [classmethod] — Converts the given Scalable float to the value at the given level.
  - `does_gameplay_cue_meet_tag_requirements(parameters, source_tag_reqs, target_tag_reqs)` -> `bool` [classmethod] — Returns true if the aggregated source and target tags from the effect spec meets the tag requirements
  - `does_target_data_contain_actor(target_data, index, actor)` -> `bool` [classmethod] — Returns true if the given TargetData has the actor passed in targeted
  - `effect_context_add_hit_result(effect_context, hit_result, reset)` -> `None` [classmethod] — Adds a hit result to the effect context
  - `effect_context_get_effect_causer(effect_context)` -> `Actor` [classmethod] — Gets the physical actor that caused the effect, possibly a projectile or weapon
  - `effect_context_get_hit_result(effect_context)` -> `HitResult` [classmethod] — Extracts a hit result from the effect context if it is set
  - `effect_context_get_instigator_actor(effect_context)` -> `Actor` [classmethod] — Gets the instigating actor (that holds the ability system component) of the EffectContext
  - `effect_context_get_origin(effect_context)` -> `Vector` [classmethod] — Gets the location the effect originated from
  - `effect_context_get_original_instigator_actor(effect_context)` -> `Actor` [classmethod] — Gets the original instigator actor that started the chain of events to cause this effect
  - `effect_context_get_source_object(effect_context)` -> `Object` [classmethod] — Gets the source object of the effect.
  - `effect_context_has_hit_result(effect_context)` -> `bool` [classmethod] — Returns true if there is a valid hit result inside the effect context
  - `effect_context_is_instigator_locally_controlled(effect_context)` -> `bool` [classmethod] — Returns true if the ability system component that instigated this is locally controlled
  - `effect_context_is_valid(effect_context)` -> `bool` [classmethod] — Returns true if this context has ever been initialized
  - `effect_context_set_origin(effect_context, origin)` -> `None` [classmethod] — Sets the location the effect originated from
  - `equal_equal_active_gameplay_effect_handle(a, b)` -> `bool` [classmethod] — Equality operator for two Active Gameplay Effect Handles
  - `equal_equal_gameplay_ability_spec_handle(a, b)` -> `bool` [classmethod] — Equality operator for two Gameplay Ability Spec Handles
  - `equal_equal_gameplay_attribute_gameplay_attribute(attribute_a, attribute_b)` -> `bool` [classmethod] — Simple equality operator for gameplay attributes
  - `evaluate_attribute_value_with_tags(ability_system, attribute, source_tags, success=bool)` [classmethod] — Returns the value of Attribute from the ability system component AbilitySystem after evaluating it with source and targe...
  - `evaluate_attribute_value_with_tags_and_base(ability_system, attribute, source_tags, target_tags, success=bool)` [classmethod] — Returns the value of Attribute from the ability system component AbilitySystem after evaluating it with source and targe...
  - `filter_target_data(target_data_handle, actor_filter_class)` -> `GameplayAbilityTargetDataHandle` [classmethod] — Create a new target data handle with filtration performed on the data
  - `forward_gameplay_cue_to_target(target_cue_interface, event_type, parameters)` -> `None` [classmethod] — Forwards the gameplay cue to another gameplay cue interface object
  - `get_ability_system_component(actor)` -> `AbilitySystemComponent` [classmethod] — Tries to find an ability system component on the actor, will use AbilitySystemInterface or fall back to a component sear...
  - `get_active_gameplay_effect_debug_string(active_handle)` -> `str` [classmethod] — Returns a debug string for display
  - `get_active_gameplay_effect_expected_end_time(active_handle)` -> `float` [classmethod] — Returns the expected end time (when we think the GE will expire) for a given GameplayEffect (note someone could remove o...
  - `get_active_gameplay_effect_remaining_duration(world_context_object, active_handle)` -> `float` [classmethod] — Returns the total duration for a given GameplayEffect, basically ExpectedEndTime - Current Time
  - `get_active_gameplay_effect_stack_count(active_handle)` -> `int32` [classmethod] — Returns current stack count of an active Gameplay Effect. Will return 0 if the GameplayEffect is no longer valid.
  - `get_active_gameplay_effect_stack_limit_count(active_handle)` -> `int32` [classmethod] — Returns stack limit count of an active Gameplay Effect. Will return 0 if the GameplayEffect is no longer valid.
  - `get_active_gameplay_effect_start_time(active_handle)` -> `float` [classmethod] — Returns the start time (time which the GE was added) for a given GameplayEffect
  - `get_active_gameplay_effect_total_duration(active_handle)` -> `float` [classmethod] — Returns the total duration for a given GameplayEffect
  - `get_actor_by_index(parameters, index)` -> `Actor` [classmethod] — Returns actor stored in the Effect Context used by this cue
  - `get_actor_count(parameters)` -> `int32` [classmethod] — Returns number of actors stored in the Effect Context used by this cue
  - `get_actors_from_target_data(target_data, index)` -> `Array [ Actor ]` [classmethod] — Returns all actors targeted, for a given index
  - `get_all_actors_from_target_data(target_data)` -> `Array [ Actor ]` [classmethod] — Returns all actors targeted
  - `get_all_linked_gameplay_effect_spec_handles(spec_handle)` -> `Array [ GameplayEffectSpecHandle ]` [classmethod] — Get All Linked Gameplay Effect Spec Handles deprecated: Function âGetAllLinkedGameplayEffectSpecHandlesâ is deprecat...
  - `get_data_count_from_target_data(target_data)` -> `int32` [classmethod] — Returns number of target data objects, not necessarily number of distinct targets
  - `get_debug_string_from_gameplay_attribute(attribute)` -> `str` [classmethod] — Returns FString representation of a gameplay attributeâs set class and name, in the form of AttrSetName.AttrName (or j...
  - `get_effect_context(spec_handle)` -> `GameplayEffectContextHandle` [classmethod] — Gets the GameplayEffectSpecâs effect context handle
  - `get_float_attribute(actor, successfully_found_attribute=bool)` [classmethod] — Returns the value of Attribute from the ability system component belonging to Actor.
  - `get_float_attribute_base(actor, successfully_found_attribute=bool)` [classmethod] — Returns the base value of Attribute from the ability system component belonging to Actor.
  - `get_float_attribute_base_from_ability_system_component(ability_system_component, successfully_found_attribute=bool)` [classmethod] — Returns the base value of Attribute from the ability system component AbilitySystemComponent.
  - `get_float_attribute_from_ability_system_component(ability_system, successfully_found_attribute=bool)` [classmethod] — Returns the value of Attribute from the ability system component AbilitySystem.
  - `get_gameplay_ability_from_spec_handle(ability_system, is_instance=bool)` [classmethod] — Provides the Gameplay Ability object associated with an Ability Spec Handle This can be either an instanced ability, or ...
  - `get_gameplay_cue_direction(target_actor, parameters)` -> `Vector or None` [classmethod] — Gets the best normalized effect direction for this gameplay cue. This is useful for effects that require the direction o...
  - `get_gameplay_cue_end_location_and_normal(target_actor, parameters)` -> `(location=Vector, normal=Vector) or None` [classmethod] — Gets the best end location and normal for this gameplay cue. If there is hit result data, it will return this. Otherwise...
  - `get_gameplay_effect_asset_tags(effect_class)` -> `GameplayTagContainer` [classmethod] — Returns all tags that the Gameplay Effect has (that denote the GE Asset itself) and does not grant to any Actor.
  - `get_gameplay_effect_from_active_effect_handle(active_handle)` -> `GameplayEffect` [classmethod] — Returns the Gameplay Effect CDO from an active handle. This reference should be considered read only, but you can use it...
  - `get_gameplay_effect_granted_tags(effect_class)` -> `GameplayTagContainer` [classmethod] — Returns all tags that the Gameplay Effect grants to the target Actor
  - `get_gameplay_effect_ui_data(effect_class, data_type)` -> `GameplayEffectUIData` [classmethod] — Returns the UI data for a gameplay effect class (if any)
  - `get_hit_result(parameters)` -> `HitResult` [classmethod] — Returns a hit result stored in the effect context if valid
  - `get_hit_result_from_target_data(hit_result, index)` -> `HitResult` [classmethod] — Returns the hit result for a given index if it exists
  - `get_instigator_actor(parameters)` -> `Actor` [classmethod] — Gets the instigating actor (that holds the ability system component) of the GameplayCue
  - `get_instigator_transform(parameters)` -> `Transform` [classmethod] — Gets instigating world location
  - `get_modified_attribute_magnitude(spec_handle, attribute)` -> `float` [classmethod] — Gets the magnitude of change for an attribute on an APPLIED GameplayEffectSpec.
  - `get_origin(parameters)` -> `Vector` [classmethod] — Gets instigating world location
  - `get_target_data_end_point(target_data, index)` -> `Vector` [classmethod] — Returns the end point for a given index if it exists
  - `get_target_data_end_point_transform(target_data, index)` -> `Transform` [classmethod] — Returns the end point transform for a given index if it exists
  - `get_target_data_origin(target_data, index)` -> `Transform` [classmethod] — Returns the origin for a given index if it exists
  - `has_hit_result(parameters)` -> `bool` [classmethod] — Checks if the effect context has a hit reslt stored inside
  - `is_gameplay_ability_active(gameplay_ability)` -> `bool` [classmethod] — Returns true if the passed-in Gameplay Ability instance is active (activated and not yet ended).
  - `is_instigator_locally_controlled(parameters)` -> `bool` [classmethod] — Returns true if the ability system component that spawned this cue is locally controlled
  - `is_instigator_locally_controlled_player(parameters)` -> `bool` [classmethod] — Returns true if the ability system component that spawned this cue is locally controlled and a player
  - `is_valid(attribute)` -> `bool` [classmethod] — Returns true if the attribute actually exists
  - `make_filter_handle(filter, filter_actor)` -> `GameplayTargetDataFilterHandle` [classmethod] — Create a handle for filtering target data, filling out all fields
  - `make_spec_handle(gameplay_effect, instigator, effect_causer, level = 1.000000)` -> `GameplayEffectSpecHandle` [classmethod] — Make Spec Handle deprecated: Function âMakeSpecHandleâ is deprecated.
  - `make_spec_handle_by_class(gameplay_effect, instigator, effect_causer, level = 1.000000)` -> `GameplayEffectSpecHandle` [classmethod] — Create a spec handle, filling out all fields
  - `not_equal_active_gameplay_effect_handle(a, b)` -> `bool` [classmethod] — Inequality operator for two Active Gameplay Effect Handles
  - `not_equal_gameplay_ability_spec_handle(a, b)` -> `bool` [classmethod] — Inequality operator for two Gameplay Ability Spec Handles
  - `not_equal_gameplay_attribute_gameplay_attribute(attribute_a, attribute_b)` -> `bool` [classmethod] — Simple inequality operator for gameplay attributes
  - `remove_loose_gameplay_tags(actor, gameplay_tags, should_replicate = False)` -> `bool` [classmethod] — Manually removes a set of tags from a given actor, with optional replication.
  - `send_gameplay_event_to_actor(actor, event_tag, payload)` -> `None` [classmethod] — This function can be used to trigger an ability on the actor in question with useful payload data.
  - `set_duration(spec_handle, duration)` -> `GameplayEffectSpecHandle` [classmethod] — Manually sets the duration on a specific effect
  - `set_stack_count(spec_handle, stack_count)` -> `GameplayEffectSpecHandle` [classmethod] — Sets the GameplayEffectSpecâs StackCount to the specified amount (prior to applying)
  - `set_stack_count_to_max(spec_handle)` -> `GameplayEffectSpecHandle` [classmethod] — Sets the GameplayEffectSpecâs StackCount to the max stack count defined in the GameplayEffect definition
  - `target_data_has_actor(target_data, index)` -> `bool` [classmethod] — Returns true if the given TargetData has at least 1 actor targeted
  - `target_data_has_end_point(target_data, index)` -> `bool` [classmethod] — Returns true if the target data has an end point
  - `target_data_has_hit_result(hit_result, index)` -> `bool` [classmethod] — Returns true if the target data has a hit result
  - `target_data_has_origin(target_data, index)` -> `bool` [classmethod] — Returns true if the target data has an origin
  - `unbind_all_gameplay_tag_changed_event_wrappers_for_handle(handle)` -> `None` [classmethod] — Unbinds the event wrapper tag change event bound via a BindEventWrapper<to gameplay tag(s)> method that is tied to the g...
  - `unbind_gameplay_tag_changed_event_wrapper_for_handle(tag, handle)` -> `None` [classmethod] — (expected to unbind 1 or none, only makes sense to call if the original binding was for listening to multiple tags.)

### `unreal.AbilitySystemTestAttributeSet`
Inherits: `AttributeSet` | Header: `AbilitySystemTestAttributeSet.h`

Ability System Test Attribute Set

**Properties** (16):
  - `armor_damage_reduction`: `float` — [Read-Write] (float)
  - `crit_chance`: `float` — [Read-Write] (float)
  - `crit_multiplier`: `float` — [Read-Write] (float)
  - `damage`: `float` — [Read-Write] This Damage is just used for applying negative health mods. Its not a âpersistentâ ...
  - `dodge_chance`: `float` — [Read-Write] (float)
  - `health`: `float` — [Read-Write] You canât make a GameplayEffect modify Health Directly (go through) (float)
  - `life_steal`: `float` — [Read-Write] (float)
  - `mana`: `GameplayAttributeData` — [Read-Write] (GameplayAttributeData)
  - `max_health`: `float` — [Read-Write] NOTE ON MUTABLE:
This is only done so that UAbilitySystemTestAttributeSet can be initia...
  - `max_mana`: `float` — [Read-Write] (float)
  - `no_stack_attribute`: `float` — [Read-Write] (float)
  - `physical_damage`: `float` — [Read-Write] This Attribute is the actual physical damage for this actor. It will power physical bas...
  - `spell_damage`: `float` — [Read-Write] This Attribute is the actual spell damage for this actor. It will power spell based Gam...
  - `stacking_attribute1`: `float` — [Read-Write] (float)
  - `stacking_attribute2`: `float` — [Read-Write] (float)
  - `strength`: `float` — [Read-Write] (float)

### `unreal.AbilitySystemTestPawn`
Inherits: `DefaultPawn` | Header: `AbilitySystemTestPawn.h`

Ability System Test Pawn

**Methods** (1):
  - `forward_gameplay_cue_to_parent()` -> `None` — Call from a Cue handler event to continue checking for additional, more generic handlers. Called from the ability system...

**Properties** (1):
  - `ability_system_component`: `AbilitySystemComponent` [Read-Only] — [Read-Only] DefaultPawn collision component (AbilitySystemComponent)

### `unreal.AbilityTask`
Inherits: `GameplayTask` | Header: `AbilityTask.h`

Ability Task

### `unreal.AbilityTask_ApplyRootMotion_Base`
Inherits: `AbilityTask` | Header: `AbilityTask_ApplyRootMotion_Base.h`

Base class for ability tasks that apply root motion

### `unreal.AbilityTask_ApplyRootMotionConstantForce`
Inherits: `AbilityTask_ApplyRootMotion_Base` | Header: `AbilityTask_ApplyRootMotionConstantForce.h`

Applies force to characterâs movement

**Properties** (1):
  - `on_finish`: `ApplyRootMotionConstantForceDelegate` — [Read-Write] (ApplyRootMotionConstantForceDelegate)

### `unreal.AbilityTask_ApplyRootMotionJumpForce`
Inherits: `AbilityTask_ApplyRootMotion_Base` | Header: `AbilityTask_ApplyRootMotionJumpForce.h`

Applies force to characterâs movement

**Methods** (1):
  - `finish()` -> `None` — Finish

**Properties** (2):
  - `on_finish`: `ApplyRootMotionJumpForceDelegate` — [Read-Write] (ApplyRootMotionJumpForceDelegate)
  - `on_landed`: `ApplyRootMotionJumpForceDelegate` — [Read-Write] (ApplyRootMotionJumpForceDelegate)

### `unreal.AbilityTask_ApplyRootMotionMoveToActorForce`
Inherits: `AbilityTask_ApplyRootMotion_Base` | Header: `AbilityTask_ApplyRootMotionMoveToActorForce.h`

Applies force to characterâs movement

**Properties** (1):
  - `on_finished`: `ApplyRootMotionMoveToActorForceDelegate` — [Read-Write] (ApplyRootMotionMoveToActorForceDelegate)

### `unreal.AbilityTask_ApplyRootMotionMoveToForce`
Inherits: `AbilityTask_ApplyRootMotion_Base` | Header: `AbilityTask_ApplyRootMotionMoveToForce.h`

Applies force to characterâs movement

**Properties** (2):
  - `on_timed_out`: `ApplyRootMotionMoveToForceDelegate` — [Read-Write] (ApplyRootMotionMoveToForceDelegate)
  - `on_timed_out_and_destination_reached`: `ApplyRootMotionMoveToForceDelegate` — [Read-Write] (ApplyRootMotionMoveToForceDelegate)

### `unreal.AbilityTask_ApplyRootMotionRadialForce`
Inherits: `AbilityTask_ApplyRootMotion_Base` | Header: `AbilityTask_ApplyRootMotionRadialForce.h`

Applies force to characterâs movement

**Properties** (1):
  - `on_finish`: `ApplyRootMotionRadialForceDelegate` — [Read-Write] (ApplyRootMotionRadialForceDelegate)

### `unreal.AbilityTask_MoveToLocation`
Inherits: `AbilityTask` | Header: `AbilityTask_MoveToLocation.h`

Move to a location, ignoring clipping, over a given length of time. Ends when the TargetLocation is reached. This will RESET your characterâs current movement mode! If you wish to maintain PHYS_Flyi...

**Properties** (1):
  - `on_target_location_reached`: `MoveToLocationDelegate` — [Read-Write] (MoveToLocationDelegate)

### `unreal.AbilityTask_NetworkSyncPoint`
Inherits: `AbilityTask` | Header: `AbilityTask_NetworkSyncPoint.h`

Task for providing a generic sync point for client server (one can wait for a signal from the other)

**Properties** (1):
  - `on_sync`: `NetworkSyncDelegate` — [Read-Write] (NetworkSyncDelegate)

### `unreal.AbilityTask_PlayAnimAndWait`
Inherits: `AbilityTask` | Header: `AbilityTask_PlayAnimAndWait.h`

Ability Task Play Anim and Wait

**Properties** (5):
  - `on_blend_in`: `PlayAnimWaitSimpleDelegate` — [Read-Write] (PlayAnimWaitSimpleDelegate)
  - `on_blend_out`: `PlayAnimWaitSimpleDelegate` — [Read-Write] (PlayAnimWaitSimpleDelegate)
  - `on_cancelled`: `PlayAnimWaitSimpleDelegate` — [Read-Write] (PlayAnimWaitSimpleDelegate)
  - `on_completed`: `PlayAnimWaitSimpleDelegate` — [Read-Write] (PlayAnimWaitSimpleDelegate)
  - `on_interrupted`: `PlayAnimWaitSimpleDelegate` — [Read-Write] (PlayAnimWaitSimpleDelegate)

### `unreal.AbilityTask_PlayMontageAndWait`
Inherits: `AbilityTask` | Header: `AbilityTask_PlayMontageAndWait.h`

Ability task to simply play a montage. Many games will want to make a modified version of this task that looks for game-specific events

**Properties** (5):
  - `on_blend_out`: `MontageWaitSimpleDelegate` — [Read-Write] (MontageWaitSimpleDelegate)
  - `on_blended_in`: `MontageWaitSimpleDelegate` — [Read-Write] (MontageWaitSimpleDelegate)
  - `on_cancelled`: `MontageWaitSimpleDelegate` — [Read-Write] (MontageWaitSimpleDelegate)
  - `on_completed`: `MontageWaitSimpleDelegate` — [Read-Write] (MontageWaitSimpleDelegate)
  - `on_interrupted`: `MontageWaitSimpleDelegate` — [Read-Write] (MontageWaitSimpleDelegate)

### `unreal.AbilityTask_Repeat`
Inherits: `AbilityTask` | Header: `AbilityTask_Repeat.h`

Repeat a task a certain number of times at a given interval.

**Properties** (2):
  - `on_finished`: `RepeatedActionDelegate` — [Read-Write] (RepeatedActionDelegate)
  - `on_perform_action`: `RepeatedActionDelegate` — [Read-Write] (RepeatedActionDelegate)

### `unreal.AbilityTask_SpawnActor`
Inherits: `AbilityTask` | Header: `AbilityTask_SpawnActor.h`

Convenience task for spawning actors on the network authority. If not the net authority, we will not spawn and Success will not be called. The nice thing this adds is the ability to modify expose on s...

**Properties** (2):
  - `did_not_spawn`: `SpawnActorDelegate` — on clients or potentially on server if they fail to spawn (rare) (SpawnActorDelegate) [Read-Write] C...
  - `success`: `SpawnActorDelegate` — [Read-Write] (SpawnActorDelegate)

### `unreal.AbilityTask_StartAbilityState`
Inherits: `AbilityTask` | Header: `AbilityTask_StartAbilityState.h`

An ability state is simply an ability task that provides a way to handle the ability being interrupted. You can use ability states to do state-specific cleanup if the ability ends or was interrupted a...

**Properties** (2):
  - `on_state_ended`: `AbilityStateDelegate` — [Read-Write] Invoked if âEndAbilityStateâ is called or if âEndAbilityâ is called and this st...
  - `on_state_interrupted`: `AbilityStateDelegate` — [Read-Write] Invoked if the ability was interrupted and this state is active. (AbilityStateDelegate)

### `unreal.AbilityTask_VisualizeTargeting`
Inherits: `AbilityTask` | Header: `AbilityTask_VisualizeTargeting.h`

Ability Task Visualize Targeting

**Properties** (1):
  - `time_elapsed`: `VisualizeTargetingDelegate` — [Read-Write] (VisualizeTargetingDelegate)

### `unreal.AbilityTask_WaitAbilityActivate`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitAbilityActivate.h`

Waits for the actor to activate another ability

**Properties** (1):
  - `on_activate`: `WaitAbilityActivateDelegate` — [Read-Write] (WaitAbilityActivateDelegate)

### `unreal.AbilityTask_WaitAbilityCommit`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitAbilityCommit.h`

Waits for the actor to activate another ability

**Properties** (1):
  - `on_commit`: `WaitAbilityCommitDelegate` — [Read-Write] (WaitAbilityCommitDelegate)

### `unreal.AbilityTask_WaitAttributeChange`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitAttributeChange.h`

Waits for the actor to activate another ability

**Properties** (1):
  - `on_change`: `WaitAttributeChangeDelegate` — [Read-Write] (WaitAttributeChangeDelegate)

### `unreal.AbilityTask_WaitAttributeChangeRatioThreshold`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitAttributeChangeRatioThreshold.h`

Waits for the ratio between two attributes to match a threshold

**Properties** (1):
  - `on_change`: `WaitAttributeChangeRatioThresholdDelegate` — [Read-Write] (WaitAttributeChangeRatioThresholdDelegate)

### `unreal.AbilityTask_WaitAttributeChangeThreshold`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitAttributeChangeThreshold.h`

Waits for an attribute to match a threshold

**Properties** (1):
  - `on_change`: `WaitAttributeChangeThresholdDelegate` — [Read-Write] (WaitAttributeChangeThresholdDelegate)

### `unreal.AbilityTask_WaitCancel`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitCancel.h`

Ability Task Wait Cancel

**Properties** (1):
  - `on_cancel`: `WaitCancelDelegate` — [Read-Write] (WaitCancelDelegate)

### `unreal.AbilityTask_WaitConfirm`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitConfirm.h`

Ability Task Wait Confirm

**Properties** (1):
  - `on_confirm`: `GenericGameplayTaskDelegate` — [Read-Write] (GenericGameplayTaskDelegate)

### `unreal.AbilityTask_WaitConfirmCancel`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitConfirmCancel.h`

Fixme: this name is conflicting with AbilityTask_WaitConfirm UAbilityTask_WaitConfirmCancel = Wait for Targeting confirm/cancel UAbilityTask_WaitConfirm = Wait for server to confirm ability activation

**Properties** (2):
  - `on_cancel`: `WaitConfirmCancelDelegate` — [Read-Write] (WaitConfirmCancelDelegate)
  - `on_confirm`: `WaitConfirmCancelDelegate` — [Read-Write] (WaitConfirmCancelDelegate)

### `unreal.AbilityTask_WaitDelay`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitDelay.h`

Ability Task Wait Delay

**Properties** (1):
  - `on_finish`: `WaitDelayDelegate` — [Read-Write] (WaitDelayDelegate)

### `unreal.AbilityTask_WaitGameplayEffectApplied`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayEffectApplied.h`

Ability Task Wait Gameplay Effect Applied

### `unreal.AbilityTask_WaitGameplayEffectApplied_Self`
Inherits: `AbilityTask_WaitGameplayEffectApplied` | Header: `AbilityTask_WaitGameplayEffectApplied_Self.h`

Ability Task Wait Gameplay Effect Applied Self

**Properties** (1):
  - `on_applied`: `GameplayEffectAppliedSelfDelegate` — [Read-Write] (GameplayEffectAppliedSelfDelegate)

### `unreal.AbilityTask_WaitGameplayEffectApplied_Target`
Inherits: `AbilityTask_WaitGameplayEffectApplied` | Header: `AbilityTask_WaitGameplayEffectApplied_Target.h`

Ability Task Wait Gameplay Effect Applied Target

**Properties** (1):
  - `on_applied`: `GameplayEffectAppliedTargetDelegate` — [Read-Write] (GameplayEffectAppliedTargetDelegate)

### `unreal.AbilityTask_WaitGameplayEffectBlockedImmunity`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayEffectBlockedImmunity.h`

Ability Task Wait Gameplay Effect Blocked Immunity

**Properties** (1):
  - `blocked`: `GameplayEffectBlockedDelegate` — [Read-Write] (GameplayEffectBlockedDelegate)

### `unreal.AbilityTask_WaitGameplayEffectRemoved`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayEffectRemoved.h`

Waits for the actor to activate another ability

**Properties** (2):
  - `invalid_handle`: `WaitGameplayEffectRemovedDelegate` — [Read-Write] (WaitGameplayEffectRemovedDelegate)
  - `on_removed`: `WaitGameplayEffectRemovedDelegate` — [Read-Write] (WaitGameplayEffectRemovedDelegate)

### `unreal.AbilityTask_WaitGameplayEffectStackChange`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayEffectStackChange.h`

Waits for the actor to activate another ability

**Properties** (2):
  - `invalid_handle`: `WaitGameplayEffectStackChangeDelegate` — [Read-Write] (WaitGameplayEffectStackChangeDelegate)
  - `on_change`: `WaitGameplayEffectStackChangeDelegate` — [Read-Write] (WaitGameplayEffectStackChangeDelegate)

### `unreal.AbilityTask_WaitGameplayEvent`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayEvent.h`

Ability Task Wait Gameplay Event

**Properties** (1):
  - `event_received`: `WaitGameplayEventDelegate` — [Read-Write] (WaitGameplayEventDelegate)

### `unreal.AbilityTask_WaitGameplayTag`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayTagBase.h`

Ability Task Wait Gameplay Tag

### `unreal.AbilityTask_WaitGameplayTagAdded`
Inherits: `AbilityTask_WaitGameplayTag` | Header: `AbilityTask_WaitGameplayTag.h`

Ability Task Wait Gameplay Tag Added

**Properties** (1):
  - `added`: `WaitGameplayTagDelegate` — [Read-Write] (WaitGameplayTagDelegate)

### `unreal.AbilityTask_WaitGameplayTagCountChanged`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayTagCountChanged.h`

Ability Task Wait Gameplay Tag Count Changed

**Properties** (1):
  - `tag_count_changed`: `WaitGameplayTagCountDelegate` — [Read-Write] (WaitGameplayTagCountDelegate)

### `unreal.AbilityTask_WaitGameplayTagQuery`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitGameplayTagQuery.h`

This class defines a node to wait on a gameplay tag query.

**Properties** (1):
  - `triggered`: `WaitGameplayTagQueryDelegate` — [Read-Write] This delegate will be triggered when the trigger condition has been met. (WaitGameplayT...

### `unreal.AbilityTask_WaitGameplayTagRemoved`
Inherits: `AbilityTask_WaitGameplayTag` | Header: `AbilityTask_WaitGameplayTag.h`

Ability Task Wait Gameplay Tag Removed

**Properties** (1):
  - `removed`: `WaitGameplayTagDelegate` — [Read-Write] (WaitGameplayTagDelegate)

### `unreal.AbilityTask_WaitInputPress`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitInputPress.h`

Waits until the input is pressed from activating an ability. This should be true immediately upon starting the ability, since the key was pressed to activate it. We expect server to execute this task ...

**Properties** (1):
  - `on_press`: `InputPressDelegate` — [Read-Write] (InputPressDelegate)

### `unreal.AbilityTask_WaitInputRelease`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitInputRelease.h`

Waits until the input is released from activating an ability. Clients will replicate a ârelease inputâ event to the server, but not the exact time it was held locally. We expect server to execute ...

**Properties** (1):
  - `on_release`: `InputReleaseDelegate` — [Read-Write] (InputReleaseDelegate)

### `unreal.AbilityTask_WaitMovementModeChange`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitMovementModeChange.h`

Ability Task Wait Movement Mode Change

**Properties** (1):
  - `on_change`: `MovementModeChangedDelegate` — [Read-Write] (MovementModeChangedDelegate)

### `unreal.AbilityTask_WaitOverlap`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitOverlap.h`

**Properties** (1):
  - `on_overlap`: `WaitOverlapDelegate` — [Read-Write] (WaitOverlapDelegate)

### `unreal.AbilityTask_WaitTargetData`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitTargetData.h`

Wait for targeting actor (spawned from parameter) to provide data. Can be set not to end upon outputting data. Can be ended by task name.

**Properties** (2):
  - `cancelled`: `WaitTargetDataDelegate` — [Read-Write] (WaitTargetDataDelegate)
  - `valid_data`: `WaitTargetDataDelegate` — [Read-Write] (WaitTargetDataDelegate)

### `unreal.AbilityTask_WaitVelocityChange`
Inherits: `AbilityTask` | Header: `AbilityTask_WaitVelocityChange.h`

Ability Task Wait Velocity Change

**Properties** (1):
  - `on_velocity_chage`: `WaitVelocityChangeDelegate` — [Read-Write] Delegate called when velocity requirements are met (WaitVelocityChangeDelegate)

### `unreal.AnimNotify_GameplayCue`
Inherits: `AnimNotify` | Header: `AnimNotify_GameplayCue.h`

UAnimNotify_GameplayCue

**Properties** (1):
  - `gameplay_cue`: `GameplayCueTag` [Read-Only] — [Read-Only] GameplayCue tag to invoke. (GameplayCueTag)

### `unreal.AnimNotify_GameplayCueState`
Inherits: `AnimNotifyState` | Header: `AnimNotify_GameplayCue.h`

UAnimNotify_GameplayCueState

**Properties** (1):
  - `gameplay_cue`: `GameplayCueTag` [Read-Only] — [Read-Only] GameplayCue tag to invoke (GameplayCueTag)

### `unreal.AttributeSet`
Inherits: `Object` | Header: `AttributeSet.h`

Defines the set of all GameplayAttributes for your game Games should subclass this and add FGameplayAttributeData properties to represent attributes like health, damage, etc AttributeSets are added to...

### `unreal.GameplayAbility`
Inherits: `Object` | Header: `GameplayAbility.h`

Abilities define custom gameplay logic that can be activated by players or external game logic

**Methods** (56):
  - `activate_ability()` -> `None` — The main function that defines what an ability does. -Child classes will want to override this -This function graph shou...
  - `activate_ability_from_event(event_data)` -> `None` — K2 Activate Ability from Event
  - `add_gameplay_cue(gameplay_cue_tag, context, remove_on_ability_end = True)` -> `None` — Adds a persistent gameplay cue to the ability owner. Optionally will remove if ability ends
  - `add_gameplay_cue_with_params(gameplay_cue_tag, gameplay_cue_parameter, remove_on_ability_end = True)` -> `None` — Adds a persistent gameplay cue to the ability owner. Optionally will remove if ability ends
  - `apply_gameplay_effect_spec_to_owner(effect_spec_handle)` -> `ActiveGameplayEffectHandle` — Apply a previously created gameplay effect spec to the owner of this ability
  - `apply_gameplay_effect_spec_to_target(effect_spec_handle, target_data)` -> `Array [ ActiveGameplayEffectHandle ]` — Apply a previously created gameplay effect spec to a target
  - `apply_gameplay_effect_to_owner(gameplay_effect_class, gameplay_effect_level = 1, stacks = 1)` -> `ActiveGameplayEffectHandle` — Apply a gameplay effect to the owner of this ability
  - `apply_gameplay_effect_to_target(target_data, gameplay_effect_class, gameplay_effect_level = 1, stacks = 1)` -> `Array [ ActiveGameplayEffectHandle ]` — Apply a gameplay effect to a Target
  - `can_activate_ability(actor_info, handle)` -> `GameplayTagContainer or None` — Returns true if this ability can be activated right now. Has no side effects
  - `cancel_ability()` -> `None` — Call from Blueprint to cancel the ability naturally
  - `cancel_task_by_instance_name(instance_name)` -> `None` — Add any task with this instance name to a list to be canceled (not ended) next frame. See also EndTaskByInstanceName.
  - `check_ability_cooldown()` -> `bool` — Checks the abilityâs cooldown, but does not apply it.
  - `check_ability_cost()` -> `bool` — Checks the abilityâs cost, but does not apply it.
  - `commit_ability()` -> `bool` — Attempts to commit the ability (spend resources, etc). This our last chance to fail. Child classes that override Activat...
  - `commit_ability_cooldown(broadcast_commit_event = False, force_cooldown = False)` -> `bool` — Attempts to commit the abilityâs cooldown only. If BroadcastCommitEvent is true, it will broadcast the commit event th...
  - `commit_ability_cost(broadcast_commit_event = False)` -> `bool` — Attempts to commit the abilityâs cost only. If BroadcastCommitEvent is true, it will broadcast the commit event that t...
  - `commit_execute()` -> `None` — BP event called from CommitAbility
  - `confirm_task_by_instance_name(instance_name, end_task)` -> `None` — Finds all currently active tasks named InstanceName and confirms them. What this means depends on the individual task. B...
  - `end_ability()` -> `None` — Call from blueprints to forcibly end the ability without canceling it. This will replicate the end ability to the client...
  - `end_ability_locally()` -> `None` — Call from blueprints to end the ability naturally. This will only end predicted abilities locally, allowing it end natur...
  - `end_ability_state(optional_state_name_to_end)` -> `None` — Ends any active ability state task with the given name. If name is âNoneâ all active states will be ended (in an arb...
  - `end_task_by_instance_name(instance_name)` -> `None` — Add any task with this instance name to a list to be ended (not canceled) next frame. See also CancelTaskByInstanceName.
  - `execute_gameplay_cue(gameplay_cue_tag, context)` -> `None` — Invoke a gameplay cue on the ability owner
  - `execute_gameplay_cue_with_params(gameplay_cue_tag, gameplay_cue_parameters)` -> `None` — Invoke a gameplay cue on the ability owner, with extra parameters
  - `get_ability_level()` -> `int32` — Returns current level of the Ability
  - `get_ability_level_bp(handle, actor_info)` -> `int32` — Returns current ability level for non instanced abilities. You must call this version in these contexts!
  - `get_ability_system_component_from_actor_info()` -> `AbilitySystemComponent` — Returns the AbilitySystemComponent that is activating this ability
  - `get_actor_info()` -> `GameplayAbilityActorInfo` — Returns the actor info associated with this ability, has cached pointers to useful objects
  - `get_avatar_actor_from_actor_info()` -> `Actor` — Returns the physical actor that is executing this ability. May be null
  - `get_context_from_owner(optional_target_data)` -> `GameplayEffectContextHandle` — Generates a GameplayEffectContextHandle from our owner and an optional TargetData.
  - `get_cooldown_time_remaining()` -> `float` — Returns the time in seconds remaining on the currently active cooldown.
  - `get_current_montage()` -> `AnimMontage` — Returns the currently playing montage for this ability, if any
  - `get_current_source_object()` -> `Object` — Retrieves the SourceObject associated with this ability. Can only be called on instanced abilities.
  - `get_granted_by_effect_context()` -> `GameplayEffectContextHandle` — Retrieves the EffectContext of the GameplayEffect that granted this ability. Can only be called on instanced abilities.
  - `get_owning_actor_from_actor_info()` -> `Actor` — Returns the actor that owns this ability, which may not have a physical location
  - `get_owning_component_from_actor_info()` -> `SkeletalMeshComponent` — Convenience method for abilities to get skeletal mesh component - useful for aiming abilities
  - `get_source_object_bp(handle, actor_info)` -> `Object` — Retrieves the SourceObject associated with this ability. Callable on non instanced
  - `invalidate_client_prediction_key()` -> `None` — Invalidates the current prediction key. This should be used in cases where there is a valid prediction window, but the s...
  - `is_locally_controlled()` -> `bool` — True if the owning actor is locally controlled, true in single player
  - `k2_has_authority()` -> `bool` — K2 Has Authority
  - `make_outgoing_gameplay_effect_spec(gameplay_effect_class, level = 1.000000)` -> `GameplayEffectSpecHandle` — Convenience method for abilities to get outgoing gameplay effect specs (for example, to pass on to projectiles to apply ...
  - `make_target_location_info_from_owner_actor()` -> `GameplayAbilityTargetingLocationInfo` — Creates a target location from where the owner avatar is
  - `make_target_location_info_from_owner_skeletal_mesh_component(socket_name)` -> `GameplayAbilityTargetingLocationInfo` — Creates a target location from a socket on the owner avatarâs skeletal mesh
  - `montage_jump_to_section(section_name)` -> `None` — Immediately jumps the active montage to a section
  - `montage_set_next_section_name(from_section_name, to_section_name)` -> `None` — Sets pending section on active montage
  - `montage_stop(override_blend_out_time = -1.000000)` -> `None` — Stops the current animation montage.
  - `on_end_ability(was_cancelled)` -> `None` — Blueprint event, will be called if an ability ends normally or abnormally
  - `remove_gameplay_cue(gameplay_cue_tag)` -> `None` — Removes a persistent gameplay cue from the ability owner
  - `remove_gameplay_effect_from_owner_with_asset_tags(with_asset_tags, stacks_to_remove = -1)` -> `None` — Removes GameplayEffects from owner which match the given asset level tags
  - `remove_gameplay_effect_from_owner_with_granted_tags(with_granted_tags, stacks_to_remove = -1)` -> `None` — Removes GameplayEffects from owner which grant the given tags
  - `remove_gameplay_effect_from_owner_with_handle(handle, stacks_to_remove = -1)` -> `None` — Removes GameplayEffect from owner that match the given handle
  - `remove_granted_by_effect()` -> `None` — Removes the GameplayEffect that granted this ability. Can only be called on instanced abilities.
  - `send_gameplay_event(event_tag, payload)` -> `None` — Sends a gameplay event, also creates a prediction window
  - `set_can_be_canceled(can_be_canceled)` -> `None` — Sets whether the ability should ignore cancel requests. Only valid on instanced abilities
  - `set_should_block_other_abilities(should_block_abilities)` -> `None` — Sets rather ability block flags are enabled or disabled. Only valid on instanced abilities
  - `should_ability_respond_to_event(actor_info, payload)` -> `bool` — Returns true if this ability can be activated right now. Has no side effects

**Properties** (3):
  - `current_activation_info`: `GameplayAbilityActivationInfo` [Read-Only] — [Read-Only] This is information specific to this instance of the ability. E.g, whether it is predict...
  - `current_event_data`: `GameplayEventData` [Read-Only] — [Read-Only] Information specific to this instance of the ability, if it was activated by an event (G...
  - `mark_pending_kill_on_ability_end`: `bool` [Read-Only] — [Read-Only]
deprecated: This is unsafe. Do not use. (bool)

### `unreal.GameplayAbility_CharacterJump`
Inherits: `GameplayAbility` | Header: `GameplayAbility_CharacterJump.h`

Ability that jumps with a character.

### `unreal.GameplayAbility_Montage`
Inherits: `GameplayAbility` | Header: `GameplayAbility_Montage.h`

A gameplay ability that plays a single montage and applies a GameplayEffect

### `unreal.GameplayAbilityBlueprint`
Inherits: `Blueprint` | Header: `GameplayAbilityBlueprint.h`

A Gameplay Ability Blueprint is essentially a specialized Blueprint whose graphs control a gameplay ability The ability factory should pick this for you automatically

### `unreal.GameplayAbilityTargetActor`
Inherits: `Actor` | Header: `GameplayAbilityTargetActor.h`

TargetActors are spawned to assist with ability targeting. They are spawned by ability tasks and create/determine the outgoing targeting data passed from one task to another

**Properties** (8):
  - `debug`: `bool` — [Read-Write] Draw the debug information (if applicable) for this targeting actor. (bool)
  - `destroy_on_confirmation`: `bool` [Read-Only] — [Read-Only] (bool)
  - `filter`: `GameplayTargetDataFilterHandle` — [Read-Write] Using a special class for replication purposes. (GameplayTargetDataFilterHandle)
  - `primary_pc`: `PlayerController` [Read-Only] — [Read-Only] (PlayerController)
  - `reticle_class`: `Class` — [Read-Write] Reticle that will appear on top of acquired targets. Reticles will be spawned/despawned...
  - `reticle_params`: `WorldReticleParameters` — [Read-Write] Parameters for world reticle. Usage of these parameters is dependent on the reticle. (W...
  - `source_actor`: `Actor` [Read-Only] — [Read-Only] (Actor)
  - `start_location`: `GameplayAbilityTargetingLocationInfo` [Read-Only] — [Read-Only] Describes where the targeting action starts, usually the player character or a socket on...

### `unreal.GameplayAbilityTargetActor_ActorPlacement`
Inherits: `GameplayAbilityTargetActor_GroundTrace` | Header: `GameplayAbilityTargetActor_ActorPlacement.h`

Gameplay Ability Target Actor Actor Placement

**Properties** (2):
  - `placed_actor_class`: `Class` — [Read-Write] Actor we intend to place. (type(Class))
  - `placed_actor_material`: `MaterialInterface` — [Read-Write] Override Material 0 on our placed actorâs meshes with this material for visualization...

### `unreal.GameplayAbilityTargetActor_GroundTrace`
Inherits: `GameplayAbilityTargetActor_Trace` | Header: `GameplayAbilityTargetActor_GroundTrace.h`

Gameplay Ability Target Actor Ground Trace

**Properties** (2):
  - `collision_height`: `float` — [Read-Write] Height for a capsule. Implicitly indicates a capsule is desired if this is greater than...
  - `collision_radius`: `float` — [Read-Write] Radius for a sphere or capsule. (float)

### `unreal.GameplayAbilityTargetActor_Radius`
Inherits: `GameplayAbilityTargetActor` | Header: `GameplayAbilityTargetActor_Radius.h`

Selects everything within a given radius of the source actor.

**Properties** (1):
  - `radius`: `float` — [Read-Write] Radius of target acquisition around the abilityâs start location. (float)

### `unreal.GameplayAbilityTargetActor_SingleLineTrace`
Inherits: `GameplayAbilityTargetActor_Trace` | Header: `GameplayAbilityTargetActor_SingleLineTrace.h`

Gameplay Ability Target Actor Single Line Trace

### `unreal.GameplayAbilityTargetActor_Trace`
Inherits: `GameplayAbilityTargetActor` | Header: `GameplayAbilityTargetActor_Trace.h`

Intermediate base class for all line-trace type targeting actors.

**Properties** (3):
  - `max_range`: `float` — [Read-Write] (float)
  - `trace_affects_aim_pitch`: `bool` — [Read-Write] Does the trace affect the aiming pitch (bool)
  - `trace_profile`: `CollisionProfileName` — [Read-Write] (CollisionProfileName)

### `unreal.GameplayAbilityWorldReticle`
Inherits: `Actor` | Header: `GameplayAbilityWorldReticle.h`

Reticles allow targeting to be visualized. Tasks can spawn these. Artists/designers can create BPs for these.

**Methods** (6):
  - `face_toward_source(face_in2d)` -> `None` — Face Toward Source
  - `on_parameters_initialized()` -> `None` — On Parameters Initialized
  - `on_targeting_an_actor(new_value)` -> `None` — Called whenever bIsTargetAnActor changes value.
  - `on_valid_target_changed(new_value)` -> `None` — Called whenever bIsTargetValid changes value.
  - `set_reticle_material_param_float(param_name, value)` -> `None` — Set Reticle Material Param Float
  - `set_reticle_material_param_vector(param_name, value)` -> `None` — Set Reticle Material Param Vector

**Properties** (7):
  - `face_owner_flat`: `bool` — [Read-Write] Makes the reticleâs default owner-facing behavior operate in 2D (flat) instead of 3D ...
  - `is_target_an_actor`: `bool` [Read-Only] — [Read-Only] This indicates whether or not the targeting reticle is pointed at an actor. Defaults to ...
  - `is_target_valid`: `bool` [Read-Only] — [Read-Only] This indicates whether or not the targeting actor considers the current target to be val...
  - `parameters`: `WorldReticleParameters` — [Read-Write] (WorldReticleParameters)
  - `primary_pc`: `PlayerController` [Read-Only] — [Read-Only] This is used in the process of determining whether we should replicate to a specific cli...
  - `snap_to_targeted_actor`: `bool` — [Read-Write] If the target is an actor snap to itâs location (bool)
  - `targeting_actor`: `GameplayAbilityTargetActor` [Read-Only] — [Read-Only] In the future, we may want to grab things like sockets off of this. (GameplayAbilityTarg...

### `unreal.GameplayAbilityWorldReticle_ActorVisualization`
Inherits: `GameplayAbilityWorldReticle` | Header: `GameplayAbilityWorldReticle_ActorVisualization.h`

This is a dummy reticle for internal use by visualization placement tasks. It builds a custom visual model of the visualization being placed.

### `unreal.GameplayCueFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GameplayCueFunctionLibrary.h`

UGameplayCueFunctionLibrary

**Methods** (4):
  - `add_gameplay_cue_on_actor(target, gameplay_cue_tag, parameters)` -> `None` [classmethod] — Invoke the added event for a gameplay cue on the target actor. This should be paired with a RemoveGameplayCueOnActor cal...
  - `execute_gameplay_cue_on_actor(target, gameplay_cue_tag, parameters)` -> `None` [classmethod] — Invoke a one time âinstantâ execute event for a gameplay cue on the target actor. * If the actor has an ability syst...
  - `make_gameplay_cue_parameters_from_hit_result(hit_result)` -> `GameplayCueParameters` [classmethod] — Builds gameplay cue parameters using data from a hit result.
  - `remove_gameplay_cue_on_actor(target, gameplay_cue_tag, parameters)` -> `None` [classmethod] — Invoke the removed event for a gameplay cue on the target actor. This should be paired with an AddGameplayCueOnActor cal...

### `unreal.GameplayCueInterface`
Inherits: `Interface` | Header: `GameplayCueInterface.h`

Gameplay Cue Interface

**Methods** (1):
  - `forward_gameplay_cue_to_parent()` -> `None` — Call from a Cue handler event to continue checking for additional, more generic handlers. Called from the ability system...

### `unreal.GameplayCueNotify_Actor`
Inherits: `Actor` | Header: `GameplayCueNotify_Actor.h`

An instantiated Actor that acts as a handler of a GameplayCue. Since they are instantiated, they can maintain state and tick/update every frame if necessary.

**Methods** (9):
  - `end_gameplay_cue()` -> `None` — Ends the gameplay cue: either destroying it or recycling it. You must call this manually only if you do not use bAutoDes...
  - `handle_gameplay_cue(my_target, event_type, parameters)` -> `None` — Generic Event Graph event that will get called for every event type
  - `on_active(my_target: Actor, parameters: GameplayCueParameters)` -> `bool` — deprecated: âon_activeâ was renamed to âon_burstâ.
  - `on_become_relevant(my_target, parameters)` -> `bool` — Called when a GameplayCue with duration is first seen as active, even if it wasnât actually just applied (Join in prog...
  - `on_burst(my_target, parameters)` -> `bool` — Called when a GameplayCue with duration is first activated, this will only be called if the client witnessed the activat...
  - `on_cease_relevant(my_target, parameters)` -> `bool` — Called when a GameplayCue with duration is removed
  - `on_execute(my_target, parameters)` -> `bool` — Called when a GameplayCue is executed, this is used for instant effects or periodic ticks
  - `on_remove(my_target: Actor, parameters: GameplayCueParameters)` -> `bool` — deprecated: âon_removeâ was renamed to âon_cease_relevantâ.
  - `while_active(my_target: Actor, parameters: GameplayCueParameters)` -> `bool` — deprecated: âwhile_activeâ was renamed to âon_become_relevantâ.

### `unreal.GameplayCueNotify_Burst`
Inherits: `GameplayCueNotify_Static` | Header: `GameplayCueNotify_Burst.h`

UGameplayCueNotify_Burst

**Methods** (1):
  - `on_burst(target, parameters, spawn_results)` -> `None` — On Burst

**Properties** (3):
  - `burst_effects`: `GameplayCueNotify_BurstEffects` [Read-Only] — [Read-Only] List of effects to spawn on burst. (GameplayCueNotify_BurstEffects)
  - `default_placement_info`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Default placement rules.  Applies for all spawns unless overridden. (GameplayCueNotify_P...
  - `default_spawn_condition`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Default condition to check before spawning anything.  Applies for all spawns unless over...

### `unreal.GameplayCueNotify_BurstLatent`
Inherits: `GameplayCueNotify_Actor` | Header: `GameplayCueNotify_BurstLatent.h`

AGameplayCueNotify_BurstLatent

**Methods** (1):
  - `on_burst(target, parameters, spawn_results)` -> `None` — On Burst

**Properties** (4):
  - `burst_effects`: `GameplayCueNotify_BurstEffects` [Read-Only] — [Read-Only] List of effects to spawn on burst. (GameplayCueNotify_BurstEffects)
  - `burst_spawn_results`: `GameplayCueNotify_SpawnResult` [Read-Only] — [Read-Only] Results of spawned burst effects. (GameplayCueNotify_SpawnResult)
  - `default_placement_info`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Default placement rules.  Applies for all spawns unless overridden. (GameplayCueNotify_P...
  - `default_spawn_condition`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Default condition to check before spawning anything.  Applies for all spawns unless over...

### `unreal.GameplayCueNotify_HitImpact`
Inherits: `GameplayCueNotify_Static` | Header: `GameplayCueNotify_HitImpact.h`

Non instanced GameplayCueNotify for spawning particle and sound FX. Still WIP - needs to be fleshed out more.

**Properties** (2):
  - `particle_system`: `ParticleSystem` — [Read-Write] Effects to play for weapon attacks against specific surfaces (ParticleSystem)
  - `sound`: `SoundBase` — [Read-Write] (SoundBase)

### `unreal.GameplayCueNotify_Looping`
Inherits: `GameplayCueNotify_Actor` | Header: `GameplayCueNotify_Looping.h`

AGameplayCueNotify_Looping

**Methods** (4):
  - `on_application(target, parameters, spawn_results)` -> `None` — On Application
  - `on_looping_start(target, parameters, spawn_results)` -> `None` — On Looping Start
  - `on_recurring(target, parameters, spawn_results)` -> `None` — On Recurring
  - `on_removal(target, parameters, spawn_results)` -> `None` — On Removal

**Properties** (10):
  - `application_effects`: `GameplayCueNotify_BurstEffects` [Read-Only] — [Read-Only] List of effects to spawn on application.  These should not be looping effects! (Gameplay...
  - `application_spawn_results`: `GameplayCueNotify_SpawnResult` [Read-Only] — [Read-Only] Results of spawned application effects. (GameplayCueNotify_SpawnResult)
  - `default_placement_info`: `GameplayCueNotify_PlacementInfo` [Read-Only] — [Read-Only] Default placement rules.  Applies for all spawns unless overridden. (GameplayCueNotify_P...
  - `default_spawn_condition`: `GameplayCueNotify_SpawnCondition` [Read-Only] — [Read-Only] Default condition to check before spawning anything.  Applies for all spawns unless over...
  - `looping_effects`: `GameplayCueNotify_LoopingEffects` [Read-Only] — [Read-Only] List of effects to spawn on loop start. (GameplayCueNotify_LoopingEffects)
  - `looping_spawn_results`: `GameplayCueNotify_SpawnResult` [Read-Only] — [Read-Only] Results of spawned looping effects. (GameplayCueNotify_SpawnResult)
  - `recurring_effects`: `GameplayCueNotify_BurstEffects` [Read-Only] — [Read-Only] List of effects to spawn for a recurring gameplay effect (e.g. each time a DOT ticks).  ...
  - `recurring_spawn_results`: `GameplayCueNotify_SpawnResult` [Read-Only] — [Read-Only] Results of spawned recurring effects. (GameplayCueNotify_SpawnResult)
  - `removal_effects`: `GameplayCueNotify_BurstEffects` [Read-Only] — [Read-Only] List of effects to spawn on removal.  These should not be looping effects! (GameplayCueN...
  - `removal_spawn_results`: `GameplayCueNotify_SpawnResult` [Read-Only] — [Read-Only] Results of spawned removal effects. (GameplayCueNotify_SpawnResult)

### `unreal.GameplayCueNotify_Static`
Inherits: `Object` | Header: `GameplayCueNotify_Static.h`

A non instantiated UObject that acts as a handler for a GameplayCue. These are useful for one-off âburstâ effects.

**Methods** (5):
  - `handle_gameplay_cue(my_target, event_type, parameters)` -> `None` — Generic Event Graph event that will get called for every event type
  - `on_active(my_target, parameters)` -> `bool` — Called when a GameplayCue with duration is first activated, this will only be called if the client witnessed the activat...
  - `on_execute(my_target, parameters)` -> `bool` — Called when a GameplayCue is executed, this is used for instant effects or periodic ticks
  - `on_remove(my_target, parameters)` -> `bool` — Called when a GameplayCue with duration is removed
  - `while_active(my_target, parameters)` -> `bool` — Called when a GameplayCue with duration is first seen as active, even if it wasnât actually just applied (Join in prog...

### `unreal.GameplayCueNotify_UnitTest`
Inherits: `GameplayCueNotify_Static` | Header: `GameplayCueTests.h`

Helper GameplayCueNotify that is used for unit testing. Note: Since this is a GCN_Static, weâre using the CDO during testing

### `unreal.GameplayEffect`
Inherits: `Object` | Header: `GameplayEffect.h`

**Methods** (3):
  - `has_all_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against all of the specified tags (expands to include parents of asset...
  - `has_any_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against any of the specified tags (expands to include parents of asset...
  - `has_matching_gameplay_tag(tag_to_check)` -> `bool` — Check if the asset has a gameplay tag that matches against the specified tag (expands to include parents of asset tags)

**Properties** (35):
  - `application_requirements`: `None` — [Read-Write]
deprecated: Property âApplicationRequirementsâ is deprecated. (Array[type(Class)])
  - `application_tag_requirements`: `GameplayTagRequirements` [Read-Only] — [Read-Only]
deprecated: Property âApplicationTagRequirementsâ is deprecated. (GameplayTagRequire...
  - `chance_to_apply_to_target`: `ScalableFloat` — [Read-Write]
deprecated: Property âChanceToApplyToTargetâ is deprecated. (ScalableFloat)
  - `clear_stack_on_overflow`: `bool` [Read-Only] — [Read-Only] If true, the entire stack of the effect will be cleared once it overflows (bool)
  - `conditional_gameplay_effects`: `None` [Read-Only] — [Read-Only]
deprecated: Property âConditionalGameplayEffectsâ is deprecated. (Array[ConditionalG...
  - `deny_overflow_application`: `bool` [Read-Only] — [Read-Only] If true, stacking attempts made while at the stack count will fail, resulting in the dur...
  - `execute_periodic_effect_on_application`: `bool` [Read-Only] — [Read-Only] If true, the effect executes on application and then at every period interval. If false,...
  - `executions`: `None` [Read-Only] — [Read-Only] Array of executions that will affect the target of this effect (Array[GameplayEffectExec...
  - `factor_in_stack_count`: `bool` [Read-Only] — [Read-Only] If true, the calculation will include the stack count for Modifier Magnitudes (bool)
  - `gameplay_cues`: `None` [Read-Only] — [Read-Only] Cues to trigger non-simulated reactions in response to this GameplayEffect such as sound...
  - `ge_components`: `None` [Read-Only] — [Read-Only] These Gameplay Effect Components define how this Gameplay Effect behaves when applied (A...
  - `granted_abilities`: `None` [Read-Only] — [Read-Only] (Array[GameplayAbilitySpecDef])
  - `granted_application_immunity_query`: `GameplayEffectQuery` [Read-Only] — [Read-Only]
deprecated: Property âGrantedApplicationImmunityQueryâ is deprecated. (GameplayEffec...
  - `granted_application_immunity_tags`: `GameplayTagRequirements` [Read-Only] — [Read-Only]
deprecated: Property âGrantedApplicationImmunityTagsâ is deprecated. (GameplayTagReq...
  - `inheritable_blocked_ability_tags_container`: `InheritedTagContainer` [Read-Only] — [Read-Only]
deprecated: Property âInheritableBlockedAbilityTagsContainerâ is deprecated. (Inheri...
  - `inheritable_clear_tags_container`: `InheritedTagContainer` — âinheritable_clear_tags_containerâ was renamed to âremove_gameplay_effects_with_tagsâ. depre...
  - `inheritable_gameplay_effect_tags`: `InheritedTagContainer` [Read-Only] — [Read-Only]
deprecated: Property âInheritableGameplayEffectTagsâ is deprecated. (InheritedTagCon...
  - `inheritable_owned_tags_container`: `InheritedTagContainer` [Read-Only] — [Read-Only]
deprecated: Property âInheritableOwnedTagsContainerâ is deprecated. (InheritedTagCon...
  - `modifiers`: `None` [Read-Only] — [Read-Only] Array of modifiers that will affect the target of this effect (Array[GameplayModifierInf...
  - `ongoing_tag_requirements`: `GameplayTagRequirements` [Read-Only] — [Read-Only]
deprecated: Property âOngoingTagRequirementsâ is deprecated. (GameplayTagRequirement...
  - `overflow_effects`: `None` [Read-Only] — [Read-Only] Effects to apply when a stacking effect âoverflowsâ its stack count through another ...
  - `period`: `ScalableFloat` [Read-Only] — [Read-Only] Period in seconds. 0.0 for non-periodic effects (ScalableFloat)
  - `periodic_inhibition_policy`: `GameplayEffectPeriodInhibitionRemovedPolicy` [Read-Only] — [Read-Only] How we should respond when a periodic gameplay effect is no longer inhibited // EditCond...
  - `premature_expiration_effect_classes`: `None` [Read-Only] — [Read-Only]
deprecated: Property âPrematureExpirationEffectClassesâ is deprecated. (Array[type(C...
  - `removal_tag_requirements`: `GameplayTagRequirements` [Read-Only] — [Read-Only]
deprecated: Property âRemovalTagRequirementsâ is deprecated. (GameplayTagRequirement...
  - `remove_gameplay_effect_query`: `GameplayEffectQuery` [Read-Only] — [Read-Only]
deprecated: Property âRemoveGameplayEffectQueryâ is deprecated. (GameplayEffectQuery...
  - `remove_gameplay_effects_with_tags`: `InheritedTagContainer` [Read-Only] — [Read-Only]
deprecated: Property âRemoveGameplayEffectsWithTagsâ is deprecated. (InheritedTagCon...
  - `require_modifier_success_to_trigger_cues`: `bool` [Read-Only] — [Read-Only] If true, cues will only trigger when GE modifiers succeed being applied (whether through...
  - `routine_expiration_effect_classes`: `None` [Read-Only] — [Read-Only]
deprecated: Property âRoutineExpirationEffectClassesâ is deprecated. (Array[type(Cla...
  - `stack_duration_refresh_policy`: `GameplayEffectStackingDurationPolicy` [Read-Only] — [Read-Only] Policy for how the effect duration should be refreshed while stacking (GameplayEffectSta...
  - `stack_expiration_policy`: `GameplayEffectStackingExpirationPolicy` [Read-Only] — [Read-Only] Policy for how to handle duration expiring on this gameplay effect (GameplayEffectStacki...
  - `stack_limit_count`: `int` [Read-Only] — [Read-Only] Stack limit for StackingType (int32)
  - `stack_period_reset_policy`: `GameplayEffectStackingPeriodPolicy` [Read-Only] — [Read-Only] Policy for how the effect period should be reset (or not) while stacking (GameplayEffect...
  - `stacking_type`: `GameplayEffectStackingType` [Read-Only] — [Read-Only] How this GameplayEffect stacks with other instances of this same GameplayEffect (Gamepla...
  - `ui_data`: `GameplayEffectUIData` [Read-Only] — [Read-Only]
deprecated: Property âUIDataâ is deprecated. (GameplayEffectUIData)

### `unreal.GameplayEffectCalculation`
Inherits: `Object` | Header: `GameplayEffectCalculation.h`

Abstract base for specialized gameplay effect calculations; Capable of specifing attribute captures

**Properties** (1):
  - `relevant_attributes_to_capture`: `None` [Read-Only] — [Read-Only] Attributes to capture that are relevant to the calculation (Array[GameplayEffectAttribut...

### `unreal.GameplayEffectComponent`
Inherits: `Object` | Header: `GameplayEffectComponent.h`

Gameplay Effect Component (aka GEComponent)

### `unreal.GameplayEffectCustomApplicationRequirement`
Inherits: `Object` | Header: `GameplayEffectCustomApplicationRequirement.h`

Class used to perform custom gameplay effect modifier calculations, either via blueprint or native code

**Methods** (1):
  - `can_apply_gameplay_effect(gameplay_effect, spec, asc)` -> `bool` — Return whether the gameplay effect should be applied or not

### `unreal.GameplayEffectExecutionCalculation`
Inherits: `GameplayEffectCalculation` | Header: `GameplayEffectExecutionCalculation.h`

Gameplay Effect Execution Calculation

**Methods** (1):
  - `execute(execution_params)` -> `GameplayEffectCustomExecutionOutput` — Called whenever the owning gameplay effect is executed. Allowed to do essentially whatever is desired, including generat...

**Properties** (1):
  - `requires_passed_in_tags`: `bool` [Read-Only] — [Read-Only] Used to indicate if this execution uses Passed In Tags (bool)

### `unreal.GameplayEffectUIData`
Inherits: `GameplayEffectComponent` | Header: `GameplayEffectUIData.h`

UGameplayEffectUIData Base class to provide game-specific data about how to describe a Gameplay Effect in the UI. Subclass with data to use in your game. In Unreal Engine 5.3, this now derives from UG...

### `unreal.GameplayEffectUIData_TextOnly`
Inherits: `GameplayEffectUIData` | Header: `GameplayEffectUIData_TextOnly.h`

UI data that contains only text. This is mostly used as an example of a subclass of UGameplayEffectUIData. If your game needs only text, this is a reasonable class to use. To include more data, make a...

**Properties** (1):
  - `description`: `Text` [Read-Only] — [Read-Only] (Text)

### `unreal.GameplayModMagnitudeCalculation`
Inherits: `GameplayEffectCalculation` | Header: `GameplayModMagnitudeCalculation.h`

Class used to perform custom gameplay effect modifier calculations, either via blueprint or native code

**Methods** (10):
  - `calculate_base_magnitude(spec)` -> `float` — Calculate the base magnitude of the gameplay effect modifier, given the specified spec. Note that the owning spec def ca...
  - `get_captured_attribute_magnitude(effect_spec, attribute, source_tags, target_tags)` -> `float` — Gets the captured magnitude value for the given Attribute For this to work correctly, the Attribute needs to be added to...
  - `get_set_by_caller_magnitude_by_name(effect_spec, magnitude_name)` -> `float` — Extracts the Set by Caller Magnitude from a Gameplay Effect Spec
  - `get_set_by_caller_magnitude_by_tag(effect_spec, tag)` -> `float` — Extracts the Set by Caller Magnitude from a Gameplay Effect Spec
  - `get_source_actor_tags(effect_spec)` -> `GameplayTagContainer` — Returns the source actor tags from a Gameplay Effect Spec
  - `get_source_aggregated_tags(effect_spec)` -> `GameplayTagContainer` — Copies and returns the source aggregated tags from a Gameplay Effect Spec
  - `get_source_spec_tags(effect_spec)` -> `GameplayTagContainer` — Returns the source spec tags from a Gameplay Effect Spec
  - `get_target_actor_tags(effect_spec)` -> `GameplayTagContainer` — Returns the target actor tags from a Gameplay Effect Spec Useful for Modifier Magnitude Calculations
  - `get_target_aggregated_tags(effect_spec)` -> `GameplayTagContainer` — Copies and returns the target aggregated tags from a Gameplay Effect Spec
  - `get_target_spec_tags(effect_spec)` -> `GameplayTagContainer` — Returns the target spec tags from a Gameplay Effect Spec Useful for Modifier Magnitude Calculations

### `unreal.ImmunityGameplayEffectComponent`
Inherits: `GameplayEffectComponent` | Header: `ImmunityGameplayEffectComponent.h`

Immunity is blocking the application of _other_ GameplayEffectSpecs. This registers a global handler on the ASC to block the application of other GameplayEffectSpecs.

**Properties** (1):
  - `immunity_queries`: `None` [Read-Only] — [Read-Only] Grants immunity to GameplayEffects that match this query. (Array[GameplayEffectQuery])

### `unreal.MovieSceneGameplayCueSection`
Inherits: `MovieSceneHookSection` | Header: `MovieSceneGameplayCueSections.h`

Implements a movie scene section that triggers gameplay cues

### `unreal.MovieSceneGameplayCueTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneGameplayCueTrack.h`

Implements a movie scene track that triggers gameplay cues

**Methods** (1):
  - `set_sequencer_track_handler(gameplay_cue_track_handler)` -> `None` [classmethod] — Override the default function for invoking Gameplay Cues from sequencer tracks

### `unreal.MovieSceneGameplayCueTriggerSection`
Inherits: `MovieSceneHookSection` | Header: `MovieSceneGameplayCueSections.h`

Implements a movie scene section that triggers gameplay cues

### `unreal.AttributeBasedFloatCalculationType`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Enumeration outlining the possible attribute based float calculation policies.

**Properties** (3):
  - `ATTRIBUTE_BASE_VALUE`: `AttributeBasedFloatCalculationType = Ellipsis` — Use the base value of the attribute. 1
  - `ATTRIBUTE_BONUS_MAGNITUDE`: `AttributeBasedFloatCalculationType = Ellipsis` — Equivalent to (FinalMag - BaseValue). 2 Use the âbonusâ evaluated magnitude of the attribute
  - `ATTRIBUTE_MAGNITUDE`: `AttributeBasedFloatCalculationType = Ellipsis` — Use the final evaluated magnitude of the attribute. 0

### `unreal.GameplayAbilityActivationMode`
Inherits: `EnumBase` | Header: `GameplayAbilitySpec.h`

Describes the status of activating this ability, this is updated as prediction is handled

**Properties** (5):
  - `AUTHORITY`: `GameplayAbilityActivationMode = Ellipsis` — We are the authority activating this ability 0
  - `CONFIRMED`: `GameplayAbilityActivationMode = Ellipsis` — We are not the authority, but the authority has confirmed this activation 3
  - `NON_AUTHORITY`: `GameplayAbilityActivationMode = Ellipsis` — We are not the authority but arenât predicting yet. This is a mostly invalid state to be in 1
  - `PREDICTING`: `GameplayAbilityActivationMode = Ellipsis` — We are predicting the activation of this ability 2
  - `REJECTED`: `GameplayAbilityActivationMode = Ellipsis` — We tried to activate it, and server told us we couldnât (even though we thought we could) 4

### `unreal.GameplayAbilityInputBinds`
Inherits: `EnumBase` | Header: `GameplayAbilitySet.h`

This is an example input binding enum for GameplayAbilities. Your project may want to create its own. The MetaData default bind keys (LMB, RMB, Q, E, etc) are a convenience for designers setting up ab...

**Properties** (9):
  - `ABILITY1`: `GameplayAbilityInputBinds = Ellipsis` — 0
  - `ABILITY2`: `GameplayAbilityInputBinds = Ellipsis` — 1
  - `ABILITY3`: `GameplayAbilityInputBinds = Ellipsis` — 2
  - `ABILITY4`: `GameplayAbilityInputBinds = Ellipsis` — 3
  - `ABILITY5`: `GameplayAbilityInputBinds = Ellipsis` — 4
  - `ABILITY6`: `GameplayAbilityInputBinds = Ellipsis` — 5
  - `ABILITY7`: `GameplayAbilityInputBinds = Ellipsis` — 6
  - `ABILITY8`: `GameplayAbilityInputBinds = Ellipsis` — 7
  - `ABILITY9`: `GameplayAbilityInputBinds = Ellipsis` — 8

### `unreal.GameplayAbilityInstancingPolicy`
Inherits: `EnumBase` | Header: `GameplayAbilityTypes.h`

How the ability is instanced when executed. This limits what an ability can do in its implementation. For example, a NonInstanced Ability cannot have state. It is probably unsafe for an InstancedPerAc...

**Properties** (3):
  - `INSTANCED_PER_ACTOR`: `GameplayAbilityInstancingPolicy = Ellipsis` — Each actor gets their own instance of this ability. State can be saved, replication is possible. 1
  - `INSTANCED_PER_EXECUTION`: `GameplayAbilityInstancingPolicy = Ellipsis` — We instance this ability each time it is executed. Replication currently unsupported. 2
  - `NON_INSTANCED`: `GameplayAbilityInstancingPolicy = Ellipsis` — This ability is never instanced. Anything that executes the ability is operating on the CDO. 0

### `unreal.GameplayAbilityNetExecutionPolicy`
Inherits: `EnumBase` | Header: `GameplayAbilityTypes.h`

Where does an ability execute on the network. Does a client âask and predictâ, âask and waitâ, âdonât ask (just do it)â

**Properties** (4):
  - `LOCAL_ONLY`: `GameplayAbilityNetExecutionPolicy = Ellipsis` — This ability will only run on the client or server that has local control 1
  - `LOCAL_PREDICTED`: `GameplayAbilityNetExecutionPolicy = Ellipsis` — Part of this ability runs predictively on the local client if there is one 0
  - `SERVER_INITIATED`: `GameplayAbilityNetExecutionPolicy = Ellipsis` — This ability is initiated by the server, but will also run on the local client if one exists 2
  - `SERVER_ONLY`: `GameplayAbilityNetExecutionPolicy = Ellipsis` — This ability will only run on the server 3

### `unreal.GameplayAbilityNetSecurityPolicy`
Inherits: `EnumBase` | Header: `GameplayAbilityTypes.h`

What protections does this ability have? Should the client be allowed to request changes to the execution of the ability?

**Properties** (4):
  - `CLIENT_OR_SERVER`: `GameplayAbilityNetSecurityPolicy = Ellipsis` — No security requirements. Client or server can trigger execution and termination of this ability fre...
  - `SERVER_ONLY`: `GameplayAbilityNetSecurityPolicy = Ellipsis` — Server controls both execution and termination of this ability. A client making any requests will be...
  - `SERVER_ONLY_EXECUTION`: `GameplayAbilityNetSecurityPolicy = Ellipsis` — A client requesting execution of this ability will be ignored by the server. Clients can still reque...
  - `SERVER_ONLY_TERMINATION`: `GameplayAbilityNetSecurityPolicy = Ellipsis` — A client requesting cancellation or ending of this ability will be ignored by the server. Clients ca...

### `unreal.GameplayAbilityReplicationPolicy`
Inherits: `EnumBase` | Header: `GameplayAbilityTypes.h`

How an ability replicates state/events to everyone on the network

**Properties** (2):
  - `REPLICATE_NO`: `GameplayAbilityReplicationPolicy = Ellipsis` — We donât replicate the instance of the ability to anyone. 0
  - `REPLICATE_YES`: `GameplayAbilityReplicationPolicy = Ellipsis` — We replicate the instance of the ability to the owner. 1

### `unreal.GameplayAbilityTargetingLocationType`
Inherits: `EnumBase` | Header: `GameplayAbilityTargetTypes.h`

What type of location calculation to use when an ability asks for our transform

**Properties** (3):
  - `ACTOR_TRANSFORM`: `GameplayAbilityTargetingLocationType = Ellipsis` — We pull the transform from an associated actor directly 1
  - `LITERAL_TRANSFORM`: `GameplayAbilityTargetingLocationType = Ellipsis` — We report an actual raw transform. This is also the final fallback if other methods fail 0
  - `SOCKET_TRANSFORM`: `GameplayAbilityTargetingLocationType = Ellipsis` — We aim from a named socket on the playerâs skeletal mesh component 2

### `unreal.GameplayAbilityTriggerSource`
Inherits: `EnumBase` | Header: `GameplayAbilityTypes.h`

Defines what type of trigger will activate the ability, paired to a tag

**Properties** (3):
  - `GAMEPLAY_EVENT`: `GameplayAbilityTriggerSource = Ellipsis` — Triggered from a gameplay event, will come with payload 0
  - `OWNED_TAG_ADDED`: `GameplayAbilityTriggerSource = Ellipsis` — Triggered if the abilityâs owner gets a tag added, triggered once whenever itâs added 1
  - `OWNED_TAG_PRESENT`: `GameplayAbilityTriggerSource = Ellipsis` — Triggered if the abilityâs owner gets tag added, removed when the tag is removed 2

### `unreal.GameplayCueEvent`
Inherits: `EnumBase` | Header: `GameplayEffectTypes.h`

Indicates what type of action happened to a specific gameplay cue tag. Sometimes you will get multiple events at once

**Properties** (4):
  - `EXECUTED`: `GameplayCueEvent = Ellipsis` — Called when a GameplayCue is executed, this is used for instant effects or periodic ticks 2
  - `ON_ACTIVE`: `GameplayCueEvent = Ellipsis` — Called when a GameplayCue with duration is first activated, this will only be called if the client w...
  - `REMOVED`: `GameplayCueEvent = Ellipsis` — Called when a GameplayCue with duration is removed 3
  - `WHILE_ACTIVE`: `GameplayCueEvent = Ellipsis` — Called when a GameplayCue with duration is first seen as active, even if it wasnât actually just a...

### `unreal.GameplayCueNotify_AttachPolicy`
Inherits: `EnumBase` | Header: `GameplayCueNotifyTypes.h`

EGameplayCueNotify_AttachPolicy

**Properties** (2):
  - `ATTACH_TO_TARGET`: `GameplayCueNotify_AttachPolicy = Ellipsis` — Attach to the target actor if possible. 1
  - `DO_NOT_ATTACH`: `GameplayCueNotify_AttachPolicy = Ellipsis` — Do not attach to the target actor.  The target may still be used to get location and other informati...

### `unreal.GameplayCueNotify_EffectPlaySpace`
Inherits: `EnumBase` | Header: `GameplayCueNotifyTypes.h`

EGameplayCueNotify_EffectPlaySpace

**Properties** (2):
  - `CAMERA_SPACE`: `GameplayCueNotify_EffectPlaySpace = Ellipsis` — Play the effect in camera space. 1
  - `WORLD_SPACE`: `GameplayCueNotify_EffectPlaySpace = Ellipsis` — Play the effect in world space. 0

### `unreal.GameplayCueNotify_LocallyControlledPolicy`
Inherits: `EnumBase` | Header: `GameplayCueNotifyTypes.h`

EGameplayCueNotify_LocallyControlledPolicy

**Properties** (3):
  - `ALWAYS`: `GameplayCueNotify_LocallyControlledPolicy = Ellipsis` — Always spawns regardless of locally controlled. 0
  - `LOCAL_ONLY`: `GameplayCueNotify_LocallyControlledPolicy = Ellipsis` — Only spawn if the source actor is locally controlled. 1
  - `NOT_LOCAL`: `GameplayCueNotify_LocallyControlledPolicy = Ellipsis` — Only spawn if the source actor is NOT locally controlled. 2

### `unreal.GameplayCueNotify_LocallyControlledSource`
Inherits: `EnumBase` | Header: `GameplayCueNotifyTypes.h`

EGameplayCueNotify_LocallyControlledSource

**Properties** (2):
  - `INSTIGATOR_ACTOR`: `GameplayCueNotify_LocallyControlledSource = Ellipsis` — Use the instigator actor as the source when deciding the locally controlled policy. 0
  - `TARGET_ACTOR`: `GameplayCueNotify_LocallyControlledSource = Ellipsis` — Use the target actor as the source when deciding the locally controlled policy. 1

### `unreal.GameplayEffectAttributeCaptureSource`
Inherits: `EnumBase` | Header: `GameplayEffectAttributeCaptureDefinition.h`

Enumeration for options of where to capture gameplay attributes from for gameplay effects.

**Properties** (2):
  - `SOURCE`: `GameplayEffectAttributeCaptureSource = Ellipsis` — Source (caster) of the gameplay effect. 0
  - `TARGET`: `GameplayEffectAttributeCaptureSource = Ellipsis` — Target (recipient) of the gameplay effect. 1

### `unreal.GameplayEffectDurationType`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Gameplay effect duration policies

**Properties** (3):
  - `HAS_DURATION`: `GameplayEffectDurationType = Ellipsis` — The duration of this effect will be specified by a magnitude 2
  - `INFINITE`: `GameplayEffectDurationType = Ellipsis` — This effect lasts forever 1
  - `INSTANT`: `GameplayEffectDurationType = Ellipsis` — This effect applies instantly 0

### `unreal.GameplayEffectGrantedAbilityRemovePolicy`
Inherits: `EnumBase` | Header: `GameplayAbilitySpec.h`

Describes what happens when a GameplayEffect, that is granting an active ability, is removed from its owner.

**Properties** (3):
  - `CANCEL_ABILITY_IMMEDIATELY`: `GameplayEffectGrantedAbilityRemovePolicy = Ellipsis` — Active abilities are immediately canceled and the ability is removed. 0
  - `DO_NOTHING`: `GameplayEffectGrantedAbilityRemovePolicy = Ellipsis` — Granted abilities are left lone when the granting GameplayEffect is removed. 2
  - `REMOVE_ABILITY_ON_END`: `GameplayEffectGrantedAbilityRemovePolicy = Ellipsis` — Active abilities are allowed to finish, and then removed. 1

### `unreal.GameplayEffectMagnitudeCalculation`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Enumeration outlining the possible gameplay effect magnitude calculation policies.

**Properties** (4):
  - `ATTRIBUTE_BASED`: `GameplayEffectMagnitudeCalculation = Ellipsis` — Perform a calculation based upon an attribute. 1
  - `CUSTOM_CALCULATION_CLASS`: `GameplayEffectMagnitudeCalculation = Ellipsis` — Perform a custom calculation, capable of capturing and acting on multiple attributes, in either BP o...
  - `SCALABLE_FLOAT`: `GameplayEffectMagnitudeCalculation = Ellipsis` — Use a simple, scalable float for the calculation. 0
  - `SET_BY_CALLER`: `GameplayEffectMagnitudeCalculation = Ellipsis` — This magnitude will be set explicitly by the code/blueprint that creates the spec. 3

### `unreal.GameplayEffectPeriodInhibitionRemovedPolicy`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Enumeration of policies for dealing with the period of a gameplay effect when inhibition is removed

**Properties** (3):
  - `EXECUTE_AND_RESET_PERIOD`: `GameplayEffectPeriodInhibitionRemovedPolicy = Ellipsis` — Executes immediately and resets the period. 2
  - `NEVER_RESET`: `GameplayEffectPeriodInhibitionRemovedPolicy = Ellipsis` — Does not reset. The period timing will continue as if the inhibition hadnât occurred. 0
  - `RESET_PERIOD`: `GameplayEffectPeriodInhibitionRemovedPolicy = Ellipsis` — Resets the period. The next execution will occur one full period from when inhibition is removed. 1

### `unreal.GameplayEffectScopedModifierAggregatorType`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Enumeration representing the types of scoped modifier aggregator usages available

**Properties** (2):
  - `CAPTURED_ATTRIBUTE_BACKED`: `GameplayEffectScopedModifierAggregatorType = Ellipsis` — Aggregator is backed by an attribute capture 0
  - `TRANSIENT`: `GameplayEffectScopedModifierAggregatorType = Ellipsis` — Aggregator is entirely transient (acting as a âtemporary variableâ) and must be identified via g...

### `unreal.GameplayEffectStackingDurationPolicy`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Enumeration of policies for dealing with duration of a gameplay effect while stacking

**Properties** (2):
  - `NEVER_REFRESH`: `GameplayEffectStackingDurationPolicy = Ellipsis` — The duration of the effect will never be refreshed 1
  - `REFRESH_ON_SUCCESSFUL_APPLICATION`: `GameplayEffectStackingDurationPolicy = Ellipsis` — The duration of the effect will be refreshed from any successful stack application 0

### `unreal.GameplayEffectStackingExpirationPolicy`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Enumeration of policies for dealing gameplay effect stacks that expire (in duration based effects).

**Properties** (3):
  - `CLEAR_ENTIRE_STACK`: `GameplayEffectStackingExpirationPolicy = Ellipsis` — The entire stack is cleared when the active gameplay effect expires 0
  - `REFRESH_DURATION`: `GameplayEffectStackingExpirationPolicy = Ellipsis` — The duration of the gameplay effect is refreshed. This essentially makes the effect infinite in dura...
  - `REMOVE_SINGLE_STACK_AND_REFRESH_DURATION`: `GameplayEffectStackingExpirationPolicy = Ellipsis` — The current stack count will be decremented by 1 and the duration refreshed. The GE is not âreappl...

### `unreal.GameplayEffectStackingPeriodPolicy`
Inherits: `EnumBase` | Header: `GameplayEffect.h`

Enumeration of policies for dealing with the period of a gameplay effect while stacking

**Properties** (2):
  - `NEVER_RESET`: `GameplayEffectStackingPeriodPolicy = Ellipsis` — The progress toward the next tick of a periodic effect will never be reset, regardless of stack appl...
  - `RESET_ON_SUCCESSFUL_APPLICATION`: `GameplayEffectStackingPeriodPolicy = Ellipsis` — Any progress toward the next tick of a periodic effect is discarded upon any successful stack applic...

### `unreal.GameplayEffectStackingType`
Inherits: `EnumBase` | Header: `GameplayEffectTypes.h`

Enumeration for ways a single GameplayEffect asset can stack.

**Properties** (3):
  - `AGGREGATE_BY_SOURCE`: `GameplayEffectStackingType = Ellipsis` — Each caster has its own stack. 1
  - `AGGREGATE_BY_TARGET`: `GameplayEffectStackingType = Ellipsis` — Each target has its own stack. 2
  - `NONE`: `GameplayEffectStackingType = Ellipsis` — No stacking. Multiple applications of this GameplayEffect are treated as separate instances. 0

### `unreal.GameplayModEvaluationChannel`
Inherits: `EnumBase` | Header: `GameplayEffectTypes.h`

Valid gameplay modifier evaluation channels; Displayed and renamed via game-specific aliases and options

### `unreal.GameplayModOp`
Inherits: `EnumBase` | Header: `GameplayEffectTypes.h`

Defines the ways that mods will modify attributes. Values of the same type are aggregated, and then applied in the following equation: ((BaseValue + AddBase) * MultiplyAdditive / DivideAdditive * Mult...

**Properties** (6):
  - `ADD_BASE`: `GameplayModOp = Ellipsis` — Adds to the Base value. This happens first, before all other mods are considered. 0
  - `ADD_FINAL`: `GameplayModOp = Ellipsis` — Add this value to the final computed result. 5
  - `DIVIDE_ADDITIVE`: `GameplayModOp = Ellipsis` — Divisors are added together, then divided against the prev result. E.g. 1/2 + 1/2 = 1/3 in values is...
  - `MULTIPLY_ADDITIVE`: `GameplayModOp = Ellipsis` — Multipliers are added together first, then multiplied against prev result. E.g. 50% + 50% = 100% in ...
  - `MULTIPLY_COMPOUND`: `GameplayModOp = Ellipsis` — 1.5 * 1.5 = 2.25. 4 Multiply the prev result by this value. E.g. two values of 1.5 compounded
  - `OVERRIDE`: `GameplayModOp = Ellipsis` — Override the value, regardless of what the computation provides. 3

### `unreal.GameplayTagEventType`
Inherits: `EnumBase` | Header: `GameplayEffectTypes.h`

Rather a tag was added or removed, used in callbacks

**Properties** (2):
  - `ANY_COUNT_CHANGE`: `GameplayTagEventType = Ellipsis` — Event happens any time tag âcountâ changes 1
  - `NEW_OR_REMOVED`: `GameplayTagEventType = Ellipsis` — Event only happens when tag is new or completely removed 0

### `unreal.GameplayTargetingConfirmation`
Inherits: `EnumBase` | Header: `GameplayAbilityTargetTypes.h`

Describes how the targeting information is confirmed

**Properties** (4):
  - `CUSTOM`: `GameplayTargetingConfirmation = Ellipsis` — The GameplayTargeting Ability is responsible for deciding when the targeting data is ready. Not supp...
  - `CUSTOM_MULTI`: `GameplayTargetingConfirmation = Ellipsis` — The GameplayTargeting Ability is responsible for deciding when the targeting data is ready. Not supp...
  - `INSTANT`: `GameplayTargetingConfirmation = Ellipsis` — The targeting happens instantly without special logic or user input deciding when to âfireâ 0
  - `USER_CONFIRMED`: `GameplayTargetingConfirmation = Ellipsis` — The targeting happens when the user confirms the targeting 1

### `unreal.TargetDataFilterSelf`
Inherits: `EnumBase` | Header: `GameplayAbilityTargetDataFilter.h`

Set rather it is possible to target self

**Properties** (3):
  - `TDFS_ANY`: `TargetDataFilterSelf = Ellipsis` — 0
  - `TDFS_NO_OTHERS`: `TargetDataFilterSelf = Ellipsis` — 2
  - `TDFS_NO_SELF`: `TargetDataFilterSelf = Ellipsis` — 1

### `unreal.AbilityAsync_WaitAttributeChanged_AsyncWaitAttributeChangedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityAsync_WaitAttributeChanged.h`

Async Wait Attribute Changed Delegate Delegate Signature

### `unreal.AbilityAsync_WaitGameplayEffectApplied_OnAppliedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityAsync_WaitGameplayEffectApplied.h`

On Applied Delegate Delegate Signature

### `unreal.AbilityAsync_WaitGameplayEvent_EventReceivedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityAsync_WaitGameplayEvent.h`

Event Received Delegate Delegate Signature

### `unreal.AbilityAsync_WaitGameplayTag_AsyncWaitGameplayTagDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityAsync_WaitGameplayTag.h`

Async Wait Gameplay Tag Delegate Delegate Signature

### `unreal.AbilityAsync_WaitGameplayTagCountChanged_AsyncWaitGameplayTagCountDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityAsync_WaitGameplayTagCountChanged.h`

Async Wait Gameplay Tag Count Delegate Delegate Signature

### `unreal.AbilityStateDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_StartAbilityState.h`

Ability State Delegate Delegate Signature

### `unreal.AbilitySystemComponent_AbilityAbilityKey`
Inherits: `MulticastDelegateBase` | Header: `AbilitySystemComponent.h`

UGameplayAbility*, Ability,

### `unreal.AbilitySystemComponent_AbilityConfirmOrCancel`
Inherits: `MulticastDelegateBase` | Header: `AbilitySystemComponent.h`

Used to register callbacks to confirm/cancel input

### `unreal.ActiveGameplayEffectQueryCustomMatch_Dynamic`
Inherits: `DelegateBase` | Header: `GameplayEffect.h`

Active Gameplay Effect Query Custom Match Dynamic Delegate Signature

### `unreal.ApplyRootMotionConstantForceDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_ApplyRootMotionConstantForce.h`

Apply Root Motion Constant Force Delegate Delegate Signature

### `unreal.ApplyRootMotionJumpForceDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_ApplyRootMotionJumpForce.h`

Apply Root Motion Jump Force Delegate Delegate Signature

### `unreal.ApplyRootMotionMoveToActorForceDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_ApplyRootMotionMoveToActorForce.h`

Apply Root Motion Move to Actor Force Delegate Delegate Signature

### `unreal.ApplyRootMotionMoveToForceDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_ApplyRootMotionMoveToForce.h`

Apply Root Motion Move to Force Delegate Delegate Signature

### `unreal.ApplyRootMotionRadialForceDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_ApplyRootMotionRadialForce.h`

Apply Root Motion Radial Force Delegate Delegate Signature

### `unreal.AsyncWaitGameplayTagQueryDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityAsync_WaitGameplayTagQuery.h`

Async Wait Gameplay Tag Query Delegate Delegate Signature

### `unreal.GameplayEffectAppliedSelfDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayEffectApplied_Self.h`

Gameplay Effect Applied Self Delegate Delegate Signature

### `unreal.GameplayEffectAppliedTargetDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayEffectApplied_Target.h`

Gameplay Effect Applied Target Delegate Delegate Signature

### `unreal.GameplayEffectBlockedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayEffectBlockedImmunity.h`

Gameplay Effect Blocked Delegate Delegate Signature

### `unreal.InputPressDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitInputPress.h`

Input Press Delegate Delegate Signature

### `unreal.InputReleaseDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitInputRelease.h`

Input Release Delegate Delegate Signature

### `unreal.MontageWaitSimpleDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_PlayMontageAndWait.h`

Montage Wait Simple Delegate Delegate Signature

### `unreal.MovementModeChangedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitMovementModeChange.h`

Movement Mode Changed Delegate Delegate Signature

### `unreal.MoveToLocationDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_MoveToLocation.h`

Move to Location Delegate Delegate Signature

### `unreal.MovieSceneGameplayCueEvent`
Inherits: `DelegateBase` | Header: `MovieSceneGameplayCueTrack.h`

Movie Scene Gameplay Cue Event Delegate Signature

### `unreal.NetworkSyncDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_NetworkSyncPoint.h`

Network Sync Delegate Delegate Signature

### `unreal.OnGameplayTagChangedEventWrapperSignature`
Inherits: `DelegateBase` | Header: `AbilitySystemBlueprintLibrary.h`

Called when a gameplay tag bound to a event wrapper via one of the BindEventWrapper<to gameplay tag(s)> methods on the AbilitySystemLibrary changes.

### `unreal.PlayAnimWaitSimpleDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_PlayAnimAndWait.h`

Play Anim Wait Simple Delegate Delegate Signature

### `unreal.RepeatedActionDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_Repeat.h`

Repeated Action Delegate Delegate Signature

### `unreal.SpawnActorDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_SpawnActor.h`

Spawn Actor Delegate Delegate Signature

### `unreal.VisualizeTargetingDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_VisualizeTargeting.h`

Visualize Targeting Delegate Delegate Signature

### `unreal.WaitAbilityActivateDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitAbilityActivate.h`

Wait Ability Activate Delegate Delegate Signature

### `unreal.WaitAbilityCommitDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitAbilityCommit.h`

Wait Ability Commit Delegate Delegate Signature

### `unreal.WaitAttributeChangeDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitAttributeChange.h`

Wait Attribute Change Delegate Delegate Signature

### `unreal.WaitAttributeChangeRatioThresholdDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitAttributeChangeRatioThreshold.h`

Wait Attribute Change Ratio Threshold Delegate Delegate Signature

### `unreal.WaitAttributeChangeThresholdDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitAttributeChangeThreshold.h`

Wait Attribute Change Threshold Delegate Delegate Signature

### `unreal.WaitCancelDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitCancel.h`

Wait Cancel Delegate Delegate Signature

### `unreal.WaitConfirmCancelDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitConfirmCancel.h`

Wait Confirm Cancel Delegate Delegate Signature

### `unreal.WaitDelayDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitDelay.h`

Wait Delay Delegate Delegate Signature

### `unreal.WaitGameplayEffectRemovedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayEffectRemoved.h`

Wait Gameplay Effect Removed Delegate Delegate Signature

### `unreal.WaitGameplayEffectStackChangeDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayEffectStackChange.h`

Wait Gameplay Effect Stack Change Delegate Delegate Signature

### `unreal.WaitGameplayEventDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayEvent.h`

Wait Gameplay Event Delegate Delegate Signature

### `unreal.WaitGameplayTagCountDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayTagCountChanged.h`

Wait Gameplay Tag Count Delegate Delegate Signature

### `unreal.WaitGameplayTagDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayTag.h`

Wait Gameplay Tag Delegate Delegate Signature

### `unreal.WaitGameplayTagQueryDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitGameplayTagQuery.h`

Wait Gameplay Tag Query Delegate Delegate Signature

### `unreal.WaitOverlapDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitOverlap.h`

Wait Overlap Delegate Delegate Signature

### `unreal.WaitTargetDataDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitTargetData.h`

Wait Target Data Delegate Delegate Signature

### `unreal.WaitVelocityChangeDelegate`
Inherits: `MulticastDelegateBase` | Header: `AbilityTask_WaitVelocityChange.h`

Wait Velocity Change Delegate Delegate Signature
