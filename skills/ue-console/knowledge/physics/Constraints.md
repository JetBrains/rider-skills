# UE Python API — Constraints Module

**17 types** from the `Constraints` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConstraintsActor`, `ConstraintsManager`, `ConstraintsScriptingLibrary`, `ConstraintSubsystem`, `TickableConstraint`, `TickableLookAtConstraint`, `TickableParentConstraint`, `TickableRotationConstraint`, `TickableScaleConstraint`, `TickableTransformConstraint`, `TickableTranslationConstraint`, `TransformableComponentHandle`, `TransformableHandle`, `ConstraintsManager_OnConstraintAdded`, `ConstraintsManager_OnConstraintRemoved`, `ConstraintSubsystem_OnConstraintAddedToSystem`, `ConstraintSubsystem_OnConstraintRemovedFromSystem`

---

## Classes

### `unreal.ConstraintsActor`
Inherits: `Actor` | Header: `ConstraintsActor.h`

Constraints Actor

### `unreal.ConstraintsManager`
Inherits: `Object` | Header: `ConstraintsManager.h`

UConstraintsManager This object gathers the different static/nonanimated constraints of the level and is held by the ConstraintsActor (unique in the level) Note in 5.4 all of the constraints are owned...

**Properties** (2):
  - `on_constraint_added_bp`: `OnConstraintAdded` — [Read-Write] BP Delegate fired when constraints are added (OnConstraintAdded)
  - `on_constraint_removed_bp`: `OnConstraintRemoved` — [Read-Write] BP Delegate fired when constraints are removed (OnConstraintRemoved)

### `unreal.ConstraintsScriptingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ConstraintsScripting.h`

This is a set of helper functions to access various parts of the Sequencer and Control Rig API via Python and Blueprints.

**Methods** (7):
  - `add_constraint(world, parent_handle, child_handle, constraint, maintain_offset)` -> `bool` [classmethod] — Add Constraint
  - `create_from_type(world, type)` -> `TickableTransformConstraint` [classmethod] — Create Constraint based on the specified type.
  - `create_transformable_component_handle(world, scene_component, socket_name)` -> `TransformableComponentHandle` [classmethod] — Create the transformable handle that deals with getting and setting transforms on this scene component
  - `create_transformable_handle(world, object, attachment_name = 'None')` -> `TransformableHandle` [classmethod] — Create the transformable handle that deals with getting and setting transforms on this object
  - `get_constraints_array(world)` -> `Array [ TickableConstraint ]` [classmethod] — Get a copy of the constraints in the current world
  - `remove_constraint(world, index)` -> `bool` [classmethod] — Remove constraint at specified index
  - `remove_this_constraint(world, tickable_constraint)` -> `bool` [classmethod] — Remove specified constraint

### `unreal.ConstraintSubsystem`
Inherits: `EngineSubsystem` | Header: `ConstraintSubsystem.h`

Constraint Subsystem

**Properties** (2):
  - `on_constraint_added_to_system_bp`: `OnConstraintAddedToSystem` — [Read-Write] BP Delegate fired when constraints are added (OnConstraintAddedToSystem)
  - `on_constraint_removed_from_system_bp`: `OnConstraintRemovedFromSystem` — [Read-Write] BP Delegate fired when constraints are removed (OnConstraintRemovedFromSystem)

### `unreal.TickableConstraint`
Inherits: `Object` | Header: `ConstraintsManager.h`

UTickableConstraint Represents the basic interface of constraint within the constraints manager.

**Properties** (1):
  - `active`: `bool` — [Read-Write]
todo: documentation. (bool)

### `unreal.TickableLookAtConstraint`
Inherits: `TickableTransformConstraint` | Header: `TransformConstraint.h`

UTickableLookAtConstraint

**Properties** (1):
  - `axis`: `Vector` — [Read-Write] Defines the aiming axis. (Vector)

### `unreal.TickableParentConstraint`
Inherits: `TickableTransformConstraint` | Header: `TransformConstraint.h`

UTickableParentConstraint

**Properties** (3):
  - `offset_transform`: `Transform` — [Read-Write] Defines the local childâs transform offset in the parent space. (Transform)
  - `scaling`: `bool` — [Read-Write] Defines whether we propagate the parent scale. (bool)
  - `transform_filter`: `TransformFilter` — [Read-Write] Defines which translation/rotation/scale axis are constrained. (TransformFilter)

### `unreal.TickableRotationConstraint`
Inherits: `TickableTransformConstraint` | Header: `TransformConstraint.h`

UTickableRotationConstraint

**Properties** (2):
  - `axis_filter`: `FilterOptionPerAxis` — [Read-Write] Defines which rotation axis is constrained. (FilterOptionPerAxis)
  - `offset_rotation`: `Quat` — [Read-Write] Defines the local childâs rotation offset in the parent space. (Quat)

### `unreal.TickableScaleConstraint`
Inherits: `TickableTransformConstraint` | Header: `TransformConstraint.h`

UTickableScaleConstraint

**Properties** (2):
  - `axis_filter`: `FilterOptionPerAxis` — [Read-Write] Defines which scale axis is constrained. (FilterOptionPerAxis)
  - `offset_scale`: `Vector` — [Read-Write] Defines the local childâs scale offset in the parent space. (Vector)

### `unreal.TickableTransformConstraint`
Inherits: `TickableConstraint` | Header: `TransformConstraint.h`

UTickableTransformConstraint

**Properties** (4):
  - `child_trs_handle`: `TransformableHandle` — [Read-Write] The transformable handle representing the child of that constraint. (TransformableHandl...
  - `dynamic_offset`: `bool` — [Read-Write] Should the child be able to change itâs offset dynamically. (bool)
  - `maintain_offset`: `bool` — [Read-Write] Should that constraint maintain the default offset. (bool)
  - `parent_trs_handle`: `TransformableHandle` — [Read-Write] The transformable handle representing the parent of that constraint. (TransformableHand...

### `unreal.TickableTranslationConstraint`
Inherits: `TickableTransformConstraint` | Header: `TransformConstraint.h`

UTickableTranslationConstraint

**Properties** (2):
  - `axis_filter`: `FilterOptionPerAxis` — [Read-Write] Defines which translation axis is constrained. (FilterOptionPerAxis)
  - `offset_translation`: `Vector` — [Read-Write] Defines the local childâs translation offset in the parent space. (Vector)

### `unreal.TransformableComponentHandle`
Inherits: `TransformableHandle` | Header: `TransformableHandle.h`

Transformable Component Handle

**Properties** (2):
  - `component`: `SceneComponent` [Read-Only] — [Read-Only] The Component that this handle is pointing at. (SceneComponent)
  - `socket_name`: `Name` [Read-Only] — [Read-Only] Optional socket name on Component. (Name)

### `unreal.TransformableHandle`
Inherits: `Object` | Header: `TransformableHandle.h`

UTransformableHandle

**Properties** (1):
  - `constraint_binding_id`: `MovieSceneObjectBindingID` [Read-Only] — [Read-Only] possible bindingID (MovieSceneObjectBindingID)

### `unreal.ConstraintsManager_OnConstraintAdded`
Inherits: `MulticastDelegateBase` | Header: `ConstraintsManager.h`

Dynamic blueprintable delegates for knowing when a constraints are added or deleted

### `unreal.ConstraintsManager_OnConstraintRemoved`
Inherits: `MulticastDelegateBase` | Header: `ConstraintsManager.h`

On Constraint Removed Delegate Signature

### `unreal.ConstraintSubsystem_OnConstraintAddedToSystem`
Inherits: `MulticastDelegateBase` | Header: `ConstraintSubsystem.h`

Dynamic blueprintable delegates for knowing when a constraints are added or deleted

### `unreal.ConstraintSubsystem_OnConstraintRemovedFromSystem`
Inherits: `MulticastDelegateBase` | Header: `ConstraintSubsystem.h`

On Constraint Removed from System Delegate Signature
