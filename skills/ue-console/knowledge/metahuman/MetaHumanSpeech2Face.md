# UE Python API — MetaHumanSpeech2Face Module

**4 types** from the `MetaHumanSpeech2Face` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioDrivenAnimationModels`, `AudioDrivenAnimationSolveOverrides`, `AudioDrivenAnimationMood`, `AudioDrivenAnimationOutputControls`

---

## Classes

### `unreal.AudioDrivenAnimationModels`
Inherits: `StructBase` | Header: `AudioDrivenAnimationConfig.h`

Audio Driven Animation Models

**Properties** (2):
  - `animation_decoder`: `SoftObjectPath` — [Read-Write] The model which will be used for decoding the animation (SoftObjectPath)
  - `audio_encoder`: `SoftObjectPath` — [Read-Write] The model which will be used for audio encoding (SoftObjectPath)

### `unreal.AudioDrivenAnimationSolveOverrides`
Inherits: `StructBase` | Header: `AudioDrivenAnimationConfig.h`

Audio Driven Animation Solve Overrides

**Properties** (2):
  - `mood`: `AudioDrivenAnimationMood` — [Read-Write] (AudioDrivenAnimationMood)
  - `mood_intensity`: `float` — [Read-Write] (float)

### `unreal.AudioDrivenAnimationMood`
Inherits: `EnumBase` | Header: `AudioDrivenAnimationConfig.h`

EAudio Driven Animation Mood

**Properties** (8):
  - `ANGER`: `AudioDrivenAnimationMood = Ellipsis` — Anger (4) 4
  - `AUTO_DETECT`: `AudioDrivenAnimationMood = Ellipsis` — Auto Detect (255) 255
  - `DISGUST`: `AudioDrivenAnimationMood = Ellipsis` — Disgust (3) 3
  - `FEAR`: `AudioDrivenAnimationMood = Ellipsis` — Fear (6) 6
  - `HAPPY`: `AudioDrivenAnimationMood = Ellipsis` — Happy (1) 1
  - `NEUTRAL`: `AudioDrivenAnimationMood = Ellipsis` — Neutral (0) 0
  - `SAD`: `AudioDrivenAnimationMood = Ellipsis` — Sad (2) 2
  - `SURPRISE`: `AudioDrivenAnimationMood = Ellipsis` — Surprise (5) 5

### `unreal.AudioDrivenAnimationOutputControls`
Inherits: `EnumBase` | Header: `AudioDrivenAnimationConfig.h`

EAudio Driven Animation Output Controls

**Properties** (2):
  - `FULL_FACE`: `AudioDrivenAnimationOutputControls = Ellipsis` — 0
  - `MOUTH_ONLY`: `AudioDrivenAnimationOutputControls = Ellipsis` — 1
