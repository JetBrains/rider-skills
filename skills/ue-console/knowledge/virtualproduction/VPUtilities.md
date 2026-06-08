# UE Python API — VPUtilities Module

**23 types** from the `VPUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VPCameraRigSpawnParams`, `VPFullScreenUserWidget_PostProcess`, `VPFullScreenUserWidget_PostProcessBase`, `VPFullScreenUserWidget_PostProcessWithSVE`, `VPFullScreenUserWidget_Viewport`, `FullScreenUserWidgetActor`, `VPAssetThumbnailWrapperWidget`, `VPBlueprintLibrary`, `VPBookmarkActor`, `VPCameraBlueprintLibrary`, `VPContextMenuProvider`, `VPFullScreenUserWidget`, `VPGameMode`, `VPInteraction`, `VPPassthroughPostProcessVolume`, `VPRenderingBlueprintLibrary`, `VPRootActor`, `VPTimecodeCustomTimeStep`, `VPViewportTickableActorBase`, `AssetThumbnailDisplayMode`, ... (23 total)

---

## Classes

### `unreal.VPCameraRigSpawnParams`
Inherits: `StructBase` | Header: `VPCameraBlueprintLibrary.h`

Parameters used to custom the CameraRig thatâs created.

**Properties** (4):
  - `linear_approximation_mode`: `VPCameraRigSpawnLinearApproximationMode` — [Read-Write]
deprecated: This property deprecated (VPCameraRigSpawnLinearApproximationMode)
  - `linear_approximation_param`: `float` — [Read-Write]
deprecated: This property deprecated (float)
  - `use_first_point_as_spawn_location`: `bool` — [Read-Write]
deprecated: This property deprecated (bool)
  - `use_world_space`: `bool` — [Read-Write]
deprecated: This property deprecated (bool)

### `unreal.VPFullScreenUserWidget_PostProcess`
Inherits: `VPFullScreenUserWidget_PostProcessBase` | Header: `VPFullScreenUserWidget_PostProcess.h`

Renders widget by adding it as a blend material.

### `unreal.VPFullScreenUserWidget_PostProcessBase`
Inherits: `StructBase` | Header: `VPFullScreenUserWidget_PostProcessBase.h`

Implements shared widget initialization logic.

### `unreal.VPFullScreenUserWidget_PostProcessWithSVE`
Inherits: `VPFullScreenUserWidget_PostProcessBase` | Header: `VPFullScreenUserWidget_PostProcessWithSVE.h`

Renders widget in post process phase by using Scene View Extensions (SVE).

### `unreal.VPFullScreenUserWidget_Viewport`
Inherits: `StructBase` | Header: `VPFullScreenUserWidget.h`

VPFull Screen User Widget Viewport

### `unreal.FullScreenUserWidgetActor`
Inherits: `Info` | Header: `VPFullScreenUserWidgetActor.h`

Widgets are first rendered to a render target, then that render target is displayed in the world.

**Methods** (1):
  - `get_user_widget()` -> `UserWidget` — Get a pointer to the inner user widget

### `unreal.VPAssetThumbnailWrapperWidget`
Inherits: `Widget` | Header: `VPAssetThumbnailWrapperWidget.h`

Version of UAssetThumbnailWidget that compiles in packaged games. In editor builds, a thumbnail widget is displayed. In packaged builds, a fallback SImage is displayed.

**Methods** (7):
  - `get_editor_asset_widget()` -> `Object` — Gets the widget used for displaying in editor. Returns nullptr in non-editor builds. This type must be cast to UAssetThu...
  - `get_editor_thumbnail_resolution()` -> `IntPoint` — Get Editor Thumbnail Resolution
  - `set_asset(asset_data)` -> `None` — Sets the asset to display. Has no effect in non-editor builds.
  - `set_asset_by_object(object)` -> `None` — Sets the asset to display. Has no effect in non-editor builds.
  - `set_display_mode(mode = AssetThumbnailDisplayMode.FALLBACK_IMAGE)` -> `None` — Sets the display mode. Only has an effect in editor builds because packaged games always display in FallbackImage mode.
  - `set_editor_thumbnail_resolution(new_resolution)` -> `None` — Sets the resolution of the editor thumbnail
  - `set_fallback_brush(new_fallback_brush)` -> `None` — Sets the fallback image to display.

**Properties** (2):
  - `display_mode`: `AssetThumbnailDisplayMode` — [Read-Write] How the widget is supposed to be displayed. (AssetThumbnailDisplayMode)
  - `fallback_brush`: `SlateBrush` — [Read-Write] Fallback brush to draw (SlateBrush)

### `unreal.VPBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VPBlueprintLibrary.h`

Functionality added to prototype the VR scouting tools

**Methods** (21):
  - `editor_delete_selected_objects()` -> `bool` [classmethod] — Trigger an UnrealEd Delete
  - `editor_duplicate()` -> `bool` [classmethod] — Trigger an UnrealEd Duplicate
  - `editor_redo()` -> `bool` [classmethod] — Trigger an UnrealEd Redo
  - `editor_undo()` -> `bool` [classmethod] — Trigger an UnrealEd Undo
  - `get_editor_viewport_transform()` -> `Transform` [classmethod] — Get the location of the 2D viewport camera
  - `get_editor_vr_head_transform()` -> `Transform` [classmethod] — Get the location of the VR HMD
  - `get_editor_vr_room_transform()` -> `Transform` [classmethod] — Get the VR room transform (the playable area shown as a wireframe cage on Vive and Rift
  - `get_editor_world()` -> `World` [classmethod] — Wrapper around UUnrealEditorSubsystem::GetEditorWorld. Used because you canât get the subsystem without being an edito...
  - `get_left_interactor_location()` -> `Vector` [classmethod] — Get the location of the left interactor, in world space
  - `get_virtual_production_role()` -> `GameplayTagContainer` [classmethod] — The machine role(s) in a virtual production context.
  - `get_vr_editor_laser_hover_location()` -> `Vector` [classmethod] — Get the hitlocation of the interaction controllerâs laser pointer, in world space
  - `is_vr_editor_mode_active()` -> `bool` [classmethod] — Get whether the user is in editor VR mode
  - `jump_to_bookmark_in_level_editor(bookmark)` -> `bool` [classmethod] — Jump to a virtual production bookmark
  - `refresh3d_editor_viewport()` -> `None` [classmethod] — Refresh the desktop 3D viewport so that it updates changes even when not set to âRealtimeâ
  - `set_grab_speed(speed)` -> `None` [classmethod] — Set the VR grab speed cvar
  - `sort_actors_by_name(actors, ascending = True)` -> `Array [ Actor ]` [classmethod] — Sort actors by actor label
  - `sort_vp_bookmark_actors_by_timestamp(actors, ascending = True)` -> `Array [ VPBookmarkActor ]` [classmethod] — Sort VPBookmarkActors by Timestamp parameter
  - `spawn_bookmark_at_current_level_editor_position(actor_class, creation_context, offset, flatten_rotation = True)` -> `Actor` [classmethod] — Spawn a virtual production bookmark
  - `spawn_vp_tickable_actor(context_object, actor_class, location, rotation)` -> `VPViewportTickableActorBase` [classmethod] — Spawn a virtual production tickable actor
  - `vp_bookmark_spline_mesh_indicator_disable(spline_mesh)` -> `None` [classmethod] — VPBookmark Spline Mesh Indicator Disable
  - `vp_bookmark_spline_mesh_indicator_set_start_and_end(spline_mesh)` -> `None` [classmethod] — VPBookmark Spline Mesh Indicator Set Start and End

### `unreal.VPBookmarkActor`
Inherits: `VPViewportTickableActorBase` | Header: `VPBookmarkActor.h`

VPBookmark Actor

**Methods** (19):
  - `capture_snapshot()` -> `None` — Update SnapshotTexture captured via SceneCaptureComponent
  - `generate_bookmark_name()` -> `None` — Generate Bookmark Name
  - `generate_bookmark_name_implementation()` -> `None` — Generate Bookmark Name Implementation
  - `hide_bookmark_spline_mesh_indicator()` -> `None` — Hide Bookmark Spline Mesh Indicator
  - `hide_bookmark_spline_mesh_indicator_implementation()` -> `None` — Hide Bookmark Spline Mesh Indicator Implementation
  - `on_actor_dropped_from_carry()` -> `None` — On Actor Dropped from Carry deprecated: This function will be removed from UE5.7
  - `on_actor_dropped_from_carry_implementation()` -> `None` — VPInteraction Interface Events
  - `on_actor_dropped_from_transform()` -> `None` — On Actor Dropped from Transform deprecated: This function will be removed from UE5.7
  - `on_actor_dropped_from_transform_implementation()` -> `None` — On Actor Dropped from Transform Implementation
  - `on_actor_selected_for_transform()` -> `None` — On Actor Selected for Transform deprecated: This function will be removed from UE5.7
  - `on_actor_selected_for_transform_implementation()` -> `None` — On Actor Selected for Transform Implementation
  - `on_bookmark_activation(bookmark, activate)` -> `None` — On Bookmark Activation
  - `on_bookmark_activation_implementation(bookmark, activate)` -> `None` — VPBookmark Interface events
  - `on_bookmark_changed(bookmark)` -> `None` — On Bookmark Changed
  - `on_bookmark_changed_implementation(bookmark)` -> `None` — On Bookmark Changed Implementation
  - `update_bookmark_color(color)` -> `None` — Update the mesh color and BookmarkColor variable. Intended for use with multiuser initialization
  - `update_bookmark_spline_mesh_indicator()` -> `None` — Update Bookmark Spline Mesh Indicator
  - `update_bookmark_spline_mesh_indicator_implementation()` -> `None` — Update Bookmark Spline Mesh Indicator Implementation
  - `update_timestamp()` -> `None` — Update Timestamp property with current time

**Properties** (14):
  - `bookmark_color`: `LinearColor` — [Read-Write] Color of Bookmark in MU Session (LinearColor)
  - `bookmark_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `bookmark_mesh_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] Mesh Representation in the world (StaticMeshComponent)
  - `bookmark_object`: `VPBookmark` — [Read-Write] Reference to Editor Bookmark UObject (VPBookmark)
  - `camera_component`: `CineCameraComponent` [Read-Only] — [Read-Only] CineCamera (CineCameraComponent)
  - `dynamic_material`: `MaterialInstanceDynamic` — [Read-Write] (MaterialInstanceDynamic)
  - `favorite_level`: `int` — [Read-Write] Favorite status set by a user (int32)
  - `is_flagged`: `bool` — [Read-Write] Whether this was flagged by a user (bool)
  - `is_home`: `bool` — [Read-Write] Bool to determine if this bookmark should be designated the home location (bool)
  - `name_text_render_component`: `TextRenderComponent` [Read-Only] — [Read-Only] Textrender to display bookmark name (TextRenderComponent)
  - `scene_capture_component`: `CineCaptureComponent2D` [Read-Only] — [Read-Only] CineCaptureComponent (CineCaptureComponent2D)
  - `snapshot_texture`: `Texture2D` [Read-Only] — [Read-Only] Texture reference to store render of viewpoint (Texture2D)
  - `spline_mesh_component`: `SplineMeshComponent` [Read-Only] — [Read-Only] Splinemesh (SplineMeshComponent)
  - `timestamp`: `DateTime` [Read-Only] — [Read-Only] DateTime to store creation time (DateTime)

### `unreal.VPCameraBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VPCameraBlueprintLibrary.h`

VPCamera Blueprint Library

**Methods** (5):
  - `spawn_camera_rig_from_actors(world_context_object, rig_transform, actors, params)` -> `CameraRig_Rail` [classmethod] — Spawn Camera Rig from Actors deprecated: This function will be removed from UE5.7
  - `spawn_camera_rig_from_points(world_context_object, rig_transform, points, params)` -> `CameraRig_Rail` [classmethod] — Spawn Camera Rig from Points deprecated: This function will be removed from UE5.7
  - `spawn_camera_rig_from_selected_actors(world_context_object, rig_transform, params)` -> `CameraRig_Rail` [classmethod] — Spawn Camera Rig from Selected Actors deprecated: This function will be removed from UE5.7
  - `spawn_dolly_track_from_points(world_context_object, points, interp_type = SplinePointType.LINEAR)` -> `CameraRig_Rail` [classmethod] — Spawn Dolly Track from Points deprecated: This function will be removed from UE5.7
  - `spawn_dolly_track_from_points_smooth(world_context_object, points, interp_type = SplinePointType.LINEAR)` -> `CameraRig_Rail` [classmethod] — Spawn Dolly Track from Points Smooth deprecated: This function will be removed from UE5.7

### `unreal.VPContextMenuProvider`
Inherits: `Interface` | Header: `IVPContextMenuProvider.h`

VPContext Menu Provider

**Methods** (1):
  - `on_create_context_menu()` -> `None` — On Create Context Menu deprecated: This function will be removed from UE5.7

### `unreal.VPFullScreenUserWidget`
Inherits: `Object` | Header: `VPFullScreenUserWidget.h`

Will set the Widgets on a viewport either by Widgets are first rendered to a render target, then that render target is displayed in the world.

### `unreal.VPGameMode`
Inherits: `GameMode` | Header: `VPGameMode.h`

VPGame Mode

**Properties** (1):
  - `root_actor`: `VPRootActor` [Read-Only] — [Read-Only] (VPRootActor)

### `unreal.VPInteraction`
Inherits: `Interface` | Header: `IVPInteraction.h`

**Methods** (3):
  - `on_actor_dropped_from_carry()` -> `None` — On Actor Dropped from Carry deprecated: This function will be removed from UE5.7
  - `on_actor_dropped_from_transform()` -> `None` — On Actor Dropped from Transform deprecated: This function will be removed from UE5.7
  - `on_actor_selected_for_transform()` -> `None` — On Actor Selected for Transform deprecated: This function will be removed from UE5.7

### `unreal.VPPassthroughPostProcessVolume`
Inherits: `PostProcessVolume` | Header: `VPPassthroughPostProcessVolume.h`

AVPPassthroughPostProcessVolume is derived from APostProcessVolume. Its function is to provide a Post Process Volume offers a clean passthrough of colors into display space, with no additional post-pr...

### `unreal.VPRenderingBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VPRenderingBlueprintLibrary.h`

Blueprint function library supporting Virtual Production rendering use cases.

**Methods** (1):
  - `generate_scene_view_extension_is_active_functor_for_viewport_type(pie = False, sie = False, editor_active = False, game_primary = False)` -> `SceneViewExtensionIsActiveFunctor` [classmethod] — Returns a functor to activate a scene view extension when the FViewport in the SceneViewExtensionContext is selectively:...

### `unreal.VPRootActor`
Inherits: `Actor` | Header: `VPRootActor.h`

AVPRootActor

**Methods** (3):
  - `get_cine_camera_actor()` -> `CineCameraActor` — Get the current camera used by the virtual production.
  - `move_level_to_root_actor()` -> `None` — Move Level to Root Actor
  - `toggle_components_visibility()` -> `None` — Toggle Components Visibility

### `unreal.VPTimecodeCustomTimeStep`
Inherits: `FixedFrameRateCustomTimeStep` | Header: `VPTimecodeCustomTimeStep.h`

Control the engineâs time step via the engineâs TimecodeProvider. Will sleep and wake up engine when the a new frame is available.

### `unreal.VPViewportTickableActorBase`
Inherits: `Actor` | Header: `VPViewportTickableActorBase.h`

Actor that tick in the Editor viewport with the event EditorTick.

**Methods** (4):
  - `editor_destroyed()` -> `None` — Editor Destroyed
  - `editor_lock_location(set_lock_location)` -> `None` — Sets the LockLocation variable to disable movement from the translation gizmo
  - `editor_tick(delta_seconds)` -> `None` — Editor Tick
  - `lock_location(set_lock_location: bool)` -> `None` — deprecated: âlock_locationâ was renamed to âeditor_lock_locationâ.

### `unreal.AssetThumbnailDisplayMode`
Inherits: `EnumBase` | Header: `VPAssetThumbnailWrapperWidget.h`

EAsset Thumbnail Display Mode

**Properties** (2):
  - `EDITOR_THUMBNAIL`: `AssetThumbnailDisplayMode = Ellipsis` — 0
  - `FALLBACK_IMAGE`: `AssetThumbnailDisplayMode = Ellipsis` — 1

### `unreal.VPCameraRigSpawnLinearApproximationMode`
Inherits: `EnumBase` | Header: `VPCameraBlueprintLibrary.h`

EVPCamera Rig Spawn Linear Approximation Mode

**Properties** (3):
  - `DENSITY`: `VPCameraRigSpawnLinearApproximationMode = Ellipsis` — We wonât do linear approximation, instead using the Spline as constructed initially. 1
  - `INTEGRATION_STEP`: `VPCameraRigSpawnLinearApproximationMode = Ellipsis` — LinearApproximationParam will be used as a density value 2
  - `NONE`: `VPCameraRigSpawnLinearApproximationMode = Ellipsis` — 0

### `unreal.VPViewportTickableFlags`
Inherits: `EnumBase` | Header: `VPViewportTickableActorBase.h`

EVPViewport Tickable Flags

**Properties** (4):
  - `EDITOR`: `VPViewportTickableFlags = Ellipsis` — 1
  - `EDITOR_PREVIEW`: `VPViewportTickableFlags = Ellipsis` — 4
  - `GAME`: `VPViewportTickableFlags = Ellipsis` — 2
  - `GAME_PREVIEW`: `VPViewportTickableFlags = Ellipsis` — 8

### `unreal.VPWidgetDisplayType`
Inherits: `EnumBase` | Header: `VPFullScreenUserWidget.h`

EVPWidget Display Type

**Properties** (5):
  - `COMPOSURE`: `VPWidgetDisplayType = Ellipsis` — Render to a texture and send to composure. 3
  - `INACTIVE`: `VPWidgetDisplayType = Ellipsis` — Do not display. 0
  - `POST_PROCESS_SCENE_VIEW_EXTENSION`: `VPWidgetDisplayType = Ellipsis` — Display by adding post process material via SceneViewExtensions. Widget added over entire viewport i...
  - `POST_PROCESS_WITH_BLEND_MATERIAL`: `VPWidgetDisplayType = Ellipsis` — Display by adding post process material via post process volume settings. Widget added only over are...
  - `VIEWPORT`: `VPWidgetDisplayType = Ellipsis` — Display on a game viewport. 1
