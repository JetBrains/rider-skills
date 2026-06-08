# UE Python API — XRCreative Module

**24 types** from the `XRCreative` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `XRCreativeToolEntry`, `XRCreativeAvatar`, `XRCreativeBlueprintableTool`, `XRCreativeCombinedTransformGizmoActor`, `XRCreativeEditorSettings`, `XRCreativeGameMode`, `XRCreativeGizmoMeshComponent`, `XRCreativeITFComponent`, `XRCreativeITFRenderComponent`, `XRCreativePalette`, `XRCreativePaletteTab`, `XRCreativePaletteToolTab`, `XRCreativePointerComponent`, `XRCreativeSettings`, `XRCreativeSubsystem`, `XRCreativeTeleporter`, `XRCreativeTool`, `XRCreativeToolActor`, `XRCreativeToolset`, `XRCreativeTransformInteraction`, ... (24 total)

---

## Classes

### `unreal.XRCreativeToolEntry`
Inherits: `StructBase` | Header: `XRCreativeToolset.h`

XRCreative Tool Entry

**Properties** (2):
  - `tool_class`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `tool_icon`: `Texture2D` [Read-Only] — [Read-Only] (Texture2D)

### `unreal.XRCreativeAvatar`
Inherits: `Pawn` | Header: `XRCreativeAvatar.h`

XRCreative Avatar

**Methods** (13):
  - `add_input_mapping_context(context, priority, options)` -> `None` — Adds an explicitly provided Input Mapping Context to the input system
  - `bp_on_vr_initialize()` -> `None` — Called when In-Editor VR mode is started. In-Editor equivalent to Begin Play.
  - `clear_all_input_mappings()` -> `None` — Clear All Input Mappings
  - `get_head_transform()` -> `Transform` — Get Head Transform
  - `get_head_transform_room_space()` -> `Transform` — Get Head Transform Room Space
  - `open_level_sequence(level_sequence)` -> `LevelSequenceActor` — Open Level Sequence
  - `play_haptic_effect(haptic_effect, controller_id, hand, scale, loop)` -> `None` — Play haptic feedback asset on a given hand - only left and right supported
  - `register_object_for_input(object)` -> `None`
  - `remove_input_mapping_context(context, options)` -> `None` — Removes an explicitly provided Input Mapping Context to the input system
  - `set_component_tick_in_editor(component, should_tick_in_editor)` -> `None` — Set Component Tick in Editor
  - `spawn_transient_actor(actor_class, actor_name)` -> `Actor` — Includes special handling to not dirty editor worlds.
  - `stop_haptic_effect(hand, controller_id)` -> `None` — Instantly stop a haptic feedback for a given hand - only left and right supported
  - `unregister_object_for_input(object)` -> `None`

**Properties** (13):
  - `left_controller`: `MotionControllerComponent` [Read-Only] — [Read-Only] (MotionControllerComponent)
  - `left_controller_aim`: `MotionControllerComponent` [Read-Only] — [Read-Only] (MotionControllerComponent)
  - `left_controller_model`: `SkeletalMeshComponent` — [Read-Write] (SkeletalMeshComponent)
  - `left_controller_pointer`: `XRCreativePointerComponent` [Read-Only] — [Read-Only] (XRCreativePointerComponent)
  - `menu_widget`: `WidgetComponent` — [Read-Write] (WidgetComponent)
  - `right_controller`: `MotionControllerComponent` [Read-Only] — [Read-Only] (MotionControllerComponent)
  - `right_controller_aim`: `MotionControllerComponent` [Read-Only] — [Read-Only] (MotionControllerComponent)
  - `right_controller_model`: `SkeletalMeshComponent` — [Read-Write] (SkeletalMeshComponent)
  - `right_controller_pointer`: `XRCreativePointerComponent` [Read-Only] — [Read-Only] (XRCreativePointerComponent)
  - `tools`: `None` [Read-Only] — [Read-Only] (Array[XRCreativeTool])
  - `tools_component`: `XRCreativeITFComponent` [Read-Only] — [Read-Only] (XRCreativeITFComponent)
  - `toolset`: `XRCreativeToolset` [Read-Only] — [Read-Only] (XRCreativeToolset)
  - `widget_interaction`: `WidgetInteractionComponent` [Read-Only] — [Read-Only] (WidgetInteractionComponent)

### `unreal.XRCreativeBlueprintableTool`
Inherits: `XRCreativeTool` | Header: `XRCreativeToolset.h`

XRCreative Blueprintable Tool

**Methods** (1):
  - `get_tool_input_mapping_context()` -> `InputMappingContext` — Get Tool Input Mapping Context

**Properties** (7):
  - `display_name`: `Text` [Read-Only] — [Read-Only] (Text)
  - `left_handed_input_mapping_context`: `InputMappingContext` — [Read-Write] (InputMappingContext)
  - `palette_tab_class`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `right_handed_input_mapping_context`: `InputMappingContext` — [Read-Write] (InputMappingContext)
  - `tool_actor`: `Class` — [Read-Write] (type(Class))
  - `tool_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `tool_viewmodel`: `Class` [Read-Only] — [Read-Only] (type(Class))

### `unreal.XRCreativeCombinedTransformGizmoActor`
Inherits: `CombinedTransformGizmoActor` | Header: `XRCreativeGizmos.h`

XRCreative Combined Transform Gizmo Actor

**Methods** (1):
  - `get_owner_avatar()` -> `XRCreativeAvatar` — Get the XRCreative Avatar that spawned this Gizmo

**Properties** (19):
  - `world_aligned`: `SceneComponent` [Read-Only] — [Read-Only] (SceneComponent)
  - `xr_axis_scale_x`: `XRCreativeGizmoMeshComponent` — [Read-Write] X Axis Scale Component (XRCreativeGizmoMeshComponent)
  - `xr_axis_scale_y`: `XRCreativeGizmoMeshComponent` — [Read-Write] Y Axis Scale Component (XRCreativeGizmoMeshComponent)
  - `xr_axis_scale_z`: `XRCreativeGizmoMeshComponent` — [Read-Write] Z Axis Scale Component (XRCreativeGizmoMeshComponent)
  - `xr_plane_scale_xy`: `XRCreativeGizmoMeshComponent` — [Read-Write] XY Plane Scale Component (XRCreativeGizmoMeshComponent)
  - `xr_plane_scale_xz`: `XRCreativeGizmoMeshComponent` — [Read-Write] XZ Plane Scale Component (XRCreativeGizmoMeshComponent)
  - `xr_plane_scale_yz`: `XRCreativeGizmoMeshComponent` — [Read-Write] YZ Plane Scale Component (XRCreativeGizmoMeshComponent)
  - `xr_rotate_x`: `XRCreativeGizmoMeshComponent` — [Read-Write] X Axis Rotation Component (XRCreativeGizmoMeshComponent)
  - `xr_rotate_y`: `XRCreativeGizmoMeshComponent` — [Read-Write] Y Axis Rotation Component (XRCreativeGizmoMeshComponent)
  - `xr_rotate_z`: `XRCreativeGizmoMeshComponent` — [Read-Write] Z Axis Rotation Component (XRCreativeGizmoMeshComponent)
  - `xr_rotation_sphere`: `XRCreativeGizmoMeshComponent` — [Read-Write] Z Axis Rotation Component (XRCreativeGizmoMeshComponent)
  - `xr_scene_root`: `SceneComponent` — [Read-Write] (SceneComponent)
  - `xr_translate_x`: `XRCreativeGizmoMeshComponent` — [Read-Write] X Axis Translation Component (XRCreativeGizmoMeshComponent)
  - `xr_translate_xy`: `XRCreativeGizmoMeshComponent` — [Read-Write] XY Plane Translation Component (XRCreativeGizmoMeshComponent)
  - `xr_translate_xz`: `XRCreativeGizmoMeshComponent` — [Read-Write] XZ Plane Translation Component (XRCreativeGizmoMeshComponent)
  - `xr_translate_y`: `XRCreativeGizmoMeshComponent` — [Read-Write] Y Axis Translation Component (XRCreativeGizmoMeshComponent)
  - `xr_translate_yz`: `XRCreativeGizmoMeshComponent` — [Read-Write] YZ Plane Translation Component (XRCreativeGizmoMeshComponent)
  - `xr_translate_z`: `XRCreativeGizmoMeshComponent` — [Read-Write] Z Axis Translation Component (XRCreativeGizmoMeshComponent)
  - `xr_uniform_scale`: `XRCreativeGizmoMeshComponent` — [Read-Write] Uniform Scale Component (XRCreativeGizmoMeshComponent)

### `unreal.XRCreativeEditorSettings`
Inherits: `DeveloperSettings` | Header: `XRCreativeSettings.h`

Per user settings for XRCreative Editor.

**Methods** (1):
  - `get_xr_creative_editor_settings()` -> `XRCreativeEditorSettings` [classmethod] — Get XRCreative Editor Settings

**Properties** (1):
  - `handedness`: `XRCreativeHandedness` — [Read-Write] Manages Left/Right handedness user preferences.
Modifying this setting requires an edit...

### `unreal.XRCreativeGameMode`
Inherits: `GameModeBase` | Header: `XRCreativeGameMode.h`

XRCreative Game Mode

**Properties** (1):
  - `toolset_class`: `XRCreativeToolset` [Read-Only] — [Read-Only] (XRCreativeToolset)

### `unreal.XRCreativeGizmoMeshComponent`
Inherits: `StaticMeshComponent` | Header: `XRCreativeGizmos.h`

XRCreative Gizmo Mesh Component

**Properties** (7):
  - `hide_absolute_view_dot_threshold`: `float` — [Read-Write] (float)
  - `hovering`: `bool` [Read-Only] — [Read-Only] (bool)
  - `interacting`: `bool` [Read-Only] — [Read-Only] (bool)
  - `on_hovering_changed`: `XRCreativeGizmoStateChanged` — [Read-Write] (XRCreativeGizmoStateChanged)
  - `on_interacting_changed`: `XRCreativeGizmoStateChanged` — [Read-Write] (XRCreativeGizmoStateChanged)
  - `reflect_on_primary_axis`: `bool` — [Read-Write] (bool)
  - `reflect_on_tangent_axes`: `bool` — [Read-Write] (bool)

### `unreal.XRCreativeITFComponent`
Inherits: `ActorComponent` | Header: `XRCreativeITFComponent.h`

XRCreative ITFComponent

**Methods** (13):
  - `can_redo()` -> `bool` — Can Redo
  - `can_undo()` -> `bool` — Can Undo
  - `get_current_coordinate_system()` -> `ToolContextCoordinateSystem` — Get Current Coordinate System
  - `get_current_transform_gizmo_mode()` -> `ToolContextTransformGizmoMode` — Get Current Transform Gizmo Mode
  - `get_gizmo_actor()` -> `XRCreativeCombinedTransformGizmoActor` — Get Gizmo Actor
  - `get_selection_set()` -> `TypedElementSelectionSet` — Get Selection Set
  - `have_active_tool()` -> `bool` — Have Active Tool
  - `left_mouse_pressed()` -> `None` — Left Mouse Pressed
  - `left_mouse_released()` -> `None` — Left Mouse Released
  - `redo()` -> `None` — Redo
  - `set_current_coordinate_system(coord_system)` -> `None` — Set Current Coordinate System
  - `set_current_transform_gizmo_mode(gizmo_mode)` -> `None` — Set Current Transform Gizmo Mode
  - `undo()` -> `None` — Undo

**Properties** (4):
  - `can_select_predicate`: `CanSelectActorPredicate` — [Read-Write] (CanSelectActorPredicate)
  - `on_redo`: `OnUndoRedo` — [Read-Write] (OnUndoRedo)
  - `on_undo`: `OnUndoRedo` — [Read-Write] (OnUndoRedo)
  - `unselectable_actor_classes`: `None` — [Read-Write] (Array[type(Class)])

### `unreal.XRCreativeITFRenderComponent`
Inherits: `PrimitiveComponent` | Header: `XRCreativeITFRenderComponent.h`

UXRCreativeITFRenderComponent is a helper component that can provide a FPrimitiveDrawInterface API implementation. This PDI can be passed to UInterativeTool::Render() and UInteractiveGizmo::Render() (...

### `unreal.XRCreativePalette`
Inherits: `CommonActivatableWidget` | Header: `XRCreativeToolset.h`

XRCreative Palette

**Properties** (2):
  - `owner`: `XRCreativeAvatar` — [Read-Write] (XRCreativeAvatar)
  - `tabs`: `None` [Read-Only] — [Read-Only] (Array[XRCreativePaletteTab])

### `unreal.XRCreativePaletteTab`
Inherits: `CommonActivatableWidget` | Header: `XRCreativeToolset.h`

XRCreative Palette Tab

### `unreal.XRCreativePaletteToolTab`
Inherits: `XRCreativePaletteTab` | Header: `XRCreativeToolset.h`

XRCreative Palette Tool Tab

**Properties** (1):
  - `tool`: `XRCreativeTool` [Read-Only] — [Read-Only] (XRCreativeTool)

### `unreal.XRCreativePointerComponent`
Inherits: `SceneComponent` | Header: `XRCreativePointerComponent.h`

XRCreative Pointer Component

**Methods** (5):
  - `get_filtered_trace_end(scaled_by_impact = True)` -> `Vector` — If bScaledByImpact is false, this is the smoothed filter output, roughly TraceMaxLength units away, roughly in the +X di...
  - `get_hit_result()` -> `HitResult` — Get Hit Result
  - `get_raw_trace_end(scaled_by_impact = True)` -> `Vector` — If bScaledByImpact is false, this returns the raw input to the smoothing filter, TraceMaxLength units away in the +X dir...
  - `is_enabled()` -> `bool` — Is Enabled
  - `set_enabled(enabled)` -> `None` — Set Enabled

**Properties** (5):
  - `ignored_actors`: `None` — [Read-Write] (Array[Actor])
  - `ignored_components`: `None` — [Read-Write] (Array[PrimitiveComponent])
  - `smoothing_lag`: `float` — [Read-Write] (float)
  - `smoothing_min_cutoff`: `float` — [Read-Write] (float)
  - `trace_max_length`: `float` — [Read-Write] (float)

### `unreal.XRCreativeSettings`
Inherits: `DeveloperSettings` | Header: `XRCreativeSettings.h`

Per project settings for XRCreative.

**Methods** (1):
  - `get_xr_creative_settings()` -> `XRCreativeSettings` [classmethod] — Get XRCreative Settings

### `unreal.XRCreativeSubsystem`
Inherits: `EngineSubsystem` | Header: `XRCreativeSubsystem.h`

XRCreative Subsystem

**Methods** (3):
  - `enter_vr_mode()` -> `bool` [classmethod] — Enter VR Mode
  - `exit_vr_mode()` -> `None` [classmethod] — Exit VR Mode
  - `get_view_model_collection()` -> `MVVMViewModelCollectionObject` — Get View Model Collection

### `unreal.XRCreativeTeleporter`
Inherits: `Actor` | Header: `XRCreativeTeleporter.h`

XRCreative Teleporter

**Properties** (7):
  - `head_mounted_display`: `MotionControllerComponent` [Read-Only] — [Read-Only] (MotionControllerComponent)
  - `hmd_visual`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `left_controller`: `MotionControllerComponent` [Read-Only] — [Read-Only] (MotionControllerComponent)
  - `left_controller_visual`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `right_controller`: `MotionControllerComponent` [Read-Only] — [Read-Only] (MotionControllerComponent)
  - `right_controller_visual`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)
  - `teleport_mesh`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)

### `unreal.XRCreativeTool`
Inherits: `Object` | Header: `XRCreativeToolset.h`

XRCreative Tool

**Methods** (3):
  - `get_display_name()` -> `Text` — Get Display Name
  - `get_palette_tab_class()` — Get Palette Tab Class
  - `get_tool_name()` -> `Name` — Get Tool Name

### `unreal.XRCreativeToolActor`
Inherits: `Actor` | Header: `XRCreativeToolActor.h`

XRCreative Tool Actor

**Methods** (3):
  - `initialize_tool()` -> `None` — Called manually by the Avatar that spawns them.
  - `shut_down_tool()` -> `bool` — Shut Down Tool
  - `tick_tool(delta_seconds)` -> `None` — Tick Tool

**Properties** (1):
  - `owner_avatar`: `XRCreativeAvatar` — [Read-Write] (XRCreativeAvatar)

### `unreal.XRCreativeToolset`
Inherits: `PrimaryDataAsset` | Header: `XRCreativeToolset.h`

XRCreative Toolset

**Methods** (2):
  - `get_enable_ui_menu_actor()` -> `bool` — Get Enable UIMenu Actor
  - `get_ui_menu_actor()` — Get UIMenu Actor

**Properties** (7):
  - `avatar`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `left_handed_input_mapping_context`: `InputMappingContext` [Read-Only] — [Read-Only] If Handedness is selected in XRCreative Settings, uses this entry in place of Default/Ri...
  - `palette`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `right_handed_input_mapping_context`: `InputMappingContext` [Read-Only] — [Read-Only] Default Input Mapping is used for Right-Handed users, or if no LeftInputMappingContext i...
  - `tools`: `None` [Read-Only] — [Read-Only] (Array[XRCreativeToolEntry])
  - `toolset_name`: `Text` [Read-Only] — [Read-Only] UXRCreativeToolset(); ~UXRCreativeToolset(); (Text)
  - `ui_menu_actor`: `Class` [Read-Only] — [Read-Only] Enable for legacy or custom menu actors. (type(Class))

### `unreal.XRCreativeTransformInteraction`
Inherits: `Object` | Header: `TransformInteraction.h`

UXRCreativeTransformInteraction manages a 3D Translate/Rotate/Scale (TRS) Gizmo.

**Methods** (3):
  - `force_update_gizmo_state()` -> `None` — Recreate Gizmo. Call when external state changes, like set of selected objects
  - `set_enable_non_uniform_scaling(enable)` -> `None` — Set Enable Non Uniform Scaling
  - `set_enable_scaling(enable)` -> `None` — Set Enable Scaling

### `unreal.XRCreativeHandedness`
Inherits: `EnumBase` | Header: `XRCreativeSettings.h`

EXRCreative Handedness

**Properties** (2):
  - `LEFT`: `XRCreativeHandedness = Ellipsis` — 0
  - `RIGHT`: `XRCreativeHandedness = Ellipsis` — 1

### `unreal.CanSelectActorPredicate`
Inherits: `DelegateBase` | Header: `XRCreativeITFComponent.h`

Can Select Actor Predicate Delegate Signature

### `unreal.XRCreativeGizmoStateChanged`
Inherits: `MulticastDelegateBase` | Header: `XRCreativeGizmos.h`

XRCreative Gizmo State Changed Delegate Signature

### `unreal.XRCreativeITFComponent_OnUndoRedo`
Inherits: `MulticastDelegateBase` | Header: `XRCreativeITFComponent.h`

On Undo Redo Delegate Signature
