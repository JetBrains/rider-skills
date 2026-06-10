# UE Python API — TemplateSequence Module

**8 types** from the `TemplateSequence` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TemplateSequenceBindingOverrideData`, `CameraAnimationSequence`, `SequenceCameraShakeTestUtil`, `TemplateSequence`, `TemplateSequenceActor`, `TemplateSequencePlayer`, `TemplateSequenceSection`, `TemplateSequenceTrack`

---

## Classes

### `unreal.TemplateSequenceBindingOverrideData`
Inherits: `StructBase` | Header: `TemplateSequenceActor.h`

Template sequence binding override data

### `unreal.CameraAnimationSequence`
Inherits: `TemplateSequence` | Header: `CameraAnimationSequence.h`

A template sequence specifically designed for playing on cameras.

### `unreal.SequenceCameraShakeTestUtil`
Inherits: `BlueprintFunctionLibrary` | Header: `SequenceCameraShakeTestUtil.h`

Sequence Camera Shake Test Util

**Methods** (3):
  - `get_camera_cache_pov(player_controller)` -> `MinimalViewInfo` [classmethod] — Get Camera Cache POV
  - `get_last_frame_camera_cache_pov(player_controller)` -> `MinimalViewInfo` [classmethod] — Get Last Frame Camera Cache POV
  - `get_post_process_blend_cache(player_controller, pp_index)` -> `(out_pp_settings=PostProcessSettings, out_pp_blend_weight=float) or None` [classmethod] — Get Post Process Blend Cache

### `unreal.TemplateSequence`
Inherits: `MovieSceneSequence` | Header: `TemplateSequence.h`

Movie scene animation that can be instanced multiple times inside a level sequence.

### `unreal.TemplateSequenceActor`
Inherits: `Actor` | Header: `TemplateSequenceActor.h`

Actor responsible for controlling a specific template sequence in the world.

**Methods** (4):
  - `get_sequence()` -> `TemplateSequence` — Get the template sequence being played by this actor.
  - `load_sequence()` -> `TemplateSequence` — Get the template sequence being played by this actor.
  - `set_binding(actor, overrides_default = True)` -> `None` — Set the actor to play the template sequence onto, by setting up an override for the template sequenceâs root object bi...
  - `set_sequence(sequence)` -> `None` — Set the template sequence being played by this actor.

**Properties** (4):
  - `binding_override`: `TemplateSequenceBindingOverrideData` [Read-Only] — [Read-Only] The override for the template sequenceâs root object binding. See SetBinding. (Templat...
  - `playback_settings`: `MovieSceneSequencePlaybackSettings` [Read-Only] — [Read-Only] (MovieSceneSequencePlaybackSettings)
  - `sequence_player`: `TemplateSequencePlayer` [Read-Only] — [Read-Only] (TemplateSequencePlayer)
  - `template_sequence`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)

### `unreal.TemplateSequencePlayer`
Inherits: `MovieSceneSequencePlayer` | Header: `TemplateSequencePlayer.h`

Template Sequence Player

**Methods** (1):
  - `create_template_sequence_player(world_context_object, template_sequence, out_actor=TemplateSequenceActor)` [classmethod] — Create Template Sequence Player

### `unreal.TemplateSequenceSection`
Inherits: `MovieSceneSubSection` | Header: `TemplateSequenceSection.h`

Defines the section for a template sequence track.

### `unreal.TemplateSequenceTrack`
Inherits: `MovieSceneSubTrack` | Header: `TemplateSequenceTrack.h`

Template Sequence Track
