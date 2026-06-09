# UE Python API — TakeMovieScene Module

**3 types** from the `TakeMovieScene` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieSceneTakeSection`, `MovieSceneTakeSettings`, `MovieSceneTakeTrack`

---

## Classes

### `unreal.MovieSceneTakeSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneTakeSection.h`

A section in a Take track

### `unreal.MovieSceneTakeSettings`
Inherits: `Object` | Header: `MovieSceneTakeSettings.h`

Universal take recorder settings that apply to a whole take

**Properties** (7):
  - `frames_name`: `str` — [Read-Write] Frames Name (str)
  - `hours_name`: `str` — [Read-Write] Hours Name (str)
  - `minutes_name`: `str` — [Read-Write] Minutes Name (str)
  - `rate_name`: `str` — [Read-Write] Rate Name (str)
  - `seconds_name`: `str` — [Read-Write] Seconds Name (str)
  - `slate_name`: `str` — [Read-Write] Slate Name (str)
  - `sub_frames_name`: `str` — [Read-Write] SubFrames Name (str)

### `unreal.MovieSceneTakeTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneTakeTrack.h`

Handles manipulation of takes in a movie scene
