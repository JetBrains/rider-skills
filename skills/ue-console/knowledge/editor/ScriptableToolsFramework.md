# UE Python API — ScriptableToolsFramework Module

**67 types** from the `ScriptableToolsFramework` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ScriptableToolGizmoOptions`, `ScriptableToolGroupSet`, `ScriptableToolModifierStates`, `BaseScriptableToolBuilder`, `CustomScriptableToolBuilder`, `CustomScriptableToolBuilderBaseInterface`, `CustomScriptableToolBuilderComponentBase`, `CustomScriptableToolBuilderContainer`, `ScriptableClickDragTool`, `ScriptableInteractiveTool`, `ScriptableInteractiveToolPropertySet`, `ScriptableModularBehaviorTool`, `ScriptableSingleClickTool`, `ScriptableTool_HUDAPI`, `ScriptableTool_RenderAPI`, `ScriptableToolGroupTag`, `ScriptableToolLine`, `ScriptableToolLineSet`, `ScriptableToolPoint`, `ScriptableToolPointSet`, ... (67 total)

---

## Classes

### `unreal.ScriptableToolGizmoOptions`
Inherits: `StructBase` | Header: `ScriptableInteractiveTool.h`

FScriptableToolGizmoOptions is a configuration struct passed to the CreateTRSGizmo function of UScriptableInteractiveTool.

**Properties** (9):
  - `allow_negative_scaling`: `bool` — [Read-Write] (bool)
  - `coord_system`: `ScriptableToolGizmoCoordinateSystem` — [Read-Write] (ScriptableToolGizmoCoordinateSystem)
  - `gizmo_mode`: `ScriptableToolGizmoMode` — [Read-Write] (ScriptableToolGizmoMode)
  - `repositionable`: `bool` — [Read-Write] (bool)
  - `rotation_parts`: `int` — [Read-Write] (int32)
  - `scale_parts`: `int` — [Read-Write] (int32)
  - `snap_rotation`: `bool` — [Read-Write] (bool)
  - `snap_translation`: `bool` — [Read-Write] (bool)
  - `translation_parts`: `int` — [Read-Write] (int32)

### `unreal.ScriptableToolGroupSet`
Inherits: `StructBase` | Header: `ScriptableToolGroupSet.h`

Scriptable Tool Group Set

### `unreal.ScriptableToolModifierStates`
Inherits: `StructBase` | Header: `ScriptableInteractiveTool.h`

Scriptable Tool Modifier States

**Properties** (3):
  - `alt_down`: `bool` — [Read-Write] (bool)
  - `ctrl_down`: `bool` — [Read-Write] (bool)
  - `shift_down`: `bool` — [Read-Write] (bool)

### `unreal.BaseScriptableToolBuilder`
Inherits: `InteractiveToolBuilder` | Header: `ScriptableToolBuilder.h`

UBaseScriptableToolBuilder is a trivial base UInteractiveToolBuilder for any UScriptableInteractiveTool subclass. CanBuildTool will return true as long as the ToolClass is a valid UClass.

### `unreal.CustomScriptableToolBuilder`
Inherits: `CustomScriptableToolBuilderComponentBase` | Header: `ScriptableToolBuilder.h`

Tool Builders for custom builder logic

**Methods** (2):
  - `on_can_build_tool(selected_actors, selected_components)` -> `bool` — On Can Build Tool
  - `on_setup_tool(tool, selected_actors, selected_components)` -> `None` — On Setup Tool

### `unreal.CustomScriptableToolBuilderBaseInterface`
Inherits: `Interface` | Header: `ScriptableToolBuilder.h`

Custom Scriptable Tool Builder Base Interface

### `unreal.CustomScriptableToolBuilderComponentBase`
Inherits: `Object` | Header: `ScriptableToolBuilder.h`

Custom Scriptable Tool Builder Component Base

### `unreal.CustomScriptableToolBuilderContainer`
Inherits: `BaseScriptableToolBuilder` | Header: `ScriptableToolBuilder.h`

Custom Scriptable Tool Builder Container

### `unreal.ScriptableClickDragTool`
Inherits: `ScriptableInteractiveTool` | Header: `ScriptableClickDragTool.h`

UScriptableClickDragTool is an extension of UScriptableInteractiveTool that supports a âclick-dragâ interaction, ie capture the input device on press-down and collect any device movement events un...

**Methods** (15):
  - `get_active_modifiers()` -> `ScriptableToolModifierStates`
  - `in_active_click_drag()` -> `bool` — In Active Click Drag
  - `in_active_hover()` -> `bool` — In Active Hover
  - `is_alt_down()` -> `bool`
  - `is_ctrl_down()` -> `bool`
  - `is_shift_down()` -> `bool`
  - `on_drag_begin(start_position, modifiers)` -> `None` — On Drag Begin
  - `on_drag_end(end_position, modifiers)` -> `None` — On Drag End
  - `on_drag_sequence_cancelled()` -> `None` — On Drag Sequence Cancelled
  - `on_drag_update_position(new_position, modifiers)` -> `None` — On Drag Update Position
  - `on_hover_begin(hover_pos, modifiers)` -> `None` — Begin a sequence of Hover input events
  - `on_hover_end(modifiers)` -> `None` — Indicate that an active captured Hover sequence has ended. The device may no longer be in the viewport, so no position c...
  - `on_hover_hit_test(hover_pos, modifiers)` -> `InputRayHit` — OnHoverHitTest is called to allow the Tool to indicate if it would like to start consuing âhoverâ input at HoverPos....
  - `on_hover_update(hover_pos, modifiers)` -> `bool` — Update an active Hover sequence. OnHoverUpdate is only ever called between OnHoverBegin and OnHoverEnd
  - `test_if_can_begin_click_drag(click_pos, modifiers)` -> `InputRayHit` — Test if Can Begin Click Drag

**Properties** (2):
  - `update_modifiers_during_drag`: `bool` — [Read-Write] Allow Modifiers states to be updated during ClickDrag sequence. Defaults to enabled.
Ca...
  - `want_mouse_hover`: `bool` — [Read-Write] Enable Hover support API functions OnHoverHitTest / OnHoverBegin / OnHoverUpdate / OnHo...

### `unreal.ScriptableInteractiveTool`
Inherits: `InteractiveTool` | Header: `ScriptableInteractiveTool.h`

UScriptableInteractiveTool is an extension of UInteractiveTool that allows the Tool functionality to be defined via Blueprints.

**Methods** (42):
  - `add_line_set()` -> `ScriptableToolLineSet` — Create and return a new, independent line set, used for drawing persistent line objects in the scene. Users must save a ...
  - `add_log_message(message, highlighted = False)` -> `None` — Append a Message to the UE Editor Log.
  - `add_point_set()` -> `ScriptableToolPointSet` — Create and return a new, independent point set, used for drawing persistent point objects in the scene. Users must save ...
  - `add_property_set_of_type(property_set_type, outcome=ToolsFrameworkOutcomePins)` — Create a new Tool Property Set (ie BP subclass of UScriptableInteractiveToolPropertySet) with the given string Identifie...
  - `add_triangle_set()` -> `ScriptableToolTriangleSet` — Create and return a new, independent triangle set, used for drawing persistent triangle and quad objects in the scene. U...
  - `clear_overlay_widget()` -> `None` — Clear Overlay Widget
  - `clear_user_messages(help_message = True, warning_message = True)` -> `None` — Clear any active message shown via DisplayUserHelpMessage and/or DisplayUserWarningMessage
  - `create_trs_gizmo(identifier="Gizmo1", initial_transform, gizmo_options)` -> `ToolsFrameworkOutcomePins` — Create a Translate/Rotate/Scale Gizmo with the given Options at the specified InitialTransform. The Gizmo must be given ...
  - `destroy_trs_gizmo(identifier = 'Gizmo1')` -> `ToolsFrameworkOutcomePins` — Destroy a created Gizmo by name Identifier
  - `display_user_help_message(message)` -> `None` — Display a short Help message for the user, ie to guide them in Tool usage. In the UE5 Editor this message appears in the...
  - `display_user_warning_message(message)` -> `None` — Display a Warning message to the user, ie to indicate a problem/issue occurred.
  - `force_property_set_update_by_name(identifier = 'Settings')` -> `None` — Force the Property Set associated with the given Identifier to be updated. This may be necessary if you change the Prope...
  - `get_default_line_set()` -> `ScriptableToolLineSet` — Retrieve the default line set object for the tool, used for drawing persistent line objects in the scene.
  - `get_default_point_set()` -> `ScriptableToolPointSet` — Retrieve the default point set object for the tool, used for drawing persistent point objects in the scene.
  - `get_default_triangle_set()` -> `ScriptableToolTriangleSet` — Retrieve the default triangle set object for the tool, used for drawing persistent triangle and quad objects in the scen...
  - `get_gizmo_transform(identifier = 'Gizmo1')` -> `Transform` — Get the current Transform on the Gizmo specified by the name Identifier
  - `get_tool_targets()` -> `Array [ ToolTarget ]` — Get Tool Targets
  - `get_tool_world()` -> `World` — Access the World this Tool is currently operating on.
  - `on_gizmo_transform_changed(gizmo_identifier, new_transform)` -> `None` — The OnGizmoTransformChanged event fires whenever the transform on any Gizmo created by CreateTRSGizmo() is modified. The...
  - `on_gizmo_transform_state_change(gizmo_identifier, current_transform, change_type)` -> `None` — The OnGizmoTransformStateChange event fires whenever the user start/ends a Gizmo transform, or when an Undo/Redo event o...
  - `on_script_can_accept()` -> `bool` — CanAccept function. Implement this function for AcceptCancel Tools, and return true when it is valid for the Tool Accept...
  - `on_script_draw_hud(draw_hudapi)` -> `None` — OnScriptDrawHUD is called every frame. Use the DrawHUDAPI to draw various simple HUD elements like text. This drawing is...
  - `on_script_render(render_api)` -> `None` — OnScriptRender is called every frame. Use the RenderAPI object to draw various simple geometric elements like lines and ...
  - `on_script_setup()` -> `None` — Implement OnScriptSetup to do initial setup/configuration of the Tool, such as adding Property Sets, creating Gizmos, et...
  - `on_script_shutdown(shutdown_type)` -> `None` — OnScriptShutdown is called when the Tool is shutting down. The ShutdownType defines what the Tool should do. For Complet...
  - `on_script_tick(delta_time)` -> `None` — OnScriptTick is called every Editor Tick, ie basically every frame. Implement per-frame processing here.
  - `remove_property_set_by_name(identifier = 'Settings')` -> `ToolsFrameworkOutcomePins` — Remove a Property Set from the current Tool, found via itâs unique Identifier. Unless the Property Set absolutely need...
  - `request_tool_shutdown(accept, show_user_popup_message, user_message)` -> `None` — Request that the active Tool be shut down. The Tool can post this to shut itself down (eg in a Tool where the interactio...
  - `restore_property_set_settings(property_set, save_key)` -> `ScriptableInteractiveToolPropertySet` — Restore the values of the specified PropertySet, optionally with a specific SaveKey string. This will have no effect unl...
  - `save_property_set_settings(property_set, save_key)` -> `ScriptableInteractiveToolPropertySet` — Save the values of the specified PropertySet, optionally with a specific SaveKey string. These saved values can be resto...
  - `set_gizmo_transform(identifier="Gizmo1", new_transform, undoable)` -> `None` — Update the Transform on the Gizmo specified by the name Identifier
  - `set_gizmo_visible(identifier="Gizmo1", visible)` -> `None` — Set an existing Gizmo visible/hidden based on its name Identifier
  - `set_overlay_widget(widget, make_draggable = True)` -> `None` — Widget Overlay API
  - `set_property_set_visible_by_name(identifier="Settings", visible)` -> `None` — Set the visibility of a Property Set that is paired with the given unique Identifier.
  - `watch_bool_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch a Bool-valued Property for changes
  - `watch_enum_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch an Enum-valued Property for changes. Note that in this case the OnModified delegate will be called with a uint8 in...
  - `watch_float_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch a Float-valued Property for changes (double precision)
  - `watch_int_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch an Integer-valued Property for changes
  - `watch_name_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch an (F)Name-valued Property for changes
  - `watch_object_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch an Object-valued Property for changes (ie UObject, UClass, etc)
  - `watch_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch any Property in a PropertySet for changes. This function handles most basic properties, as well as Struct and Arra...
  - `watch_string_property(property_set, property_name, on_modified)` -> `ScriptableInteractiveToolPropertySet` — Watch a String-valued Property for changes

**Properties** (10):
  - `custom_icon_path`: `str` — [Read-Write] Relative Path to a custom Icon Image for this Tool. The Image file format must be png o...
  - `custom_tool_builder_class`: `Class` — [Read-Write] (type(Class))
  - `show_tool_in_editor`: `bool` — [Read-Write] A generic flag to indicate whether this Tool should be shown in the UE Editor. This may...
  - `tool_category`: `Text` — [Read-Write] Category of this Tool, will be used in (eg) Tool Palette Section headers (Text)
  - `tool_long_name`: `Text` — [Read-Write] Long Name of this Tool, will be used in (eg) longer labels like the Accept/Cancel toolb...
  - `tool_name`: `Text` — [Read-Write] Name of this Tool, will be used in (eg) Toolbars (Text)
  - `tool_shutdown_type`: `ScriptableToolShutdownType` — [Read-Write] Specifies how the user exits this Tool, either Accept/Cancel-style or Complete-style (S...
  - `tool_startup_requirements`: `ScriptableToolStartupRequirements` — [Read-Write] (ScriptableToolStartupRequirements)
  - `tool_target_tool_builder_class`: `Class` — [Read-Write] (type(Class))
  - `tool_tooltip`: `Text` — [Read-Write] Tooltip used for this Tool in (eg) icons/etc (Text)

### `unreal.ScriptableInteractiveToolPropertySet`
Inherits: `InteractiveToolPropertySet` | Header: `ScriptableInteractiveTool.h`

UScriptableInteractiveToolPropertySet is a Blueprintable extension of UInteractiveToolPropertySet. This is a helper type meant to be used with UScriptableInteractiveTool. The intention is that the â...

**Methods** (1):
  - `get_owning_tool(outcome=ToolsFrameworkOutcomePins)` — Access the Tool that owns this PropertySet

### `unreal.ScriptableModularBehaviorTool`
Inherits: `ScriptableInteractiveTool` | Header: `ScriptableModularBehaviorTool.h`

A Scriptable tool base blueprint class which provides support for user defined mouse interaction behaviors

**Methods** (13):
  - `add_click_drag_behavior(can_begin_click_drag_sequence, on_click_press, on_click_drag, on_click_release, on_terminate_drag_sequence, capture_check, capture_priority = 100, mouse_button = ScriptableToolMouseButton.LEFT_BUTTON, update_modifiers_during_drag = False)` -> `None` — Implements a standard âbutton-click-dragâ-style input behavior. If a ForceEndCapture occurs we call OnTerminateDragS...
  - `add_double_click_behavior(if_hit_by_click, on_hit_by_click, capture_check, capture_priority = 100, mouse_button = ScriptableToolMouseButton.LEFT_BUTTON, hit_test_on_release = True)` -> `None` — Implements a standard âbutton-clickâ-style input behavior The state machine works as follows: The second hit-test is...
  - `add_mouse_hover_behavior(begin_hover_sequence_hit_test, on_begin_hover, on_update_hover, on_end_hover, hover_capture_check, capture_priority = 100)` -> `None`
  - `add_mouse_wheel_behavior(test_should_respond_to_mouse_wheel, on_mouse_wheel_scroll_up, on_mouse_wheel_scroll_down, capture_check, capture_priority = 100)` -> `None`
  - `add_multi_click_sequence_behavior(on_begin_sequence_preview, can_begin_click_sequence, on_begin_click_sequence, on_next_sequence_preview, on_next_sequence_click, on_terminate_click_sequence, request_abort_click_sequence, capture_check, hover_capture_check, capture_priority = 100, mouse_button = ScriptableToolMouseButton.LEFT_BUTTON)` -> `None` — MultiClickSequenceBehavior implements a generic multi-click-sequence input behavior. For example this behavior could be ...
  - `add_multi_key_input_behavior(on_key_pressed, on_key_released, keys, require_all_keys, capture_check, capture_priority)` -> `None` — AddMultiKeyInputBehavior implements a generic keyboard multi key listener behavior
  - `add_single_click_behavior(if_hit_by_click, on_hit_by_click, capture_check, capture_priority = 100, mouse_button = ScriptableToolMouseButton.LEFT_BUTTON, hit_test_on_release = True)` -> `None` — Implements a standard âbutton-clickâ-style input behavior The state machine works as follows: The second hit-test is...
  - `add_single_click_or_drag_behavior(if_hit_by_click, on_hit_by_click, can_begin_click_drag_sequence, on_click_press, on_click_drag, on_click_release, on_terminate_drag_sequence, capture_check, capture_priority = 100, mouse_button = ScriptableToolMouseButton.LEFT_BUTTON, begin_drag_if_click_target_not_hit = True, click_distance_threshold = 5.000000)` -> `None` — SingleClickOrDragBehavior is a combination of a SingleClickBehavior and ClickDragBehavior, and allows for the common UI ...
  - `add_single_key_input_behavior(on_key_pressed, on_key_released, key, capture_check, capture_priority)` -> `None` — AddSingleKeyInputBehavior implements a generic keyboard key listener behavior
  - `get_active_modifiers()` -> `ScriptableToolModifierStates`
  - `is_alt_down()` -> `bool`
  - `is_ctrl_down()` -> `bool`
  - `is_shift_down()` -> `bool`

### `unreal.ScriptableSingleClickTool`
Inherits: `ScriptableInteractiveTool` | Header: `ScriptableSingleClickTool.h`

UScriptableSingleClickTool is an extension of UScriptableInteractiveTool that supports a âclickâ interaction, ie button press-down-and-release on an arbitrary Target (defined by the Tool). Note th...

**Methods** (11):
  - `get_active_modifiers()` -> `ScriptableToolModifierStates`
  - `in_active_hover()` -> `bool` — In Active Hover
  - `is_alt_down()` -> `bool`
  - `is_ctrl_down()` -> `bool`
  - `is_shift_down()` -> `bool`
  - `on_hit_by_click(click_pos, modifiers)` -> `None` — OnHitByClick is called when the Tool has indicated it would like to consume a click event (via TestIfHitByClick), and th...
  - `on_hover_begin(hover_pos, modifiers)` -> `None` — Begin a sequence of Hover input events
  - `on_hover_end(modifiers)` -> `None` — Indicate that an active captured Hover sequence has ended. The device may no longer be in the viewport, so no position c...
  - `on_hover_hit_test(hover_pos, modifiers)` -> `InputRayHit` — OnHoverHitTest is called to allow the Tool to indicate if it would like to start consuing âhoverâ input at HoverPos....
  - `on_hover_update(hover_pos, modifiers)` -> `bool` — Update an active Hover sequence. OnHoverUpdate is only ever called between OnHoverBegin and OnHoverEnd
  - `test_if_hit_by_click(click_pos, modifiers)` -> `InputRayHit` — TestIfHitByClick is called to allow the Tool to indicate if it would like to consume a potential click at ClickPos. The ...

**Properties** (1):
  - `want_mouse_hover`: `bool` — [Read-Write] Enable Hover support API functions OnHoverHitTest / OnHoverBegin / OnHoverUpdate / OnHo...

### `unreal.ScriptableTool_HUDAPI`
Inherits: `Object` | Header: `ScriptableInteractiveTool.h`

UScriptableTool_HUDAPI is helper Object that is created internally by a UScriptableInteractiveTool to allow Blueprints to access basic 2D rendering functionality, in the context of a specific Tool. Th...

**Methods** (3):
  - `draw_text_array_at_location()` -> `ScriptableTool_HUDAPI` — Draw Text Array at Location
  - `draw_text_at_location()` -> `ScriptableTool_HUDAPI` — Draw Text at Location
  - `get_canvas_location(canvas_location=Vector2D)` — Get Canvas Location

### `unreal.ScriptableTool_RenderAPI`
Inherits: `Object` | Header: `ScriptableInteractiveTool.h`

UScriptableTool_RenderAPI is helper Object that is created internally by a UScriptableInteractiveTool to allow Blueprints to access basic 3D rendering functionality, in the context of a specific Tool....

**Methods** (2):
  - `draw_line(start, end, color, thickness = 1.000000, depth_bias = 0.000000, depth_tested = True)` -> `ScriptableTool_RenderAPI` — Draw Line
  - `draw_rect_width_height_xy(transform, width, height, color, line_thickness = 1.000000, depth_bias = 0.000000, depth_tested = True, centered = True)` -> `ScriptableTool_RenderAPI` — Draw Rect Width Height XY

### `unreal.ScriptableToolGroupTag`
Inherits: `Object` | Header: `ScriptableToolGroupTag.h`

Scriptable Tool Group Tag

### `unreal.ScriptableToolLine`
Inherits: `Object` | Header: `ScriptableToolLine.h`

Scriptable Tool Line

**Methods** (6):
  - `set_line_color(color)` -> `None` — Set the lineâs color
  - `set_line_depth_bias(depth_bias)` -> `None` — Set the lineâs depth bias. The depth bias controls small micro adjustments in effective displacement towards or away f...
  - `set_line_end(end)` -> `None` — Set the ending position of the line
  - `set_line_end_points(start, end)` -> `None` — Set the starting and ending positions of the line
  - `set_line_start(start)` -> `None` — Set the starting position of the line
  - `set_line_thickness(thickness)` -> `None` — Set the lineâs thickness

### `unreal.ScriptableToolLineSet`
Inherits: `Object` | Header: `ScriptableToolLineSet.h`

Scriptable Tool Line Set

**Methods** (5):
  - `add_line()` -> `ScriptableToolLine` — Create and return a new line object. Users should save a reference to this object for future updates or removal from the...
  - `remove_all_lines()` -> `None` — Remove all current lines in the set.
  - `remove_line(line)` -> `None` — Remove a specific line object from the set, removing it fromt the scene.
  - `set_all_lines_color(color)` -> `None` — Set the color of all lines in the set simultaneously.
  - `set_all_lines_thickness(thickness)` -> `None` — Set the thickness of all lines in the set simultaneously.

### `unreal.ScriptableToolPoint`
Inherits: `Object` | Header: `ScriptableToolPoint.h`

Scriptable Tool Point

**Methods** (4):
  - `set_point_color(color)` -> `None` — Set the pointâs color
  - `set_point_depth_bias(depth_bias)` -> `None` — Set the pointâs depth bias. The depth bias controls small micro adjustments in effective displacement towards or away ...
  - `set_point_position(position)` -> `None` — Set the position of the point
  - `set_point_size(thickness)` -> `None` — Set the pointâs size

### `unreal.ScriptableToolPointSet`
Inherits: `Object` | Header: `ScriptableToolPointSet.h`

Scriptable Tool Point Set

**Methods** (5):
  - `add_point()` -> `ScriptableToolPoint` — Create and return a new point object. Users should save a reference to this object for future updates or removal from th...
  - `remove_all_points()` -> `None` — Remove all current points in the set.
  - `remove_point(point)` -> `None` — Remove a specific point object from the set, removing it from the scene.
  - `set_all_points_color(color)` -> `None` — Set the color of all points in the set simultaneously.
  - `set_all_points_size(size)` -> `None` — Set the size of all points in the set simultaneously.

### `unreal.ScriptableToolQuad`
Inherits: `Object` | Header: `ScriptableToolTriangle.h`

Scriptable Tool Quad

**Methods** (5):
  - `set_quad_colors(a, b, c, d)` -> `None` — Set the vertex colors of the quad
  - `set_quad_material(material)` -> `None` — Set the material of the quad
  - `set_quad_normals(a, b, c, d)` -> `None` — Set the normal values of the quad
  - `set_quad_points(a, b, c, d)` -> `None` — Set the points of the quad
  - `set_quad_u_vs(a, b, c, d)` -> `None` — Set the UV coordinates of the quad

### `unreal.ScriptableTools_Util`
Inherits: `BlueprintFunctionLibrary` | Header: `ScriptableInteractiveTool.h`

Scriptable Tools Utility Library

**Methods** (3):
  - `make_input_ray_hit(hit_depth, optional_hit_object)` -> `InputRayHit` [classmethod] — Make Input Ray Hit
  - `make_input_ray_hit_max_depth()` -> `InputRayHit` [classmethod] — Make Input Ray Hit Max Depth
  - `make_input_ray_hit_miss()` -> `InputRayHit` [classmethod] — Make Input Ray Hit Miss

### `unreal.ScriptableToolTargetRequirements`
Inherits: `Object` | Header: `ScriptableToolBuilder.h`

Tool Builders for Tool Target support

**Methods** (1):
  - `build_tool_target_requirements(requirement_interfaces)` -> `ScriptableToolTargetRequirements` [classmethod] — Build Tool Target Requirements

**Properties** (2):
  - `max_matching_targets`: `int` — [Read-Write] (int32)
  - `min_matching_targets`: `int` — [Read-Write] (int32)

### `unreal.ScriptableToolTriangle`
Inherits: `Object` | Header: `ScriptableToolTriangle.h`

Scriptable Tool Triangle

**Methods** (5):
  - `set_triangle_colors(a, b, c)` -> `None`
  - `set_triangle_material(material)` -> `None`
  - `set_triangle_normals(a, b, c)` -> `None`
  - `set_triangle_points(a, b, c)` -> `None`
  - `set_triangle_u_vs(a, b, c)` -> `None`

### `unreal.ScriptableToolTriangleSet`
Inherits: `Object` | Header: `ScriptableToolTriangleSet.h`

Scriptable Tool Triangle Set

**Methods** (7):
  - `add_quad()` -> `ScriptableToolQuad` — Create and return a new quad object. Quad objects are two paired triangles. Users should save a reference to this object...
  - `add_triangle()` -> `ScriptableToolTriangle` — Create and return a new triangle object. Users should save a reference to this object for future updates or removal from...
  - `remove_all_faces()` -> `None` — Remove all current triangles and quads in the set.
  - `remove_quad(quad)` -> `None` — Remove a specific quad object from the set, removing it from the scene.
  - `remove_triangle(triangle)` -> `None` — Remove a specific triangle object from the set, removing it from the scene.
  - `set_all_triangles_color(color)` -> `None` — Set the color of all triangles and quads in the set simultaneously .
  - `set_all_triangles_material(material)` -> `None` — Set the material of all triangles and quads in the set simultaneously .

### `unreal.ToolTargetScriptableToolBuilder`
Inherits: `CustomScriptableToolBuilderComponentBase` | Header: `ScriptableToolBuilder.h`

Tool Target Scriptable Tool Builder

**Methods** (2):
  - `get_tool_target_requirements()` -> `ScriptableToolTargetRequirements` — Get Tool Target Requirements
  - `on_setup_tool(tool)` -> `None` — On Setup Tool

### `unreal.ScriptableToolGizmoCoordinateSystem`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Gizmo Coordinate System

**Properties** (3):
  - `FROM_VIEWPORT_SETTINGS`: `ScriptableToolGizmoCoordinateSystem = Ellipsis` — 2
  - `LOCAL`: `ScriptableToolGizmoCoordinateSystem = Ellipsis` — 1
  - `WORLD`: `ScriptableToolGizmoCoordinateSystem = Ellipsis` — 0

### `unreal.ScriptableToolGizmoMode`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Gizmo Mode

**Properties** (5):
  - `COMBINED`: `ScriptableToolGizmoMode = Ellipsis` — 3
  - `FROM_VIEWPORT_SETTINGS`: `ScriptableToolGizmoMode = Ellipsis` — 4
  - `ROTATION_ONLY`: `ScriptableToolGizmoMode = Ellipsis` — 1
  - `SCALE_ONLY`: `ScriptableToolGizmoMode = Ellipsis` — 2
  - `TRANSLATION_ONLY`: `ScriptableToolGizmoMode = Ellipsis` — 0

### `unreal.ScriptableToolGizmoRotation`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Gizmo Rotation

**Properties** (5):
  - `FREE_ROTATE`: `ScriptableToolGizmoRotation = Ellipsis` — 128
  - `NONE`: `ScriptableToolGizmoRotation = Ellipsis` — 0
  - `ROTATE_AXIS_X`: `ScriptableToolGizmoRotation = Ellipsis` — 2
  - `ROTATE_AXIS_Y`: `ScriptableToolGizmoRotation = Ellipsis` — 4
  - `ROTATE_AXIS_Z`: `ScriptableToolGizmoRotation = Ellipsis` — 8

### `unreal.ScriptableToolGizmoScale`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Gizmo Scale

**Properties** (8):
  - `NONE`: `ScriptableToolGizmoScale = Ellipsis` — 0
  - `SCALE_AXIS_X`: `ScriptableToolGizmoScale = Ellipsis` — 2
  - `SCALE_AXIS_Y`: `ScriptableToolGizmoScale = Ellipsis` — 4
  - `SCALE_AXIS_Z`: `ScriptableToolGizmoScale = Ellipsis` — 8
  - `SCALE_PLANE_XY`: `ScriptableToolGizmoScale = Ellipsis` — 16
  - `SCALE_PLANE_XZ`: `ScriptableToolGizmoScale = Ellipsis` — 32
  - `SCALE_PLANE_YZ`: `ScriptableToolGizmoScale = Ellipsis` — 64
  - `SCALE_UNIFORM`: `ScriptableToolGizmoScale = Ellipsis` — 128

### `unreal.ScriptableToolGizmoStateChangeType`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Gizmo State Change Type

**Properties** (3):
  - `BEGIN_TRANSFORM`: `ScriptableToolGizmoStateChangeType = Ellipsis` — 0
  - `END_TRANSFORM`: `ScriptableToolGizmoStateChangeType = Ellipsis` — 1
  - `UNDO_REDO`: `ScriptableToolGizmoStateChangeType = Ellipsis` — 2

### `unreal.ScriptableToolGizmoTranslation`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Gizmo Translation

**Properties** (8):
  - `FREE_TRANSLATE`: `ScriptableToolGizmoTranslation = Ellipsis` — 128
  - `NONE`: `ScriptableToolGizmoTranslation = Ellipsis` — 0
  - `TRANSLATE_AXIS_X`: `ScriptableToolGizmoTranslation = Ellipsis` — 2
  - `TRANSLATE_AXIS_Y`: `ScriptableToolGizmoTranslation = Ellipsis` — 4
  - `TRANSLATE_AXIS_Z`: `ScriptableToolGizmoTranslation = Ellipsis` — 8
  - `TRANSLATE_PLANE_XY`: `ScriptableToolGizmoTranslation = Ellipsis` — 16
  - `TRANSLATE_PLANE_XZ`: `ScriptableToolGizmoTranslation = Ellipsis` — 32
  - `TRANSLATE_PLANE_YZ`: `ScriptableToolGizmoTranslation = Ellipsis` — 64

### `unreal.ScriptableToolMouseButton`
Inherits: `EnumBase` | Header: `ScriptableToolBehaviorDelegates.h`

EScriptable Tool Mouse Button

**Properties** (3):
  - `LEFT_BUTTON`: `ScriptableToolMouseButton = Ellipsis` — 0
  - `MIDDLE_BUTTON`: `ScriptableToolMouseButton = Ellipsis` — 2
  - `RIGHT_BUTTON`: `ScriptableToolMouseButton = Ellipsis` — 1

### `unreal.ScriptableToolShutdownType`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Shutdown Type

**Properties** (2):
  - `ACCEPT_CANCEL`: `ScriptableToolShutdownType = Ellipsis` — 1
  - `COMPLETE`: `ScriptableToolShutdownType = Ellipsis` — 0

### `unreal.ScriptableToolStartupRequirements`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

EScriptable Tool Startup Requirements

**Properties** (3):
  - `CUSTOM`: `ScriptableToolStartupRequirements = Ellipsis` — OnCanBuildTool is run every tick, and may slow down editor performance. 2 A custom tool builder blue...
  - `NONE`: `ScriptableToolStartupRequirements = Ellipsis` — No startup requirements needed. Tool can run any time. 0
  - `TOOL_TARGET`: `ScriptableToolStartupRequirements = Ellipsis` — A custom tool builder blueprint class that is configured with tool target requirements to filter sel...

### `unreal.ToolsFrameworkOutcomePins`
Inherits: `EnumBase` | Header: `ScriptableInteractiveTool.h`

ETools Framework Outcome Pins

**Properties** (2):
  - `FAILURE`: `ToolsFrameworkOutcomePins = Ellipsis` — 1
  - `SUCCESS`: `ToolsFrameworkOutcomePins = Ellipsis` — 0

### `unreal.BeginHoverSequenceHitTestDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

Begin Hover Sequence Hit Test Delegate Delegate Signature

### `unreal.CanBeginClickSequenceDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

Can Begin Click Sequence Delegate Delegate Signature

### `unreal.MouseBehaviorModiferCheckDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

Mouse Behavior Modifer Check Delegate Delegate Signature

### `unreal.OnBeginClickSequenceDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Begin Click Sequence Delegate Delegate Signature

### `unreal.OnBeginHoverDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Begin Hover Delegate Delegate Signature

### `unreal.OnBeginSequencePreviewDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Begin Sequence Preview Delegate Delegate Signature

### `unreal.OnClickDragDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Click Drag Delegate Delegate Signature

### `unreal.OnClickPressDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Click Press Delegate Delegate Signature

### `unreal.OnClickReleaseDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Click Release Delegate Delegate Signature

### `unreal.OnEndHoverDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On End Hover Delegate Delegate Signature

### `unreal.OnHitByClickDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Hit by Click Delegate Delegate Signature

### `unreal.OnKeyStateToggleDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Key State Toggle Delegate Delegate Signature

### `unreal.OnMouseWheelScrollDownDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Mouse Wheel Scroll Down Delegate Delegate Signature

### `unreal.OnMouseWheelScrollUpDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Mouse Wheel Scroll Up Delegate Delegate Signature

### `unreal.OnNextSequenceClickDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Next Sequence Click Delegate Delegate Signature

### `unreal.OnNextSequencePreviewDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Next Sequence Preview Delegate Delegate Signature

### `unreal.OnTerminateClickSequenceDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Terminate Click Sequence Delegate Delegate Signature

### `unreal.OnTerminateDragSequenceDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Terminate Drag Sequence Delegate Delegate Signature

### `unreal.OnUpdateHoverDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

On Update Hover Delegate Delegate Signature

### `unreal.RequestAbortClickSequenceDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

Request Abort Click Sequence Delegate Delegate Signature

### `unreal.TestCanBeginClickDragSequenceDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

Test Can Begin Click Drag Sequence Delegate Delegate Signature

### `unreal.TestIfHitByClickDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

Test if Hit by Click Delegate Delegate Signature

### `unreal.TestShouldRespondToMouseWheelDelegate`
Inherits: `DelegateBase` | Header: `ScriptableToolBehaviorDelegates.h`

Test Should Respond to Mouse Wheel Delegate Delegate Signature

### `unreal.ToolBoolPropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

Tool Bool Property Modified Delegate Delegate Signature

### `unreal.ToolEnumPropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

Tool Enum Property Modified Delegate Delegate Signature

### `unreal.ToolFloatPropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

Tool Float Property Modified Delegate Delegate Signature

### `unreal.ToolFNamePropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

Tool FName Property Modified Delegate Delegate Signature

### `unreal.ToolIntPropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

Tool Int Property Modified Delegate Delegate Signature

### `unreal.ToolObjectPropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

Tool Object Property Modified Delegate Delegate Signature

### `unreal.ToolPropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

these are delegates for the various property-watchers below

### `unreal.ToolStringPropertyModifiedDelegate`
Inherits: `DelegateBase` | Header: `ScriptableInteractiveTool.h`

Tool String Property Modified Delegate Delegate Signature
