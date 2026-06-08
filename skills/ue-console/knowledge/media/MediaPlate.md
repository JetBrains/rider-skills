# UE Python API — MediaPlate Module

**6 types** from the `MediaPlate` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MediaPlateResource`, `MediaTextureResourceSettings`, `MediaPlate`, `MediaPlateComponent`, `MediaPlateEventState`, `MediaPlateResourceType`

---

## Classes

### `unreal.MediaPlateResource`
Inherits: `StructBase` | Header: `MediaPlateResource.h`

Helper struct to wrap source selection functionality, and enabling the usage of media source properties for places like Remote Control.

**Properties** (1):
  - `external_media`: `MediaSource` — [Read-Write]
deprecated: Moved to UMediaPlateComponent::ExternalMediaSource (MediaSource)

### `unreal.MediaTextureResourceSettings`
Inherits: `StructBase` | Header: `MediaPlateComponent.h`

This struct is used to expose Media Texture settings via Media Plate Component and is a mirror of some of the settings.

**Properties** (1):
  - `current_num_mips`: `int` — [Read-Write]
deprecated: Only âEnable RealTime Mipsâ is needed now. When true, the full mip chai...

### `unreal.MediaPlate`
Inherits: `Actor` | Header: `MediaPlate.h`

MediaPlate is an actor that can play and show media in the world.

**Properties** (3):
  - `enable_holdout_composite`: `bool` — [Read-Write] If true, the mesh is rendered separately and composited after post-processing (see Hold...
  - `media_plate_component`: `MediaPlateComponent` [Read-Only] — [Read-Only] (MediaPlateComponent)
  - `static_mesh_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] Holds the mesh. (StaticMeshComponent)

### `unreal.MediaPlateComponent`
Inherits: `ActorComponent` | Header: `MediaPlateComponent.h`

This is a component for AMediaPlate that can play and show media in the world.

**Methods** (21):
  - `close()` -> `None` — Call this to close the media.
  - `get_is_aspect_ratio_auto()` -> `bool` — Gets whether automatic aspect ratio is enabled.
  - `get_letterbox_aspect_ratio()` -> `float` — Call this to get the aspect ratio of the screen.
  - `get_media_player()` -> `MediaPlayer` — Call this get our media player.
  - `get_media_texture(index = 0)` -> `MediaTexture` — Call this get our media texture.
  - `get_mesh_range()` -> `Vector2D` — Return the arc size in degrees used for visible mips and tiles calculations, specific to the sphere.
  - `is_event_state_change_allowed(request_event_state)` -> `bool` — Indicates if switching to the given event state (open, play, etc) is currently allowed by the backend.
  - `open()` -> `None` — Call this to open the media.
  - `open_latent(world_context_object, latent_info, timeout = 10.000000, wait_for_texture = True)` -> `bool` — Open the media using a latent action.
  - `pause()` -> `None` — Call this to pause playback. Play can be called to resume playback.
  - `play()` -> `None` — Call this to start playing. Open must be called before this.
  - `rewind()` -> `bool` — Rewinds the media to the beginning. This is the same as seeking to zero time.
  - `seek(time)` -> `bool` — Call this to seek to the specified playback time.
  - `select_external_media(file_path)` -> `None` — brief: Select the external media file (non-UE asset) to be opened.
  - `select_media_playlist_asset(media_playlist)` -> `None` — brief: Select the media playlist asset to be opened.
  - `select_media_source_asset(media_source)` -> `None` — brief: Select the media source asset to be opened.
  - `set_enable_audio(enable_audio)` -> `None` — Set Enable Audio
  - `set_is_aspect_ratio_auto(is_aspect_ratio_auto)` -> `None` — Sets whether automatic aspect ratio is enabled.
  - `set_letterbox_aspect_ratio(aspect_ratio)` -> `None` — Call this to set the aspect ratio of the screen.
  - `set_mesh_range(mesh_range)` -> `None` — Set the arc size in degrees used for visible mips and tiles calculations, specific to the sphere.
  - `set_play_only_when_visible(play_only_when_visible)` -> `None` — Call this to set bPlayOnlyWhenVisible.

**Properties** (9):
  - `is_aspect_ratio_auto`: `bool` — [Read-Write] If true then set the aspect ratio automatically based on the media. (bool)
  - `is_media_plate_playing`: `bool` [Read-Only] — [Read-Only] If true, then we want the media plate to play.
Note that this could be true, but the pla...
  - `loop`: `bool` — [Read-Write] If set then loop when we reach the end. (bool)
  - `media_plate_resource`: `MediaPlateResource` — [Read-Write] Which media source is used to populate the media playlist (MediaPlateResource)
  - `media_playlist`: `MediaPlaylist` — [Read-Write]
deprecated: Use MediaPlateResource instead (MediaPlaylist)
  - `play_on_open`: `bool` — [Read-Write] If set then play when opening the media. (bool)
  - `play_only_when_visible`: `bool` [Read-Only] — [Read-Only] If true then only allow playback when the media plate is visible. (bool)
  - `playlist_index`: `int` — [Read-Write] The current index of the source in the play list being played. (int32)
  - `start_time`: `float` — [Read-Write] What time to start playing from (in seconds). (float)

### `unreal.MediaPlateEventState`
Inherits: `EnumBase` | Header: `MediaPlateComponent.h`

EMedia Plate Event State

**Properties** (9):
  - `CLOSE`: `MediaPlateEventState = Ellipsis` — 2
  - `FORWARD`: `MediaPlateEventState = Ellipsis` — 5
  - `NEXT`: `MediaPlateEventState = Ellipsis` — 7
  - `OPEN`: `MediaPlateEventState = Ellipsis` — 1
  - `PAUSE`: `MediaPlateEventState = Ellipsis` — 3
  - `PLAY`: `MediaPlateEventState = Ellipsis` — 0
  - `PREVIOUS`: `MediaPlateEventState = Ellipsis` — 8
  - `REVERSE`: `MediaPlateEventState = Ellipsis` — 4
  - `REWIND`: `MediaPlateEventState = Ellipsis` — 6

### `unreal.MediaPlateResourceType`
Inherits: `EnumBase` | Header: `MediaPlateResource.h`

EMedia Plate Resource Type

**Properties** (3):
  - `ASSET`: `MediaPlateResourceType = Ellipsis` — 2
  - `EXTERNAL`: `MediaPlateResourceType = Ellipsis` — 1
  - `PLAYLIST`: `MediaPlateResourceType = Ellipsis` — 0
