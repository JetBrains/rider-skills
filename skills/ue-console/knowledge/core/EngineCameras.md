# UE Python API — EngineCameras Module

**22 types** from the `EngineCameras` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CameraAnimationHandle`, `CameraAnimationParams`, `FOscillator`, `PerlinNoiseShaker`, `ROscillator`, `VOscillator`, `WaveOscillator`, `CameraAnimationCameraModifier`, `DefaultCameraShakeBase`, `EngineCameraAnimationFunctionLibrary`, `EngineCamerasSubsystem`, `LegacyCameraShake`, `LegacyCameraShakeFunctionLibrary`, `PerlinNoiseCameraShakePattern`, `SimpleCameraShakePattern`, `TestCameraShake`, `WaveOscillatorCameraShakePattern`, `CameraAnimationEasingType`, `CameraAnimationPlaySpace`, `InitialOscillatorOffset`, ... (22 total)

---

## Classes

### `unreal.CameraAnimationHandle`
Inherits: `StructBase` | Header: `CameraAnimationCameraModifier.h`

A handle to a camera animation running in UCameraAnimationCameraModifier

### `unreal.CameraAnimationParams`
Inherits: `StructBase` | Header: `CameraAnimationCameraModifier.h`

Parameter struct for adding new camera animations to UCameraAnimationCameraModifier

**Properties** (12):
  - `duration_override`: `float` — [Read-Write] Override the duration of the animation with a new duration (including blends) (float)
  - `ease_in_duration`: `float` — [Read-Write] Ease-in duration in seconds (float)
  - `ease_in_type`: `CameraAnimationEasingType` — [Read-Write] Ease-in function type (CameraAnimationEasingType)
  - `ease_out_duration`: `float` — [Read-Write] Ease-out duration in seconds (float)
  - `ease_out_type`: `CameraAnimationEasingType` — [Read-Write] Ease-out function type (CameraAnimationEasingType)
  - `loop`: `bool` — [Read-Write] Whether the camera animation should loop (bool)
  - `play_rate`: `float` — [Read-Write] Time scale for playing the new camera animation (float)
  - `play_space`: `CameraAnimationPlaySpace` — [Read-Write] The transform space to use for the new camera shake (CameraAnimationPlaySpace)
  - `random_start_time`: `bool` — [Read-Write] Whether the camera animation should have a random start time (bool)
  - `scale`: `float` — [Read-Write] Global scale to use for the new camera animation (float)
  - `start_offset`: `int` — [Read-Write] Offset, in frames, into the animation to start at (int32)
  - `user_play_space_rot`: `Rotator` — [Read-Write] User space to use when PlaySpace is UserDefined (Rotator)

### `unreal.FOscillator`
Inherits: `StructBase` | Header: `LegacyCameraShake.h`

Defines oscillation of a single number.

**Properties** (3):
  - `amplitude`: `float` — [Read-Write] Amplitude of the sinusoidal oscillation. (float)
  - `frequency`: `float` — [Read-Write] Frequency of the sinusoidal oscillation. (float)
  - `waveform`: `OscillatorWaveform` — [Read-Write] Type of waveform to use for oscillation. (OscillatorWaveform)

### `unreal.PerlinNoiseShaker`
Inherits: `StructBase` | Header: `PerlinNoiseCameraShakePattern.h`

A perlin noise shaker for a single number.

**Properties** (2):
  - `amplitude`: `float` — [Read-Write] Amplitude of the perlin noise. (float)
  - `frequency`: `float` — [Read-Write] Frequency of the sinusoidal oscillation. (float)

### `unreal.ROscillator`
Inherits: `StructBase` | Header: `LegacyCameraShake.h`

Defines FRotator oscillation.

**Properties** (3):
  - `pitch`: `FOscillator` — [Read-Write] Pitch oscillation. (FOscillator)
  - `roll`: `FOscillator` — [Read-Write] Roll oscillation. (FOscillator)
  - `yaw`: `FOscillator` — [Read-Write] Yaw oscillation. (FOscillator)

### `unreal.VOscillator`
Inherits: `StructBase` | Header: `LegacyCameraShake.h`

Defines FVector oscillation.

**Properties** (3):
  - `x`: `FOscillator` — [Read-Write] Oscillation in the X axis. (FOscillator)
  - `y`: `FOscillator` — [Read-Write] Oscillation in the Y axis. (FOscillator)
  - `z`: `FOscillator` — [Read-Write] Oscillation in the Z axis. (FOscillator)

### `unreal.WaveOscillator`
Inherits: `StructBase` | Header: `WaveOscillatorCameraShakePattern.h`

A wave oscillator for a single number.

**Properties** (3):
  - `amplitude`: `float` — [Read-Write] Amplitude of the sinusoidal oscillation. (float)
  - `frequency`: `float` — [Read-Write] Frequency of the sinusoidal oscillation. (float)
  - `initial_offset_type`: `InitialWaveOscillatorOffsetType` — [Read-Write] Defines how to begin the oscillation. (InitialWaveOscillatorOffsetType)

### `unreal.CameraAnimationCameraModifier`
Inherits: `CameraModifier` | Header: `CameraAnimationCameraModifier.h`

A camera modifier that plays camera animation sequences.

**Methods** (8):
  - `get_camera_animation_camera_modifier(world_context_object, player_index)` -> `CameraAnimationCameraModifier` [classmethod] — Get Camera Animation Camera Modifier
  - `get_camera_animation_camera_modifier_from_id(world_context_object, controller_id)` -> `CameraAnimationCameraModifier` [classmethod] — Get Camera Animation Camera Modifier from ID
  - `get_camera_animation_camera_modifier_from_player_controller(player_controller)` -> `CameraAnimationCameraModifier` [classmethod] — Get Camera Animation Camera Modifier from Player Controller
  - `is_camera_animation_active(handle)` -> `bool` — Returns whether the given camera animation is playing.
  - `play_camera_animation(sequence, params)` -> `CameraAnimationHandle` — Play a new camera animation sequence.
  - `stop_all_camera_animations(immediate = False)` -> `None` — Stop all camera animation instances.
  - `stop_all_camera_animations_of(sequence, immediate = False)` -> `None` — Stop playing all instances of the given camera animation sequence.
  - `stop_camera_animation(handle, immediate = False)` -> `None` — Stops the given camera animation instance.

### `unreal.DefaultCameraShakeBase`
Inherits: `CameraShakeBase` | Header: `DefaultCameraShakeBase.h`

Like UCameraShakeBase but with a perlin noise shake pattern by default, for convenience.

### `unreal.EngineCameraAnimationFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `CameraAnimationCameraModifier.h`

Blueprint function library for autocasting a player camera manager into the camera animation camera modifier. This prevents breaking Blueprints now that APlayerCameraManager::StartCameraShake returns ...

**Methods** (3):
  - `conv_camera_animation_camera_modifier(player_camera_manager)` -> `CameraAnimationCameraModifier` [classmethod] — Conv Camera Animation Camera Modifier
  - `conv_camera_animation_play_space(camera_shake_play_space)` -> `CameraAnimationPlaySpace` [classmethod] — Conv Camera Animation Play Space
  - `conv_camera_shake_play_space(camera_animation_play_space)` -> `CameraShakePlaySpace` [classmethod] — Conv Camera Shake Play Space

### `unreal.EngineCamerasSubsystem`
Inherits: `WorldSubsystem` | Header: `EngineCamerasSubsystem.h`

World subsystem that holds global objects for handling camera animation sequences.

**Methods** (5):
  - `is_camera_animation_active(player_controller, handle)` -> `bool` — Returns whether the given camera animation is playing.
  - `play_camera_animation(player_controller, sequence, params)` -> `CameraAnimationHandle` — Play a new camera animation sequence.
  - `stop_all_camera_animations(player_controller, immediate = False)` -> `None` — Stop all camera animation instances.
  - `stop_all_camera_animations_of(player_controller, sequence, immediate = False)` -> `None` — Stop playing all instances of the given camera animation sequence.
  - `stop_camera_animation(player_controller, handle, immediate = False)` -> `None` — Stops the given camera animation instance.

### `unreal.LegacyCameraShake`
Inherits: `CameraShakeBase` | Header: `LegacyCameraShake.h`

Legacy camera shake which can do either oscillation or run camera anims.

**Methods** (8):
  - `blueprint_update_camera_shake(delta_time, alpha, pov)` -> `MinimalViewInfo` — Called every tick to let the shake modify the point of view
  - `receive_is_finished()` -> `bool` — Called to allow a shake to decide when itâs finished playing.
  - `receive_play_shake(scale)` -> `None` — Called when the shake starts playing
  - `receive_stop_shake(immediately)` -> `None` — Called when the shake is explicitly stopped.
  - `start_legacy_camera_shake(player_camera_manager, shake_class, scale = 1.000000, play_space = CameraShakePlaySpace.CAMERA_LOCAL, user_play_space_rot = [0.000000,0.000000,0.000000])` -> `LegacyCameraShake` [classmethod] — Backwards compatible method used by core BP redirectors. This is needed because the return value is specifically a legac...
  - `start_legacy_camera_shake_from_source(player_camera_manager, shake_class, source_component, scale = 1.000000, play_space = CameraShakePlaySpace.CAMERA_LOCAL, user_play_space_rot = [0.000000,0.000000,0.000000])` -> `LegacyCameraShake` [classmethod] — Backwards compatible method used by core BP redirectors. This is needed because the return value is specifically a legac...
  - `start_matinee_camera_shake(player_camera_manager: PlayerCameraManager, shake_class: Class, scale: float = 1.0, play_space: CameraShakePlaySpace = Ellipsis, user_play_space_rot: Rotator = Ellipsis)` -> `LegacyCameraShake` [classmethod] — deprecated: âstart_matinee_camera_shakeâ was renamed to âstart_legacy_camera_shakeâ.
  - `start_matinee_camera_shake_from_source(player_camera_manager: PlayerCameraManager, shake_class: Class, source_component: CameraShakeSourceComponent, scale: float = 1.0, play_space: CameraShakePlaySpace = Ellipsis, user_play_space_rot: Rotator = Ellipsis)` -> `LegacyCameraShake` [classmethod] — deprecated: âstart_matinee_camera_shake_from_sourceâ was renamed to âstart_legacy_camera_shake_from_sourceâ.

**Properties** (4):
  - `fov_oscillation`: `FOscillator` — [Read-Write] FOV oscillation (FOscillator)
  - `loc_oscillation`: `VOscillator` — [Read-Write] Positional oscillation (VOscillator)
  - `oscillator_time_remaining`: `float` [Read-Only] — [Read-Only] Time remaining for oscillation shakes. Less than 0.f means shake infinitely. (float)
  - `rot_oscillation`: `ROscillator` — [Read-Write] Rotational oscillation (ROscillator)

### `unreal.LegacyCameraShakeFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LegacyCameraShake.h`

Blueprint function library for autocasting from a base camera shake to a legacy camera shake. This prevents breaking Blueprints now that APlayerCameraManager::StartCameraShake returns the base class.

**Methods** (2):
  - `conv_legacy_camera_shake(camera_shake)` -> `LegacyCameraShake` [classmethod] — Conv Legacy Camera Shake
  - `conv_matinee_camera_shake(camera_shake: CameraShakeBase)` -> `LegacyCameraShake` [classmethod] — deprecated: âconv_matinee_camera_shakeâ was renamed to âconv_legacy_camera_shakeâ.

### `unreal.PerlinNoiseCameraShakePattern`
Inherits: `SimpleCameraShakePattern` | Header: `PerlinNoiseCameraShakePattern.h`

A camera shake that uses Perlin noise to shake the camera.

**Properties** (11):
  - `fov`: `PerlinNoiseShaker` — [Read-Write] FOV shake. (PerlinNoiseShaker)
  - `location_amplitude_multiplier`: `float` — [Read-Write] Amplitude multiplier for all location shake (float)
  - `location_frequency_multiplier`: `float` — [Read-Write] Frequency multiplier for all location shake (float)
  - `pitch`: `PerlinNoiseShaker` — [Read-Write] Pitch shake. (PerlinNoiseShaker)
  - `roll`: `PerlinNoiseShaker` — [Read-Write] Roll shake. (PerlinNoiseShaker)
  - `rotation_amplitude_multiplier`: `float` — [Read-Write] Amplitude multiplier for all rotation shake (float)
  - `rotation_frequency_multiplier`: `float` — [Read-Write] Frequency multiplier for all rotation shake (float)
  - `x`: `PerlinNoiseShaker` — [Read-Write] Shake in the X axis. (PerlinNoiseShaker)
  - `y`: `PerlinNoiseShaker` — [Read-Write] Shake in the Y axis. (PerlinNoiseShaker)
  - `yaw`: `PerlinNoiseShaker` — [Read-Write] Yaw shake. (PerlinNoiseShaker)
  - `z`: `PerlinNoiseShaker` — [Read-Write] Shake in the Z axis. (PerlinNoiseShaker)

### `unreal.SimpleCameraShakePattern`
Inherits: `CameraShakePattern` | Header: `SimpleCameraShakePattern.h`

A base class for a simple camera shake.

### `unreal.TestCameraShake`
Inherits: `CameraShakeBase` | Header: `CameraShakeTestObjects.h`

Test Camera Shake

### `unreal.WaveOscillatorCameraShakePattern`
Inherits: `SimpleCameraShakePattern` | Header: `WaveOscillatorCameraShakePattern.h`

A camera shake that uses oscillations to move the camera.

**Properties** (11):
  - `fov`: `WaveOscillator` — [Read-Write] FOV oscillation. (WaveOscillator)
  - `location_amplitude_multiplier`: `float` — [Read-Write] Amplitude multiplier for all location oscillation (float)
  - `location_frequency_multiplier`: `float` — [Read-Write] Frequency multiplier for all location oscillation (float)
  - `pitch`: `WaveOscillator` — [Read-Write] Pitch oscillation. (WaveOscillator)
  - `roll`: `WaveOscillator` — [Read-Write] Roll oscillation. (WaveOscillator)
  - `rotation_amplitude_multiplier`: `float` — [Read-Write] Amplitude multiplier for all rotation oscillation (float)
  - `rotation_frequency_multiplier`: `float` — [Read-Write] Frequency multiplier for all rotation oscillation (float)
  - `x`: `WaveOscillator` — [Read-Write] Oscillation in the X axis. (WaveOscillator)
  - `y`: `WaveOscillator` — [Read-Write] Oscillation in the Y axis. (WaveOscillator)
  - `yaw`: `WaveOscillator` — [Read-Write] Yaw oscillation. (WaveOscillator)
  - `z`: `WaveOscillator` — [Read-Write] Oscillation in the Z axis. (WaveOscillator)

### `unreal.CameraAnimationEasingType`
Inherits: `EnumBase` | Header: `CameraAnimationCameraModifier.h`

ECamera Animation Easing Type

**Properties** (8):
  - `CIRCULAR`: `CameraAnimationEasingType = Ellipsis` — 7
  - `CUBIC`: `CameraAnimationEasingType = Ellipsis` — 3
  - `EXPONENTIAL`: `CameraAnimationEasingType = Ellipsis` — 6
  - `LINEAR`: `CameraAnimationEasingType = Ellipsis` — 0
  - `QUADRATIC`: `CameraAnimationEasingType = Ellipsis` — 2
  - `QUARTIC`: `CameraAnimationEasingType = Ellipsis` — 4
  - `QUINTIC`: `CameraAnimationEasingType = Ellipsis` — 5
  - `SINUSOIDAL`: `CameraAnimationEasingType = Ellipsis` — 1

### `unreal.CameraAnimationPlaySpace`
Inherits: `EnumBase` | Header: `CameraAnimationCameraModifier.h`

ECamera Animation Play Space

**Properties** (3):
  - `CAMERA_LOCAL`: `CameraAnimationPlaySpace = Ellipsis` — This anim is applied in camera space. 0
  - `USER_DEFINED`: `CameraAnimationPlaySpace = Ellipsis` — This anim is applied in a user-specified space (defined by UserPlaySpaceMatrix). 2
  - `WORLD`: `CameraAnimationPlaySpace = Ellipsis` — This anim is applied in world space. 1

### `unreal.InitialOscillatorOffset`
Inherits: `EnumBase` | Header: `LegacyCameraShake.h`

Shake start offset parameter

**Properties** (2):
  - `EOO_OFFSET_RANDOM`: `InitialOscillatorOffset = Ellipsis` — Start with random offset (default). 0
  - `EOO_OFFSET_ZERO`: `InitialOscillatorOffset = Ellipsis` — Start with zero offset. 1

### `unreal.InitialWaveOscillatorOffsetType`
Inherits: `EnumBase` | Header: `WaveOscillatorCameraShakePattern.h`

Shake start offset parameter.

**Properties** (2):
  - `RANDOM`: `InitialWaveOscillatorOffsetType = Ellipsis` — Start with random offset (default). 0
  - `ZERO`: `InitialWaveOscillatorOffsetType = Ellipsis` — Start with zero offset. 1

### `unreal.OscillatorWaveform`
Inherits: `EnumBase` | Header: `LegacyCameraShake.h`

Types of waveforms that can be used for camera shake oscillators

**Properties** (2):
  - `PERLIN_NOISE`: `OscillatorWaveform = Ellipsis` — Perlin noise 1
  - `SINE_WAVE`: `OscillatorWaveform = Ellipsis` — A sinusoidal wave 0
