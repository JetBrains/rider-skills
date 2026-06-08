# UE Python API — ControlRigEditor Module

**55 types** from the `ControlRigEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimDetailsBool`, `AnimDetailsEnum`, `AnimDetailsFloat`, `AnimDetailsInteger`, `AnimDetailsLocation`, `AnimDetailsRotation`, `AnimDetailsScale`, `AnimDetailsVector2D`, `AnimLayerControlRigObject`, `AnimLayerItem`, `AnimLayerObjects`, `AnimLayerPropertyAndChannels`, `AnimLayerSceneObject`, `AnimLayerSectionItem`, `AnimLayerSelectionSet`, `AnimLayerState`, `ControlRigForWorldTransforms`, `ControlRigGraphNodeContextMenuContext`, `ControlRigRigHierarchyDragAndDropContext`, `ControlRigRigHierarchyToGraphDragAndDropContext`, ... (55 total)

---

## Classes

### `unreal.AnimDetailsBool`
Inherits: `StructBase` | Header: `AnimDetailsProxyBool.h`

A boolean value in anim details

**Properties** (1):
  - `bool`: `bool` — [Read-Write] (bool)

### `unreal.AnimDetailsEnum`
Inherits: `StructBase` | Header: `AnimDetailsProxyEnum.h`

An enum value in anim details

### `unreal.AnimDetailsFloat`
Inherits: `StructBase` | Header: `AnimDetailsProxyFloat.h`

A floating point value in anim details

**Properties** (1):
  - `float`: `float` — [Read-Write] (double)

### `unreal.AnimDetailsInteger`
Inherits: `StructBase` | Header: `AnimDetailsProxyInteger.h`

An integer value in anim details

**Properties** (1):
  - `integer`: `int` — [Read-Write] (int64)

### `unreal.AnimDetailsLocation`
Inherits: `StructBase` | Header: `AnimDetailsProxyLocation.h`

A location value in anim details

**Properties** (3):
  - `lx`: `float` — [Read-Write] (double)
  - `ly`: `float` — [Read-Write] (double)
  - `lz`: `float` — [Read-Write] (double)

### `unreal.AnimDetailsRotation`
Inherits: `StructBase` | Header: `AnimDetailsProxyRotation.h`

A rotation value in anim details

**Properties** (3):
  - `rx`: `float` — [Read-Write] (double)
  - `ry`: `float` — [Read-Write] (double)
  - `rz`: `float` — [Read-Write] (double)

### `unreal.AnimDetailsScale`
Inherits: `StructBase` | Header: `AnimDetailsProxyScale.h`

A scale value in anim details

**Properties** (3):
  - `sx`: `float` — [Read-Write] (double)
  - `sy`: `float` — [Read-Write] (double)
  - `sz`: `float` — [Read-Write] (double)

### `unreal.AnimDetailsVector2D`
Inherits: `StructBase` | Header: `AnimDetailsProxyVector2D.h`

A vector 2D value in anim details

**Properties** (2):
  - `x`: `float` — [Read-Write] (double)
  - `y`: `float` — [Read-Write] (double)

### `unreal.AnimLayerControlRigObject`
Inherits: `StructBase` | Header: `AnimLayers.h`

Anim Layer Control Rig Object

**Properties** (2):
  - `control_names`: `None` — [Read-Write] (Array[Name])
  - `control_rig`: `ControlRig` — [Read-Write] (ControlRig)

### `unreal.AnimLayerItem`
Inherits: `StructBase` | Header: `AnimLayers.h`

individual layer items that make up the layer

**Properties** (1):
  - `section_items`: `None` — [Read-Write] (Array[AnimLayerSectionItem])

### `unreal.AnimLayerObjects`
Inherits: `StructBase` | Header: `AnimLayers.h`

Anim Layer Objects

**Properties** (2):
  - `control_rig_objects`: `None` — [Read-Write] (Array[AnimLayerControlRigObject])
  - `scene_objects`: `None` — [Read-Write] (Array[AnimLayerSceneObject])

### `unreal.AnimLayerPropertyAndChannels`
Inherits: `StructBase` | Header: `AnimLayers.h`

Name of a property and control and the specific channels that make up the layer

**Properties** (1):
  - `name`: `Name` — [Read-Write] Name of the property or control (Name)

### `unreal.AnimLayerSceneObject`
Inherits: `StructBase` | Header: `AnimLayers.h`

Anim Layer Scene Object

**Properties** (1):
  - `scene_object_or_component`: `Object` — [Read-Write] (Object)

### `unreal.AnimLayerSectionItem`
Inherits: `StructBase` | Header: `AnimLayers.h`

The set with itâs section

**Properties** (2):
  - `anim_layer_set`: `AnimLayerSelectionSet` — [Read-Write] (AnimLayerSelectionSet)
  - `section`: `MovieSceneSection` — [Read-Write] (MovieSceneSection)

### `unreal.AnimLayerSelectionSet`
Inherits: `StructBase` | Header: `AnimLayers.h`

Bound object/control rig and the properties/channels it is made of A layer will consist of a bunch of these

**Properties** (2):
  - `bound_object`: `Object` — [Read-Write] (Object)
  - `names`: `None` — [Read-Write] bound object is either a CR or a bound sequencer object (Map[Name,AnimLayerPropertyAndC...

### `unreal.AnimLayerState`
Inherits: `StructBase` | Header: `AnimLayers.h`

state and properties of a layer

**Properties** (7):
  - `active`: `bool` — [Read-Write] (bool)
  - `keyed`: `CheckBoxState` — [Read-Write] (CheckBoxState)
  - `lock`: `bool` — [Read-Write] (bool)
  - `name`: `Text` — [Read-Write] (Text)
  - `selected`: `CheckBoxState` — [Read-Write] (CheckBoxState)
  - `type`: `int` — [Read-Write] (int32)
  - `weight`: `float` — [Read-Write] (double)

### `unreal.ControlRigForWorldTransforms`
Inherits: `StructBase` | Header: `ControlRigSnapper.h`

Specification containing a Control Rig and a list of selected Controls we use to get World Transforms for Snapping.

**Properties** (2):
  - `control_names`: `None` — [Read-Write] (Array[Name])
  - `control_rig`: `ControlRig` — [Read-Write] (ControlRig)

### `unreal.ControlRigGraphNodeContextMenuContext`
Inherits: `StructBase` | Header: `ControlRigContextMenuContext.h`

Control Rig Graph Node Context Menu Context

**Properties** (3):
  - `graph`: `RigVMGraph` [Read-Only] — [Read-Only] The graph associated with this context. (RigVMGraph)
  - `node`: `RigVMNode` [Read-Only] — [Read-Only] The node associated with this context. (RigVMNode)
  - `pin`: `RigVMPin` [Read-Only] — [Read-Only] The pin associated with this context; may be NULL when over a node. (RigVMPin)

### `unreal.ControlRigRigHierarchyDragAndDropContext`
Inherits: `StructBase` | Header: `ControlRigContextMenuContext.h`

Control Rig Rig Hierarchy Drag and Drop Context

**Properties** (2):
  - `dragged_hierarchy_keys`: `None` [Read-Only] — [Read-Only] (Array[RigHierarchyKey])
  - `target_hierarchy_key`: `RigHierarchyKey` [Read-Only] — [Read-Only] (RigHierarchyKey)

### `unreal.ControlRigRigHierarchyToGraphDragAndDropContext`
Inherits: `StructBase` | Header: `ControlRigContextMenuContext.h`

Control Rig Rig Hierarchy to Graph Drag and Drop Context

**Properties** (1):
  - `dragged_hierarchy_keys`: `None` [Read-Only] — [Read-Only] (Array[RigHierarchyKey])

### `unreal.ControlRigSequencerBindingProxy`
Inherits: `StructBase` | Header: `ControlRigSequencerEditorLibrary.h`

Control Rig Sequencer Binding Proxy

**Properties** (3):
  - `control_rig`: `ControlRig` [Read-Only] — [Read-Only] (ControlRig)
  - `proxy`: `MovieSceneBindingProxy` [Read-Only] — [Read-Only] (MovieSceneBindingProxy)
  - `track`: `MovieSceneControlRigParameterTrack` [Read-Only] — [Read-Only] (MovieSceneControlRigParameterTrack)

### `unreal.ControlRigSnapperSelection`
Inherits: `StructBase` | Header: `ControlRigSnapper.h`

Selection from the UI to Snap To. Contains a set of Actors and/or Control Rigs to snap onto or from.

**Properties** (2):
  - `actors`: `None` — [Read-Write] (Array[ActorForWorldTransforms])
  - `control_rigs`: `None` — [Read-Write] (Array[ControlRigForWorldTransforms])

### `unreal.MergeAnimLayerSettings`
Inherits: `StructBase` | Header: `AnimLayers.h`

Merge Anim Layer Settings

**Properties** (4):
  - `baking_key_settings`: `BakingKeySettings` — [Read-Write] (BakingKeySettings)
  - `frame_increment`: `int` — [Read-Write] (int32)
  - `reduce_keys`: `bool` — [Read-Write] (bool)
  - `tolerance_percentage`: `float` — [Read-Write] (float)

### `unreal.MultiControlRigElementSelection`
Inherits: `StructBase` | Header: `ControlRigEditMode.h`

Multi Control Rig Element Selection

### `unreal.RigSpacePickerBakeSettings`
Inherits: `StructBase` | Header: `RigSpacePickerBakeSettings.h`

Rig Space Picker Bake Settings

**Properties** (6):
  - `end_frame`: `FrameNumber` — [Read-Write] DEPRECATED 5.3
deprecated: Use Settings.EndFrame instead (FrameNumber)
  - `reduce_keys`: `bool` — [Read-Write] DEPRECATED 5.3
deprecated: Use Settings.bReduceKeys instead (bool)
  - `settings`: `BakingAnimationKeySettings` — [Read-Write] (BakingAnimationKeySettings)
  - `start_frame`: `FrameNumber` — [Read-Write] DEPRECATED 5.3
deprecated: Use Settings.StartFrame instead (FrameNumber)
  - `target_space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `tolerance`: `float` — [Read-Write] DEPRECATED 5.3
deprecated: Use Settings.Tolerance instead (float)

### `unreal.AnimDetailsProxyBase`
Inherits: `Object` | Header: `AnimDetailsProxyBase.h`

Base class for anim details proxies. Anim details proxies can handle a property bound in sequencer, and the related controls if the bound object uses a control rig.

### `unreal.AnimDetailsProxyBool`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyBool.h`

Handles a boolean value property in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `bool`: `AnimDetailsBool` — [Read-Write] (AnimDetailsBool)

### `unreal.AnimDetailsProxyEnum`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyEnum.h`

Handles an enum property bound in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `enum`: `AnimDetailsEnum` — [Read-Write] (AnimDetailsEnum)

### `unreal.AnimDetailsProxyFloat`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyFloat.h`

Handles an floating point property bound in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `float`: `AnimDetailsFloat` — [Read-Write] (AnimDetailsFloat)

### `unreal.AnimDetailsProxyInteger`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyInteger.h`

Handles an integer property bound in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `integer`: `AnimDetailsInteger` — [Read-Write] (AnimDetailsInteger)

### `unreal.AnimDetailsProxyLocation`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyLocation.h`

Handles a location property bound in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `location`: `AnimDetailsLocation` — [Read-Write] (AnimDetailsLocation)

### `unreal.AnimDetailsProxyRotation`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyRotation.h`

Handles a rotation property bound in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `rotation`: `AnimDetailsRotation` — [Read-Write] (AnimDetailsRotation)

### `unreal.AnimDetailsProxyScale`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyScale.h`

Handles a scale property bound in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `scale`: `AnimDetailsScale` — [Read-Write] (AnimDetailsScale)

### `unreal.AnimDetailsProxyTransform`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyTransform.h`

Handles a transform property bound in sequencer, and the related controls if the bound object uses a control rig

**Properties** (3):
  - `location`: `AnimDetailsLocation` — [Read-Write] (AnimDetailsLocation)
  - `rotation`: `AnimDetailsRotation` — [Read-Write] (AnimDetailsRotation)
  - `scale`: `AnimDetailsScale` — [Read-Write] (AnimDetailsScale)

### `unreal.AnimDetailsProxyVector2D`
Inherits: `AnimDetailsProxyBase` | Header: `AnimDetailsProxyVector2D.h`

Handles a vector 2D property bound in sequencer, and the related control if the bound object uses a control rig

**Properties** (1):
  - `vector2d`: `AnimDetailsVector2D` — [Read-Write] (AnimDetailsVector2D)

### `unreal.AnimLayer`
Inherits: `Object` | Header: `AnimLayers.h`

Anim Layer

**Methods** (16):
  - `add_selected_in_sequencer()` -> `bool` — Add Selected in Sequencer
  - `get_active()` -> `bool` — Get Active
  - `get_keyed()` -> `CheckBoxState` — Get Keyed
  - `get_lock()` -> `bool` — Get Lock
  - `get_name()` -> `Text` — Get Name
  - `get_selected()` -> `CheckBoxState` — Get Selected
  - `get_type()` -> `AnimLayerType` — Get Type
  - `get_weight()` -> `double` — Get Weight
  - `remove_selected_in_sequencer()` -> `bool` — Remove Selected in Sequencer
  - `set_active(active)` -> `None` — Set Active
  - `set_keyed()` -> `None` — Set Keyed
  - `set_lock(lock)` -> `None` — Set Lock
  - `set_name(name)` -> `None` — Set Name
  - `set_selected(selected, clear_selection)` -> `None` — Set Selected
  - `set_type(layer_type)` -> `None` — Set Type
  - `set_weight(weight)` -> `None` — Set Weight

### `unreal.AnimLayers`
Inherits: `AssetUserData` | Header: `AnimLayers.h`

Link To Set of Anim Sequences that we may belinked to.

**Properties** (1):
  - `anim_layers`: `None` — [Read-Write] (Array[AnimLayer])

### `unreal.AnimLayerWeightProxy`
Inherits: `Object` | Header: `AnimLayers.h`

Anim Layer Weight Proxy

**Properties** (1):
  - `weight`: `float` — [Read-Write] (double)

### `unreal.AnimSequenceConverterFactory`
Inherits: `AnimSequenceFactory` | Header: `AnimSequenceConverterFactory.h`

Anim Sequence Converter Factory

### `unreal.BakeToControlRigSettings`
Inherits: `Object` | Header: `BakeToControlRigSettings.h`

Bake to Control Rig Settings

### `unreal.ControlRigBlueprintFactory`
Inherits: `Factory` | Header: `ControlRigBlueprintFactory.h`

Control Rig Blueprint Factory

**Methods** (2):
  - `create_control_rig_from_skeletal_mesh_or_skeleton(selected_object, modular_rig = False)` -> `ControlRigBlueprint` [classmethod] — Create a new control rig asset within the contents space of the project based on a skeletal mesh or skeleton object.
  - `create_new_control_rig_asset(desired_package_path, modular_rig = False)` -> `ControlRigBlueprint` [classmethod] — Create a new control rig asset within the contents space of the project.

### `unreal.ControlRigBlueprintLibrary`
Inherits: `RigVMBlueprintLibrary` | Header: `ControlRigBlueprintEditorLibrary.h`

Control Rig Blueprint Editor Library

**Methods** (10):
  - `cast_to_control_rig_blueprint(as_control_rig_blueprint=ControlRigBlueprint)` [classmethod] — Cast to Control Rig Blueprint
  - `get_available_rig_modules()` -> `Array [ RigModuleDescription ]` [classmethod] — Get Available Rig Modules
  - `get_available_rig_units()` -> `Array [ Struct ]` [classmethod] — Get Available Rig Units
  - `get_currently_open_rig_blueprints()` -> `Array [ ControlRigBlueprint ]` [classmethod] — Get Currently Open Rig Blueprints
  - `get_hierarchy(rig_blueprint)` -> `RigHierarchy` [classmethod] — Get Hierarchy
  - `get_hierarchy_controller(rig_blueprint)` -> `RigHierarchyController` [classmethod] — Get Hierarchy Controller
  - `get_preview_mesh(rig_blueprint)` -> `SkeletalMesh` [classmethod] — Get Preview Mesh
  - `request_control_rig_init(rig_blueprint)` -> `None` [classmethod] — Request Control Rig Init
  - `set_preview_mesh(rig_blueprint, preview_mesh, mark_as_dirty = True)` -> `None` [classmethod] — Set Preview Mesh
  - `setup_all_editor_menus()` -> `None` [classmethod] — Setup All Editor Menus

### `unreal.ControlRigContextMenuContext`
Inherits: `Object` | Header: `ControlRigContextMenuContext.h`

Control Rig Context Menu Context

**Methods** (6):
  - `get_control_rig()` -> `ControlRig` — Get the active control rig instance in the viewport
  - `get_control_rig_blueprint()` -> `ControlRigBlueprint` — Get the control rig blueprint that we are editing
  - `get_graph_node_context_menu_context()` -> `ControlRigGraphNodeContextMenuContext` — Returns context for graph node context menu
  - `get_rig_hierarchy_drag_and_drop_context()` -> `ControlRigRigHierarchyDragAndDropContext` — Returns context for a drag & drop action that contains source and target element keys
  - `get_rig_hierarchy_to_graph_drag_and_drop_context()` -> `ControlRigRigHierarchyToGraphDragAndDropContext` — Returns context for the menu that shows up when drag and drop from Rig Hierarchy to the Rig Graph
  - `is_alt_down()` -> `bool` — Returns true if either alt key is down

### `unreal.ControlRigSequencerLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ControlRigSequencerEditorLibrary.h`

This is a set of helper functions to access various parts of the Sequencer and Control Rig API via Python and Blueprints.

**Methods** (100):
  - `add_anim_layer_from_selection()` -> `int32` [classmethod] — Add anim layer from objects selected in Sequencer
  - `add_constraint(world, type, child, parent, maintain_offset)` -> `TickableConstraint` [classmethod] — Add a constraint possibly adding to sequencer also if one is open.
  - `bake_constraint(world, constraint, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Bake the constraint to keys based on the passed in frames. This will use the open sequencer to bake. See ConstraintsScri...
  - `bake_constraints(world, settings)` -> `Array[TickableConstraint] or None` [classmethod] — Bake the constraint to keys based on the passed in settings. This will use the open sequencer to bake. See ConstraintsSc...
  - `bake_control_rig_space(sequence, control_rig, control_names, settings, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Bake specified Control Rig Controls to a specified Space based upon the current settings
  - `bake_to_control_rig(world, level_sequence, control_rig_class, export_options, reduce_keys, tolerance, binding, reset_controls = True)` -> `bool` [classmethod] — Bake the current animation in the binding to a Control Rig track
  - `blend_values_on_selected(level_sequence, blend_operation, blend_value)` -> `bool` [classmethod] — Peform specified blend operation based upon selected keys in the curve editor or selected control rig controls
  - `collapse_control_rig_anim_layers(sequence, track, key_reduce = False, tolerance = 0.001000)` -> `bool` [classmethod]
  - `collapse_control_rig_anim_layers_with_settings(sequence, track, settings)` -> `bool` [classmethod]
  - `compensate(constraint, time, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Compensate constraint at the specfied time
  - `compensate_all(constraint)` -> `bool` [classmethod] — Compensate constraint at all keys
  - `delete_anim_layer(index)` -> `bool` [classmethod] — Delete anim layer at specified index
  - `delete_constraint_key(constraint, constraint_section, time, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Delete the Key for the Constraint at the specified time.
  - `delete_control_rig_space(sequence, control_rig, control_name, time, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Delete the Control Rig Space Key for the Control at the specified time. This will delete any attached Control Rig keys a...
  - `duplicate_anim_layer(index)` -> `int32` [classmethod] — Duplicate anim layer at specified index
  - `export_anim_sequence_from_sequencer(anim_sequence, export_option, binding, create_link)` -> `bool` [classmethod] — AnimSequence: The AnimSequence to save into. * ExportOption: The export options for the sequence. * InBinding: Binding t...
  - `export_fbx_from_control_rig_section(sequence, section, export_fbx_control_rig_settings)` -> `bool` [classmethod] — Exports an FBX from the given control rig section.
  - `find_or_create_control_rig_component_track(world, level_sequence, binding)` -> `Array [ MovieSceneTrack ]` [classmethod] — Find or create a Control Rig Component
  - `find_or_create_control_rig_track(world, level_sequence, control_rig_class, binding, is_layered_control_rig = False)` -> `MovieSceneTrack` [classmethod] — Find or create a Control Rig track of a specific class based upon the binding
  - `get_actor_world_transform(level_sequence, actor, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Transform` [classmethod] — Get Actors World Transform at a specific time
  - `get_actor_world_transforms(level_sequence, actor, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ Transform ]` [classmethod] — Get Actors World Transforms at specific times
  - `get_anim_layer_index(anim_layer)` -> `int32` [classmethod] — Helper function to get the index in the anim layer array from the anim layer
  - `get_anim_layers()` -> `Array [ AnimLayer ]` [classmethod] — Get the animation layer objects
  - `get_constraint_keys(constraint, constraint_section, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `(out_bools=Array[bool], out_frames=Array[FrameNumber]) or None` [classmethod] — Get the constraint keys for the specified constraint
  - `get_constraints_for_handle(world, child)` -> `Array [ TickableConstraint ]` [classmethod] — Get all constraints for this object, which is described by a transformable handle
  - `get_control_rig_priority_order(section)` -> `int32` [classmethod] — Get Control Rig prirority order
  - `get_control_rig_world_transform(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Transform` [classmethod] — Get ControlRig Controlâs World Transform at a specific time
  - `get_control_rig_world_transforms(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ Transform ]` [classmethod] — Get ControlRig Controlâs World Transforms at specific times
  - `get_control_rigs(level_sequence)` -> `Array [ ControlRigSequencerBindingProxy ]` [classmethod] — Get all of the control rigs and their bindings in the level sequence
  - `get_controls_mask(section, control_name)` -> `bool` [classmethod] — Get the controls mask for the given ControlName
  - `get_default_parent_key()` -> `RigElementKey` [classmethod]
  - `get_fk_control_rig_apply_mode(control_rig)` -> `ControlRigFKRigExecuteMode` [classmethod] — Get FKControlRig Apply Mode.
  - `get_local_control_rig_bool(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Get ControlRig Controlâs bool value at a specific time
  - `get_local_control_rig_bools(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ bool ]` [classmethod] — Get ControlRig Controlâs bool values at specific times
  - `get_local_control_rig_euler_transform(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `EulerTransform` [classmethod] — Get ControlRig Controlâs EulerTransform value at a specific time
  - `get_local_control_rig_euler_transforms(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ EulerTransform ]` [classmethod] — Get ControlRig Controlâs EulerTransform values at specific times
  - `get_local_control_rig_float(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `float` [classmethod] — Get ControlRig Controlâs float value at a specific time
  - `get_local_control_rig_floats(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ float ]` [classmethod] — Get ControlRig Controlâs float values at specific times
  - `get_local_control_rig_int(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `int32` [classmethod] — Get ControlRig Controlâs integer value at a specific time
  - `get_local_control_rig_ints(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ int32 ]` [classmethod] — Get ControlRig Controlâs integer values at specific times
  - `get_local_control_rig_position(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Vector` [classmethod] — Get ControlRig Controlâs Position value at a specific time
  - `get_local_control_rig_positions(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ Vector ]` [classmethod] — Get ControlRig Controlâs Position values at specific times
  - `get_local_control_rig_rotator(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Rotator` [classmethod] — Get ControlRig Controlâs Rotator value at a specific time
  - `get_local_control_rig_rotators(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ Rotator ]` [classmethod] — Get ControlRig Controlâs Rotator values at specific times
  - `get_local_control_rig_scale(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Vector` [classmethod] — Get ControlRig Controlâs Scale value at a specific time
  - `get_local_control_rig_scales(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ Vector ]` [classmethod] — Get ControlRig Controlâs Scale values at specific times
  - `get_local_control_rig_transform(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Transform` [classmethod] — Get ControlRig Controlâs Transform value at a specific time
  - `get_local_control_rig_transform_no_scale(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `TransformNoScale` [classmethod] — Get ControlRig Controlâs TransformNoScale value at a specific time
  - `get_local_control_rig_transform_no_scales(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ TransformNoScale ]` [classmethod] — Get ControlRig Controlâs TransformNoScale values at specific times
  - `get_local_control_rig_transforms(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ Transform ]` [classmethod] — Get ControlRig Controlâs Transform values at specific times
  - `get_local_control_rig_vector2_ds(level_sequence, control_rig, control_name, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Array [ Vector2D ]` [classmethod] — Get ControlRig Controlâs Vector2D values at specific times
  - `get_local_control_rig_vector2d(level_sequence, control_rig, control_name, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `Vector2D` [classmethod] — Get ControlRig Controlâs Vector2D value at a specific time
  - `get_skeletal_mesh_component_world_transform(level_sequence, skeletal_mesh_component, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, reference_name = 'None')` -> `Transform` [classmethod] — Get SkeletalMeshComponent World Transform at a specific time
  - `get_skeletal_mesh_component_world_transforms(level_sequence, skeletal_mesh_component, frames, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, reference_name = 'None')` -> `Array [ Transform ]` [classmethod] — Get SkeletalMeshComponents World Transforms at specific times
  - `get_visible_control_rigs()` -> `Array [ ControlRig ]` [classmethod] — Get all of the visible control rigs in the level
  - `get_world_space_reference_key()` -> `RigElementKey` [classmethod]
  - `hide_all_controls(section)` -> `None` [classmethod] — Hides all of the controls for the given section
  - `import_fbx_to_control_rig_track(world, sequence, track, section, selected_control_rig_names, import_fbx_control_rig_settings, import_filename)` -> `bool` [classmethod]
  - `is_fk_control_rig(control_rig)` -> `bool` [classmethod] — Whether or not the control rig is an FK Control Rig.
  - `is_layered_control_rig(control_rig)` -> `bool` [classmethod] — Whether or not the control rig is an Layered Control Rig.
  - `load_anim_sequence_into_control_rig_section(movie_scene_section, anim_sequence, skel_mesh_comp, start_frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, key_reduce = False, tolerance = 0.001000, interpolation = MovieSceneKeyInterpolation.SMART_AUTO, reset_controls = True)` -> `bool` [classmethod] — Load Anim Sequence Into Control Rig Section deprecated: Use LoadAnimSequenceIntoControlRigSectionWithRange that takes Us...
  - `load_anim_sequence_into_control_rig_section_with_range(movie_scene_section, anim_sequence, skel_mesh_comp, start_frame, use_custom_anim_range, anim_start_range, anim_end_range, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, key_reduce = False, tolerance = 0.001000, interpolation = MovieSceneKeyInterpolation.SMART_AUTO, reset_controls = True, onto_selected_controls = False)` -> `bool` [classmethod] — Load anim sequence into this control rig section
  - `merge_anim_layers(indices)` -> `bool` [classmethod] — Merge Anim Layers deprecated: Use MergeAnimLayersWithSettings that takes FMergeAnimLayerSettings
  - `merge_anim_layers_with_settings(indices, merge_anim_layer_settings)` -> `bool` [classmethod] — Merge specified anim layers into one layer. Will merge onto the anim layer with the lowest index
  - `move_constraint_key(constraint, constraint_section, time, new_time, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Move the constraint active key in the current open Sequencer
  - `move_control_rig_space(sequence, control_rig, control_name, time, new_time, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Move the Control Rig Space Key for the Control at the specified time to the new time. This will also move any Control Ri...
  - `rename_control_rig_control_channels(sequence, control_rig, old_control_names, new_control_names)` -> `bool` [classmethod] — Rename the Control Rig Channels in Sequencer to the specified new control names, which should be present on the Control ...
  - `set_constraint_active_key(constraint, active, frame, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Set the constraint active key in the current open Sequencer
  - `set_control_rig_apply_mode(control_rig, apply_mode)` -> `bool` [classmethod] — Set the FK Control Rig to apply mode
  - `set_control_rig_layered_mode(track, set_is_layered)` -> `bool` [classmethod]
  - `set_control_rig_priority_order(section, priority_order)` -> `None` [classmethod] — Set Control Rig priority order
  - `set_control_rig_space(sequence, control_rig, control_name, space_key, time, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod]
  - `set_control_rig_world_transform(level_sequence, control_rig, control_name, frame, world_transform, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs World Transform at a specific time
  - `set_control_rig_world_transforms(level_sequence, control_rig, control_name, frames, world_transforms, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs World Transforms at a specific times.
  - `set_controls_mask(section, control_names, visible)` -> `None` [classmethod] — Set the controls mask for the given ControlNames
  - `set_local_control_rig_bool(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs bool value at specific time
  - `set_local_control_rig_bools(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs bool values at specific times
  - `set_local_control_rig_euler_transform(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs EulerTransform value at specific time
  - `set_local_control_rig_euler_transforms(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs EulerTransform values at specific times
  - `set_local_control_rig_float(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs float value at specific time
  - `set_local_control_rig_floats(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs float values at specific times
  - `set_local_control_rig_int(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs int value at specific time
  - `set_local_control_rig_ints(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs int values at specific times
  - `set_local_control_rig_position(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs Position value at specific time
  - `set_local_control_rig_positions(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs Position values at specific times
  - `set_local_control_rig_rotator(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs Rotator value at specific time
  - `set_local_control_rig_rotators(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs Rotator values at specific times
  - `set_local_control_rig_scale(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs Scale value at specific time
  - `set_local_control_rig_scales(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs Scale values at specific times
  - `set_local_control_rig_transform(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs Transform value at specific time
  - `set_local_control_rig_transform_no_scale(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs TransformNoScale value at specific time
  - `set_local_control_rig_transform_no_scales(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs TransformNoScale values at specific times
  - `set_local_control_rig_transforms(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs Transform values at specific times
  - `set_local_control_rig_vector2_ds(level_sequence, control_rig, control_name, frames, values, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `None` [classmethod] — Set ControlRig Controlâs Vector2D values at specific times
  - `set_local_control_rig_vector2d(level_sequence, control_rig, control_name, frame, value, time_unit = MovieSceneTimeUnit.DISPLAY_RATE, set_key = True)` -> `None` [classmethod] — Set ControlRig Controlâs Vector2D value at specific time
  - `show_all_controls(section)` -> `None` [classmethod] — Shows all of the controls for the given section
  - `smart_reduce(movie_scene_section)` -> `SmartReduceParams or None` [classmethod] — Peform new Smart Reduce filter over the specified control rig section in the current open level sequence. Note existing ...
  - `snap_control_rig(level_sequence, start_frame, end_frame, children_to_snap, parent_to_snap, snap_settings, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Peform a Snap operation to snap the children to the parent.
  - `space_compensate(control_rig, time, time_unit = MovieSceneTimeUnit.DISPLAY_RATE)` -> `bool` [classmethod] — Perform compensation for any spaces at the specified time for the specified control rig
  - `tween_control_rig(level_sequence, control_rig, tween_value)` -> `bool` [classmethod] — Peform a Tween operation on the current active sequencer time(must be visible).

### `unreal.ControlRigShapeLibraryFactory`
Inherits: `Factory` | Header: `ControlRigGizmoLibraryFactory.h`

Control Rig Shape Library Factory

### `unreal.ControlRigSkeletalMeshComponent`
Inherits: `DebugSkelMeshComponent` | Header: `ControlRigSkeletalMeshComponent.h`

Control Rig Skeletal Mesh Component

### `unreal.ControlRigSnapSettings`
Inherits: `Object` | Header: `ControlRigSnapSettings.h`

Control Rig Snap Settings

**Properties** (8):
  - `baking_key_settings`: `BakingKeySettings` — [Read-Write] (BakingKeySettings)
  - `frame_increment`: `int` — [Read-Write] (int32)
  - `keep_offset`: `bool` — [Read-Write] When snapping keep offset, if false snap completely (bool)
  - `reduce_keys`: `bool` — [Read-Write] (bool)
  - `snap_position`: `bool` — [Read-Write] When snapping, also snap position (bool)
  - `snap_rotation`: `bool` — [Read-Write] When snapping, also snap rotation (bool)
  - `snap_scale`: `bool` — [Read-Write] When snapping, also snap scale (bool)
  - `tolerance`: `float` — [Read-Write] (float)

### `unreal.CreateControlPoseAssetRigSettings`
Inherits: `Object` | Header: `CreateControlAssetRigSettings.h`

Create Control Pose Asset Rig Settings

### `unreal.LoadAnimToControlRigSettings`
Inherits: `Object` | Header: `LoadAnimToControlRigSettings.h`

settings used when loading animation sequences into a control rig section

### `unreal.AnimLayerType`
Inherits: `EnumBase` | Header: `AnimLayers.h`

EAnim Layer Type

**Properties** (3):
  - `ADDITIVE`: `AnimLayerType = Ellipsis` — 1
  - `BASE`: `AnimLayerType = Ellipsis` — 0
  - `OVERRIDE`: `AnimLayerType = Ellipsis` — 2

### `unreal.AnimToolBlendOperation`
Inherits: `EnumBase` | Header: `ControlRigSequencerEditorLibrary.h`

EAnim Tool Blend Operation

**Properties** (6):
  - `BLEND_RELATIVE`: `AnimToolBlendOperation = Ellipsis` — 3
  - `BLEND_TO_EASE`: `AnimToolBlendOperation = Ellipsis` — 4
  - `BLEND_TO_NEIGHBOR`: `AnimToolBlendOperation = Ellipsis` — 1
  - `PUSH_PULL`: `AnimToolBlendOperation = Ellipsis` — 2
  - `SMOOTH_ROUGH`: `AnimToolBlendOperation = Ellipsis` — 5
  - `TWEEN`: `AnimToolBlendOperation = Ellipsis` — 0

### `unreal.CastToControlRigBlueprintCases`
Inherits: `EnumBase` | Header: `ControlRigBlueprintEditorLibrary.h`

ECast to Control Rig Blueprint Cases

**Properties** (2):
  - `CAST_FAILED`: `CastToControlRigBlueprintCases = Ellipsis` — 1
  - `CAST_SUCCEEDED`: `CastToControlRigBlueprintCases = Ellipsis` — 0

### `unreal.ControlRigEditModeInteractionEndedEvent`
Inherits: `MulticastDelegateBase` | Header: `ControlRigEditMode.h`

Control Rig Edit Mode Interaction Ended Event Delegate Signature

### `unreal.ControlRigEditModeInteractionStartedEvent`
Inherits: `MulticastDelegateBase` | Header: `ControlRigEditMode.h`

Control Rig Edit Mode Interaction Started Event Delegate Signature

### `unreal.ControlRigEditModeInteractionUpdatedEvent`
Inherits: `MulticastDelegateBase` | Header: `ControlRigEditMode.h`

Control Rig Edit Mode Interaction Updated Event Delegate Signature
