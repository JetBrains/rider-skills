# UE Python API — IKRigEditor Module

**18 types** from the `IKRigEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_PreviewRetargetPose`, `BatchExportOptions`, `BatchRetargetSettings`, `IKRetargetAnimInstance`, `IKRetargetBatchOperation`, `IKRetargeterController`, `IKRetargetFactory`, `IKRigAnimInstance`, `IKRigController`, `IKRigDefinitionFactory`, `IKRigStructViewer`, `IKRigStructWrapperBase`, `PoleVectorSettingsWrapper`, `RetargetFKChainSettingsWrapper`, `RetargetIKChainSettingsWrapper`, `RetargetSpeedPlantSettingsWrapper`, `RetargetStrideWarpSettingsWrapper`, `RetargetAutoAlignMethod`

---

## Classes

### `unreal.AnimNode_PreviewRetargetPose`
Inherits: `AnimNode_Base` | Header: `IKRetargetAnimInstance.h`

a node just to preview a retarget pose

### `unreal.BatchExportOptions`
Inherits: `Object` | Header: `SRetargetAnimAssetsWindow.h`

settings object used in details view of the batch retarget window

**Properties** (2):
  - `include_referenced_assets`: `bool` — [Read-Write] Duplicates and retargets any animation assets referenced by the input assets. For examp...
  - `retain_additive_flags`: `bool` — [Read-Write] If retargeting additive animations, they will have their additive settings reset so tha...

### `unreal.BatchRetargetSettings`
Inherits: `Object` | Header: `SRetargetAnimAssetsWindow.h`

settings object used in details view of the batch retarget window

**Properties** (4):
  - `auto_generate_retargeter`: `bool` — [Read-Write] When true, the system will attempt to generate an IK Retargeter compatible with the sup...
  - `retarget_asset`: `IKRetargeter` — [Read-Write] You may also supply a custom IK Retargeter if needed. (IKRetargeter)
  - `source_skeletal_mesh`: `SkeletalMesh` — [Read-Write] The skeletal mesh with the proportions you want to copy animation FROM. (SkeletalMesh)
  - `target_skeletal_mesh`: `SkeletalMesh` — [Read-Write] The skeletal mesh with the proportions you want to copy animation TO. (SkeletalMesh)

### `unreal.IKRetargetAnimInstance`
Inherits: `AnimPreviewInstance` | Header: `IKRetargetAnimInstance.h`

IKRetarget Anim Instance

### `unreal.IKRetargetBatchOperation`
Inherits: `Object` | Header: `IKRetargetBatchOperation.h`

Encapsulate ability to batch duplicate and retarget a set of animation assets

**Methods** (1):
  - `duplicate_and_retarget(assets_to_retarget, source_mesh, target_mesh, ik_retarget_asset, search = '', replace = '', prefix = '', suffix = '', include_referenced_assets = True)` -> `Array [ AssetData ]` [classmethod]

### `unreal.IKRetargeterController`
Inherits: `Object` | Header: `IKRetargeterController.h`

A stateless singleton (1-per-asset) class used to make modifications to a UIKRetargeter asset. Use UIKRetargeter.GetController() to get the controller for the asset you want to modify.

**Methods** (50):
  - `add_default_ops()` -> `None` — Automatically add basic retargeting operations Adds these ops in the following order: Pelvis Motion, FK Chains, IK Chain...
  - `add_retarget_op(ik_retarget_op_type)` -> `int32` — Add a new retarget op of the given type to the bottom of the stack. Returns the stack index.
  - `auto_align_all_bones(source_or_target, method = RetargetAutoAlignMethod.CHAIN_TO_CHAIN)` -> `None` — Automatically align all bones in mapped chains and store in the current retarget pose.
  - `auto_align_bones(bones_to_align, method, source_or_target)` -> `None` — Automatically align an array of bones and store in the current retarget pose.
  - `auto_map_chains(auto_map_type, force_remap, op_name = 'None')` -> `None` — Use string comparision to find âbestâ Source chain to map to each Target chain or clear the mappings
  - `create_retarget_pose(new_pose_name, source_or_target)` -> `Name` — Add new retarget pose.
  - `duplicate_retarget_pose(pose_to_duplicate, new_name, source_or_target)` -> `Name` — Duplicate a retarget pose.
  - `get_all_chain_settings()` -> `Array [ RetargetChainSettings ]` — Get All Chain Settings
  - `get_all_target_ik_rigs()` -> `Array [ IKRigDefinition ]` — Get all target IK Rigs referenced by all ops
  - `get_controller(retargeter_asset)` -> `IKRetargeterController` [classmethod] — Get the controller for the given retargeter asset
  - `get_current_retarget_pose(source_or_target)` -> `IKRetargetPose` — Get the current retarget pose.
  - `get_current_retarget_pose_name(source_or_target)` -> `Name` — Get the name of the current retarget pose.
  - `get_global_settings()` -> `RetargetGlobalSettings` — Get Global Settings
  - `get_ik_rig(source_or_target)` -> `IKRigDefinition` — Get either source or target IK Rig
  - `get_index_of_op_by_name(op_name)` -> `int32` — Get the index of an op.
  - `get_num_retarget_ops()` -> `int32` — Get the number of Ops in the stack.
  - `get_op_controller(op_index)` -> `IKRetargetOpControllerBase` — Get a controller to get/set the settings for a given op in the stack NOTE: the returned UIKRetargetOpControllerBase* sho...
  - `get_op_name(op_index)` -> `Name` — Get the name of the op at the given index in the stack.
  - `get_parent_op_by_name(op_name)` -> `Name` — Get the name of the parent op for the given op.
  - `get_preview_mesh(source_or_target)` -> `SkeletalMesh` — Get the preview skeletal mesh
  - `get_retarget_chain_settings(target_chain_name)` -> `TargetChainSettings` — Get Retarget Chain Settings
  - `get_retarget_op_enabled(retarget_op_index)` -> `bool` — Get enabled status of the given Op.
  - `get_retarget_poses(source_or_target)` -> `Map [ Name , IKRetargetPose ]` — Get access to array of retarget poses.
  - `get_root_offset_in_retarget_pose(source_or_target)` -> `Vector` — Get the translation offset on the retarget pelvis bone for the current retarget pose.
  - `get_root_settings()` -> `TargetRootSettings` — Get Root Settings
  - `get_rotation_offset_for_retarget_pose_bone(bone_name, source_or_target)` -> `Quat` — Get a delta rotation for a given bone in the current retarget pose.
  - `get_source_chain(target_chain_name, op_name = 'None')` -> `Name` — Get the name of the source chain mapped to a given target chain (the chain animation is copied FROM).
  - `get_target_ik_rig_for_op(op_name)` -> `IKRigDefinition` — Get the target IK Rig associated with the given Op. May be different than the default IK Rig. NOTE: all ops use the glob...
  - `move_retarget_op_in_stack(op_to_move_index, target_index)` -> `bool` — Move the retarget op at the given index to the target index. NOTE: due to constraints on execution order, the actual ind...
  - `remove_all_ops()` -> `bool` — Remove all ops in the stack.
  - `remove_retarget_op(op_index)` -> `bool` — Remove the retarget op at the given stack index NOTE: if this op is a parent, all itâs children will be removed as wel...
  - `remove_retarget_pose(pose_to_remove, source_or_target)` -> `bool` — Remove a retarget pose.
  - `rename_retarget_pose(old_pose_name, new_pose_name, source_or_target)` -> `bool` — Rename current retarget pose.
  - `reset_chain_settings_in_all_ops(target_chain_name)` -> `None` — Tell each op to reset any settings associated with this chain
  - `reset_chain_settings_to_default(target_chain_name, op_name)` -> `None` — Reset the settings for the given chain in the given op back to the defaults.
  - `reset_retarget_pose(pose_to_reset, bones_to_reset, source_or_target)` -> `None` — Reset a retarget pose for the specified bones.
  - `run_op_initial_setup(op_index)` -> `None` — Force the op to run the initial setup. This is normally run when an Op is added through the editor UI. NOTE: ops may not...
  - `set_current_retarget_pose(current_pose, source_or_target)` -> `bool` — Change which retarget pose is used by the retargeter at runtime.
  - `set_global_settings(global_settings)` -> `None` — Set Global Settings
  - `set_ik_rig(source_or_target, ik_rig)` -> `None` — Set the IK Rig to use as the source or target (to copy animation FROM/TO)
  - `set_op_name(name, op_index)` -> `Name` — Set the name of the op at the given index in the stack.
  - `set_parent_op_by_name(child_op_name, parent_op_name)` -> `bool` — Set the name of the op to parent this op to Children ops are forced to execute before their parent
  - `set_preview_mesh(source_or_target, preview_mesh)` -> `None` — Set the preview skeletal mesh for either source or target
  - `set_retarget_chain_settings(target_chain_name, settings)` -> `bool` — Set Retarget Chain Settings
  - `set_retarget_op_enabled(retarget_op_index, is_enabled)` -> `bool` — Toggle an op on/off.
  - `set_root_offset_in_retarget_pose(translation_offset, source_or_target)` -> `None` — Set the translation offset on the retarget pelvis bone for the current retarget pose.
  - `set_root_settings(root_settings)` -> `None` — Set Root Settings
  - `set_rotation_offset_for_retarget_pose_bone(bone_name, rotation_offset, skeleton_mode)` -> `None` — Set a delta rotation for a given bone in the current retarget pose.
  - `set_source_chain(source_chain_name, target_chain_name, op_name = 'None')` -> `bool` — Assign a source chain to the given target chain. Animation will be copied from the source to the target.
  - `snap_bone_to_ground(reference_bone, source_or_target)` -> `None` — Moves the entire skeleton vertically until the specified bone is the same height off the ground as in the reference pose...

### `unreal.IKRetargetFactory`
Inherits: `Factory` | Header: `IKRetargetFactory.h`

IKRetarget Factory

### `unreal.IKRigAnimInstance`
Inherits: `AnimPreviewInstance` | Header: `IKRigAnimInstance.h`

IKRig Anim Instance

### `unreal.IKRigController`
Inherits: `Object` | Header: `IKRigController.h`

A singleton (per-asset) class used to make modifications to a UIKRigDefinition asset

**Methods** (52):
  - `add_bone_setting(bone_name, solver_index)` -> `bool` — Add settings to the given Bone/Solver. Does nothing if Bone already has settings in this Solver.
  - `add_new_goal(goal_name, bone_name)` -> `Name` — Add a new Goal associated with the given Bone. GoalName must be unique. Bones can have multiple Goals (rare).
  - `add_retarget_chain(chain_name, start_bone_name, end_bone_name, goal_name)` -> `Name` — Add a new chain with the given Chain and Bone names. Returns newly created chain name (uniquified). Note: only the Chain...
  - `add_solver(ik_rig_solver_type)` -> `int32` — Add a new solver of the given type to the bottom of the stack. Returns the stack index. The type here is the full packag...
  - `apply_auto_fbik()` -> `bool` — Analyse the skeleton to see if it matches a known template and automatically generates a full body IK setup Returns true...
  - `apply_auto_generated_retarget_definition()` -> `bool` — Analyse the skeleton to see if it matches a known template and automatically generates all retarget chains and sets the ...
  - `connect_goal_to_solver(goal_name, solver_index)` -> `bool` — Connect the given Goal to the given Solver. This creates an âEffectorâ with settings specific to this Solver.
  - `disconnect_goal_from_solver(goal_to_remove, solver_index)` -> `bool` — Disconnect the given Goal from the given Solver. This removes the Effector that associates the Goal with the Solver.
  - `does_solver_have_custom_goal_settings(goal_name, solver_index)` -> `bool` — returns true if the goal has custom settings for the given solver
  - `get_all_goals()` -> `Array [ IKRigEffectorGoal ]` — Get access to the list of Goals.
  - `get_bone_excluded(bone_name)` -> `bool` — Returns true if the given Bone is excluded, false otherwise.
  - `get_bone_for_goal(goal_name)` -> `Name` — The the Bone associated with the given Goal.
  - `get_bone_settings(bone_name, solver_index)` -> `Object` — Get Bone Settings
  - `get_controller(ik_rig_definition)` -> `IKRigController` [classmethod] — Use this to get the controller for the given IKRig
  - `get_end_bone(solver_index)` -> `Name` — Get the name of the end bone on a given solver. (not all solvers require extra end bones, checks CanSetEndBone() first)
  - `get_goal(goal_name)` -> `IKRigEffectorGoal` — Get read-write access to the Goal with the given name.
  - `get_goal_name_for_bone(bone_name)` -> `Name` — Get the Goal associated with the given Bone (may be NAME_None)
  - `get_goal_settings_for_solver(goal_name, solver_index)` -> `Object` — Get Goal Settings for Solver
  - `get_index_of_solver(controller)` -> `int32` — Get the index for a given solver in the stack The input here is a solver controller (as returned by GetSolverController(...
  - `get_num_solvers()` -> `int32` — Get the number of solvers in the stack.
  - `get_ref_pose_transform_of_bone(bone_name)` -> `Transform` — Get the global-space retarget pose transform of the given Bone.
  - `get_retarget_chain_end_bone(chain_name)` -> `Name` — Get the Start Bone name for the given Chain.
  - `get_retarget_chain_goal(chain_name)` -> `Name` — Get the Goal name for the given Chain.
  - `get_retarget_chain_start_bone(chain_name)` -> `Name` — Get the End Bone name for the given Chain.
  - `get_retarget_chains()` -> `Array [ BoneChain ]` — Get read-only access to the list of Chains.
  - `get_retarget_root()` -> `Name` — Get the name of the Root Bone of the retargeting (can only be one).
  - `get_root_bone(solver_index: int)` -> `Name` — deprecated: âget_root_boneâ was renamed to âget_start_boneâ.
  - `get_skeletal_mesh()` -> `SkeletalMesh` — Get the skeletal mesh this asset is initialized with
  - `get_solver_controller(solver_index)` -> `IKRigSolverControllerBase` — Get a controller to customize the settings for a given solver in the stack
  - `get_solver_enabled(solver_index)` -> `bool` — Get enabled status of the given solver.
  - `get_start_bone(solver_index)` -> `Name` — Get the name of the root bone on a given solver. (not all solvers support start bones, checks CanSetStartBone() first)
  - `is_goal_connected_to_any_solver(goal_name)` -> `bool` — Returns true if the given Goal is connected to ANY solver. False otherwise.
  - `is_goal_connected_to_solver(goal_name, solver_index)` -> `bool` — Returns true if the given Goal is connected to the given Solver. False otherwise.
  - `is_skeletal_mesh_compatible(skeletal_mesh_to_check)` -> `bool` — Returns true if the provided skeletal mesh could be used with this IK Rig.
  - `move_solver_in_stack(solver_to_move_index, target_solver_index)` -> `bool` — Move the solver at the given index to the target index.
  - `remove_bone_setting(bone_name, solver_index)` -> `bool` — Remove settings for the given Bone/Solver. Does nothing if Bone doesnât have setting in this Solver.
  - `remove_goal(goal_name)` -> `bool` — Remove the Goal by name.
  - `remove_retarget_chain(chain_name)` -> `bool` — Remove a Chain with the given name. Returns true if a Chain was removed.
  - `remove_solver(solver_index)` -> `bool` — Remove the solver at the given stack index.
  - `rename_goal(old_name, potential_new_name)` -> `Name` — Rename a Goal. Returns new name, which may be different after being sanitized. Returns NAME_None if this fails.
  - `rename_retarget_chain(chain_name, new_chain_name)` -> `Name` — Renamed the given Chain. Returns the new name (same as old if unsuccessful).
  - `set_bone_excluded(bone_name, exclude)` -> `bool` — Include/exclude a bone from all the solvers. All bones are included by default.
  - `set_end_bone(end_bone_name, solver_index)` -> `bool` — Set the end bone on a given solver. (not all solvers require extra end bones, checks CanSetEndBone() first)
  - `set_goal_bone(goal_name, new_bone_name)` -> `bool` — The the Bone that the given Goal should be parented to / associated with.
  - `set_retarget_chain_end_bone(chain_name, end_bone_name)` -> `bool` — Set the End Bone for the given Chain. Returns true if operation was successful.
  - `set_retarget_chain_goal(chain_name, goal_name)` -> `bool` — Set the Goal for the given Chain. Returns true if operation was successful.
  - `set_retarget_chain_start_bone(chain_name, start_bone_name)` -> `bool` — Set the Start Bone for the given Chain. Returns true if operation was successful.
  - `set_retarget_root(root_bone_name)` -> `bool` — Set the Root Bone of the retargeting (can only be one).
  - `set_root_bone(root_bone_name: Name, solver_index: int)` -> `bool` — deprecated: âset_root_boneâ was renamed to âset_start_boneâ.
  - `set_skeletal_mesh(skeletal_mesh)` -> `bool` — Sets the preview mesh to use. Loads the hierarchy into the assetâs IKRigSkeleton. Returns true if the mesh was able to...
  - `set_solver_enabled(solver_index, is_enabled)` -> `bool` — Set enabled/disabled status of the given solver.
  - `set_start_bone(root_bone_name, solver_index)` -> `bool` — Set the root bone on a given solver. (not all solvers support root bones, checks CanSetStartBone() first)

### `unreal.IKRigDefinitionFactory`
Inherits: `Factory` | Header: `IKRigDefinitionFactory.h`

IKRig Definition Factory

**Methods** (1):
  - `create_new_ik_rig_asset(package_path, asset_name)` -> `IKRigDefinition` [classmethod] — Create a new IK Rig rig asset at a specified location in your projectâs content folder.

### `unreal.IKRigStructViewer`
Inherits: `Object` | Header: `IKRigStructViewer.h`

a thin wrapper around UStruct data to display in a details panel this is a generic wrapper that works for any struct it is intended to work with FIKRigStructViewerCustomization which simply puts the e...

### `unreal.IKRigStructWrapperBase`
Inherits: `IKRigStructViewer` | Header: `IKRigStructViewer.h`

this is meant to be subclassed by a type that contains a UProperty of a struct to be edited similar to UIKRigStructViewer but supports multi-struct editing and greater customization

### `unreal.PoleVectorSettingsWrapper`
Inherits: `IKRigStructWrapperBase` | Header: `IKRetargetOpDetails.h`

Pole Vector Settings Wrapper

### `unreal.RetargetFKChainSettingsWrapper`
Inherits: `IKRigStructWrapperBase` | Header: `IKRetargetOpDetails.h`

Retarget FKChain Settings Wrapper

### `unreal.RetargetIKChainSettingsWrapper`
Inherits: `IKRigStructWrapperBase` | Header: `IKRetargetOpDetails.h`

Retarget IKChain Settings Wrapper

### `unreal.RetargetSpeedPlantSettingsWrapper`
Inherits: `IKRigStructWrapperBase` | Header: `IKRetargetOpDetails.h`

Retarget Speed Plant Settings Wrapper

### `unreal.RetargetStrideWarpSettingsWrapper`
Inherits: `IKRigStructWrapperBase` | Header: `IKRetargetOpDetails.h`

Retarget Stride Warp Settings Wrapper

### `unreal.RetargetAutoAlignMethod`
Inherits: `EnumBase` | Header: `IKRetargeterPoseGenerator.h`

A Note on Determining the âDirectionâ of a Boneâ¦

**Properties** (4):
  - `CHAIN_TO_CHAIN`: `RetargetAutoAlignMethod = Ellipsis` — use the chain to determine the source and target directions to align 0
  - `GLOBAL_ROTATION_AXES`: `RetargetAutoAlignMethod = Ellipsis` — match the global rotation axes of each bone individually (will be horribly wrong if characters donâ...
  - `LOCAL_ROTATION_AXES`: `RetargetAutoAlignMethod = Ellipsis` — match the local rotation axes of each bone individually (will be horribly wrong if characters donâ...
  - `MESH_TO_MESH`: `RetargetAutoAlignMethod = Ellipsis` — use mesh direction as source, and mesh direction as the target to align 1
