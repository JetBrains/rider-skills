# UE Python API — VPUtilitiesEditor Module

**8 types** from the `VPUtilitiesEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VPEditorTickableActorBase`, `VPScoutingSubsystem`, `VPScoutingSubsystemGestureManagerBase`, `VPScoutingSubsystemHelpersBase`, `VPTransientEditorTickableActorBase`, `VPUtilitiesEditorBlueprintLibrary`, `VRTool`, `VProdPanelIDs`

---

## Classes

### `unreal.VPEditorTickableActorBase`
Inherits: `VPViewportTickableActorBase` | Header: `VPEditorTickableActorBase.h`

Actor that tick in the Editor viewport with the event EditorTick.

### `unreal.VPScoutingSubsystem`
Inherits: `EditorSubsystem` | Header: `VPScoutingSubsystem.h`

VPScouting Subsystem

**Methods** (30):
  - `enter_vr_mode()` -> `bool` [classmethod] — Enter VRMode deprecated: This function will be removed from UE5.7
  - `exit_vr_mode()` -> `None` [classmethod] — Exit VRMode deprecated: This function will be removed from UE5.7
  - `get_active_editor_vr_controllers()` -> `Array [ VREditorInteractor ]` [classmethod] — Get Active Editor VRControllers deprecated: This function will be removed from UE5.7
  - `get_director_name()` -> `str` [classmethod] — Get Director Name deprecated: This function will be removed from UE5.7
  - `get_flight_speed()` -> `float` [classmethod] — Get Flight Speed deprecated: This function will be removed from UE5.7
  - `get_grip_nav_speed()` -> `float` [classmethod] — Get Grip Nav Speed deprecated: This function will be removed from UE5.7
  - `get_panel_actor(panel_id)` -> `VREditorFloatingUI` — Get Panel Actor deprecated: This function will be removed from UE5.7
  - `get_panel_widget(panel_id)` -> `UserWidget` — Get Panel Widget deprecated: This function will be removed from UE5.7
  - `get_show_name()` -> `str` [classmethod] — Get Show Name deprecated: This function will be removed from UE5.7
  - `get_v_prod_panel_id(panel)` -> `Name` [classmethod] — Get VProd Panel ID deprecated: This function will be removed from UE5.7
  - `get_vr_editor_mode()` -> `VREditorMode` [classmethod] — Get VREditor Mode deprecated: This function will be removed from UE5.7
  - `hide_info_display_panel()` -> `None` — Hide Info Display Panel deprecated: This function will be removed from UE5.7
  - `is_helper_system_enabled()` -> `bool` [classmethod] — Is Helper System Enabled deprecated: This function will be removed from UE5.7
  - `is_location_grid_snapping_enabled()` -> `bool` [classmethod] — Is Location Grid Snapping Enabled deprecated: This function will be removed from UE5.7
  - `is_rotation_grid_snapping_enabled()` -> `bool` [classmethod] — Is Rotation Grid Snapping Enabled deprecated: This function will be removed from UE5.7
  - `is_using_inertia_damping()` -> `bool` [classmethod] — Is Using Inertia Damping deprecated: This function will be removed from UE5.7
  - `is_using_metric_system()` -> `bool` [classmethod] — Is Using Metric System deprecated: This function will be removed from UE5.7
  - `is_using_transform_gizmo()` -> `bool` [classmethod] — Is Using Transform Gizmo deprecated: This function will be removed from UE5.7
  - `is_vr_scouting_ui_open(panel_id)` -> `bool` — Is VRScouting UIOpen deprecated: This function will be removed from UE5.7
  - `set_flight_speed(flight_speed)` -> `None` [classmethod] — Set Flight Speed deprecated: This function will be removed from UE5.7
  - `set_grip_nav_speed(grip_nav_speed)` -> `None` [classmethod] — Set Grip Nav Speed deprecated: This function will be removed from UE5.7
  - `set_inertia_damping_c_var(inertia_damping)` -> `None` [classmethod] — Set Inertia Damping CVar deprecated: This function will be removed from UE5.7
  - `set_is_helper_system_enabled(is_helper_system_enabled)` -> `None` [classmethod] — Set Is Helper System Enabled deprecated: This function will be removed from UE5.7
  - `set_is_using_inertia_damping(is_using_inertia_damping)` -> `None` [classmethod] — Set Is Using Inertia Damping deprecated: This function will be removed from UE5.7
  - `set_is_using_metric_system(use_metric_system)` -> `None` [classmethod] — Set Is Using Metric System deprecated: This function will be removed from UE5.7
  - `set_is_using_transform_gizmo(is_using_transform_gizmo)` -> `None` [classmethod] — Set Is Using Transform Gizmo deprecated: This function will be removed from UE5.7
  - `set_show_transform_gizmo_c_var(show_transform_gizmo_c_var)` -> `None` [classmethod] — Set Show Transform Gizmo CVar deprecated: This function will be removed from UE5.7
  - `toggle_location_grid_snapping()` -> `None` [classmethod] — Toggle Location Grid Snapping deprecated: This function will be removed from UE5.7
  - `toggle_rotation_grid_snapping()` -> `None` [classmethod] — Toggle Rotation Grid Snapping deprecated: This function will be removed from UE5.7
  - `toggle_vr_scouting_ui(creation_context)` -> `VREditorFloatingUICreationContext` — Toggle VRScouting UI deprecated: This function will be removed from UE5.7

**Properties** (4):
  - `gesture_manager`: `VPScoutingSubsystemGestureManagerBase` [Read-Only] — [Read-Only]
deprecated: This property is deprecated (VPScoutingSubsystemGestureManagerBase)
  - `grip_nav_speed_coeff`: `float` — [Read-Write]
deprecated: This property is deprecated (float)
  - `is_settings_menu_open`: `bool` — [Read-Write]
deprecated: This property is deprecated (bool)
  - `vp_subsystem_helpers`: `VPScoutingSubsystemHelpersBase` [Read-Only] — [Read-Only]
deprecated: This property is deprecated (VPScoutingSubsystemHelpersBase)

### `unreal.VPScoutingSubsystemGestureManagerBase`
Inherits: `Object` | Header: `VPScoutingSubsystem.h`

Base class of the gesture manager defined in BP

**Methods** (3):
  - `editor_tick(delta_seconds)` -> `None` — Editor Tick deprecated: This function will be removed from UE5.7
  - `on_vr_editing_mode_enter()` -> `None` — On VREditing Mode Enter deprecated: This function will be removed from UE5.7
  - `on_vr_editing_mode_exit()` -> `None` — On VREditing Mode Exit deprecated: This function will be removed from UE5.7

### `unreal.VPScoutingSubsystemHelpersBase`
Inherits: `Object` | Header: `VPScoutingSubsystem.h`

Base class of the helper class defined in BP

### `unreal.VPTransientEditorTickableActorBase`
Inherits: `VPEditorTickableActorBase` | Header: `VPTransientEditorTickableActorBase.h`

Specific VPEditorTickableActor explicitely marked as Transient

### `unreal.VPUtilitiesEditorBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VPUtilitiesEditorBlueprintLibrary.h`

VPUtilities Editor Blueprint Library

**Methods** (4):
  - `get_default_osc_server()` -> `OSCServer` [classmethod] — Get the default OSC server.
  - `import_snapshot_texture(file_name, sub_folder_name, absolute_path_package)` -> `Texture` [classmethod] — Imports Image file into VirtualProduction/Snapshots/ folder
  - `spawn_vp_editor_tickable_actor(context_object, actor_class, location, rotation)` -> `VPEditorTickableActorBase` [classmethod] — Spawn an editor-only virtual production tickable actor note: Actors based on the non-transient AVPEditorTickableActorBas...
  - `spawn_vp_transient_editor_tickable_actor(context_object, actor_class, location, rotation)` -> `VPTransientEditorTickableActorBase` [classmethod] — Spawn an editor-only transient virtual production tickable actor note: Actors based on the transient AVPTransientEditorT...

### `unreal.VRTool`
Inherits: `VPTransientEditorTickableActorBase` | Header: `VRTool.h`

Base class for virtual production VR tools

**Methods** (1):
  - `get_input_component()` -> `InputComponent` — Returns the current InputComponent on this utility actor. This will be NULL unless bReceivesEditorInput is set to true.

**Properties** (2):
  - `editor_only_input_component`: `InputComponent` — [Read-Write]
deprecated: This is deprecated (InputComponent)
  - `receives_editor_input`: `bool` — [Read-Write] If set to true, then this actor will be able to recieve input delegate callbacks when i...

### `unreal.VProdPanelIDs`
Inherits: `EnumBase` | Header: `VPScoutingSubsystem.h`

EVProd Panel IDs

**Properties** (7):
  - `CONTEXT`: `VProdPanelIDs = Ellipsis` — 3
  - `GAFFER`: `VProdPanelIDs = Ellipsis` — 6
  - `LEFT`: `VProdPanelIDs = Ellipsis` — 1
  - `MAIN`: `VProdPanelIDs = Ellipsis` — 0
  - `MEASURE`: `VProdPanelIDs = Ellipsis` — 5
  - `RIGHT`: `VProdPanelIDs = Ellipsis` — 2
  - `TIMELINE`: `VProdPanelIDs = Ellipsis` — 4
