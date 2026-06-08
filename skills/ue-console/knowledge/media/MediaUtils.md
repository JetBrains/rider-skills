# UE Python API — MediaUtils Module

**6 types** from the `MediaUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MediaPlayerInitialTrackLanguageSelection`, `MediaPlayerOptions`, `MediaPlayerTrackOptions`, `MediaPlayerOptionBooleanOverride`, `MediaPlayerOptionSeekTimeType`, `MediaPlayerOptionTrackSelectMode`

---

## Classes

### `unreal.MediaPlayerInitialTrackLanguageSelection`
Inherits: `StructBase` | Header: `MediaPlayerOptions.h`

Media Player Initial Track Language Selection

**Properties** (4):
  - `audio`: `str` — [Read-Write] Comma separated RFC 4647 language ranges in order of priority, or keep empty for defaul...
  - `caption`: `str` — [Read-Write] Comma separated RFC 4647 language ranges in order of priority, or keep empty for defaul...
  - `subtitle`: `str` — [Read-Write] Comma separated RFC 4647 language ranges in order of priority, or keep empty for defaul...
  - `video`: `str` — [Read-Write] Comma separated RFC 4647 language ranges in order of priority, or keep empty for defaul...

### `unreal.MediaPlayerOptions`
Inherits: `StructBase` | Header: `MediaPlayerOptions.h`

Media Player Options

**Properties** (7):
  - `loop`: `MediaPlayerOptionBooleanOverride` — [Read-Write] How to initially select looping of the media. (MediaPlayerOptionBooleanOverride)
  - `play_on_open`: `MediaPlayerOptionBooleanOverride` — [Read-Write] How to handle automatic playback when media opens. (MediaPlayerOptionBooleanOverride)
  - `seek_time`: `Timespan` — [Read-Write] Initial media time to start playback at. (Timespan)
  - `seek_time_type`: `MediaPlayerOptionSeekTimeType` — [Read-Write] How to interpret the initial seek time. (MediaPlayerOptionSeekTimeType)
  - `track_selection`: `MediaPlayerOptionTrackSelectMode` — [Read-Write] How the initial media tracks for playback are selected (MediaPlayerOptionTrackSelectMod...
  - `tracks`: `MediaPlayerTrackOptions` — [Read-Write] Indices of the media tracks to select for playback (MediaPlayerTrackOptions)
  - `tracks_by_language`: `MediaPlayerInitialTrackLanguageSelection` — [Read-Write] Language of the media tracks to select for playback (MediaPlayerInitialTrackLanguageSel...

### `unreal.MediaPlayerTrackOptions`
Inherits: `StructBase` | Header: `MediaPlayerOptions.h`

Media Player Track Options

**Properties** (7):
  - `audio`: `int` — [Read-Write] (int32)
  - `caption`: `int` — [Read-Write] (int32)
  - `metadata`: `int` — [Read-Write] (int32)
  - `script`: `int` — [Read-Write] (int32)
  - `subtitle`: `int` — [Read-Write] (int32)
  - `text`: `int` — [Read-Write] (int32)
  - `video`: `int` — [Read-Write] (int32)

### `unreal.MediaPlayerOptionBooleanOverride`
Inherits: `EnumBase` | Header: `MediaPlayerOptions.h`

EMedia Player Option Boolean Override

**Properties** (3):
  - `DISABLED`: `MediaPlayerOptionBooleanOverride = Ellipsis` — 2
  - `ENABLED`: `MediaPlayerOptionBooleanOverride = Ellipsis` — 1
  - `USE_MEDIA_PLAYER_SETTING`: `MediaPlayerOptionBooleanOverride = Ellipsis` — 0

### `unreal.MediaPlayerOptionSeekTimeType`
Inherits: `EnumBase` | Header: `MediaPlayerOptions.h`

EMedia Player Option Seek Time Type

**Properties** (2):
  - `IGNORED`: `MediaPlayerOptionSeekTimeType = Ellipsis` — Ignore the given value and lets the media player choose. 0
  - `RELATIVE_TO_START_TIME`: `MediaPlayerOptionSeekTimeType = Ellipsis` — Given seek time is relative to the start of the media. 1

### `unreal.MediaPlayerOptionTrackSelectMode`
Inherits: `EnumBase` | Header: `MediaPlayerOptions.h`

EMedia Player Option Track Select Mode

**Properties** (3):
  - `USE_LANGUAGE_CODES`: `MediaPlayerOptionTrackSelectMode = Ellipsis` — Use language codes as specified with MediaPlayerInitialTrackLanguageSelection 2
  - `USE_MEDIA_PLAYER_DEFAULTS`: `MediaPlayerOptionTrackSelectMode = Ellipsis` — Let the media player choose defaults. 0
  - `USE_TRACK_OPTION_INDICES`: `MediaPlayerOptionTrackSelectMode = Ellipsis` — Use fixed track indices as specified with MediaPlayerTrackOptions 1
