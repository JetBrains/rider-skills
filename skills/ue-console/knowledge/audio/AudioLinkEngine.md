# UE Python API — AudioLinkEngine Module

**1 types** from the `AudioLinkEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioLinkBlueprintInterface`

---

## Classes

### `unreal.AudioLinkBlueprintInterface`
Inherits: `Interface` | Header: `IAudioLinkBlueprintInterface.h`

Audio Link Blueprint Interface

**Methods** (4):
  - `is_link_playing()` -> `bool` — Is Link Playing
  - `play_link(start_time = 0.000000)` -> `None` — Play Link
  - `set_link_sound(new_sound)` -> `None` — Set Link Sound
  - `stop_link()` -> `None` — Stop an audio componentâs sound, issue any delegates if needed
