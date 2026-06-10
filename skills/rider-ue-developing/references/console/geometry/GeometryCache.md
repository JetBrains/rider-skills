# UE Python API — GeometryCache Module

**9 types** from the `GeometryCache` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GeometryCache`, `GeometryCacheActor`, `GeometryCacheCodecBase`, `GeometryCacheComponent`, `GeometryCacheTrack`, `GeometryCacheTrack_FlipbookAnimation`, `GeometryCacheTrack_TransformAnimation`, `GeometryCacheTrack_TransformGroupAnimation`, `GeometryCacheTrackStreamable`

---

## Classes

### `unreal.GeometryCache`
Inherits: `Object` | Header: `GeometryCache.h`

A Geometry Cache is a piece/set of geometry that consists of individual Mesh/Transformation samples. In contrast with Static Meshes they can have their vertices animated in certain ways. *

**Methods** (3):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.

**Properties** (4):
  - `end_frame`: `int` [Read-Only] — [Read-Only] (int32)
  - `material_slot_names`: `None` — [Read-Write] (Array[Name])
  - `materials`: `None` — [Read-Write] (Array[MaterialInterface])
  - `start_frame`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.GeometryCacheActor`
Inherits: `Actor` | Header: `GeometryCacheActor.h`

GeometryCache actor, serves as a place-able actor for GeometryCache objects

**Methods** (1):
  - `get_geometry_cache_component()` -> `GeometryCacheComponent` — Returns GeometryCacheComponent subobject *

**Properties** (1):
  - `geometry_cache_component`: `GeometryCacheComponent` [Read-Only] — [Read-Only] (GeometryCacheComponent)

### `unreal.GeometryCacheCodecBase`
Inherits: `Object` | Header: `GeometryCacheCodecBase.h`

Interface for assets/objects that can own UserData *

### `unreal.GeometryCacheComponent`
Inherits: `MeshComponent` | Header: `GeometryCacheComponent.h`

GeometryCacheComponent, encapsulates a GeometryCache asset instance and implements functionality for rendering/and playback of GeometryCaches

**Methods** (30):
  - `get_animation_time()` -> `float` — Get the current animation time for GeometryCache. Includes the influence of elapsed time and SetStartTimeOffset
  - `get_duration()` -> `float` — Get the duration of the playback
  - `get_elapsed_time()` -> `float` — Get the current elapsed time for GeometryCache. Doesnât include the influence of StartTimeOffset
  - `get_motion_vector_scale()` -> `float` — Get the motion vector scale.
  - `get_number_of_frames()` -> `int32` — Get the number of frames
  - `get_number_of_tracks()` -> `int32` — Get the number of tracks
  - `get_override_wireframe_color()` -> `bool` — Check whether we are overriding the wireframe color or not.
  - `get_playback_direction()` -> `float` — Get the playback direction for GeometryCache.
  - `get_playback_speed()` -> `float` — Get current playback speed for GeometryCache.
  - `get_start_time_offset()` -> `float` — Get current start time offset for GeometryCache.
  - `get_wireframe_override_color()` -> `LinearColor` — Get the wireframe override color, used when overriding the wireframe color is enabled.
  - `is_extrapolating_frames()` -> `bool` — Get whether this GeometryCache is extrapolating frames.
  - `is_looping()` -> `bool` — Get whether this GeometryCache is looping or not.
  - `is_playing()` -> `bool` — Get whether this GeometryCache is playing or not.
  - `is_playing_reversed()` -> `bool` — Get whether this GeometryCache is playing in reverse or not.
  - `pause()` -> `None` — Pause playback of GeometryCache
  - `play()` -> `None` — Start playback of GeometryCache
  - `play_from_start()` -> `None` — Start playback of GeometryCache from the start
  - `play_reversed()` -> `None` — Start playback of GeometryCache in reverse
  - `play_reversed_from_end()` -> `None` — Start playback of GeometryCache from the end and play in reverse
  - `set_extrapolate_frames(new_extrapolating)` -> `None` — Set whether this GeometryCache is extrapolating frames.
  - `set_geometry_cache(new_geom_cache)` -> `bool` — Change the Geometry Cache used by this instance.
  - `set_looping(new_looping)` -> `None` — Set whether this GeometryCache is looping or not.
  - `set_motion_vector_scale(new_motion_vector_scale)` -> `None` — Set new motion vector scale.
  - `set_override_wireframe_color(override)` -> `None` — Override wireframe color?
  - `set_playback_speed(new_playback_speed)` -> `None` — Set new playback speed for GeometryCache.
  - `set_start_time_offset(new_start_time_offset)` -> `None` — Set current start time offset for GeometryCache.
  - `set_wireframe_override_color(color)` -> `None` — Set the color, used when overriding the wireframe color is enabled.
  - `stop()` -> `None` — Stop playback of GeometryCache
  - `tick_at_this_time(time, is_running, backwards, is_looping)` -> `None` — Tick at This Time

**Properties** (7):
  - `duration`: `float` [Read-Only] — [Read-Only] Duration of the animation (maximum time) (float)
  - `geometry_cache`: `GeometryCache` [Read-Only] — [Read-Only] Geometry Cache instance referenced by the component (GeometryCache)
  - `looping`: `bool` — [Read-Write] (bool)
  - `motion_vector_scale`: `float` — [Read-Write] Scale factor to apply to the imported motion vectors (float)
  - `playback_speed`: `float` — [Read-Write] (float)
  - `running`: `bool` — [Read-Write] (bool)
  - `start_time_offset`: `float` — [Read-Write] (float)

### `unreal.GeometryCacheTrack`
Inherits: `Object` | Header: `GeometryCacheTrack.h`

Base class for GeometryCache tracks, stores matrix animation data and implements functionality for it

### `unreal.GeometryCacheTrack_FlipbookAnimation`
Inherits: `GeometryCacheTrack` | Header: `GeometryCacheTrackFlipbookAnimation.h`

Derived GeometryCacheTrack class, used for Transform animation.

### `unreal.GeometryCacheTrack_TransformAnimation`
Inherits: `GeometryCacheTrack` | Header: `GeometryCacheTrackTransformAnimation.h`

Derived GeometryCacheTrack class, used for Transform animation.

### `unreal.GeometryCacheTrack_TransformGroupAnimation`
Inherits: `GeometryCacheTrack` | Header: `GeometryCacheTrackTransformGroupAnimation.h`

Derived GeometryCacheTrack class, used for Transform animation.

### `unreal.GeometryCacheTrackStreamable`
Inherits: `GeometryCacheTrack` | Header: `GeometryCacheTrackStreamable.h`

Derived GeometryCacheTrack class, used for Transform animation.
