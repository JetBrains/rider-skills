# UE Python API — DisplayCluster Module

**43 types** from the `DisplayCluster` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DisplayClusterClusterEventBase`, `DisplayClusterClusterEventBinary`, `DisplayClusterClusterEventJson`, `DisplayClusterComponentRef`, `LightCardAlphaGradientSettings`, `DisplayClusterBlueprint`, `DisplayClusterBlueprintAPI`, `DisplayClusterBlueprintAPIImpl`, `DisplayClusterBlueprintLib`, `DisplayClusterCameraComponent`, `DisplayClusterChromakeyCardActor`, `DisplayClusterChromakeyCardStageActorComponent`, `DisplayClusterClusterEventListener`, `DisplayClusterDisplayDeviceBaseComponent`, `DisplayClusterDisplayDeviceComponent`, `DisplayClusterICVFXCameraComponent`, `DisplayClusterLabelComponent`, `DisplayClusterLabelWidget`, `DisplayClusterLightCardActor`, `DisplayClusterLightCardStageActorComponent`, ... (43 total)

---

## Classes

### `unreal.DisplayClusterClusterEventBase`
Inherits: `StructBase` | Header: `DisplayClusterClusterEvent.h`

**Properties** (2):
  - `is_system_event`: `bool` — [Read-Write] Is nDisplay internal event(should never be true for end users) (bool)
  - `should_discard_on_repeat`: `bool` — [Read-Write] Should older events with the same Name / Type / Category(for JSON) or ID(for binary) be...

### `unreal.DisplayClusterClusterEventBinary`
Inherits: `DisplayClusterClusterEventBase` | Header: `DisplayClusterClusterEvent.h`

**Properties** (2):
  - `event_data`: `None` — [Read-Write] Binary event data (Array[uint8])
  - `event_id`: `int` — [Read-Write] Event ID(used for discarding outdated events) (int32)

### `unreal.DisplayClusterClusterEventJson`
Inherits: `DisplayClusterClusterEventBase` | Header: `DisplayClusterClusterEvent.h`

**Properties** (4):
  - `category`: `str` — [Read-Write] Event category(used for discarding outdated events) (str)
  - `name`: `str` — [Read-Write] Event name(used for discarding outdated events) (str)
  - `parameters`: `None` — [Read-Write] Event parameters (Map[str,str])
  - `type`: `str` — [Read-Write] Event type(used for discarding outdated events) (str)

### `unreal.DisplayClusterComponentRef`
Inherits: `StructBase` | Header: `DisplayClusterObjectRef.h`

Display Cluster Component Ref

### `unreal.LightCardAlphaGradientSettings`
Inherits: `StructBase` | Header: `DisplayClusterLightCardActor.h`

Light Card Alpha Gradient Settings

**Properties** (4):
  - `angle`: `float` — [Read-Write] The angle (degrees) determines the gradient direction. (float)
  - `enable_alpha_gradient`: `bool` — [Read-Write] Enables/disables alpha gradient effect (bool)
  - `ending_alpha`: `float` — [Read-Write] Ending alpha value in the gradient (float)
  - `starting_alpha`: `float` — [Read-Write] Starting alpha value in the gradient (float)

### `unreal.DisplayClusterBlueprint`
Inherits: `Blueprint` | Header: `DisplayClusterBlueprint.h`

Display Cluster Blueprint

### `unreal.DisplayClusterBlueprintAPI`
Inherits: `Interface` | Header: `IDisplayClusterBlueprintAPI.h`

Display Cluster Blueprint API

**Methods** (16):
  - `add_cluster_event_listener(listener)` -> `None` — Add Cluster Event Listener deprecated: This function is now available in the main blueprint functions list under ânDis...
  - `emit_cluster_event_binary(event, primary_only)` -> `None` — Emit Cluster Event Binary deprecated: This function is now available in the main blueprint functions list under ânDisp...
  - `emit_cluster_event_json(event, primary_only)` -> `None` — Emit Cluster Event Json deprecated: This function is now available in the main blueprint functions list under ânDispla...
  - `get_active_node_ids()` -> `Array [ str ]` — Get Active Node Ids deprecated: This function is now available in the main blueprint functions list under ânDisplayâ...
  - `get_active_nodes_amount()` -> `int32` — Get Active Nodes Amount deprecated: This function is now available in the main blueprint functions list under ânDispla...
  - `get_cluster_role()` -> `DisplayClusterNodeRole` — Get Cluster Role deprecated: This function is now available in the main blueprint functions list under ânDisplayâ se...
  - `get_node_id()` -> `str` — Get Node Id deprecated: This function is now available in the main blueprint functions list under ânDisplayâ section...
  - `get_operation_mode()` -> `DisplayClusterOperationMode` — Get Operation Mode deprecated: This function is now available in the main blueprint functions list under ânDisplayâ ...
  - `get_root_actor()` -> `DisplayClusterRootActor` — Get Root Actor deprecated: This function is now available in the main blueprint functions list under ânDisplayâ sect...
  - `is_backup()` -> `bool` — Is Backup deprecated: This function is now available in the main blueprint functions list under ânDisplayâ section.
  - `is_module_initialized()` -> `bool` — Is Module Initialized deprecated: This function has been deprecated and will be removed soon.
  - `is_primary()` -> `bool` — Is Primary deprecated: This function is now available in the main blueprint functions list under ânDisplayâ section.
  - `is_secondary()` -> `bool` — Is Secondary deprecated: This function is now available in the main blueprint functions list under ânDisplayâ sectio...
  - `remove_cluster_event_listener(listener)` -> `None` — Remove Cluster Event Listener deprecated: This function is now available in the main blueprint functions list under ân...
  - `send_cluster_event_binary_to(address, port, event, primary_only)` -> `None` — Send Cluster Event Binary To deprecated: This function is now available in the main blueprint functions list under ânD...
  - `send_cluster_event_json_to(address, port, event, primary_only)` -> `None` — Send Cluster Event Json To deprecated: This function is now available in the main blueprint functions list under ânDis...

### `unreal.DisplayClusterBlueprintAPIImpl`
Inherits: `Object` | Header: `DisplayClusterBlueprintAPIImpl.h`

Blueprint API interface implementation

**Methods** (16):
  - `add_cluster_event_listener(listener)` -> `None` — Add Cluster Event Listener deprecated: This function is now available in the main blueprint functions list under ânDis...
  - `emit_cluster_event_binary(event, primary_only)` -> `None` — Emit Cluster Event Binary deprecated: This function is now available in the main blueprint functions list under ânDisp...
  - `emit_cluster_event_json(event, primary_only)` -> `None` — Emit Cluster Event Json deprecated: This function is now available in the main blueprint functions list under ânDispla...
  - `get_active_node_ids()` -> `Array [ str ]` — Get Active Node Ids deprecated: This function is now available in the main blueprint functions list under ânDisplayâ...
  - `get_active_nodes_amount()` -> `int32` — Get Active Nodes Amount deprecated: This function is now available in the main blueprint functions list under ânDispla...
  - `get_cluster_role()` -> `DisplayClusterNodeRole` — Get Cluster Role deprecated: This function is now available in the main blueprint functions list under ânDisplayâ se...
  - `get_node_id()` -> `str` — Get Node Id deprecated: This function is now available in the main blueprint functions list under ânDisplayâ section...
  - `get_operation_mode()` -> `DisplayClusterOperationMode` — Get Operation Mode deprecated: This function is now available in the main blueprint functions list under ânDisplayâ ...
  - `get_root_actor()` -> `DisplayClusterRootActor` — Get Root Actor deprecated: This function is now available in the main blueprint functions list under ânDisplayâ sect...
  - `is_backup()` -> `bool` — Is Backup deprecated: This function is now available in the main blueprint functions list under ânDisplayâ section.
  - `is_module_initialized()` -> `bool` — Is Module Initialized deprecated: This function has been deprecated and will be removed soon.
  - `is_primary()` -> `bool` — Is Primary deprecated: This function is now available in the main blueprint functions list under ânDisplayâ section.
  - `is_secondary()` -> `bool` — Is Secondary deprecated: This function is now available in the main blueprint functions list under ânDisplayâ sectio...
  - `remove_cluster_event_listener(listener)` -> `None` — Remove Cluster Event Listener deprecated: This function is now available in the main blueprint functions list under ân...
  - `send_cluster_event_binary_to(address, port, event, primary_only)` -> `None` — Send Cluster Event Binary To deprecated: This function is now available in the main blueprint functions list under ânD...
  - `send_cluster_event_json_to(address, port, event, primary_only)` -> `None` — Send Cluster Event Json To deprecated: This function is now available in the main blueprint functions list under ânDis...

### `unreal.DisplayClusterBlueprintLib`
Inherits: `BlueprintFunctionLibrary` | Header: `DisplayClusterBlueprintLib.h`

Blueprint API function library

**Methods** (21):
  - `add_cluster_event_listener(listener)` -> `None` [classmethod] — Adds cluster event listener.
  - `create_light_card(root_actor)` -> `DisplayClusterLightCardActor` [classmethod] — Create a new light card parented to the given nDisplay root actor.
  - `duplicate_light_cards(original_lightcards)` -> `Array [ DisplayClusterLightCardActor ]` [classmethod] — Create duplicates of a list of existing light cards.
  - `emit_cluster_event_binary(event, primary_only)` -> `None` [classmethod] — Emits binary cluster event.
  - `emit_cluster_event_json(event, primary_only)` -> `None` [classmethod] — Emits JSON cluster event.
  - `find_chromakey_cards_for_root_actor(root_actor)` -> `Set [ DisplayClusterChromakeyCardActor ]` [classmethod] — Gets a list of all chromakey card actors on the level linked to the specified root actor.
  - `find_light_cards_for_root_actor(root_actor)` -> `Set [ DisplayClusterLightCardActor ]` [classmethod] — Gets a list of all light card actors on the level linked to the specified root actor.
  - `get_active_node_ids()` -> `Array [ str ]` [classmethod] — Returns List of the active nodes in the runtime cluster node in a cluster.
  - `get_active_nodes_amount()` -> `int32` [classmethod] — Returns amount of active nodes in a cluster.
  - `get_api()` -> `DisplayClusterBlueprintAPI` [classmethod] — Get API deprecated: GetAPI has been deprecated. All functions are now available in the main blueprint functions list und...
  - `get_cluster_role()` -> `DisplayClusterNodeRole` [classmethod] — Returns the role of the current cluster node.
  - `get_node_id()` -> `str` [classmethod] — Returns Id of the current node in a cluster.
  - `get_operation_mode()` -> `DisplayClusterOperationMode` [classmethod] — Returns current operation mode.
  - `get_root_actor()` -> `DisplayClusterRootActor` [classmethod] — Returns currently active root actor.
  - `has_cluster_role(role)` -> `bool` [classmethod] — Checks if the node has a specific role.
  - `is_backup()` -> `bool` [classmethod] — Returns true if current node is a backup node in a cluster.
  - `is_primary()` -> `bool` [classmethod] — Returns true if current node is a primary node in a cluster.
  - `is_secondary()` -> `bool` [classmethod] — Returns true if current node is a secondary node in a cluster.
  - `remove_cluster_event_listener(listener)` -> `None` [classmethod] — Removes cluster event listener.
  - `send_cluster_event_binary_to(address, port, event, primary_only)` -> `None` [classmethod] — Sends binary cluster event to a specific target (may be outside of the cluster).
  - `send_cluster_event_json_to(address, port, event, primary_only)` -> `None` [classmethod] — Sends JSON cluster event to a specific target (may be outside of the cluster).

### `unreal.DisplayClusterCameraComponent`
Inherits: `SceneComponent` | Header: `DisplayClusterCameraComponent.h`

3D point in space used to render nDisplay viewports from

**Methods** (7):
  - `get_interpupillary_distance()` -> `float` — Get interpupillary distance
  - `get_stereo_offset()` -> `DisplayClusterEyeStereoOffset` — Get stereo offset type
  - `get_swap_eyes()` -> `bool` — Get swap eyes state
  - `set_interpupillary_distance(distance)` -> `None` — Set interpupillary distance
  - `set_stereo_offset(stereo_offset)` -> `None` — Set stereo offset type
  - `set_swap_eyes(swap_eyes)` -> `None` — Set swap eyes state
  - `toggle_swap_eyes()` -> `bool` — Toggles eyes swap state

**Properties** (10):
  - `enable_depth_of_field`: `bool` — [Read-Write] Enable the DoF PP settings from the specified camera. (bool)
  - `enable_icvfx_color_grading`: `bool` — [Read-Write] Use the DC ColorGrading from the specified ICVFX camera. (bool)
  - `enable_icvfx_depth_of_field_compensation`: `bool` — [Read-Write] Use the DC Depth-Of-Field settings from the specified ICVFX camera. (bool)
  - `enable_icvfx_motion_blur`: `bool` — [Read-Write] Use the DC Motion Blur settings from the specified ICVFX camera. (bool)
  - `enable_near_clipping_plane`: `bool` — [Read-Write] Use the NearClippingPlane value from the specified cine camera. (bool)
  - `enable_post_process`: `bool` — [Read-Write] Use the PP settings from the specified camera. (bool)
  - `external_cine_camera_actor`: `CineCameraActor` — [Read-Write] Use a specific actor camera instead of a game camera. (CineCameraActor)
  - `icvfx_camera_component_name`: `str` — [Read-Write] The name of the camera component that is used as the PP source. (str)
  - `target_camera_type`: `DisplayClusterTargetCameraType` — [Read-Write] Type of source camera used. (DisplayClusterTargetCameraType)
  - `use_icvfx_camera_component_tracking`: `bool` — [Read-Write] (bool)

### `unreal.DisplayClusterChromakeyCardActor`
Inherits: `DisplayClusterLightCardActor` | Header: `DisplayClusterChromakeyCardActor.h`

Display Cluster Chromakey Card Actor

### `unreal.DisplayClusterChromakeyCardStageActorComponent`
Inherits: `DisplayClusterStageActorComponent` | Header: `DisplayClusterChromakeyCardStageActorComponent.h`

Stage Actor Component to be placed in chromakey card actors

### `unreal.DisplayClusterClusterEventListener`
Inherits: `Interface` | Header: `IDisplayClusterClusterEventListener.h`

Display Cluster Cluster Event Listener

**Methods** (2):
  - `on_cluster_event_binary(event)` -> `None` — React on incoming binary cluster events
  - `on_cluster_event_json(event)` -> `None` — React on incoming JSON cluster events

### `unreal.DisplayClusterDisplayDeviceBaseComponent`
Inherits: `SceneComponent` | Header: `DisplayClusterDisplayDeviceBaseComponent.h`

Display Device Components can be added to nDisplay root actors and assigned to viewport nodes to allow additional processing on the preview material.

### `unreal.DisplayClusterDisplayDeviceComponent`
Inherits: `DisplayClusterDisplayDeviceBaseComponent` | Header: `DisplayClusterDisplayDeviceComponent.h`

Display Device Component with OCIO render pass

### `unreal.DisplayClusterICVFXCameraComponent`
Inherits: `CineCameraComponent` | Header: `DisplayClusterICVFXCameraComponent.h`

nDisplay in-camera VFX camera representation

**Methods** (1):
  - `set_depth_of_field_parameters(new_depth_of_field_params)` -> `None` — Sets new depth of field parameters and updates the dynamically generated compensation LUT if needed

**Properties** (1):
  - `camera_settings`: `DisplayClusterConfigurationICVFX_CameraSettings` — [Read-Write] (DisplayClusterConfigurationICVFX_CameraSettings)

### `unreal.DisplayClusterLabelComponent`
Inherits: `SceneComponent` | Header: `DisplayClusterLabelComponent.h`

A label component specific to nDisplay. Displays a widget with a consistent scale facing the root actor view point. Visible only in scene capture when in the editor or in 3d space on the wall.

**Properties** (1):
  - `widget_scale`: `float` — [Read-Write] A uniform scale to apply to the text which will keep consistency across distance from t...

### `unreal.DisplayClusterLabelWidget`
Inherits: `UserWidget` | Header: `DisplayClusterLabelWidget.h`

A base widget to display on actor labels.

**Methods** (1):
  - `set_label_text(text)` -> `None` — Set Label Text

### `unreal.DisplayClusterLightCardActor`
Inherits: `Actor` | Header: `DisplayClusterLightCardActor.h`

Display Cluster Light Card Actor

**Properties** (28):
  - `alpha_gradient`: `LightCardAlphaGradientSettings` — [Read-Write] Settings related to an alpha gradient effect (LightCardAlphaGradientSettings)
  - `always_flush_to_wall`: `bool` — [Read-Write] Indicates whether the light card is always made to be flush to a stage wall or not (boo...
  - `color`: `LinearColor` — [Read-Write] Light card color, before any modifier is applied (LinearColor)
  - `default_scene_root_component`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `distance_from_center`: `float` — [Read-Write] Radius of light card polar coordinates. Does not include the effect of RadialOffset (do...
  - `exposure`: `float` — [Read-Write] 2^Exposure color value multiplier (float)
  - `feathering`: `float` — [Read-Write] Feathers in the alpha from the edges (float)
  - `gain`: `float` — [Read-Write] Linear color value multiplier (float)
  - `label_component`: `DisplayClusterLabelComponent` [Read-Only] — [Read-Only] (DisplayClusterLabelComponent)
  - `latitude`: `float` — [Read-Write] Related to the Elevation of light card polar coordinates (double)
  - `light_card_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `light_card_transformer_component`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `longitude`: `float` — [Read-Write] Related to the Azimuth of light card polar coordinates (double)
  - `main_spring_arm_component`: `SpringArmComponent` [Read-Only] — [Read-Only] (SpringArmComponent)
  - `mask`: `DisplayClusterLightCardMask` — [Read-Write] (DisplayClusterLightCardMask)
  - `opacity`: `float` — [Read-Write] Linear alpha multiplier (float)
  - `per_lightcard_render_mode`: `DisplayClusterConfigurationICVFX_PerLightcardRenderMode` — [Read-Write] Specify how to render this Light Card Actor in relation to the inner frustum. (DisplayC...
  - `pitch`: `float` — [Read-Write] (double)
  - `polygon`: `None` — [Read-Write] Polygon points when using this type of mask (Array[Vector2D])
  - `radial_offset`: `float` — [Read-Write] Used by the flush constraint to offset the location of the light card form the wall (do...
  - `scale`: `Vector2D` — [Read-Write] (Vector2D)
  - `spin`: `float` — [Read-Write] Roll rotation of light card around its plane axis (double)
  - `temperature`: `float` — [Read-Write] (float)
  - `texture`: `Texture` — [Read-Write] (Texture)
  - `tint`: `float` — [Read-Write] (float)
  - `uv_coordinates`: `Vector2D` — [Read-Write] The UV coordinates of the light card, if it is in UV space (Vector2D)
  - `uv_indicator_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `yaw`: `float` — [Read-Write] (double)

### `unreal.DisplayClusterLightCardStageActorComponent`
Inherits: `DisplayClusterStageActorComponent` | Header: `DisplayClusterLightCardStageActorComponent.h`

Stage Actor Component to be placed in light card actors

### `unreal.DisplayClusterOriginComponent`
Inherits: `SceneComponent` | Header: `DisplayClusterOriginComponent.h`

nDisplay origin component (mostly for in-Editor visualization)

**Properties** (1):
  - `proxy_mesh`: `StaticMesh` — [Read-Write] Proxy mesh to render (StaticMesh)

### `unreal.DisplayClusterPlayerInput`
Inherits: `EnhancedPlayerInput` | Header: `DisplayClusterPlayerInput.h`

An object within PlayerController that processes player input.

### `unreal.DisplayClusterPreviewShareComponent`
Inherits: `ActorComponent` | Header: `DisplayClusterPreviewShareComponent.h`

nDisplay Viewport preview share component

**Methods** (2):
  - `set_mode(new_mode)` -> `None` — Sets the sharing mode
  - `set_unique_name(new_unique_name)` -> `None` — Sets the unique name, which should match between sender and receiver of viewport textures

**Properties** (2):
  - `mode`: `DisplayClusterPreviewShareMode` — [Read-Write] Current sharing mode of this component (DisplayClusterPreviewShareMode)
  - `unique_name`: `str` — [Read-Write] Current unique name of this component, which should match between sender and receiver o...

### `unreal.DisplayClusterRootActor`
Inherits: `Actor` | Header: `DisplayClusterRootActor.h`

VR root. This contains nDisplay VR hierarchy in the game.

**Methods** (7):
  - `get_common_view_point()` -> `SceneComponent` — Get the view point most commonly used by viewports in this cluster. If no viewports override the camera, this returns th...
  - `get_distance_to_stage_geometry(world_position, world_direction)` -> `float or None` — Gets the distance from a world position to the stageâs geometry along the specified direction, if there is an intersec...
  - `get_flush_position_and_normal(world_position)` -> `(out_position=Vector, out_normal=Vector) or None` — Get Flush Position and Normal
  - `make_stage_actor_flush_to_wall(stage_actor, desired_offset_from_flush = 0.000000)` -> `bool` — Make Stage Actor Flush to Wall
  - `set_freeze_outer_viewports(enable)` -> `bool` — Set Freeze Outer Viewports
  - `set_replace_texture_flag_for_all_viewports(replace)` -> `bool` — Set Replace Texture Flag for All Viewports
  - `update_procedural_mesh_component_data(procedural_mesh_component = None)` -> `None` — Update the geometry of the procedural mesh component(s) referenced inside nDisplay

**Properties** (18):
  - `current_config_data`: `DisplayClusterConfigurationData` [Read-Only] — [Read-Only] If set from the DisplayCluster BP Compiler it will be loaded from the class default subo...
  - `default_view_point`: `DisplayClusterCameraComponent` [Read-Only] — [Read-Only] Default camera component. Itâs an outer camera in VP/ICVFX terminology. Always exists ...
  - `enable_preview_techvis`: `bool` — [Read-Write] Configure the root actor for Techvis rendering with preview components. (bool)
  - `freeze_preview_render`: `bool` — [Read-Write] Freeze preview render.  This will impact editor performance. (bool)
  - `preview_enable`: `bool` — [Read-Write] Render the scene and display it as a preview on the nDisplay root actor in the editor. ...
  - `preview_enable_holdout_composite`: `bool` — [Read-Write] Render a preview with postprocessing in the scene using the HoldoutComposite plugin. Th...
  - `preview_enable_ocio`: `bool` — [Read-Write] Enable OCIO on preview. (bool)
  - `preview_enable_overlay_material`: `bool` — [Read-Write] Show overlay material on the preview mesh when preview rendering is enabled (UMeshCompo...
  - `preview_enable_post_process`: `bool` — [Read-Write] Enable PostProcess for preview. (bool)
  - `preview_icvfx_frustums`: `bool` — [Read-Write] Render ICVFX Frustums (bool)
  - `preview_icvfx_frustums_far_distance`: `float` — [Read-Write] Render ICVFX Frustums (float)
  - `preview_in_game_enable`: `bool` — [Read-Write] Render this DCRA in game for Standalone/Package builds. (bool)
  - `preview_max_texture_dimension`: `int` — [Read-Write] The maximum dimension of any internal texture for preview. Use less memory for large pr...
  - `preview_node_id`: `str` — [Read-Write] Selectively preview a specific viewport or show all/none. (str)
  - `preview_render_target_ratio_mult`: `float` — [Read-Write] Adjust resolution scaling for the editor preview. (float)
  - `render_mode`: `DisplayClusterConfigurationRenderMode` — [Read-Write] Render Mode (DisplayClusterConfigurationRenderMode)
  - `tick_per_frame`: `int` — [Read-Write] Tick Per Frame (int32)
  - `viewports_per_frame`: `int` — [Read-Write] Max amount of Viewports Per Frame (int32)

### `unreal.DisplayClusterSceneComponentSync`
Inherits: `SceneComponent` | Header: `DisplayClusterSceneComponentSync.h`

Abstract synchronization component

### `unreal.DisplayClusterSceneComponentSyncParent`
Inherits: `DisplayClusterSceneComponentSync` | Header: `DisplayClusterSceneComponentSyncParent.h`

Synchronization component. Synchronizes parent scene component.

### `unreal.DisplayClusterSceneComponentSyncThis`
Inherits: `DisplayClusterSceneComponentSync` | Header: `DisplayClusterSceneComponentSyncThis.h`

Synchronization component. Synchronizes itself

### `unreal.DisplayClusterScreenComponent`
Inherits: `StaticMeshComponent` | Header: `DisplayClusterScreenComponent.h`

Simple projection policy screen component

**Methods** (2):
  - `get_screen_size()` -> `Vector2D` — Return the screen size adjusted by its transform scale.
  - `set_screen_size(size)` -> `None` — Set screen size (update transform scale).

### `unreal.DisplayClusterStageActorComponent`
Inherits: `ActorComponent` | Header: `DisplayClusterStageActorComponent.h`

Stage Actor Component used to determine root actor ownership

### `unreal.DisplayClusterStageGeometryComponent`
Inherits: `ActorComponent` | Header: `DisplayClusterStageGeometryComponent.h`

A component that stores the generated geometry map of the stage actor, which is used for placing stage actors (light cards, CCWs, etc) flush to the stageâs walls and ceiling

**Methods** (3):
  - `get_stage_distance_and_normal(direction)` -> `(out_distance=float, out_normal=Vector) or None` — Gets the distance and normal vector (in radial space) of the stageâs geometry in the specified world direction
  - `invalidate(force_immediate_redraw = False)` -> `None` — Invalidates and regenerates the cached stage geometry map
  - `is_geometry_map_valid()` -> `bool` — Gets whether the stage geometry map is valid and usable

### `unreal.DisplayClusterStageIsosphereComponent`
Inherits: `ProceduralMeshComponent` | Header: `DisplayClusterStageIsosphereComponent.h`

A procedural mesh component generated by morphing an isosphere to match the stageâs geometry map, providing a 3D version of the map that can be ray traced against

### `unreal.DisplayClusterSyncTickComponent`
Inherits: `ActorComponent` | Header: `DisplayClusterSyncTickComponent.h`

Helper component to trigger nDisplay sync for Tick sync group

### `unreal.DisplayClusterTestPatternsActor`
Inherits: `Actor` | Header: `DisplayClusterTestPatternsActor.h`

Test patterns actor

**Properties** (2):
  - `calibration_patterns`: `None` — [Read-Write] (Map[str,Material])
  - `post_process_component`: `PostProcessComponent` [Read-Only] — [Read-Only] Postprocess component (PostProcessComponent)

### `unreal.DisplayClusterWidgetComponent`
Inherits: `WidgetComponent` | Header: `DisplayClusterWidgetComponent.h`

Extend the widget component to optimize when the widget is initialized and released.

### `unreal.DisplayClusterXformComponent`
Inherits: `SceneComponent` | Header: `DisplayClusterXformComponent.h`

nDisplay Transform component

**Properties** (1):
  - `proxy_mesh`: `StaticMesh` — [Read-Write] Proxy mesh to render (StaticMesh)

### `unreal.DisplayClusterEyeStereoOffset`
Inherits: `EnumBase` | Header: `DisplayClusterCameraComponent.h`

EDisplay Cluster Eye Stereo Offset

**Properties** (3):
  - `LEFT`: `DisplayClusterEyeStereoOffset = Ellipsis` — 1
  - `NONE`: `DisplayClusterEyeStereoOffset = Ellipsis` — 0
  - `RIGHT`: `DisplayClusterEyeStereoOffset = Ellipsis` — 2

### `unreal.DisplayClusterLightCardMask`
Inherits: `EnumBase` | Header: `DisplayClusterLightCardActor.h`

EDisplay Cluster Light Card Mask

**Properties** (4):
  - `CIRCLE`: `DisplayClusterLightCardMask = Ellipsis` — 0
  - `POLYGON`: `DisplayClusterLightCardMask = Ellipsis` — 3
  - `SQUARE`: `DisplayClusterLightCardMask = Ellipsis` — 1
  - `USE_TEXTURE_ALPHA`: `DisplayClusterLightCardMask = Ellipsis` — 2

### `unreal.DisplayClusterNodeRole`
Inherits: `EnumBase` | Header: `DisplayClusterEnums.h`

Display cluster node role

**Properties** (4):
  - `BACKUP`: `DisplayClusterNodeRole = Ellipsis` — 3
  - `NONE`: `DisplayClusterNodeRole = Ellipsis` — 0
  - `PRIMARY`: `DisplayClusterNodeRole = Ellipsis` — 1
  - `SECONDARY`: `DisplayClusterNodeRole = Ellipsis` — 2

### `unreal.DisplayClusterOperationMode`
Inherits: `EnumBase` | Header: `DisplayClusterEnums.h`

Display cluster operation mode

**Properties** (3):
  - `CLUSTER`: `DisplayClusterOperationMode = Ellipsis` — 0
  - `DISABLED`: `DisplayClusterOperationMode = Ellipsis` — 2
  - `EDITOR`: `DisplayClusterOperationMode = Ellipsis` — 1

### `unreal.DisplayClusterPreviewShareIcvfxSync`
Inherits: `EnumBase` | Header: `DisplayClusterPreviewShareComponent.h`

Available Icvfx camera sync types

**Properties** (3):
  - `NONE`: `DisplayClusterPreviewShareIcvfxSync = Ellipsis` — Icvfx cameras will not be synced 0
  - `PULL_ACTOR`: `DisplayClusterPreviewShareIcvfxSync = Ellipsis` — Pull from Source nDisplay Actor 1
  - `PUSH_ACTOR`: `DisplayClusterPreviewShareIcvfxSync = Ellipsis` — Pushes to source display actor 2

### `unreal.DisplayClusterPreviewShareMode`
Inherits: `EnumBase` | Header: `DisplayClusterPreviewShareComponent.h`

Available sharing modes

**Properties** (4):
  - `NONE`: `DisplayClusterPreviewShareMode = Ellipsis` — Preview share disabled. 0
  - `PULL_ACTOR`: `DisplayClusterPreviewShareMode = Ellipsis` — Pull from Source nDisplay Actor (if set) 1
  - `RECEIVE`: `DisplayClusterPreviewShareMode = Ellipsis` — Receives textures to replace the viewport textures with 3
  - `SEND`: `DisplayClusterPreviewShareMode = Ellipsis` — Sends the viewport textures for sharing 2

### `unreal.DisplayClusterSyncGroup`
Inherits: `EnumBase` | Header: `DisplayClusterEnums.h`

Display cluster synchronization groups

**Properties** (3):
  - `POST_TICK`: `DisplayClusterSyncGroup = Ellipsis` — 2
  - `PRE_TICK`: `DisplayClusterSyncGroup = Ellipsis` — 0
  - `TICK`: `DisplayClusterSyncGroup = Ellipsis` — 1

### `unreal.DisplayClusterTargetCameraType`
Inherits: `EnumBase` | Header: `DisplayClusterCameraComponent.h`

The type of camera used.

**Properties** (4):
  - `ACTIVE_ENGINE_CAMERA`: `DisplayClusterTargetCameraType = Ellipsis` — Use active engine camera 1
  - `EXTERNAL_CINE_CAMERA_ACTOR`: `DisplayClusterTargetCameraType = Ellipsis` — Use the CineCamera actor reference. 3
  - `ICVFX_CAMERA_COMPONENT`: `DisplayClusterTargetCameraType = Ellipsis` — Use camera component from the root actor 2
  - `NONE`: `DisplayClusterTargetCameraType = Ellipsis` — No camera used 0
