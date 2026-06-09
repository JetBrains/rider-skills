# UE Python API — Avalanche Module

**23 types** from the `Avalanche` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaColorChangeData`, `AvaViewportQualitySettings`, `AvaViewportQualitySettingsFeature`, `AvaViewportQualitySettingsPreset`, `AvaCineCameraActor`, `AvaGameInstance`, `AvaGizmoComponent`, `AvaGizmoObjectInterface`, `AvaNullActor`, `AvaNullComponent`, `AvaPostProcessVolume`, `AvaScene`, `AvaSnapPointGenerator`, `AvaSplineActor`, `AvaTestDynamicMeshActor`, `AvaTestStaticMeshActor`, `AvaTransitionAttributeLibrary`, `AvaTransitionRCLibrary`, `AvaAnchors`, `AvaColorStyle`, ... (23 total)

---

## Classes

### `unreal.AvaColorChangeData`
Inherits: `StructBase` | Header: `AvaDefs.h`

Ava Color Change Data

**Properties** (4):
  - `color_style`: `AvaColorStyle` — [Read-Write] (AvaColorStyle)
  - `is_unlit`: `bool` — [Read-Write] (bool)
  - `primary_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `secondary_color`: `LinearColor` — [Read-Write] (LinearColor)

### `unreal.AvaViewportQualitySettings`
Inherits: `StructBase` | Header: `AvaViewportQualitySettings.h`

Motion Design Viewport Quality Settings

**Properties** (1):
  - `features`: `None` — [Read-Write] Advanced viewport client engine features indexed by FEngineShowFlags names. (Array[AvaV...

### `unreal.AvaViewportQualitySettingsFeature`
Inherits: `StructBase` | Header: `AvaViewportQualitySettings.h`

Ava Viewport Quality Settings Feature

**Properties** (2):
  - `enabled`: `bool` — [Read-Write] True if this engine feature show flag should be enabled. (bool)
  - `name`: `str` — [Read-Write] The name of the feature in the engine show flags. (str)

### `unreal.AvaViewportQualitySettingsPreset`
Inherits: `StructBase` | Header: `AvaViewportQualitySettings.h`

Ava Viewport Quality Settings Preset

**Properties** (2):
  - `preset_name`: `Text` — [Read-Write] (Text)
  - `quality_settings`: `AvaViewportQualitySettings` — [Read-Write] (AvaViewportQualitySettings)

### `unreal.AvaCineCameraActor`
Inherits: `CineCameraActor` | Header: `AvaCineCameraActor.h`

Motion Design Cine Camera Actor is derived from Cine Camera Actor. Its function is to provide a Cine Camera which can be used right away inside Motion Design. This is done by customizing some of its d...

### `unreal.AvaGameInstance`
Inherits: `GameInstance` | Header: `AvaGameInstance.h`

Ava Game Instance

### `unreal.AvaGizmoComponent`
Inherits: `ActorComponent` | Header: `AvaGizmoComponent.h`

Add to an actor to indicate itâs used as a Gizmo.

**Properties** (12):
  - `apply_to_child_actors`: `bool` — [Read-Write] Whether the settings apply to child actors or not. (bool)
  - `cast_shadow`: `bool` — [Read-Write] Controls whether the primitive component should cast a shadow or not. (bool)
  - `draw_wireframe`: `bool` — [Read-Write] Currently only applies to dynamic meshes. (bool)
  - `is_gizmo_enabled`: `bool` — [Read-Write] Whether âgizmo modeâ is enabled. (bool)
  - `is_hidden_in_game`: `bool` — [Read-Write] Whether to hide the primitive in game, if the primitive is Visible. (bool)
  - `is_visible_in_editor`: `bool` — [Read-Write] Whether to completely draw the primitive; if false, the primitive is not drawn, does no...
  - `material`: `MaterialInterface` — [Read-Write] Material that overrides all others attached to the parent actor, if specified. (Materia...
  - `render_depth`: `bool` — [Read-Write] Whether to render to the depth buffer. (bool)
  - `render_in_main_pass`: `bool` — [Read-Write] Whether to render in the main pass. (bool)
  - `set_stencil`: `bool` — [Read-Write] Whether to render to the custom depth/stencil buffer. (bool)
  - `stencil_id`: `int` — [Read-Write] The custom stencil id, if applicable. (uint8)
  - `wireframe_color`: `LinearColor` — [Read-Write] The color of the wireframe when drawn. (LinearColor)

### `unreal.AvaGizmoObjectInterface`
Inherits: `Interface` | Header: `IAvaGizmoObject.h`

Ava Gizmo Object Interface

**Methods** (1):
  - `toggle_gizmo(gizmo_component, show_as_gizmo = True)` -> `None` — Whether to show the callee as a gizmo or not

### `unreal.AvaNullActor`
Inherits: `Actor` | Header: `AvaNullActor.h`

Null Actor (Empty Group)

**Properties** (1):
  - `null_component`: `AvaNullComponent` [Read-Only] — [Read-Only] (AvaNullComponent)

### `unreal.AvaNullComponent`
Inherits: `SceneComponent` | Header: `AvaNullComponent.h`

Ava Null Component

### `unreal.AvaPostProcessVolume`
Inherits: `PostProcessVolume` | Header: `AvaPostProcessVolume.h`

Motion Design Post Process Volume is derived from Post Process Volume. Its function is to provide a Post Process which can be used right away inside Motion Design. This is done by customizing some of ...

### `unreal.AvaScene`
Inherits: `Actor` | Header: `AvaScene.h`

Ava Scene

**Methods** (1):
  - `on_values_applied()` -> `None` — Called when the remote control values are applied.

### `unreal.AvaSnapPointGenerator`
Inherits: `Interface` | Header: `IAvaSnapPointGenerator.h`

Ava Snap Point Generator

### `unreal.AvaSplineActor`
Inherits: `Actor` | Header: `AvaSplineActor.h`

Motion Design Spline Actor

**Properties** (1):
  - `spline_component`: `SplineComponent` [Read-Only] — [Read-Only] (SplineComponent)

### `unreal.AvaTestDynamicMeshActor`
Inherits: `Actor` | Header: `AvaTestDynamicMeshActor.h`

Ava Test Dynamic Mesh Actor

**Properties** (1):
  - `shape_dynamic_mesh_component`: `DynamicMeshComponent` [Read-Only] — [Read-Only] (DynamicMeshComponent)

### `unreal.AvaTestStaticMeshActor`
Inherits: `Actor` | Header: `AvaTestStaticMeshActor.h`

Ava Test Static Mesh Actor

**Properties** (1):
  - `static_mesh_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] (StaticMeshComponent)

### `unreal.AvaTransitionAttributeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaTransitionAttributeLibrary.h`

Ava Transition Attribute Library

**Methods** (6):
  - `add_name_attribute(transition_node, name)` -> `bool` [classmethod] — Add Name Attribute
  - `add_tag_attribute(transition_node, tag_handle)` -> `bool` [classmethod] — Add Tag Attribute
  - `contains_name_attribute(transition_node, name)` -> `bool` [classmethod] — Contains Name Attribute
  - `contains_tag_attribute(transition_node, tag_handle)` -> `bool` [classmethod] — Contains Tag Attribute
  - `remove_name_attribute(transition_node, name)` -> `bool` [classmethod] — Remove Name Attribute
  - `remove_tag_attribute(transition_node, tag_handle)` -> `bool` [classmethod] — Remove Tag Attribute

### `unreal.AvaTransitionRCLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaTransitionRCLibrary.h`

Ava Transition RCLibrary

**Methods** (2):
  - `compare_rc_controller_values(transition_node, controller_id, value_comparison_type = AvaTransitionComparisonResult.DIFFERENT)` -> `bool` [classmethod] — Compare RCController Values
  - `get_changed_rc_controllers(transition_node)` -> `Array [ RCVirtualPropertyBase ]` [classmethod] — Get Changed RCControllers

### `unreal.AvaAnchors`
Inherits: `EnumBase` | Header: `AvaDefs.h`

UType 2D space point map. None should not be selectable in the UI. Z: Top, Bottom, VMiddle & Y: Left, Right, HMiddle Expressed as ZY eg TopLeft

**Properties** (10):
  - `BOTTOM`: `AvaAnchors = Ellipsis` — 34
  - `BOTTOM_LEFT`: `AvaAnchors = Ellipsis` — 33
  - `BOTTOM_RIGHT`: `AvaAnchors = Ellipsis` — 36
  - `CENTER`: `AvaAnchors = Ellipsis` — 18
  - `CUSTOM`: `AvaAnchors = Ellipsis` — 64
  - `LEFT`: `AvaAnchors = Ellipsis` — 17
  - `RIGHT`: `AvaAnchors = Ellipsis` — 20
  - `TOP`: `AvaAnchors = Ellipsis` — 10
  - `TOP_LEFT`: `AvaAnchors = Ellipsis` — 9
  - `TOP_RIGHT`: `AvaAnchors = Ellipsis` — 12

### `unreal.AvaColorStyle`
Inherits: `EnumBase` | Header: `AvaDefs.h`

EAva Color Style

**Properties** (3):
  - `LINEAR_GRADIENT`: `AvaColorStyle = Ellipsis` — 2
  - `NONE`: `AvaColorStyle = Ellipsis` — 0
  - `SOLID`: `AvaColorStyle = Ellipsis` — 1

### `unreal.AvaDepthAlignment`
Inherits: `EnumBase` | Header: `AvaDefs.h`

EAva Depth Alignment

**Properties** (3):
  - `BACK`: `AvaDepthAlignment = Ellipsis` — 2
  - `CENTER`: `AvaDepthAlignment = Ellipsis` — 1
  - `FRONT`: `AvaDepthAlignment = Ellipsis` — 0

### `unreal.AvaHorizontalAlignment`
Inherits: `EnumBase` | Header: `AvaDefs.h`

EAva Horizontal Alignment

**Properties** (3):
  - `CENTER`: `AvaHorizontalAlignment = Ellipsis` — 1
  - `LEFT`: `AvaHorizontalAlignment = Ellipsis` — 0
  - `RIGHT`: `AvaHorizontalAlignment = Ellipsis` — 2

### `unreal.AvaVerticalAlignment`
Inherits: `EnumBase` | Header: `AvaDefs.h`

EAva Vertical Alignment

**Properties** (3):
  - `BOTTOM`: `AvaVerticalAlignment = Ellipsis` — 2
  - `CENTER`: `AvaVerticalAlignment = Ellipsis` — 1
  - `TOP`: `AvaVerticalAlignment = Ellipsis` — 0
