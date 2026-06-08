# UE Python API — SequencerPlaylists Module

**7 types** from the `SequencerPlaylists` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SequencerPlaylistPlaybackState`, `SequencerPlaylist`, `SequencerPlaylistItem`, `SequencerPlaylistItem_Sequence`, `SequencerPlaylistPlayer`, `SequencerPlaylistPlaybackDirection`, `OnPlayerSequencerPlaylistSet`

---

## Classes

### `unreal.SequencerPlaylistPlaybackState`
Inherits: `StructBase` | Header: `ISequencerPlaylistsModule.h`

Sequencer Playlist Playback State

**Properties** (3):
  - `is_paused`: `bool` — [Read-Write] (bool)
  - `is_playing`: `bool` — [Read-Write] (bool)
  - `playback_direction`: `SequencerPlaylistPlaybackDirection` — [Read-Write] (SequencerPlaylistPlaybackDirection)

### `unreal.SequencerPlaylist`
Inherits: `Object` | Header: `SequencerPlaylist.h`

Sequencer Playlist

**Properties** (2):
  - `description`: `Text` [Read-Only] — [Read-Only] (Text)
  - `items`: `None` [Read-Only] — [Read-Only] (Array[SequencerPlaylistItem])

### `unreal.SequencerPlaylistItem`
Inherits: `Object` | Header: `SequencerPlaylistItem.h`

Sequencer Playlist Item

**Properties** (5):
  - `end_frame_offset`: `int` — [Read-Write] Number of frames by which to clip the out point of sections played from this item. (int...
  - `mute`: `bool` — [Read-Write] Disable playback of this item and prevent it from entering a hold state. (bool)
  - `num_loops`: `int` — [Read-Write] 0 is single playthrough, >= 1 is (n+1) playthroughs. (int32)
  - `playback_speed`: `float` — [Read-Write] Speed multiplier at which to play sections created by this item. A value of 1 will resu...
  - `start_frame_offset`: `int` — [Read-Write] Number of frames by which to clip the in point of sections played from this item. Will ...

### `unreal.SequencerPlaylistItem_Sequence`
Inherits: `SequencerPlaylistItem` | Header: `SequencerPlaylistItem_Sequence.h`

Sequencer Playlist Item Sequence

**Methods** (1):
  - `set_sequence(new_sequence)` -> `None` — Set Sequence

**Properties** (1):
  - `sequence`: `LevelSequence` — [Read-Write] (LevelSequence)

### `unreal.SequencerPlaylistPlayer`
Inherits: `Object` | Header: `SequencerPlaylistPlayer.h`

Controls playback of playlist items

**Methods** (13):
  - `get_default_player()` -> `SequencerPlaylistPlayer` [classmethod] — Get Default Player deprecated: There is no longer a âdefaultâ player. Open a specific Playlist asset to create a pla...
  - `get_playback_state(item)` -> `SequencerPlaylistPlaybackState` — Get Playback State
  - `get_playlist()` -> `SequencerPlaylist` — Get Playlist
  - `is_playing(item)` -> `bool` — Is Playing
  - `pause_all()` -> `bool` — Pause All
  - `pause_item(item)` -> `bool` — Pause Item
  - `play_all(direction = SequencerPlaylistPlaybackDirection.FORWARD)` -> `bool` — Play All
  - `play_item(item, direction = SequencerPlaylistPlaybackDirection.FORWARD)` -> `bool` — Play Item
  - `reset_all()` -> `bool` — Reset All
  - `reset_item(item)` -> `bool` — Reset Item
  - `set_playlist(playlist)` -> `None` — Set Playlist
  - `stop_all()` -> `bool` — Stop All
  - `stop_item(item)` -> `bool` — Stop Item

**Properties** (1):
  - `on_playlist_set`: `OnPlayerSequencerPlaylistSet` — [Read-Write] (OnPlayerSequencerPlaylistSet)

### `unreal.SequencerPlaylistPlaybackDirection`
Inherits: `EnumBase` | Header: `ISequencerPlaylistsModule.h`

ESequencer Playlist Playback Direction

**Properties** (2):
  - `FORWARD`: `SequencerPlaylistPlaybackDirection = Ellipsis` — 0
  - `REVERSE`: `SequencerPlaylistPlaybackDirection = Ellipsis` — 1

### `unreal.OnPlayerSequencerPlaylistSet`
Inherits: `MulticastDelegateBase` | Header: `SequencerPlaylistPlayer.h`

On Player Sequencer Playlist Set Delegate Signature
