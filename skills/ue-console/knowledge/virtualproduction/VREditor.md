# UE Python API — VREditor Module

**19 types** from the `VREditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VREditorFloatingUICreationContext`, `FloatingText`, `VREditorAvatarActor`, `VREditorBaseActor`, `VREditorBaseUserWidget`, `VREditorCameraWidgetComponent`, `VREditorDockableCameraWindow`, `VREditorDockableWindow`, `VREditorFloatingCameraUI`, `VREditorFloatingUI`, `VREditorInteractor`, `VREditorMode`, `VREditorModeBase`, `VREditorRadialFloatingUI`, `VREditorTeleporter`, `VREditorWidgetComponent`, `VRScoutingInteractor`, `ControllerType`, `TouchSwipeDirection`

---

## Classes

### `unreal.VREditorFloatingUICreationContext`
Inherits: `StructBase` | Header: `VREditorFloatingUI.h`

Creation parameters for AVREditorFloatingUI

**Properties** (10):
  - `editor_ui_size`: `float` — [Read-Write] Optional override for âVREd.EditorUISizeâ. Leave at 0 for default. (float)
  - `hide_window_handles`: `bool` — [Read-Write] Turn off handles under window? (X-To-Close, movement barâ¦) (bool)
  - `mask_out_widget_background`: `bool` — [Read-Write] Turn off the widgetâs background to create a see-through look. (bool)
  - `no_close_button`: `bool` — [Read-Write] If bHideWindowHandles is false, this window doesnât have a close button. ( (bool)
  - `panel_id`: `Name` — [Read-Write] ID that the UI system will use to identify the panel. MUST BE UNIQUE! (Name)
  - `panel_mesh`: `StaticMesh` — [Read-Write] Optional custom mesh to use for the VR window. (StaticMesh)
  - `panel_size`: `Vector2D` — [Read-Write] Panel size. Should match the size of the UMG passed in. (Vector2D)
  - `panel_spawn_offset`: `Transform` — [Read-Write] Optional offset from HMD where the window opens. Pass FTransform::Identity for default ...
  - `parent_actor`: `Actor` — [Read-Write] (Actor)
  - `widget_class`: `Class` — [Read-Write] Widget to open in the VR window. null to close an open window (if if matches the PanelI...

### `unreal.FloatingText`
Inherits: `Actor` | Header: `VREditorFloatingText.h`

Draws 3D text in the world along with targeting line cues

### `unreal.VREditorAvatarActor`
Inherits: `Actor` | Header: `VREditorAvatarActor.h`

Avatar Actor

### `unreal.VREditorBaseActor`
Inherits: `Actor` | Header: `VREditorBaseActor.h`

Represents an actor specifically for VR Editor that has roomspace transformation

### `unreal.VREditorBaseUserWidget`
Inherits: `UserWidget` | Header: `VREditorBaseUserWidget.h`

Base class for all of the VR widgets

### `unreal.VREditorCameraWidgetComponent`
Inherits: `VREditorWidgetComponent` | Header: `VREditorCameraWidgetComponent.h`

A specialized WidgetComponent that color-corrects cameras previews (viewfinders) in VR

### `unreal.VREditorDockableCameraWindow`
Inherits: `VREditorDockableWindow` | Header: `VREditorDockableCameraWindow.h`

A specialized dockable window for camera viewfinders in VR that applies the correct material

### `unreal.VREditorDockableWindow`
Inherits: `VREditorFloatingUI` | Header: `VREditorDockableWindow.h`

An interactive floating UI panel that can be dragged around

### `unreal.VREditorFloatingCameraUI`
Inherits: `VREditorFloatingUI` | Header: `VREditorFloatingCameraUI.h`

Represents an interactive floating UI camera preview panel in the VR Editor

### `unreal.VREditorFloatingUI`
Inherits: `VREditorBaseActor` | Header: `VREditorFloatingUI.h`

Represents an interactive floating UI panel in the VR Editor

### `unreal.VREditorInteractor`
Inherits: `ViewportInteractor` | Header: `VREditorInteractor.h`

VREditor default interactor

**Methods** (24):
  - `get_controller_hand_side()` -> `Name` — Sets the EControllerHand for this motioncontroller
  - `get_controller_side()` -> `ControllerHand` — Get the side of the controller
  - `get_controller_type()` -> `ControllerType` — Returns what controller type this is for asymmetric control schemes
  - `get_hmd_device_type()` -> `Name`
  - `get_laser_end()` -> `Vector` — Get Laser End
  - `get_laser_start()` -> `Vector` — Getters and setters
  - `get_last_trackpad_position()` -> `Vector2D` — Get the last position of the trackpad or analog stick
  - `get_motion_controller_component()` -> `MotionControllerComponent` — Get the motioncontroller component of this interactor
  - `get_select_and_move_trigger_value()` -> `float` — Gets the trigger value
  - `get_slide_delta()` -> `float` — Returns the slide delta for pushing and pulling objects. Needs to be implemented by derived classes (e.g. touchpad for v...
  - `get_teleport_actor()` -> `VREditorTeleporter` — Get Teleport Actor
  - `get_trackpad_position()` -> `Vector2D` — Get the current position of the trackpad or analog stick
  - `init(vr_mode)` -> `None` — Initialize default values
  - `is_clicking_on_ui()` -> `bool` — Gets if the interactor is clicking on any UI
  - `is_hovering_over_ui()` -> `bool` — Gets if this interactor is hovering over UI
  - `is_touching_trackpad()` -> `bool` — Check if the touchpad is currently touched
  - `replace_hand_mesh_component(new_mesh, mesh_scale = [1.000000,1.000000,1.000000])` -> `None` — Replace the default VR controller mesh with a custom one.
  - `set_controller_hand_side(controller_hand_side)` -> `None` — Sets the EControllerHand for this motioncontroller
  - `set_controller_type(controller_type)` -> `None` — Set what controller type this is for asymmetric control schemes
  - `set_force_laser_color(color)` -> `None` — Next frame this will be used as color for the laser
  - `set_force_show_laser(force_show)` -> `None` — Set if we want to force to show the laser
  - `setup_component(owning_actor)` -> `None` — Sets up all components
  - `try_override_controller_type(controller_type)` -> `bool` — Temporary set what controller type this is for asymmetric control schemes. You canât override the controller type when...
  - `update_hand_mesh_relative_transform()` -> `None` — Update Hand Mesh Relative Transform

**Properties** (1):
  - `hand_mesh_component`: `StaticMeshComponent` — [Read-Write] Access to the current handmesh. Use ReplaceHandMeshComponent() to update the entire Sta...

### `unreal.VREditorMode`
Inherits: `VREditorModeBase` | Header: `VREditorMode.h`

VR Editor Mode. Extends editor viewports with functionality for VR controls and object manipulation

**Methods** (3):
  - `get_world_scale_factor()` -> `float` — Gets the world scale factor, which can be multiplied by a scale vector to convert to room space
  - `is_in_game_view()` -> `bool` — Returns whether game view is currently active.
  - `set_game_view(game_view)` -> `None` — Display the scene more closely to how it would appear at runtime (as opposed to edit time).

**Properties** (2):
  - `interactor_class`: `Class` — [Read-Write] The controller to use when UnrealEd is in VR mode. Use VREditorInteractor get default e...
  - `teleporter_class`: `Class` — [Read-Write] The teleporter to use when UnrealEd is in VR mode. Use VREditorTeleporter to get defaul...

### `unreal.VREditorModeBase`
Inherits: `EditorWorldExtension` | Header: `VREditorModeBase.h`

VREditor Mode Base

### `unreal.VREditorRadialFloatingUI`
Inherits: `VREditorBaseActor` | Header: `VREditorRadialFloatingUI.h`

Represents an interactive floating UI panel in the VR Editor

### `unreal.VREditorTeleporter`
Inherits: `Actor` | Header: `VREditorTeleporter.h`

VR Editor teleport manager and the visual representation of the teleport

**Methods** (14):
  - `do_teleport()` -> `None` — Do and finalize teleport.
  - `get_interactor_trying_teleport()` -> `ViewportInteractor` — Get the actor weâre currently trying to teleport with. Valid during aiming and teleporting.
  - `get_slide_delta(interactor, axis)` -> `float` — Get slide delta to push/pull or scale the teleporter
  - `get_vr_mode()` -> `VREditorMode` — Get VRMode
  - `init(mode)` -> `None` — Initializes the teleporter
  - `is_aiming()` -> `bool` — Whether we are currently aiming to teleport.
  - `is_teleporting()` -> `bool` — Is Teleporting
  - `set_color(color)` -> `None` — Sets the color for the teleporter visuals
  - `set_visibility(visible)` -> `None` — Hide or show the teleporter visuals
  - `shutdown()` -> `None` — Shuts down the teleporter
  - `start_aiming(interactor)` -> `None` — Functions we call to handle teleporting in navigation mode
  - `start_teleport()` -> `None` — Start teleporting, does a ray trace with the hand passed and calculates the locations for lerp movement in Teleport
  - `stop_aiming()` -> `None` — Cancel teleport aiming mode without doing the teleport
  - `teleport_done()` -> `None` — Called when teleport is done for cleanup

### `unreal.VREditorWidgetComponent`
Inherits: `WidgetComponent` | Header: `VREditorWidgetComponent.h`

A specialized WidgetComponent for the VREditor

### `unreal.VRScoutingInteractor`
Inherits: `VREditorInteractor` | Header: `VRScoutingInteractor.h`

Represents the interactor in the world

**Methods** (4):
  - `get_gizmo_mode()` -> `GizmoHandleTypes` — Gets the gizmo mode for selected object
  - `get_input_component()` -> `InputComponent` — Returns the current InputComponent. This will be NULL unless bReceivesEditorInput is set to true.
  - `get_selected_actors()` -> `Array [ Actor ]` [classmethod] — Gets all actors that are selected in the world editor
  - `set_gizmo_mode(gizmo_mode)` -> `None` — Sets the gizmo mode for selected object

**Properties** (2):
  - `flying_indicator_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] Shown in Navigation mode (StaticMeshComponent)
  - `receives_editor_input`: `bool` — [Read-Write] If set to true, then this interactor will be able to recieve input delegate callbacks w...

### `unreal.ControllerType`
Inherits: `EnumBase` | Header: `VREditorInteractor.h`

EController Type

**Properties** (5):
  - `ASSISTING_LASER`: `ControllerType = Ellipsis` — 1
  - `LASER`: `ControllerType = Ellipsis` — 0
  - `NAVIGATION`: `ControllerType = Ellipsis` — 3
  - `UI`: `ControllerType = Ellipsis` — 2
  - `UNKNOWN`: `ControllerType = Ellipsis` — 4

### `unreal.TouchSwipeDirection`
Inherits: `EnumBase` | Header: `VREditorInteractor.h`

Directions the trackpad can be swiped to

**Properties** (5):
  - `DOWN`: `TouchSwipeDirection = Ellipsis` — 4
  - `LEFT`: `TouchSwipeDirection = Ellipsis` — 1
  - `NONE`: `TouchSwipeDirection = Ellipsis` — 0
  - `RIGHT`: `TouchSwipeDirection = Ellipsis` — 2
  - `UP`: `TouchSwipeDirection = Ellipsis` — 3
