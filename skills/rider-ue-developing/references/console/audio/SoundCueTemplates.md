# UE Python API — SoundCueTemplates Module

**5 types** from the `SoundCueTemplates` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SoundCueCrossfadeInfo`, `SoundCueContainer`, `SoundCueDistanceCrossfade`, `SoundCueTemplate`, `SoundContainerType`

---

## Classes

### `unreal.SoundCueCrossfadeInfo`
Inherits: `StructBase` | Header: `SoundCueDistanceCrossfade.h`

USoundCueDistanceCrossfade Sound Cue template class which implements USoundCueTemplate.

### `unreal.SoundCueContainer`
Inherits: `SoundCueTemplate` | Header: `SoundCueContainer.h`

Sound Cue Container

### `unreal.SoundCueDistanceCrossfade`
Inherits: `SoundCueTemplate` | Header: `SoundCueDistanceCrossfade.h`

Sound Cue Distance Crossfade

### `unreal.SoundCueTemplate`
Inherits: `SoundCue` | Header: `SoundCueTemplate.h`

Base Sound Cue Template class, which builds the sound node graph procedurally and hides more complex Sound Cue functionality to streamline implementation defined in child classes.

**Methods** (1):
  - `add_sound_waves_to_template(selected_objects)` -> `None` — Add Sound Waves to Template

### `unreal.SoundContainerType`
Inherits: `EnumBase` | Header: `SoundCueContainer.h`

USoundCueContainer Sound Cue template class which implements USoundCueTemplate.

**Properties** (3):
  - `CONCATENATE`: `SoundContainerType = Ellipsis` — 0
  - `MIX`: `SoundContainerType = Ellipsis` — 2
  - `RANDOMIZE`: `SoundContainerType = Ellipsis` — 1
