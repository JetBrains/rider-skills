# UE Python API — ViewportInteraction Module

**19 types** from the `ViewportInteraction` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ViewportActionKeyInput`, `AxisGizmoHandleGroup`, `BaseTransformGizmo`, `GizmoHandleGroup`, `GizmoHandleMeshComponent`, `MouseCursorInteractor`, `PivotPlaneTranslationGizmoHandleGroup`, `PivotRotationGizmoHandleGroup`, `PivotScaleGizmoHandleGroup`, `PivotTransformGizmo`, `PivotTranslationGizmoHandleGroup`, `StretchGizmoHandleGroup`, `UniformScaleGizmoHandleGroup`, `ViewportDragOperationComponent`, `ViewportInteractor`, `ViewportWorldInteraction`, `GizmoHandleTypes`, `HitResultGizmoFilterMode`, `ViewportInteractionDraggingMode`

---

## Classes

### `unreal.ViewportActionKeyInput`
Inherits: `StructBase` | Header: `ViewportInteractionTypes.h`

Represents a generic action

**Properties** (2):
  - `action_type`: `Name` [Read-Only] — [Read-Only] The name of this action (Name)
  - `event`: `InputEventType` [Read-Only] — [Read-Only] Input event (InputEventType)

### `unreal.AxisGizmoHandleGroup`
Inherits: `GizmoHandleGroup` | Header: `VIGizmoHandle.h`

Base class for gizmo handles on axis

### `unreal.BaseTransformGizmo`
Inherits: `Actor` | Header: `VIBaseTransformGizmo.h`

Base class for transform gizmo

### `unreal.GizmoHandleGroup`
Inherits: `SceneComponent` | Header: `VIGizmoHandle.h`

Base class for gizmo handles

### `unreal.GizmoHandleMeshComponent`
Inherits: `StaticMeshComponent` | Header: `VIGizmoHandleMeshComponent.h`

Gizmo Handle Mesh Component

### `unreal.MouseCursorInteractor`
Inherits: `ViewportInteractor` | Header: `MouseCursorInteractor.h`

Viewport interactor for a mouse cursor

### `unreal.PivotPlaneTranslationGizmoHandleGroup`
Inherits: `AxisGizmoHandleGroup` | Header: `VIPivotTransformGizmo.h`

Axis Gizmo handle for plane translation

### `unreal.PivotRotationGizmoHandleGroup`
Inherits: `AxisGizmoHandleGroup` | Header: `VIPivotTransformGizmo.h`

Axis Gizmo handle for rotation

### `unreal.PivotScaleGizmoHandleGroup`
Inherits: `AxisGizmoHandleGroup` | Header: `VIPivotTransformGizmo.h`

Axis Gizmo handle for scaling

### `unreal.PivotTransformGizmo`
Inherits: `BaseTransformGizmo` | Header: `VIPivotTransformGizmo.h`

A transform gizmo on the pivot that allows you to interact with selected objects by moving, scaling and rotating.

### `unreal.PivotTranslationGizmoHandleGroup`
Inherits: `AxisGizmoHandleGroup` | Header: `VIPivotTransformGizmo.h`

Axis Gizmo handle for translating

### `unreal.StretchGizmoHandleGroup`
Inherits: `GizmoHandleGroup` | Header: `VIStretchGizmoHandle.h`

Gizmo handle for stretching/scaling

### `unreal.UniformScaleGizmoHandleGroup`
Inherits: `GizmoHandleGroup` | Header: `VIUniformScaleGizmoHandle.h`

Gizmo handle for uniform scaling

### `unreal.ViewportDragOperationComponent`
Inherits: `ActorComponent` | Header: `ViewportDragOperation.h`

Container component for UViewportDragOperation that can be used by objects in the world that are draggable and implement the ViewportInteractableInterface

### `unreal.ViewportInteractor`
Inherits: `Object` | Header: `ViewportInteractor.h`

Represents the interactor in the world

**Methods** (20):
  - `can_carry()` -> `bool` — Gets if the interactor can carry an object
  - `get_dragging_mode()` -> `ViewportInteractionDraggingMode` — Gets the current interactor data dragging mode
  - `get_hit_result_gizmo_filter_mode()` -> `HitResultGizmoFilterMode` — Gets current gizmo filter mode used for Interaction
  - `get_hover_location()` -> `Vector` — Gets the interactor laser hover location
  - `get_laser_pointer(even_if_blocked = False, laser_length_override = 0.000000)` -> `(laser_pointer_start=Vector, laser_pointer_end=Vector) or None` — Gets the start and end point of the laser pointer for the specified hand
  - `get_last_room_space_transform()` -> `Transform` — Gets the last hand transform of the interactor, in the local tracking space
  - `get_last_transform()` -> `Transform` — Gets the last world transform of this interactor
  - `get_other_interactor()` -> `ViewportInteractor` — Gets the paired interactor assigned by the world interaction, can return null when there is no other interactor
  - `get_room_space_transform()` -> `Transform` — Gets the hand transform of the interactor, in the local tracking space
  - `get_transform()` -> `Transform` — Gets the world transform of this interactor
  - `get_transform_and_forward_vector()` -> `(out_hand_transform=Transform, out_forward_vector=Vector) or None` — Creates a hand transform and forward vector for a laser pointer for a given hand
  - `get_world_interaction()` -> `ViewportWorldInteraction` — Gets the world interaction
  - `handle_input_axis_bp(action, key, delta, delta_time)` -> `bool` — To be overridden. Called by HandleInputAxis before delegates and default input implementation
  - `handle_input_key_bp(action, key, event)` -> `bool` — To be overridden. Called by HandleInputKey before delegates and default input implementation
  - `is_hovering_over_gizmo()` -> `bool` — If the interactor laser is currently hovering over a gizmo handle
  - `set_can_carry(can_carry)` -> `None` — Sets if the interactor can carry an object
  - `set_dragging_mode(new_dragging_mode)` -> `None` — Sets the current dragging mode for this interactor
  - `set_hit_result_gizmo_filter_mode(new_filter)` -> `None` — Sets the current gizmo filter mode used for Interaction
  - `shutdown()` -> `None` — Whenever the ViewportWorldInteraction is shut down, the interacts will shut down as well
  - `tick(delta_time)` -> `None` — Update for this interactor called by the ViewportWorldInteraction

### `unreal.ViewportWorldInteraction`
Inherits: `EditorWorldExtension` | Header: `ViewportWorldInteraction.h`

Viewport World Interaction

**Methods** (12):
  - `add_actor_to_exclude_from_hit_tests(actor_to_exclude_from_hit_tests)` -> `None` — Adds an actor to the list of actors to never allow an interactor to hit in the scene. No selection. No hover. Thereâs ...
  - `add_interactor(interactor)` -> `None` — Adds interactor to the worldinteraction
  - `get_head_transform()` -> `Transform` — Gets the transform of the viewport / userâs HMD in world space
  - `get_interactors()` -> `Array [ ViewportInteractor ]` — Gets all the interactors
  - `get_room_space_head_transform()` -> `Transform` — Gets the transform of the viewport / userâs HMD in room space
  - `get_room_transform()` -> `Transform`
  - `get_transform_gizmo_actor()` -> `BaseTransformGizmo` — Gets the transform gizmo actor, or returns null if we currently donât have one
  - `get_world_scale_factor()` -> `float` — Gets the world scale factor, which can be multiplied by a scale vector to convert to room space
  - `remove_interactor(interactor)` -> `None` — Removes interactor from the worldinteraction and removes the interactor from its paired interactor if any
  - `set_head_transform(new_head_transform)` -> `None`
  - `set_room_transform_for_next_frame(new_room_transform)` -> `None` — Set Room Transform for Next Frame
  - `set_world_to_meters_scale(new_world_to_meters_scale, compensate_room_world_scale = False)` -> `None` — Sets GNewWorldToMetersScale

### `unreal.GizmoHandleTypes`
Inherits: `EnumBase` | Header: `VIBaseTransformGizmo.h`

EGizmo Handle Types

**Properties** (4):
  - `ALL`: `GizmoHandleTypes = Ellipsis` — 0
  - `ROTATE`: `GizmoHandleTypes = Ellipsis` — 2
  - `SCALE`: `GizmoHandleTypes = Ellipsis` — 3
  - `TRANSLATE`: `GizmoHandleTypes = Ellipsis` — 1

### `unreal.HitResultGizmoFilterMode`
Inherits: `EnumBase` | Header: `ViewportInteractor.h`

Filter mode for GetHitResultFromLaserPointer

**Properties** (3):
  - `ALL`: `HitResultGizmoFilterMode = Ellipsis` — 0
  - `GIZMOS_ONLY`: `HitResultGizmoFilterMode = Ellipsis` — 2
  - `NO_GIZMOS`: `HitResultGizmoFilterMode = Ellipsis` — 1

### `unreal.ViewportInteractionDraggingMode`
Inherits: `EnumBase` | Header: `ViewportInteractionTypes.h`

Methods of dragging objects around in VR

**Properties** (8):
  - `ASSISTING_DRAG`: `ViewportInteractionDraggingMode = Ellipsis` — Weâre grabbing an object (or the world) that was already grabbed by the other hand 3
  - `INTERACTABLE`: `ViewportInteractionDraggingMode = Ellipsis` — Moving a custom interactable 6
  - `MATERIAL`: `ViewportInteractionDraggingMode = Ellipsis` — Dragging a material 7
  - `NOTHING`: `ViewportInteractionDraggingMode = Ellipsis` — Not dragging right now with this hand 0
  - `TRANSFORMABLES_AT_LASER_IMPACT`: `ViewportInteractionDraggingMode = Ellipsis` — Transformables locked to the impact point under the laser 2
  - `TRANSFORMABLES_FREELY`: `ViewportInteractionDraggingMode = Ellipsis` — Freely moving, rotating and scaling transformables with one or two hands 4
  - `TRANSFORMABLES_WITH_GIZMO`: `ViewportInteractionDraggingMode = Ellipsis` — Dragging transformables (e.g. actors, components, geometry elements) around using the transform gizm...
  - `WORLD`: `ViewportInteractionDraggingMode = Ellipsis` — Moving the world itself around (actually, moving the camera in such a way that it feels like youâr...
