# UE Python API — RazerChromaDevices Module

**5 types** from the `RazerChromaDevices` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RazerChromaAppInfo`, `RazerChromaAnimationAsset`, `RazerChromaDevicesDeveloperSettings`, `RazerChromaFunctionLibrary`, `RazerChromaPlayAnimationFile`

---

## Classes

### `unreal.RazerChromaAppInfo`
Inherits: `StructBase` | Header: `RazerChromaDevicesDeveloperSettings.h`

This information will be used to populate data in Razer Synapse.

### `unreal.RazerChromaAnimationAsset`
Inherits: `Object` | Header: `RazerChromaAnimationAsset.h`

Represents a single â.chromaâ Razer animation file that can be played.

### `unreal.RazerChromaDevicesDeveloperSettings`
Inherits: `DeveloperSettings` | Header: `RazerChromaDevicesDeveloperSettings.h`

Project settings for the Razer Chroma API in Unreal.

**Properties** (1):
  - `idle_animation_asset`: `RazerChromaAnimationAsset` — [Read-Write] This is the chroma animation file that should play when there are no other
animations p...

### `unreal.RazerChromaFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `RazerChromaFunctionLibrary.h`

Function library for Razer Chroma devices.

**Methods** (15):
  - `conv_razer_chroma_device_types_to_string(device_types)` -> `str` [classmethod] — Converts a ERazerChromaDeviceTypes enum to string.
  - `get_total_duration(anim)` -> `float` [classmethod] — Returns the duration in seconds of the specified animation.
  - `is_animation_playing(anim)` -> `bool` [classmethod] — Returns true if the given animation is currently playing.
  - `is_chroma_animation_paused(anim)` -> `bool` [classmethod] — Returns true if the given animation is currently paused.
  - `is_chroma_runtime_available()` -> `bool` [classmethod] — Returns true if the Razer Chroma runtime libraries are currently available. This will be false on any machines that do n...
  - `pause_chroma_animation(anim_to_pause)` -> `None` [classmethod] — Pauses the given animation if it is currently playing
  - `play_chroma_animation(anim_to_play, looping = False)` -> `bool` [classmethod] — Attempts to play the given Chroma animation file. If the Chroma Runtime is not available, nothing will happen.
  - `resume_chroma_animation(anim_to_resume, loop)` -> `None` [classmethod] — Resumes the given animation if it has been paused.
  - `set_all_devices_static_color(color_to_set, device_types)` -> `None` [classmethod] — Sets the color of every connected Razer Chroma Device to this static color
  - `set_event_name(name)` -> `int32` [classmethod]
  - `set_idle_animation(new_idle_animation)` -> `None` [classmethod] — Sets the idle animation for this application. This animation will play if no other animations are playing at the moment....
  - `set_use_idle_animation(use_idle_animation)` -> `None` [classmethod] — Sets whether or not we should use an idle currently an animation
  - `stop_all_chroma_animations()` -> `None` [classmethod] — Stops all currently active Chroma animations
  - `stop_chroma_animation(anim_to_stop)` -> `None` [classmethod] — Stops the given Chroma Animation if it is currently playing.
  - `use_forward_chroma_events(toggle)` -> `None` [classmethod]

### `unreal.RazerChromaPlayAnimationFile`
Inherits: `InputDeviceProperty` | Header: `RazerChromaDeviceProperties.h`

Razer Chroma Play Animation File

**Properties** (2):
  - `anim_asset`: `RazerChromaAnimationAsset` — [Read-Write] The chroma animation to play (RazerChromaAnimationAsset)
  - `looping`: `bool` — [Read-Write] If true, then this animation should loop when played (bool)
