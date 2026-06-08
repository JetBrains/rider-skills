# UE Python API — ResonanceAudio Module

**11 types** from the `ResonanceAudio` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ResonanceAudioReverbPluginSettings`, `ResonanceAudioBlueprintFunctionLibrary`, `ResonanceAudioDirectivityVisualizer`, `ResonanceAudioReverbPluginPreset`, `ResonanceAudioSoundfieldSettings`, `ResonanceAudioSpatializationSourceSettings`, `RaDistanceRolloffModel`, `RaMaterialName`, `RaQualityMode`, `RaSpatializationMethod`, `ResonanceRenderMode`

---

## Classes

### `unreal.ResonanceAudioReverbPluginSettings`
Inherits: `StructBase` | Header: `ResonanceAudioReverb.h`

Resonance Audio Reverb Plugin Settings

**Properties** (14):
  - `back_wall_material`: `RaMaterialName` — [Read-Write] Back wall acoustic material (RaMaterialName)
  - `ceiling_material`: `RaMaterialName` — [Read-Write] Ceiling acoustic material (RaMaterialName)
  - `enable_room_effects`: `bool` — [Read-Write] Whether Resonance Audio room effects are enabled (bool)
  - `floor_material`: `RaMaterialName` — [Read-Write] Floor acoustic material (RaMaterialName)
  - `front_wall_material`: `RaMaterialName` — [Read-Write] Front wall acoustic material (RaMaterialName)
  - `left_wall_material`: `RaMaterialName` — [Read-Write] Left wall acoustic material (RaMaterialName)
  - `reflection_scalar`: `float` — 1.0 (float) [Read-Write] Early reflections gain multiplier. Default
  - `reverb_brightness`: `float` — 0.0 (float) [Read-Write] Reverb brightness modifier. Default
  - `reverb_gain`: `float` — 1.0 (float) [Read-Write] Reverb gain multiplier. Default
  - `reverb_time_modifier`: `float` — 1.0 (float) [Read-Write] Reverb time modifier. Default
  - `right_wall_material`: `RaMaterialName` — [Read-Write] Right wall acoustic material (RaMaterialName)
  - `room_dimensions`: `Vector` — [Read-Write] Room dimensions in 3D space (Vector)
  - `room_position`: `Vector` — [Read-Write] Room position in 3D space (Vector)
  - `room_rotation`: `Quat` — [Read-Write] Room rotation in 3D space (Quat)

### `unreal.ResonanceAudioBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ResonanceAudioBlueprintFunctionLibrary.h`

Resonance Audio Blueprint Function Library

**Methods** (2):
  - `get_global_reverb_preset()` -> `ResonanceAudioReverbPluginPreset` [classmethod] — This function retrieves the Global Reverb Preset for Resonance Audio
  - `set_global_reverb_preset(preset)` -> `None` [classmethod] — This function overrides the Global Reverb Preset for Resonance Audio

### `unreal.ResonanceAudioDirectivityVisualizer`
Inherits: `Actor` | Header: `ResonanceAudioDirectivityVisualizer.h`

Resonance Audio Directivity Visualizer

### `unreal.ResonanceAudioReverbPluginPreset`
Inherits: `SoundEffectSubmixPreset` | Header: `ResonanceAudioReverb.h`

Resonance Audio Reverb Plugin Preset

**Methods** (9):
  - `set_enable_room_effects(enable_room_effects)` -> `None` — Enables/disables Resonance Audio room effects
  - `set_reflection_scalar(reflection_scalar)` -> `None` — Sets early reflections gain multiplier
  - `set_reverb_brightness(reverb_brightness)` -> `None` — Increases high frequency reverberation times when positive, decreases when negative. Has no effect when set to 0.0
  - `set_reverb_gain(reverb_gain)` -> `None` — Sets reverb gain multiplier
  - `set_reverb_time_modifier(reverb_time_modifier)` -> `None` — Adjusts the reverberation time across all frequency bands by multiplying the computed values by this factor. Has no effe...
  - `set_room_dimensions(dimensions)` -> `None` — Sets room dimensions in 3D space
  - `set_room_materials(materials)` -> `None` — Sets Resonance Audio roomâs acoustic materials
  - `set_room_position(position)` -> `None` — Sets room position in 3D space
  - `set_room_rotation(rotation)` -> `None` — Sets room rotation in 3D space

### `unreal.ResonanceAudioSoundfieldSettings`
Inherits: `SoundfieldEncodingSettingsBase` | Header: `ResonanceAudioAmbisonicsSettings.h`

Resonance Audio Soundfield Settings

**Properties** (1):
  - `render_mode`: `ResonanceRenderMode` [Read-Only] — [Read-Only] Which order of ambisonics to use for this submix. (ResonanceRenderMode)

### `unreal.ResonanceAudioSpatializationSourceSettings`
Inherits: `SpatializationPluginSourceSettingsBase` | Header: `ResonanceAudioSpatializationSourceSettings.h`

Resonance Audio Spatialization Source Settings

**Methods** (2):
  - `set_sound_source_directivity(pattern, sharpness)` -> `None` — Sets the sound source directivity, applies, and updates
  - `set_sound_source_spread(spread)` -> `None` — Sets the sound source spread (width), applies, and updates

### `unreal.RaDistanceRolloffModel`
Inherits: `EnumBase` | Header: `ResonanceAudioEnums.h`

ERa Distance Rolloff Model

**Properties** (3):
  - `LINEAR`: `RaDistanceRolloffModel = Ellipsis` — Linear distance attenuation model. 1
  - `LOGARITHMIC`: `RaDistanceRolloffModel = Ellipsis` — Logarithmic distance attenuation model (default). 0
  - `NONE`: `RaDistanceRolloffModel = Ellipsis` — Use Unreal Engine attenuation settings. 2

### `unreal.RaMaterialName`
Inherits: `EnumBase` | Header: `ResonanceAudioEnums.h`

ERa Material Name

**Properties** (24):
  - `ACOUSTIC_CEILING_TILES`: `RaMaterialName = Ellipsis` — 1
  - `BRICK_BARE`: `RaMaterialName = Ellipsis` — 2
  - `BRICK_PAINTED`: `RaMaterialName = Ellipsis` — 3
  - `CONCRETE_BLOCK_COARSE`: `RaMaterialName = Ellipsis` — 4
  - `CONCRETE_BLOCK_PAINTED`: `RaMaterialName = Ellipsis` — 5
  - `CURTAIN_HEAVY`: `RaMaterialName = Ellipsis` — 6
  - `FIBER_GLASS_INSULATION`: `RaMaterialName = Ellipsis` — 7
  - `GLASS_THICK`: `RaMaterialName = Ellipsis` — 9
  - `GLASS_THIN`: `RaMaterialName = Ellipsis` — 8
  - `GRASS`: `RaMaterialName = Ellipsis` — 10
  - `LINOLEUM_ON_CONCRETE`: `RaMaterialName = Ellipsis` — 11
  - `MARBLE`: `RaMaterialName = Ellipsis` — 12
  - `METAL`: `RaMaterialName = Ellipsis` — 13
  - `PARQUET_ONCONCRETE`: `RaMaterialName = Ellipsis` — 14
  - `PLASTER_ROUGH`: `RaMaterialName = Ellipsis` — 15
  - `PLASTER_SMOOTH`: `RaMaterialName = Ellipsis` — 16
  - `PLYWOOD_PANEL`: `RaMaterialName = Ellipsis` — 17
  - `POLISHED_CONCRETE_OR_TILE`: `RaMaterialName = Ellipsis` — 18
  - `SHEETROCK`: `RaMaterialName = Ellipsis` — 19
  - `TRANSPARENT`: `RaMaterialName = Ellipsis` — Full acoustic energy absorption. 0
  - `UNIFORM`: `RaMaterialName = Ellipsis` — Uniform acoustic energy absorption across all frequency bands. 23
  - `WATER_OR_ICE_SURFACE`: `RaMaterialName = Ellipsis` — 20
  - `WOOD_CEILING`: `RaMaterialName = Ellipsis` — 21
  - `WOOD_PANEL`: `RaMaterialName = Ellipsis` — 22

### `unreal.RaQualityMode`
Inherits: `EnumBase` | Header: `ResonanceAudioEnums.h`

ERa Quality Mode

**Properties** (4):
  - `BINAURAL_HIGH`: `RaQualityMode = Ellipsis` — Binaural High (Third Order Ambisonics = Default). 3
  - `BINAURAL_LOW`: `RaQualityMode = Ellipsis` — Binaural Low (First Order Ambisonics). 1
  - `BINAURAL_MEDIUM`: `RaQualityMode = Ellipsis` — Binaural Medium (Second Order Ambisonics). 2
  - `STEREO_PANNING`: `RaQualityMode = Ellipsis` — Stereo panning. 0

### `unreal.RaSpatializationMethod`
Inherits: `EnumBase` | Header: `ResonanceAudioEnums.h`

ERa Spatialization Method

**Properties** (2):
  - `HRTF`: `RaSpatializationMethod = Ellipsis` — Binaural rendering via HRTF. 1
  - `STEREO_PANNING`: `RaSpatializationMethod = Ellipsis` — Stereo panning. 0

### `unreal.ResonanceRenderMode`
Inherits: `EnumBase` | Header: `ResonanceAudioAmbisonicsSettings.h`

EResonance Render Mode

**Properties** (5):
  - `BINAURAL_HIGH_QUALITY`: `ResonanceRenderMode = Ellipsis` — HRTF-based rendering using Third Order Ambisonics, over a virtual array of
26 loudspeakers arranged ...
  - `BINAURAL_LOW_QUALITY`: `ResonanceRenderMode = Ellipsis` — HRTF-based rendering using First Order Ambisonics, over a virtual array of
8 loudspeakers arranged i...
  - `BINAURAL_MEDIUM_QUALITY`: `ResonanceRenderMode = Ellipsis` — HRTF-based rendering using Second Order Ambisonics, over a virtual array of
12 loudspeakers arranged...
  - `ROOM_EFFECTS_ONLY`: `ResonanceRenderMode = Ellipsis` — Room effects only rendering. This disables HRTF-based rendering and direct
(dry) output of a sound o...
  - `STEREO_PANNING`: `ResonanceRenderMode = Ellipsis` — Stereo panning, i.e., this disables HRTF-based rendering. 0
