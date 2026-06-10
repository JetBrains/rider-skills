# UE Python API — AudioGameplayVolume Module

**12 types** from the `AudioGameplayVolume` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AttenuationVolumeComponent`, `AudioGameplayVolume`, `AudioGameplayVolumeComponent`, `AudioGameplayVolumeComponentBase`, `AudioGameplayVolumeMutator`, `AudioGameplayVolumeProxy`, `FilterVolumeComponent`, `ReverbVolumeComponent`, `SubmixOverrideVolumeComponent`, `SubmixSendVolumeComponent`, `AudioGameplayVolumeEvent`, `OnAudioGameplayVolumeProxyStateChange`

---

## Classes

### `unreal.AttenuationVolumeComponent`
Inherits: `AudioGameplayVolumeMutator` | Header: `AttenuationVolumeComponent.h`

UAttenuationVolumeComponent - Audio Gameplay Volume component for occlusion settings (volume attenuation)

**Methods** (2):
  - `set_exterior_volume(volume, interpolate_time)` -> `None` — Set Exterior Volume
  - `set_interior_volume(volume, interpolate_time)` -> `None` — Set Interior Volume

**Properties** (4):
  - `exterior_time`: `float` [Read-Only] — [Read-Only] The time over which to interpolate from the current volume to the desired volume of soun...
  - `exterior_volume`: `float` [Read-Only] — [Read-Only] The desired volume of sounds outside the volume when the player is inside the volume (fl...
  - `interior_time`: `float` [Read-Only] — [Read-Only] The time over which to interpolate from the current volume to the desired volume of soun...
  - `interior_volume`: `float` [Read-Only] — [Read-Only] The desired volume of sounds inside the volume when the player is outside the volume (fl...

### `unreal.AudioGameplayVolume`
Inherits: `Volume` | Header: `AudioGameplayVolume.h`

**Methods** (3):
  - `on_listener_enter()` -> `None` — Blueprint event for listener enter
  - `on_listener_exit()` -> `None` — Blueprint event for listener exit
  - `set_enabled(enable)` -> `None` — Sets whether the volume is enabled

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] Whether this volume is currently enabled.  Disabled volumes will not have a volume prox...
  - `on_listener_enter_event`: `AudioGameplayVolumeEvent` — [Read-Write] (AudioGameplayVolumeEvent)
  - `on_listener_exit_event`: `AudioGameplayVolumeEvent` — [Read-Write] (AudioGameplayVolumeEvent)

### `unreal.AudioGameplayVolumeComponent`
Inherits: `AudioGameplayComponent` | Header: `AudioGameplayVolumeComponent.h`

**Properties** (3):
  - `on_proxy_enter`: `OnAudioGameplayVolumeProxyStateChange` — [Read-Write] Blueprint event for proxy enter (OnAudioGameplayVolumeProxyStateChange)
  - `on_proxy_exit`: `OnAudioGameplayVolumeProxyStateChange` — [Read-Write] Blueprint event for proxy exit (OnAudioGameplayVolumeProxyStateChange)
  - `proxy`: `AudioGameplayVolumeProxy` — [Read-Write] A representation of this volume for the audio thread (AudioGameplayVolumeProxy)

### `unreal.AudioGameplayVolumeComponentBase`
Inherits: `AudioGameplayComponent` | Header: `AudioGameplayVolumeComponent.h`

**Methods** (2):
  - `on_listener_enter()` -> `None` — Called when a listener âentersâ the associated proxy
  - `on_listener_exit()` -> `None` — Called when a listener âexitsâ the associated proxy

### `unreal.AudioGameplayVolumeMutator`
Inherits: `AudioGameplayComponent` | Header: `AudioGameplayVolumeMutator.h`

**Methods** (1):
  - `set_priority(priority)` -> `None` — Set Priority

**Properties** (1):
  - `priority`: `int` — [Read-Write] The priority of this component.  In the case of overlapping volumes or multiple affecti...

### `unreal.AudioGameplayVolumeProxy`
Inherits: `Object` | Header: `AudioGameplayVolumeProxy.h`

UAudioGameplayVolumeProxy - Abstract proxy used on audio thread to represent audio gameplay volumes.

### `unreal.FilterVolumeComponent`
Inherits: `AudioGameplayVolumeMutator` | Header: `FilterVolumeComponent.h`

UFilterVolumeComponent - Audio Gameplay Volume component for occlusion settings (volume filter)

**Methods** (2):
  - `set_exterior_lpf(volume, interpolate_time)` -> `None` — Set Exterior LPF
  - `set_interior_lpf(volume, interpolate_time)` -> `None` — Set Interior LPF

**Properties** (4):
  - `exterior_lpf`: `float` [Read-Only] — [Read-Only] The desired LPF frequency cutoff (in hertz) of sounds outside the volume when the player...
  - `exterior_lpf_time`: `float` [Read-Only] — [Read-Only] The time over which to interpolate from the current LPF to the desired LPF of sounds out...
  - `interior_lpf`: `float` [Read-Only] — [Read-Only] The desired LPF frequency cutoff (in hertz) of sounds inside the volume when the player ...
  - `interior_lpf_time`: `float` [Read-Only] — [Read-Only] The time over which to interpolate from the current LPF to the desired LPF of sounds ins...

### `unreal.ReverbVolumeComponent`
Inherits: `AudioGameplayVolumeMutator` | Header: `ReverbVolumeComponent.h`

UReverbVolumeComponent - Audio Gameplay Volume component for reverb settings

**Methods** (1):
  - `set_reverb_settings(new_reverb_settings)` -> `None` — Set Reverb Settings

**Properties** (1):
  - `reverb_settings`: `ReverbSettings` [Read-Only] — [Read-Only] Reverb settings to use with this component (ReverbSettings)

### `unreal.SubmixOverrideVolumeComponent`
Inherits: `AudioGameplayVolumeMutator` | Header: `SubmixOverrideVolumeComponent.h`

USubmixOverrideVolumeComponent - Audio Gameplay Volume component for submix effect chain overrides

**Methods** (1):
  - `set_submix_override_settings(new_submix_override_settings)` -> `None` — Set Submix Override Settings

**Properties** (1):
  - `submix_override_settings`: `None` [Read-Only] — [Read-Only] Submix effect chain override settings. Will override the effect chains on the given subm...

### `unreal.SubmixSendVolumeComponent`
Inherits: `AudioGameplayVolumeMutator` | Header: `SubmixSendVolumeComponent.h`

USubmixSendVolumeComponent - Audio Gameplay Volume component for submix sends

**Methods** (1):
  - `set_submix_send_settings(new_submix_send_settings)` -> `None` — Set Submix Send Settings

**Properties** (1):
  - `submix_send_settings`: `None` [Read-Only] — [Read-Only] Submix send settings to use for this component. Allows audio to dynamically send to subm...

### `unreal.AudioGameplayVolumeEvent`
Inherits: `MulticastDelegateBase` | Header: `AudioGameplayVolume.h`

Audio Gameplay Volume Event Delegate Signature

### `unreal.OnAudioGameplayVolumeProxyStateChange`
Inherits: `MulticastDelegateBase` | Header: `AudioGameplayVolumeComponent.h`

On Audio Gameplay Volume Proxy State Change Delegate Signature
