# UE Python API — ControlRig Module

**606 types** from the `ControlRig` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AimTarget`, `AnimNode_ControlRig`, `AnimNode_ControlRigBase`, `BlendTarget`, `CachedRigComponent`, `CachedRigElement`, `ConstraintParent`, `ConstraintTarget`, `ControlRigAnimNodeEventName`, `ControlRigComponentMappedBone`, `ControlRigComponentMappedComponent`, `ControlRigComponentMappedCurve`, `ControlRigComponentMappedElement`, `ControlRigControlPose`, `ControlRigExecuteContext`, `ControlRigInteractionTransformContext`, `ControlRigOverrideContainer`, `ControlRigOverrideValue`, `ControlRigReference`, `ControlRigReplayTracks`, ... (606 total)

---

## Classes

### `unreal.AimTarget`
Inherits: `StructBase` | Header: `RigUnit_AimConstraint.h`

Aim Target

### `unreal.AnimNode_ControlRig`
Inherits: `AnimNode_ControlRigBase` | Header: `AnimNode_ControlRig.h`

Animation node that allows animation ControlRig output to be used in an animation graph

### `unreal.AnimNode_ControlRigBase`
Inherits: `AnimNode_CustomProperty` | Header: `AnimNode_ControlRigBase.h`

Animation node that allows animation ControlRig output to be used in an animation graph

### `unreal.BlendTarget`
Inherits: `StructBase` | Header: `RigUnit_BlendTransform.h`

Blend Target

### `unreal.CachedRigComponent`
Inherits: `StructBase` | Header: `RigHierarchyCache.h`

Cached Rig Component

### `unreal.CachedRigElement`
Inherits: `StructBase` | Header: `RigHierarchyCache.h`

Cached Rig Element

### `unreal.ConstraintParent`
Inherits: `StructBase` | Header: `RigUnit_TransformConstraint.h`

Constraint Parent

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `weight`: `float` — [Read-Write] (float)

### `unreal.ConstraintTarget`
Inherits: `StructBase` | Header: `RigUnit_TransformConstraint.h`

Constraint Target

**Properties** (1):
  - `filter`: `TransformFilter` [Read-Only] — [Read-Only] (TransformFilter)

### `unreal.ControlRigAnimNodeEventName`
Inherits: `StructBase` | Header: `AnimNode_ControlRigBase.h`

Control Rig Anim Node Event Name

### `unreal.ControlRigComponentMappedBone`
Inherits: `StructBase` | Header: `ControlRigComponent.h`

Control Rig Component Mapped Bone

**Properties** (2):
  - `source`: `Name` — [Read-Write] (Name)
  - `target`: `Name` — [Read-Write] (Name)

### `unreal.ControlRigComponentMappedComponent`
Inherits: `StructBase` | Header: `ControlRigComponent.h`

Control Rig Component Mapped Component

**Properties** (4):
  - `component`: `SceneComponent` — [Read-Write] (SceneComponent)
  - `direction`: `ControlRigComponentMapDirection` — [Read-Write] (ControlRigComponentMapDirection)
  - `element_name`: `Name` — [Read-Write] (Name)
  - `element_type`: `RigElementType` — [Read-Write] The type of element this is mapped to (RigElementType)

### `unreal.ControlRigComponentMappedCurve`
Inherits: `StructBase` | Header: `ControlRigComponent.h`

Control Rig Component Mapped Curve

**Properties** (2):
  - `source`: `Name` — [Read-Write] (Name)
  - `target`: `Name` — [Read-Write] (Name)

### `unreal.ControlRigComponentMappedElement`
Inherits: `StructBase` | Header: `ControlRigComponent.h`

Control Rig Component Mapped Element

**Properties** (9):
  - `component_reference`: `SoftComponentReference` — [Read-Write] The component to map to the Control Rig (SoftComponentReference)
  - `direction`: `ControlRigComponentMapDirection` — [Read-Write] The direction (input / output) to be used for mapping an element (ControlRigComponentMa...
  - `element_name`: `Name` — [Read-Write] The name of the element to map to (Name)
  - `element_type`: `RigElementType` — [Read-Write] The type of element this is mapped to (RigElementType)
  - `offset`: `Transform` — [Read-Write] The offset transform to apply (Transform)
  - `space`: `ControlRigComponentSpace` — [Read-Write] space in which the mapping happens (ControlRigComponentSpace)
  - `transform_index`: `int` — [Read-Write] An optional index that can be used with components
with multiple transforms (for exampl...
  - `transform_name`: `Name` — [Read-Write] An optional name that can be used with components
that have sockets (for example the Sk...
  - `weight`: `float` — [Read-Write] defines how much the mapped element should be driven (float)

### `unreal.ControlRigControlPose`
Inherits: `StructBase` | Header: `ControlRigPose.h`

The Data Stored For Each Pose and associated Functions to Store and Paste It

**Properties** (1):
  - `copy_of_controls`: `None` — [Read-Write] (Array[RigControlCopy])

### `unreal.ControlRigExecuteContext`
Inherits: `RigVMExecuteContext` | Header: `RigUnitContext.h`

Control Rig Execute Context

### `unreal.ControlRigInteractionTransformContext`
Inherits: `StructBase` | Header: `ControlRig.h`

FTransformContext provides a way of passing the various transform parameters to functions that need to know what the transform context is. Extend it if necessary, particularly to avoid overloading som...

**Properties** (4):
  - `drag`: `Vector` — [Read-Write] (Vector)
  - `rot`: `Rotator` — [Read-Write] (Rotator)
  - `scale`: `Vector` — [Read-Write] (Vector)
  - `space`: `ControlRigInteractionTransformSpace` — [Read-Write] (ControlRigInteractionTransformSpace)

### `unreal.ControlRigOverrideContainer`
Inherits: `StructBase` | Header: `ControlRigOverride.h`

A container to represent a set of override values for one or more subjects. The bUsesKeyForSubject setting will control if the subject name is respected when adding / looking up / applying overrides. ...

### `unreal.ControlRigOverrideValue`
Inherits: `StructBase` | Header: `ControlRigOverride.h`

A single value used to represent an override on a subject. The value serialized the data using binary serialization based on the last property in the property chain. The value can be copied on to the ...

### `unreal.ControlRigReference`
Inherits: `AnimNodeReference` | Header: `AnimNode_ControlRig_Library.h`

Control Rig Reference

### `unreal.ControlRigReplayTracks`
Inherits: `SampleTrackHost` | Header: `ControlRigReplay.h`

Control Rig Replay Tracks

### `unreal.ControlRigReplayVariable`
Inherits: `StructBase` | Header: `ControlRigReplay.h`

Control Rig Replay Variable

**Properties** (3):
  - `cpp_type`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `value`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.ControlRigShapeDefinition`
Inherits: `StructBase` | Header: `ControlRigGizmoLibrary.h`

Control Rig Shape Definition

**Properties** (4):
  - `gizmo_name`: `Name` — âgizmo_nameâ was renamed to âshape_nameâ. deprecated
  - `shape_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `static_mesh`: `StaticMesh` [Read-Only] — [Read-Only] (StaticMesh)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.ControlRigTestDataFrame`
Inherits: `StructBase` | Header: `ControlRigTestData.h`

Control Rig Test Data Frame

**Properties** (5):
  - `absolute_time`: `float` [Read-Only] — [Read-Only] (double)
  - `delta_time`: `float` [Read-Only] — [Read-Only] (double)
  - `metadata`: `None` [Read-Only] — [Read-Only] (Array[uint8])
  - `pose`: `RigPose` [Read-Only] — [Read-Only] (RigPose)
  - `variables`: `None` [Read-Only] — [Read-Only] (Array[ControlRigReplayVariable])

### `unreal.CRSimLinearSpring`
Inherits: `StructBase` | Header: `CRSimLinearSpring.h`

CRSim Linear Spring

### `unreal.CRSimPointForce`
Inherits: `StructBase` | Header: `CRSimPointForce.h`

CRSim Point Force

### `unreal.CRSimSoftCollision`
Inherits: `StructBase` | Header: `CRSimSoftCollision.h`

CRSim Soft Collision

### `unreal.ModularRigConnections`
Inherits: `StructBase` | Header: `ModularRigModel.h`

Modular Rig Connections

### `unreal.ModularRigModel`
Inherits: `StructBase` | Header: `ModularRigModel.h`

A management struct containing all modules in the rig

### `unreal.ModularRigResolveResult`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Modular Rig Resolve Result

### `unreal.ModularRigSettings`
Inherits: `StructBase` | Header: `RigModuleDefines.h`

Modular Rig Settings

**Properties** (1):
  - `auto_resolve`: `bool` — [Read-Write] Whether or not to autoresolve secondary connectors once the primary connector is resolv...

### `unreal.ModularRigSingleConnection`
Inherits: `StructBase` | Header: `ModularRigModel.h`

Modular Rig Single Connection

### `unreal.RegionScaleFactors`
Inherits: `StructBase` | Header: `RigUnit_SphericalPoseReader.h`

Region Scale Factors

**Properties** (4):
  - `negative_height`: `float` — [Read-Write] Scale the region in the NEGATIVE height direction. Range is 0-1. Default is 1.0. (float...
  - `negative_width`: `float` — [Read-Write] Scale the region in the NEGATIVE width direction. Range is 0-1. Default is 1.0. (float)
  - `positive_height`: `float` — [Read-Write] Scale the region in the POSITIVE height direction. Range is 0-1. Default is 1.0. (float...
  - `positive_width`: `float` — [Read-Write] Scale the region in the POSITIVE width direction. Range is 0-1. Default is 1.0. (float)

### `unreal.RigAndConnectionRule`
Inherits: `RigConnectionRule` | Header: `RigConnectionRules.h`

Rig and Connection Rule

**Properties** (1):
  - `child_rules`: `None` — [Read-Write] (Array[RigConnectionRuleStash])

### `unreal.RigBaseComponent`
Inherits: `StructBase` | Header: `RigHierarchyComponents.h`

Rig Base Component

### `unreal.RigBaseElement`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Base Element

**Properties** (5):
  - `created_at_instruction_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `index`: `int` [Read-Only] — [Read-Only] (int32)
  - `key`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)
  - `selected`: `bool` [Read-Only] — [Read-Only] (bool)
  - `sub_index`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigBone`
Inherits: `RigElement` | Header: `RigBoneHierarchy.h`

Rig Bone

**Properties** (5):
  - `global_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `initial_transform`: `Transform` [Read-Only] — [Read-Only] Initial global transform that is saved in this rig (Transform)
  - `local_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `parent_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `type`: `RigBoneType` [Read-Only] — [Read-Only] the source of the bone to differentiate procedurally generated, imported etc (RigBoneTyp...

### `unreal.RigBoneElement`
Inherits: `RigSingleParentElement` | Header: `RigHierarchyElements.h`

Rig Bone Element

**Properties** (1):
  - `bone_type`: `RigBoneType` [Read-Only] — [Read-Only] (RigBoneType)

### `unreal.RigChildOfPrimaryConnectionRule`
Inherits: `RigConnectionRule` | Header: `RigConnectionRules.h`

Rig Child Of Primary Connection Rule

### `unreal.RigComponentKey`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Component Key

**Properties** (2):
  - `element_key`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `name`: `Name` — [Read-Write] (Name)

### `unreal.RigComputedTransform`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Computed Transform

### `unreal.RigConnectionRule`
Inherits: `StructBase` | Header: `RigConnectionRules.h`

Rig Connection Rule

### `unreal.RigConnectionRuleStash`
Inherits: `StructBase` | Header: `RigConnectionRules.h`

Rig Connection Rule Stash

**Properties** (2):
  - `exported_text`: `str` — [Read-Write] (str)
  - `script_struct_path`: `str` — [Read-Write] (str)

### `unreal.RigConnectorElement`
Inherits: `RigBaseElement` | Header: `RigHierarchyElements.h`

Rig Connector Element

**Properties** (1):
  - `settings`: `RigConnectorSettings` [Read-Only] — [Read-Only] (RigConnectorSettings)

### `unreal.RigConnectorSettings`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Connector Settings

**Properties** (5):
  - `description`: `str` — [Read-Write] (str)
  - `is_array`: `bool` — [Read-Write] by enabling this the connector will be able to connect to more than one target (bool)
  - `optional`: `bool` — [Read-Write] (bool)
  - `rules`: `None` — [Read-Write] (Array[RigConnectionRuleStash])
  - `type`: `ConnectorType` — [Read-Write] (ConnectorType)

### `unreal.RigConnectorState`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Connector State

**Properties** (3):
  - `name`: `Name` — [Read-Write] (Name)
  - `resolved_target`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `settings`: `RigConnectorSettings` — [Read-Write] (RigConnectorSettings)

### `unreal.RigControl`
Inherits: `RigElement` | Header: `RigControlHierarchy.h`

Rig Control

**Properties** (24):
  - `animatable`: `bool` — [Read-Write] If the control is animatable in sequencer (bool)
  - `control_enum`: `Enum` [Read-Only] — [Read-Only] If the control is transient and only visible in the control rig editor (Enum)
  - `control_type`: `RigControlType` — [Read-Write] (RigControlType)
  - `display_name`: `Name` — [Read-Write] (Name)
  - `draw_limits`: `bool` — [Read-Write] True if the limits should be drawn in debug. (bool)
  - `gizmo_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `gizmo_enabled`: `bool` — [Read-Write] Set to true if the gizmo is enabled in 3d (bool)
  - `gizmo_name`: `Name` — [Read-Write] This is optional UI setting - this doesnât mean this is always used, but it is option...
  - `gizmo_transform`: `Transform` — [Read-Write] (Transform)
  - `gizmo_visible`: `bool` — [Read-Write] Set to true if the gizmo is currently visible in 3d (bool)
  - `initial_value`: `RigControlValue` [Read-Only] — [Read-Only] The value that a control is reset to during begin play or when the
control rig is instan...
  - `is_transient_control`: `bool` — [Read-Write] If the control is transient and only visible in the control rig editor (bool)
  - `limit_rotation`: `bool` — [Read-Write] True if the control has to obey rotation limits. (bool)
  - `limit_scale`: `bool` — [Read-Write] True if the control has to obey scale limits. (bool)
  - `limit_translation`: `bool` — [Read-Write] True if the control has to obey translation limits. (bool)
  - `maximum_value`: `RigControlValue` — [Read-Write] The maximum limit of the controlâs value (RigControlValue)
  - `minimum_value`: `RigControlValue` — [Read-Write] The minimum limit of the controlâs value (RigControlValue)
  - `offset_transform`: `Transform` — [Read-Write] Used to offset a control in global space. This can be useful
to offset a float control ...
  - `parent_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `parent_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `primary_axis`: `RigControlAxis` — [Read-Write] the primary axis to use for float controls (RigControlAxis)
  - `space_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `space_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `value`: `RigControlValue` [Read-Only] — [Read-Only] The current value of the control. (RigControlValue)

### `unreal.RigControlCopy`
Inherits: `StructBase` | Header: `ControlRigPose.h`

The Data Stored For Each Control in A Pose.

**Properties** (7):
  - `control_type`: `RigControlType` — [Read-Write] (RigControlType)
  - `global_transform`: `Transform` — [Read-Write] (Transform)
  - `local_transform`: `Transform` — [Read-Write] (Transform)
  - `name`: `Name` — [Read-Write] (Name)
  - `offset_transform`: `Transform` — [Read-Write] (Transform)
  - `parent_key`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `parent_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigControlElement`
Inherits: `RigMultiParentElement` | Header: `RigHierarchyElements.h`

Rig Control Element

**Properties** (2):
  - `preferred_euler_angles`: `RigPreferredEulerAngles` [Read-Only] — [Read-Only] (RigPreferredEulerAngles)
  - `settings`: `RigControlSettings` [Read-Only] — [Read-Only] (RigControlSettings)

### `unreal.RigControlElementCustomization`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Control Element Customization

**Properties** (2):
  - `available_spaces`: `None` [Read-Only] — [Read-Only] (Array[RigElementKeyWithLabel])
  - `removed_spaces`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])

### `unreal.RigControlLimitEnabled`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Control Limit Enabled

**Properties** (2):
  - `maximum`: `bool` — [Read-Write] (bool)
  - `minimum`: `bool` — [Read-Write] (bool)

### `unreal.RigControlModifiedContext`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Control Modified Context

### `unreal.RigControlSettings`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Control Settings

**Properties** (28):
  - `animatable`: `bool` — [Read-Write] Deprecated properties.
deprecated: Use animation_type instead. (bool)
  - `animation_type`: `RigControlAnimationType` — [Read-Write] (RigControlAnimationType)
  - `b_gizmo_enabled`: `bool` — âb_gizmo_enabledâ was renamed to âshape_enabledâ. deprecated
  - `b_gizmo_visible`: `bool` — âb_gizmo_visibleâ was renamed to âshape_visibleâ. deprecated
  - `control_enum`: `Enum` [Read-Only] — [Read-Only] If the control is integer it can use this enum to choose values (Enum)
  - `control_type`: `RigControlType` — [Read-Write] (RigControlType)
  - `customization`: `RigControlElementCustomization` [Read-Only] — [Read-Only] The User interface customization used for a control
This will be used as the default con...
  - `display_name`: `Name` — [Read-Write] (Name)
  - `draw_limits`: `bool` — [Read-Write] True if the limits should be drawn in debug.
For this to be enabled you need to have at...
  - `driven_controls`: `None` [Read-Only] — [Read-Only] The list of driven controls for this proxy control. (Array[RigElementKey])
  - `filtered_channels`: `None` [Read-Only] — [Read-Only] Filtered Visible Transform channels. If this is empty everything is visible (Array[RigCo...
  - `gizmo_color`: `LinearColor` — âgizmo_colorâ was renamed to âshape_colorâ. deprecated
  - `gizmo_name`: `Name` — âgizmo_nameâ was renamed to âshape_nameâ. deprecated
  - `group_with_parent_control`: `bool` [Read-Only] — [Read-Only] If set to true the animation channel will be grouped with the parent control in sequence...
  - `is_transient_control`: `bool` — [Read-Write] If the control is transient and only visible in the control rig editor (bool)
  - `limit_enabled`: `None` — [Read-Write] True if the control has limits. (Array[RigControlLimitEnabled])
  - `maximum_value`: `RigControlValue` — [Read-Write] The maximum limit of the controlâs value (RigControlValue)
  - `minimum_value`: `RigControlValue` — [Read-Write] The minimum limit of the controlâs value (RigControlValue)
  - `preferred_rotation_order`: `EulerRotationOrder` [Read-Only] — [Read-Only] The euler rotation order this control prefers for animation, if we arenât using defaul...
  - `primary_axis`: `RigControlAxis` — [Read-Write] the primary axis to use for float controls (RigControlAxis)
  - `restrict_space_switching`: `bool` [Read-Only] — [Read-Only] Allow to space switch only to the available spaces (bool)
  - `shape_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `shape_enabled`: `bool` — [Read-Write]
deprecated: Use animation_type or shape_visible instead. (bool)
  - `shape_name`: `Name` — [Read-Write] This is optional UI setting - this doesnât mean this is always used, but it is option...
  - `shape_transform`: `Transform` [Read-Only] — [Read-Only] Transient storage for overrides when changing the shape transform (Transform)
  - `shape_visibility`: `RigControlVisibility` — [Read-Write] Defines how the shape visibility should be changed (RigControlVisibility)
  - `shape_visible`: `bool` — [Read-Write] Set to true if the shape is currently visible in 3d (bool)
  - `use_preferred_rotation_order`: `bool` [Read-Only] — [Read-Only] Whether to use a specified rotation order or just use the default FRotator order and con...

### `unreal.RigControlValue`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Control Value

### `unreal.RigControlValueStorage`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Control Value Storage

### `unreal.RigCurrentAndInitialDirtyState`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Current and Initial Dirty State

**Properties** (2):
  - `current`: `RigLocalAndGlobalDirtyState` [Read-Only] — [Read-Only] (RigLocalAndGlobalDirtyState)
  - `initial`: `RigLocalAndGlobalDirtyState` [Read-Only] — [Read-Only] (RigLocalAndGlobalDirtyState)

### `unreal.RigCurrentAndInitialTransform`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Current and Initial Transform

**Properties** (2):
  - `current`: `RigLocalAndGlobalTransform` [Read-Only] — [Read-Only] (RigLocalAndGlobalTransform)
  - `initial`: `RigLocalAndGlobalTransform` [Read-Only] — [Read-Only] (RigLocalAndGlobalTransform)

### `unreal.RigCurve`
Inherits: `RigElement` | Header: `RigCurveContainer.h`

Rig Curve

**Properties** (1):
  - `value`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigCurveElement`
Inherits: `RigBaseElement` | Header: `RigHierarchyElements.h`

Rig Curve Element

### `unreal.RigDispatch_AnimAttributeBase`
Inherits: `RigDispatchFactory` | Header: `RigUnit_AnimAttribute.h`

Animation Attributes allow dynamically added data to flow from one Anim Node to other Anim Nodes downstream in the Anim Graph and accessible from deformer graph

### `unreal.RigDispatch_ComponentBase`
Inherits: `RigDispatchFactory` | Header: `RigUnit_Component.h`

Rig Dispatch Component Base

### `unreal.RigDispatch_GetAnimAttribute`
Inherits: `RigDispatch_AnimAttributeBase` | Header: `RigUnit_AnimAttribute.h`

Get the value of an animation attribute from the skeletal mesh

### `unreal.RigDispatch_GetComponentContent`
Inherits: `RigDispatch_ComponentBase` | Header: `RigUnit_Component.h`

Gets the component

### `unreal.RigDispatch_GetMetadata`
Inherits: `RigDispatch_MetadataBase` | Header: `RigUnit_Metadata.h`

Sets some metadata for the provided item

### `unreal.RigDispatch_GetModuleMetadata`
Inherits: `RigDispatch_GetMetadata` | Header: `RigUnit_Metadata.h`

Returns some metadata on a given module

### `unreal.RigDispatch_GetTopLevelComponentContent`
Inherits: `RigDispatch_ComponentBase` | Header: `RigUnit_Component.h`

Gets the top level component

### `unreal.RigDispatch_GetUserData`
Inherits: `RigDispatchFactory` | Header: `RigUnit_UserData.h`

Retrieves a value from a namespaces user data

### `unreal.RigDispatch_MetadataBase`
Inherits: `RigDispatchFactory` | Header: `RigUnit_Metadata.h`

Rig Dispatch Metadata Base

### `unreal.RigDispatch_SetAnimAttribute`
Inherits: `RigDispatch_AnimAttributeBase` | Header: `RigUnit_AnimAttribute.h`

Modify an animation attribute if one is found, otherwise add a new animation attribute

### `unreal.RigDispatch_SetComponentContent`
Inherits: `RigDispatch_ComponentBase` | Header: `RigUnit_Component.h`

Set the content of a component

### `unreal.RigDispatch_SetMetadata`
Inherits: `RigDispatch_MetadataBase` | Header: `RigUnit_Metadata.h`

Sets some metadata for the provided item

### `unreal.RigDispatch_SetModuleMetadata`
Inherits: `RigDispatch_SetMetadata` | Header: `RigUnit_Metadata.h`

Sets metadata on the module

### `unreal.RigDispatch_SetTopLevelComponentContent`
Inherits: `RigDispatch_ComponentBase` | Header: `RigUnit_Component.h`

Set the content of a component

### `unreal.RigDispatch_SpawnComponent`
Inherits: `RigDispatch_ComponentBase` | Header: `RigUnit_Component.h`

Adds a component under an element in the hierarchy

### `unreal.RigDispatch_SpawnTopLevelComponent`
Inherits: `RigDispatch_ComponentBase` | Header: `RigUnit_Component.h`

Spawns a top level component

### `unreal.RigDispatchFactory`
Inherits: `RigVMDispatchFactory` | Header: `RigDispatchFactory.h`

Base class for all rig dispatch factories

### `unreal.RigElement`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Element

**Properties** (2):
  - `index`: `int` [Read-Only] — [Read-Only] (int32)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.RigElementKey`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Element Key

**Properties** (2):
  - `name`: `Name` — [Read-Write] (Name)
  - `type`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigElementKeyCollection`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Element Key Collection

**Properties** (1):
  - `keys`: `None` — [Read-Write] (Array[RigElementKey])

### `unreal.RigElementKeyWithLabel`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Element Key with Label

**Properties** (2):
  - `key`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)
  - `label`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.RigElementResolveResult`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Element Resolve Result

### `unreal.RigElementWeight`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Element Weight

**Properties** (3):
  - `location`: `float` — [Read-Write] (float)
  - `rotation`: `float` — [Read-Write] (float)
  - `scale`: `float` — [Read-Write] (float)

### `unreal.RigEventContext`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Event Context

### `unreal.RigHierarchyKey`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Hierarchy Key

### `unreal.RigHierarchyModulePath`
Inherits: `StructBase` | Header: `RigHierarchyDefines.h`

Rig Hierarchy Module Path

### `unreal.RigHierarchySettings`
Inherits: `StructBase` | Header: `RigUnitContext.h`

Rig Hierarchy Settings

### `unreal.RigInfluenceEntry`
Inherits: `StructBase` | Header: `RigInfluenceMap.h`

Rig Influence Entry

### `unreal.RigInfluenceMap`
Inherits: `StructBase` | Header: `RigInfluenceMap.h`

Rig Influence Map

### `unreal.RigInfluenceMapPerEvent`
Inherits: `StructBase` | Header: `RigInfluenceMap.h`

Rig Influence Map Per Event

### `unreal.RigLocalAndGlobalDirtyState`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Local and Global Dirty State

**Properties** (2):
  - `global_`: `RigTransformDirtyState` [Read-Only] — [Read-Only] (RigTransformDirtyState)
  - `local`: `RigTransformDirtyState` [Read-Only] — [Read-Only] (RigTransformDirtyState)

### `unreal.RigLocalAndGlobalTransform`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Local and Global Transform

**Properties** (2):
  - `global_`: `RigComputedTransform` [Read-Only] — [Read-Only] (RigComputedTransform)
  - `local`: `RigComputedTransform` [Read-Only] — [Read-Only] (RigComputedTransform)

### `unreal.RigModuleConnector`
Inherits: `StructBase` | Header: `RigModuleDefines.h`

Rig Module Connector

**Properties** (2):
  - `name`: `str` — [Read-Write] (str)
  - `settings`: `RigConnectorSettings` — [Read-Write] (RigConnectorSettings)

### `unreal.RigModuleDescription`
Inherits: `StructBase` | Header: `RigModuleDefines.h`

Rig Module Description

**Properties** (2):
  - `path`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)
  - `settings`: `RigModuleSettings` [Read-Only] — [Read-Only] (RigModuleSettings)

### `unreal.RigModuleExecutionElement`
Inherits: `StructBase` | Header: `ModularRig.h`

Rig Module Execution Element

### `unreal.RigModuleIdentifier`
Inherits: `StructBase` | Header: `RigModuleDefines.h`

Rig Module Identifier

**Properties** (2):
  - `name`: `str` — [Read-Write] The name of the module used to find it in the module library (str)
  - `type`: `str` — [Read-Write] The kind of module this is (for example âArmâ) (str)

### `unreal.RigModuleInstance`
Inherits: `StructBase` | Header: `ModularRig.h`

Rig Module Instance

### `unreal.RigModuleReference`
Inherits: `StructBase` | Header: `ModularRigModel.h`

Rig Module Reference

**Properties** (1):
  - `connections`: `None` — [Read-Write]
deprecated: Property âConnectionsâ is deprecated. (Map[RigElementKey,RigElementKey]...

### `unreal.RigModuleSettings`
Inherits: `StructBase` | Header: `RigModuleDefines.h`

Rig Module Settings

**Properties** (6):
  - `category`: `str` — [Read-Write] The category of the module (str)
  - `description`: `str` — [Read-Write] The description of the module (str)
  - `exposed_connectors`: `None` [Read-Only] — [Read-Only] (Array[RigModuleConnector])
  - `icon`: `SoftObjectPath` — [Read-Write] The icon used for the module in the module library (SoftObjectPath)
  - `identifier`: `RigModuleIdentifier` — [Read-Write] The identifier used to retrieve the module in the module library (RigModuleIdentifier)
  - `keywords`: `str` — [Read-Write] The keywords of the module (str)

### `unreal.RigMultiParentElement`
Inherits: `RigTransformElement` | Header: `RigHierarchyElements.h`

Rig Multi Parent Element

### `unreal.RigNullElement`
Inherits: `RigMultiParentElement` | Header: `RigHierarchyElements.h`

Rig Null Element

### `unreal.RigOrConnectionRule`
Inherits: `RigConnectionRule` | Header: `RigConnectionRules.h`

Rig or Connection Rule

**Properties** (1):
  - `child_rules`: `None` — [Read-Write] (Array[RigConnectionRuleStash])

### `unreal.RigPhysicsSolverID`
Inherits: `StructBase` | Header: `RigPhysics.h`

Note - FRigPhysicsSolverID is no long used - solvers are referenced using their component key

**Properties** (1):
  - `guid`: `Guid` [Read-Only] — [Read-Only] (Guid)

### `unreal.RigPose`
Inherits: `StructBase` | Header: `RigHierarchyPose.h`

Rig Pose

### `unreal.RigPoseElement`
Inherits: `StructBase` | Header: `RigHierarchyPose.h`

Rig Pose Element

### `unreal.RigPreferredEulerAngles`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Preferred Euler Angles

**Properties** (3):
  - `current`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `initial`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `rotation_order`: `EulerRotationOrder` [Read-Only] — [Read-Only] (EulerRotationOrder)

### `unreal.RigReferenceElement`
Inherits: `RigSingleParentElement` | Header: `RigHierarchyElements.h`

Rig Reference Element

### `unreal.RigSingleParentElement`
Inherits: `RigTransformElement` | Header: `RigHierarchyElements.h`

Rig Single Parent Element

### `unreal.RigSocketElement`
Inherits: `RigSingleParentElement` | Header: `RigHierarchyElements.h`

Rig Socket Element

### `unreal.RigSocketState`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Socket State

**Properties** (5):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `description`: `str` — [Read-Write] (str)
  - `initial_local_transform`: `Transform` — [Read-Write] (Transform)
  - `name`: `Name` — [Read-Write] (Name)
  - `parent`: `RigElementKey` — [Read-Write] (RigElementKey)

### `unreal.RigSpace`
Inherits: `RigElement` | Header: `RigSpaceHierarchy.h`

Rig Space

**Properties** (5):
  - `initial_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `local_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `parent_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `parent_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `space_type`: `RigSpaceType` [Read-Only] — [Read-Only] (RigSpaceType)

### `unreal.RigTagConnectionRule`
Inherits: `RigConnectionRule` | Header: `RigConnectionRules.h`

Rig Tag Connection Rule

**Properties** (1):
  - `tag`: `Name` — [Read-Write] (Name)

### `unreal.RigTransformDirtyState`
Inherits: `StructBase` | Header: `RigHierarchyElements.h`

Rig Transform Dirty State

### `unreal.RigTransformElement`
Inherits: `RigBaseElement` | Header: `RigHierarchyElements.h`

Rig Transform Element

### `unreal.RigTypeConnectionRule`
Inherits: `RigConnectionRule` | Header: `RigConnectionRules.h`

Rig Type Connection Rule

**Properties** (1):
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit`
Inherits: `RigVMStruct` | Header: `RigUnit.h`

Base class for all rig units

### `unreal.RigUnit_Add_FloatFloat`
Inherits: `RigUnit_BinaryFloatOp` | Header: `RigUnit_Float.h`

Rig Unit Add Float Float

### `unreal.RigUnit_Add_VectorVector`
Inherits: `RigUnit_BinaryVectorOp` | Header: `RigUnit_Vector.h`

Rig Unit Add Vector Vector

### `unreal.RigUnit_AddAvailableSpaces`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Adds available spaces for a given control. This is used for the space switching widget.

**Properties** (2):
  - `control`: `RigElementKey` — [Read-Write] * The available spaces to add for a given control (RigElementKey)
  - `spaces`: `None` — [Read-Write] * The spaces to add (Array[RigElementKeyWithLabel])

### `unreal.RigUnit_AddBoneTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_AddBoneTransform.h`

Offset Transform is used to perform a change in the hierarchy by setting a single boneâs transform.

**Properties** (5):
  - `bone`: `Name` — [Read-Write] The name of the Bone to set the transform for. (Name)
  - `post_multiply`: `bool` — [Read-Write] If set to true the transform will be post multiplied, otherwise pre multiplied.
Post mu...
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Bone. (Transform)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_AddParent`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new parent to an element. The weight for the new parent will be 0.0. You can use the SetParentWeights node to change the parent weights later.

**Properties** (3):
  - `child`: `RigElementKey` — [Read-Write] * The child to be parented under the new parent (RigElementKey)
  - `display_label`: `Name` — [Read-Write] * The optional display label for the parent constraint / space (Name)
  - `parent`: `RigElementKey` — [Read-Write] * The new parent to be added to the child (RigElementKey)

### `unreal.RigUnit_AimBone`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_AimBone.h`

Aligns the rotation of a primary and secondary axis of a bone to a global target. Note: This node operates in global space!

**Properties** (6):
  - `bone`: `Name` — [Read-Write] The name of the bone to align (Name)
  - `debug_settings`: `RigUnit_AimBone_DebugSettings` — [Read-Write] The debug setting for the node (RigUnit_AimBone_DebugSettings)
  - `primary`: `RigUnit_AimBone_Target` — [Read-Write] The primary target for the aim (RigUnit_AimBone_Target)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `secondary`: `RigUnit_AimBone_Target` — [Read-Write] The secondary target for the aim - also referred to as PoleVector / UpVector (RigUnit_A...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_AimBone_DebugSettings`
Inherits: `StructBase` | Header: `RigUnit_AimBone.h`

Rig Unit Aim Bone Debug Settings

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] If enabled debug information will be drawn (bool)
  - `scale`: `float` — [Read-Write] The size of the debug drawing information (float)
  - `world_offset`: `Transform` — [Read-Write] The offset at which to draw the debug information in the world (Transform)

### `unreal.RigUnit_AimBone_Target`
Inherits: `StructBase` | Header: `RigUnit_AimBone.h`

Rig Unit Aim Bone Target

**Properties** (5):
  - `axis`: `Vector` — [Read-Write] The axis to align with the aim on this target (Vector)
  - `kind`: `ControlRigVectorKind` — [Read-Write] The kind of target this is representing - can be a direction or a location (ControlRigV...
  - `space`: `Name` — [Read-Write] The space in which the target is expressed (Name)
  - `target`: `Vector` — [Read-Write] The target to aim at - can be a direction or location based on the Kind setting (Vector...
  - `weight`: `float` — [Read-Write] The amount of aim rotation to apply on this target. (float)

### `unreal.RigUnit_AimBoneMath`
Inherits: `RigUnit_HighlevelBase` | Header: `RigUnit_AimBone.h`

Outputs an aligned transform of a primary and secondary axis of an input transform to a world target. Note: This node operates in world space!

**Properties** (6):
  - `debug_settings`: `RigUnit_AimBone_DebugSettings` — [Read-Write] The debug setting for the node (RigUnit_AimBone_DebugSettings)
  - `input_transform`: `Transform` — [Read-Write] The transform (in global space) before the aim was applied (optional) (Transform)
  - `primary`: `RigUnit_AimItem_Target` — [Read-Write] The primary target for the aim (RigUnit_AimItem_Target)
  - `result`: `Transform` [Read-Only] — [Read-Only] The resulting transform (Transform)
  - `secondary`: `RigUnit_AimItem_Target` — [Read-Write] The secondary target for the aim - also referred to as PoleVector / UpVector (RigUnit_A...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_AimConstraint`
Inherits: `RigUnitMutable` | Header: `RigUnit_AimConstraint.h`

Rig Unit Aim Constraint

**Properties** (7):
  - `aim_mode`: `AimMode` — [Read-Write] # How to perform an aim (AimMode)
  - `aim_targets`: `None` — [Read-Write] (Array[AimTarget])
  - `aim_vector`: `Vector` — [Read-Write] # Vector in the space of Named joint which will be aligned to the aim target (Vector)
  - `joint`: `Name` — [Read-Write] (Name)
  - `up_mode`: `AimMode` — [Read-Write] # How to perform an upvector stabilization (AimMode)
  - `up_targets`: `None` — [Read-Write] (Array[AimTarget])
  - `up_vector`: `Vector` — [Read-Write] # Vector in the space of Named joint which will be aligned to the up target for stabili...

### `unreal.RigUnit_AimConstraint_AdvancedSettings`
Inherits: `StructBase` | Header: `RigUnit_AimBone.h`

Rig Unit Aim Constraint Advanced Settings

**Properties** (2):
  - `debug_settings`: `RigUnit_AimBone_DebugSettings` — [Read-Write] Settings related to debug drawings (RigUnit_AimBone_DebugSettings)
  - `rotation_order_for_filter`: `EulerRotationOrder` — [Read-Write] Rotation is converted to euler angles using the specified order such that individual ax...

### `unreal.RigUnit_AimConstraint_WorldUp`
Inherits: `StructBase` | Header: `RigUnit_AimBone.h`

Rig Unit Aim Constraint World Up

**Properties** (3):
  - `kind`: `ControlRigVectorKind` — [Read-Write] The kind of target this is representing - can be a direction or a location (ControlRigV...
  - `space`: `RigElementKey` — [Read-Write] The space in which the target is expressed, use None to indicate world space (RigElemen...
  - `target`: `Vector` — [Read-Write] The target to aim at - can be a direction or location based on the Kind setting (Vector...

### `unreal.RigUnit_AimConstraintLocalSpaceOffset`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_AimBone.h`

Orients an item such that its aim axis points towards a global target. Note: This node operates in global space!

**Properties** (9):
  - `advanced_settings`: `RigUnit_AimConstraint_AdvancedSettings` — [Read-Write] (RigUnit_AimConstraint_AdvancedSettings)
  - `aim_axis`: `Vector` — [Read-Write] Child is rotated so that its AimAxis points to the parents (Vector)
  - `child`: `RigElementKey` — [Read-Write] The name of the item to apply aim (RigElementKey)
  - `filter`: `FilterOptionPerAxis` — [Read-Write] Filters the final rotation by axes based on the euler rotation order defined in the nod...
  - `maintain_offset`: `bool` — [Read-Write] Maintains the offset between child and weighted average of parents based on initial tra...
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `up_axis`: `Vector` — [Read-Write] Child is rotated around the AimAxis so that its UpAxis points to/Aligns with the WorldU...
  - `weight`: `float` — [Read-Write] (float)
  - `world_up`: `RigUnit_AimConstraint_WorldUp` — [Read-Write] Defines how Child should rotate around the AimAxis. This is the aim target for the UpAx...

### `unreal.RigUnit_AimItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_AimBone.h`

Aligns the rotation of a primary and secondary axis of a bone to a global target. Note: This node operates in global space!

**Properties** (5):
  - `debug_settings`: `RigUnit_AimBone_DebugSettings` — [Read-Write] The debug setting for the node (RigUnit_AimBone_DebugSettings)
  - `item`: `RigElementKey` — [Read-Write] The name of the item to align (RigElementKey)
  - `primary`: `RigUnit_AimItem_Target` — [Read-Write] The primary target for the aim (RigUnit_AimItem_Target)
  - `secondary`: `RigUnit_AimItem_Target` — [Read-Write] The secondary target for the aim - also referred to as PoleVector / UpVector (RigUnit_A...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_AimItem_Target`
Inherits: `StructBase` | Header: `RigUnit_AimBone.h`

Rig Unit Aim Item Target

**Properties** (5):
  - `axis`: `Vector` — [Read-Write] The axis to align with the aim on this target (Vector)
  - `kind`: `ControlRigVectorKind` — [Read-Write] The kind of target this is representing - can be a direction or a location (ControlRigV...
  - `space`: `RigElementKey` — [Read-Write] The space in which the target is expressed (RigElementKey)
  - `target`: `Vector` — [Read-Write] The target to aim at - can be a direction or location based on the Kind setting (Vector...
  - `weight`: `float` — [Read-Write] The amount of aim rotation to apply on this target. (float)

### `unreal.RigUnit_ApplyFK`
Inherits: `RigUnitMutable` | Header: `RigUnit_ApplyFK.h`

Rig Unit Apply FK

**Properties** (7):
  - `apply_transform_mode`: `ApplyTransformMode` — [Read-Write] (ApplyTransformMode)
  - `apply_transform_space`: `TransformSpaceMode` — [Read-Write] (TransformSpaceMode)
  - `base_joint`: `Name` — [Read-Write] Transform op option. Use if ETransformSpace is BaseJoint (Name)
  - `base_transform`: `Transform` — [Read-Write] Transform op option. Use if ETransformSpace is BaseTransform (Transform)
  - `filter`: `TransformFilter` — [Read-Write] The filter determines what axes can be manipulated by the in-viewport widgets (Transfor...
  - `joint`: `Name` — [Read-Write] (Name)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_BeginExecution`
Inherits: `RigUnit` | Header: `RigUnit_BeginExecution.h`

Event for driving the skeleton hierarchy with variables and rig elements

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigUnit_BinaryFloatOp`
Inherits: `RigUnit` | Header: `RigUnit_Float.h`

Two args and a result of float type

**Properties** (3):
  - `argument0`: `float` — [Read-Write] (float)
  - `argument1`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigUnit_BinaryQuaternionOp`
Inherits: `RigUnit` | Header: `RigUnit_Quaternion.h`

Two args and a result of Quaternion type

**Properties** (3):
  - `argument0`: `Quat` — [Read-Write] (Quat)
  - `argument1`: `Quat` — [Read-Write] (Quat)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigUnit_BinaryTransformOp`
Inherits: `RigUnit` | Header: `RigUnit_Transform.h`

Two args and a result of Transform type

**Properties** (3):
  - `argument0`: `Transform` — [Read-Write] (Transform)
  - `argument1`: `Transform` — [Read-Write] (Transform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigUnit_BinaryVectorOp`
Inherits: `RigUnit` | Header: `RigUnit_Vector.h`

Two args and a result of Vector type

**Properties** (3):
  - `argument0`: `Vector` — [Read-Write] (Vector)
  - `argument1`: `Vector` — [Read-Write] (Vector)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigUnit_BlendTransform`
Inherits: `RigUnit` | Header: `RigUnit_BlendTransform.h`

Rig Unit Blend Transform

**Properties** (3):
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `source`: `Transform` — [Read-Write] (Transform)
  - `targets`: `None` — [Read-Write] (Array[BlendTarget])

### `unreal.RigUnit_BoneHarmonics`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_BoneHarmonics.h`

Performs point based simulation

**Properties** (11):
  - `bones`: `None` [Read-Only] — [Read-Only] The bones to drive. (Array[RigUnit_BoneHarmonics_BoneTarget])
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)
  - `wave_amplitude`: `Vector` — [Read-Write] The amplitude in degrees per axis (Vector)
  - `wave_ease`: `RigVMAnimEasingType` — [Read-Write] (RigVMAnimEasingType)
  - `wave_frequency`: `Vector` — [Read-Write] (Vector)
  - `wave_maximum`: `float` — [Read-Write] (float)
  - `wave_minimum`: `float` — [Read-Write] (float)
  - `wave_noise`: `Vector` — [Read-Write] (Vector)
  - `wave_offset`: `Vector` — [Read-Write] (Vector)
  - `wave_speed`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_BoneHarmonics_BoneTarget`
Inherits: `StructBase` | Header: `RigUnit_BoneHarmonics.h`

Rig Unit Bone Harmonics Bone Target

**Properties** (2):
  - `bone`: `Name` — [Read-Write] The name of the bone to drive (Name)
  - `ratio`: `float` [Read-Only] — [Read-Only] The ratio of where the bone sits within the harmonics system.
Valid values reach from 0....

### `unreal.RigUnit_BoneName`
Inherits: `RigUnit` | Header: `RigUnit_BoneName.h`

BoneName is used to represent a bone name in the graph

**Properties** (1):
  - `bone`: `Name` — [Read-Write] The name of the Bone (Name)

### `unreal.RigUnit_CCDIK`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_CCDIK.h`

The CCID solver can solve N-Bone chains using the Cyclic Coordinate Descent Inverse Kinematics algorithm. For now this node supports single effector chains only.

**Properties** (10):
  - `base_rotation_limit`: `float` [Read-Only] — [Read-Only] The general rotation limit to be applied to bones (float)
  - `effector_bone`: `Name` — [Read-Write] The last bone in the chain to solve - the effector (Name)
  - `effector_transform`: `Transform` — [Read-Write] The transform of the effector in global space (Transform)
  - `max_iterations`: `int` — [Read-Write] The maximum number of iterations. Values between 4 and 16 are common. (int32)
  - `precision`: `float` [Read-Only] — [Read-Only] The precision to use for the fabrik solver (float)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_limits`: `None` [Read-Only] — [Read-Only] Defines the limits of rotation per bone. (Array[RigUnit_CCDIK_RotationLimit])
  - `start_bone`: `Name` — [Read-Write] The first bone in the chain to solve (Name)
  - `start_from_tail`: `bool` [Read-Only] — [Read-Only] If set to true the direction of the solvers is flipped. (bool)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_CCDIK_RotationLimit`
Inherits: `StructBase` | Header: `RigUnit_CCDIK.h`

Rig Unit CCDIK Rotation Limit

**Properties** (2):
  - `bone`: `Name` — [Read-Write] The name of the bone to apply the rotation limit to. (Name)
  - `limit`: `float` [Read-Only] — [Read-Only] The limit of the rotation in degrees. (float)

### `unreal.RigUnit_CCDIK_RotationLimitPerItem`
Inherits: `StructBase` | Header: `RigUnit_CCDIK.h`

Rig Unit CCDIK Rotation Limit Per Item

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] The name of the item to apply the rotation limit to. (RigElementKey)
  - `limit`: `float` [Read-Only] — [Read-Only] The limit of the rotation in degrees. (float)

### `unreal.RigUnit_CCDIKItemArray`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_CCDIK.h`

The CCID solver can solve N-Bone chains using the Cyclic Coordinate Descent Inverse Kinematics algorithm. For now this node supports single effector chains only.

**Properties** (9):
  - `base_rotation_limit`: `float` [Read-Only] — [Read-Only] The general rotation limit to be applied to bones (float)
  - `effector_transform`: `Transform` — [Read-Write] The transform of the effector in global space (Transform)
  - `items`: `None` — [Read-Write] The chain to use (Array[RigElementKey])
  - `max_iterations`: `int` — [Read-Write] The maximum number of iterations. Values between 4 and 16 are common. (int32)
  - `precision`: `float` [Read-Only] — [Read-Only] The precision to use for the fabrik solver (float)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_limits`: `None` [Read-Only] — [Read-Only] Defines the limits of rotation per bone. (Array[RigUnit_CCDIK_RotationLimitPerItem])
  - `start_from_tail`: `bool` [Read-Only] — [Read-Only] If set to true the direction of the solvers is flipped. (bool)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_CCDIKPerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_CCDIK.h`

The CCID solver can solve N-Bone chains using the Cyclic Coordinate Descent Inverse Kinematics algorithm. For now this node supports single effector chains only.

**Properties** (9):
  - `base_rotation_limit`: `float` [Read-Only] — [Read-Only] The general rotation limit to be applied to bones (float)
  - `effector_transform`: `Transform` — [Read-Write] The transform of the effector in global space (Transform)
  - `items`: `RigElementKeyCollection` — [Read-Write] The chain to use (RigElementKeyCollection)
  - `max_iterations`: `int` — [Read-Write] The maximum number of iterations. Values between 4 and 16 are common. (int32)
  - `precision`: `float` [Read-Only] — [Read-Only] The precision to use for the fabrik solver (float)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_limits`: `None` [Read-Only] — [Read-Only] Defines the limits of rotation per bone. (Array[RigUnit_CCDIK_RotationLimitPerItem])
  - `start_from_tail`: `bool` [Read-Only] — [Read-Only] If set to true the direction of the solvers is flipped. (bool)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_ChainHarmonics`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_ChainHarmonics.h`

Rig Unit Chain Harmonics

**Properties** (8):
  - `chain_root`: `Name` — [Read-Write] (Name)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `draw_world_offset`: `Transform` — [Read-Write] (Transform)
  - `pendulum`: `RigUnit_ChainHarmonics_Pendulum` — [Read-Write] (RigUnit_ChainHarmonics_Pendulum)
  - `reach`: `RigUnit_ChainHarmonics_Reach` — [Read-Write] (RigUnit_ChainHarmonics_Reach)
  - `speed`: `Vector` — [Read-Write] (Vector)
  - `wave`: `RigUnit_ChainHarmonics_Wave` — [Read-Write] (RigUnit_ChainHarmonics_Wave)
  - `wave_curve`: `RuntimeFloatCurve` [Read-Only] — [Read-Only] (RuntimeFloatCurve)

### `unreal.RigUnit_ChainHarmonics_Pendulum`
Inherits: `StructBase` | Header: `RigUnit_ChainHarmonics.h`

Rig Unit Chain Harmonics Pendulum

**Properties** (11):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `pendulum_blend`: `float` — [Read-Write] (float)
  - `pendulum_drag`: `float` — [Read-Write] (float)
  - `pendulum_ease`: `RigVMAnimEasingType` — [Read-Write] (RigVMAnimEasingType)
  - `pendulum_gravity`: `Vector` — [Read-Write] (Vector)
  - `pendulum_maximum`: `float` — [Read-Write] (float)
  - `pendulum_minimum`: `float` — [Read-Write] (float)
  - `pendulum_stiffness`: `float` — [Read-Write] (float)
  - `unwind_axis`: `Vector` — [Read-Write] (Vector)
  - `unwind_maximum`: `float` — [Read-Write] (float)
  - `unwind_minimum`: `float` — [Read-Write] (float)

### `unreal.RigUnit_ChainHarmonics_Reach`
Inherits: `StructBase` | Header: `RigUnit_ChainHarmonics.h`

Rig Unit Chain Harmonics Reach

**Properties** (6):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `reach_axis`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `reach_ease`: `RigVMAnimEasingType` — [Read-Write] (RigVMAnimEasingType)
  - `reach_maximum`: `float` — [Read-Write] (float)
  - `reach_minimum`: `float` — [Read-Write] (float)
  - `reach_target`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_ChainHarmonics_Wave`
Inherits: `StructBase` | Header: `RigUnit_ChainHarmonics.h`

Rig Unit Chain Harmonics Wave

**Properties** (8):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `wave_amplitude`: `Vector` — [Read-Write] (Vector)
  - `wave_ease`: `RigVMAnimEasingType` — [Read-Write] (RigVMAnimEasingType)
  - `wave_frequency`: `Vector` — [Read-Write] (Vector)
  - `wave_maximum`: `float` — [Read-Write] (float)
  - `wave_minimum`: `float` — [Read-Write] (float)
  - `wave_noise`: `Vector` — [Read-Write] (Vector)
  - `wave_offset`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_ChainHarmonicsPerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_ChainHarmonics.h`

Given a root will drive all items underneath in a chain based harmonics spectrum

**Properties** (8):
  - `chain_root`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `draw_world_offset`: `Transform` — [Read-Write] (Transform)
  - `pendulum`: `RigUnit_ChainHarmonics_Pendulum` — [Read-Write] (RigUnit_ChainHarmonics_Pendulum)
  - `reach`: `RigUnit_ChainHarmonics_Reach` — [Read-Write] (RigUnit_ChainHarmonics_Reach)
  - `speed`: `Vector` — [Read-Write] (Vector)
  - `wave`: `RigUnit_ChainHarmonics_Wave` — [Read-Write] (RigUnit_ChainHarmonics_Wave)
  - `wave_curve`: `RuntimeFloatCurve` [Read-Only] — [Read-Only] (RuntimeFloatCurve)

### `unreal.RigUnit_ChainInfo`
Inherits: `RigUnit_HighlevelBase` | Header: `RigUnit_ChainInfo.h`

Retrieves various pieces of info about an interpolated transform hierarchy from an rig element item list

**Properties** (11):
  - `calculate_stretch`: `bool` — [Read-Write] * If True calculate stretch factors of chain and current segment (bool)
  - `chain_length`: `float` [Read-Only] — [Read-Only] * The length of the interpolated chain (float)
  - `chain_stretch_factor`: `float` [Read-Only] — [Read-Only] * Stretch factor of chain (float)
  - `debug`: `bool` — [Read-Write] * Enable debug draw for node (bool)
  - `debug_scale`: `float` — [Read-Write] * Debug draw scale (float)
  - `initial`: `bool` — [Read-Write] * If True use initial transform values for chain (bool)
  - `interpolated_transform`: `Transform` [Read-Only] — [Read-Only] * The interpolated transform at the chainâs input parameter (Transform)
  - `items`: `None` — [Read-Write] * The items to use to interpret the chain (Array[RigElementKey])
  - `param`: `float` — [Read-Write] * The parameter value down the chain of items from 0 to 1 (float)
  - `param_length`: `float` [Read-Only] — [Read-Only] * The length of the interpolated chain (float)
  - `segment_info`: `RigUnit_ChainInfo_SegmentInfo` [Read-Only] — [Read-Only] * Segment Info (RigUnit_ChainInfo_SegmentInfo)

### `unreal.RigUnit_ChainInfo_SegmentInfo`
Inherits: `StructBase` | Header: `RigUnit_ChainInfo.h`

Rig Unit Chain Info Segment Info

### `unreal.RigUnit_Clamp_Float`
Inherits: `RigUnit` | Header: `RigUnit_Float.h`

Two args and a result of float type

**Properties** (4):
  - `max`: `float` — [Read-Write] (float)
  - `min`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigUnit_CollectionAddItem`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Adds an element to an existing collection

**Properties** (3):
  - `collection`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `result`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)

### `unreal.RigUnit_CollectionBase`
Inherits: `RigUnit` | Header: `RigUnit_Collection.h`

Rig Unit Collection Base

### `unreal.RigUnit_CollectionBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigUnit_Collection.h`

Rig Unit Collection Base Mutable

### `unreal.RigUnit_CollectionChain`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Creates a collection based on a first and last item within a chain. Chains can refer to bone chains or chains within a control hierarchy.

**Properties** (4):
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `first_item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `last_item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `reverse`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_CollectionChainArray`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Creates an item array based on a first and last item within a chain. Chains can refer to bone chains or chains within a control hierarchy.

**Properties** (4):
  - `first_item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `items`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `last_item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `reverse`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_CollectionChildren`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Creates a collection based on the direct or recursive children of a provided parent item. Returns an empty collection for an invalid parent item.

**Properties** (5):
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `include_parent`: `bool` — [Read-Write] (bool)
  - `parent`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `recursive`: `bool` — [Read-Write] (bool)
  - `type_to_search`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit_CollectionChildrenArray`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Creates an item array based on the direct or recursive children of a provided parent item. Returns an empty array for an invalid parent item.

**Properties** (6):
  - `default_children`: `bool` — [Read-Write] When true, it will return all children, regardless of whether the parent is active or n...
  - `include_parent`: `bool` — [Read-Write] (bool)
  - `items`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `parent`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `recursive`: `bool` — [Read-Write] (bool)
  - `type_to_search`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit_CollectionCount`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns the number of elements in a collection

**Properties** (2):
  - `collection`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `count`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigUnit_CollectionDifference`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns the difference between two collections (the items present in A but not in B).

**Properties** (3):
  - `a`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `b`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)

### `unreal.RigUnit_CollectionGetAll`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Creates an item array for all elements given the filter.

**Properties** (2):
  - `items`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `type_to_search`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit_CollectionGetItems`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns an array of items provided a collection

**Properties** (2):
  - `collection`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `items`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])

### `unreal.RigUnit_CollectionGetParentIndices`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns an array of relative parent indices for each item. Several options here a) If an item has multiple parents the major parent (based on the weights) will be returned. b) If an item has a parent ...

**Properties** (2):
  - `collection`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `parent_indices`: `None` [Read-Only] — [Read-Only] (Array[int32])

### `unreal.RigUnit_CollectionGetParentIndicesItemArray`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns an array of relative parent indices for each item. Several options here a) If an item has multiple parents the major parent (based on the weights) will be returned. b) If an item has a parent ...

**Properties** (2):
  - `items`: `None` — [Read-Write] (Array[RigElementKey])
  - `parent_indices`: `None` [Read-Only] — [Read-Only] (Array[int32])

### `unreal.RigUnit_CollectionIntersection`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns the intersection of two provided collections (the items present in both A and B).

**Properties** (3):
  - `a`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `b`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)

### `unreal.RigUnit_CollectionItemAtIndex`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns a single item within a collection by index

**Properties** (3):
  - `collection`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `index`: `int` — [Read-Write] (int32)
  - `item`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)

### `unreal.RigUnit_CollectionItems`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns a collection provided a specific array of items.

**Properties** (3):
  - `allow_duplicates`: `bool` — [Read-Write] (bool)
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `items`: `None` — [Read-Write] (Array[RigElementKey])

### `unreal.RigUnit_CollectionLoop`
Inherits: `RigUnit_CollectionBaseMutable` | Header: `RigUnit_Collection.h`

Given a collection of items, execute iteratively across all items in a given collection

**Properties** (6):
  - `collection`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `completed`: `ControlRigExecuteContext` [Read-Only] — [Read-Only] (ControlRigExecuteContext)
  - `count`: `int` [Read-Only] — [Read-Only] (int32)
  - `index`: `int` [Read-Only] — [Read-Only] (int32)
  - `item`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)
  - `ratio`: `float` [Read-Only] — [Read-Only] Ranging from 0.0 (first item) and 1.0 (last item)
This is useful to drive a consecutive ...

### `unreal.RigUnit_CollectionNameSearch`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Creates a collection based on a name search. The name search is case sensitive.

**Properties** (3):
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `partial_name`: `Name` — [Read-Write] (Name)
  - `type_to_search`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit_CollectionNameSearchArray`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Creates an item array based on a name search. The name search is case sensitive.

**Properties** (3):
  - `items`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `partial_name`: `Name` — [Read-Write] (Name)
  - `type_to_search`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit_CollectionReplaceItems`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Replaces all names within the collection

**Properties** (6):
  - `allow_duplicates`: `bool` — [Read-Write] (bool)
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `items`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `new`: `Name` — [Read-Write] (Name)
  - `old`: `Name` — [Read-Write] (Name)
  - `remove_invalid_items`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_CollectionReplaceItemsArray`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Replaces all names within the item array

**Properties** (6):
  - `allow_duplicates`: `bool` — [Read-Write] (bool)
  - `items`: `None` — [Read-Write] (Array[RigElementKey])
  - `new`: `Name` — [Read-Write] (Name)
  - `old`: `Name` — [Read-Write] (Name)
  - `remove_invalid_items`: `bool` — [Read-Write] (bool)
  - `result`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])

### `unreal.RigUnit_CollectionReverse`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns the collection in reverse order

**Properties** (2):
  - `collection`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `reversed`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)

### `unreal.RigUnit_CollectionUnion`
Inherits: `RigUnit_CollectionBase` | Header: `RigUnit_Collection.h`

Returns the union of two provided collections (the combination of all items from both A and B).

**Properties** (4):
  - `a`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `allow_duplicates`: `bool` — [Read-Write] (bool)
  - `b`: `RigElementKeyCollection` — [Read-Write] (RigElementKeyCollection)
  - `collection`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)

### `unreal.RigUnit_ConnectorExecution`
Inherits: `RigUnit` | Header: `RigUnit_ConnectorExecution.h`

Event for filtering connection candidates

**Properties** (1):
  - `execute_context`: `ControlRigExecuteContext` [Read-Only] — [Read-Only] The execution result (ControlRigExecuteContext)

### `unreal.RigUnit_Control`
Inherits: `RigUnit` | Header: `RigUnit_Control.h`

A control unit used to drive a transform from an external source

**Properties** (5):
  - `base`: `Transform` — [Read-Write] The base that transform is relative to (Transform)
  - `filter`: `TransformFilter` — [Read-Write] The filter determines what axes can be manipulated by the in-viewport widgets (Transfor...
  - `init_transform`: `Transform` — [Read-Write] The initial transform that The Transform is initialized to. (Transform)
  - `result`: `Transform` [Read-Only] — [Read-Only] The resultant transform of this unit (Base * Filter(Transform)) (Transform)
  - `transform`: `EulerTransform` — [Read-Write] The transform of this control (EulerTransform)

### `unreal.RigUnit_Control_StaticMesh`
Inherits: `RigUnit_Control` | Header: `RigUnit_Control_StaticMesh.h`

A control unit used to drive a transform from an external source

**Properties** (1):
  - `mesh_transform`: `Transform` — [Read-Write] The the transform the mesh will be rendered with (applied on top of the controlâs tra...

### `unreal.RigUnit_ControlName`
Inherits: `RigUnit` | Header: `RigUnit_BoneName.h`

ControlName is used to represent a Control name in the graph

**Properties** (1):
  - `control`: `Name` — [Read-Write] The name of the Control (Name)

### `unreal.RigUnit_ConvertEulerTransform`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Euler Transform

**Properties** (2):
  - `input`: `EulerTransform` — [Read-Write] (EulerTransform)
  - `result`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigUnit_ConvertQuaternion`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Quaternion

**Properties** (2):
  - `input`: `Quat` — [Read-Write] (Quat)
  - `result`: `Rotator` [Read-Only] — [Read-Only] (Rotator)

### `unreal.RigUnit_ConvertQuaternionToVector`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Quaternion to Vector

**Properties** (2):
  - `input`: `Quat` — [Read-Write] (Quat)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigUnit_ConvertRotation`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Rotation

**Properties** (2):
  - `input`: `Rotator` — [Read-Write] (Rotator)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigUnit_ConvertRotationToVector`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Rotation to Vector

**Properties** (2):
  - `input`: `Rotator` — [Read-Write] (Rotator)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigUnit_ConvertTransform`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Transform

**Properties** (2):
  - `input`: `Transform` — [Read-Write] (Transform)
  - `result`: `EulerTransform` [Read-Only] — [Read-Only] (EulerTransform)

### `unreal.RigUnit_ConvertVectorRotation`
Inherits: `RigUnit_ConvertRotation` | Header: `RigUnit_Converter.h`

Rig Unit Convert Vector Rotation

### `unreal.RigUnit_ConvertVectorToQuaternion`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Vector to Quaternion

**Properties** (2):
  - `input`: `Vector` — [Read-Write] (Vector)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigUnit_ConvertVectorToRotation`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit Convert Vector to Rotation

**Properties** (2):
  - `input`: `Vector` — [Read-Write] (Vector)
  - `result`: `Rotator` [Read-Only] — [Read-Only] (Rotator)

### `unreal.RigUnit_CurveExists`
Inherits: `RigUnit` | Header: `RigUnit_CurveExists.h`

CurveExists is used to check whether a curve exists or not.

**Properties** (2):
  - `curve`: `Name` — [Read-Write] The name of the Curve to retrieve the transform for. (Name)
  - `exists`: `bool` [Read-Only] — [Read-Only] Boolean indicating whether the named curve exists or not.
Does not indicate whether the ...

### `unreal.RigUnit_DebugArc`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugPrimitives.h`

Rig Unit Debug Arc

**Properties** (10):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `detail`: `int` — [Read-Write] (int32)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `maximum_degrees`: `float` — [Read-Write] (float)
  - `minimum_degrees`: `float` — [Read-Write] (float)
  - `radius`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugArcItemSpace`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugPrimitives.h`

Draws an arc in the viewport, can take in different min and max degrees

**Properties** (10):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `detail`: `int` — [Read-Write] (int32)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `maximum_degrees`: `float` — [Read-Write] (float)
  - `minimum_degrees`: `float` — [Read-Write] (float)
  - `radius`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugBase`
Inherits: `RigUnit` | Header: `RigUnit_DebugBase.h`

Rig Unit Debug Base

**Properties** (1):
  - `debug_draw_settings`: `RigVMDebugDrawSettings` — [Read-Write] (RigVMDebugDrawSettings)

### `unreal.RigUnit_DebugBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigUnit_DebugBase.h`

Rig Unit Debug Base Mutable

**Properties** (1):
  - `debug_draw_settings`: `RigVMDebugDrawSettings` — [Read-Write] (RigVMDebugDrawSettings)

### `unreal.RigUnit_DebugBezier`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigUnit_DebugBezier.h`

Rig Unit Debug Bezier

**Properties** (9):
  - `bezier`: `RigVMFourPointBezier` — [Read-Write] (RigVMFourPointBezier)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `detail`: `int` — [Read-Write] (int32)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `maximum_u`: `float` — [Read-Write] (float)
  - `minimum_u`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugBezierItemSpace`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigUnit_DebugBezier.h`

Rig Unit Debug Bezier Item Space

**Properties** (9):
  - `bezier`: `RigVMFourPointBezier` — [Read-Write] (RigVMFourPointBezier)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `detail`: `int` — [Read-Write] (int32)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `maximum_u`: `float` — [Read-Write] (float)
  - `minimum_u`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugHierarchy`
Inherits: `RigVMFunction_DebugBase` | Header: `RigUnit_DebugHierarchy.h`

Draws vectors on each bone in the viewport across the entire hierarchy

**Properties** (7):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `execute_pin`: `RigVMExecutePin` — [Read-Write] (RigVMExecutePin)
  - `items`: `None` — [Read-Write] the items to draw the pose for.
if this is empty weâll draw the whole hierarchy (Arra...
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugLine`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugLine.h`

Rig Unit Debug Line

**Properties** (7):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugLineItemSpace`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugLine.h`

Draws a line in the viewport given a start and end vector

**Properties** (7):
  - `a`: `Vector` — [Read-Write] (Vector)
  - `b`: `Vector` — [Read-Write] (Vector)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugLineStrip`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugLineStrip.h`

Rig Unit Debug Line Strip

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `points`: `None` — [Read-Write] (Array[Vector])
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugLineStripItemSpace`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugLineStrip.h`

Draws a line strip in the viewport given any number of points

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `points`: `None` — [Read-Write] (Array[Vector])
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugPose`
Inherits: `RigVMFunction_DebugBase` | Header: `RigUnit_DebugHierarchy.h`

Draws vectors on each bone in the viewport across the entire pose

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `execute_pin`: `RigVMExecutePin` — [Read-Write] (RigVMExecutePin)
  - `items`: `None` — [Read-Write] the items to draw the pose cache for.
if this is empty weâll draw the whole pose cach...
  - `pose`: `RigPose` — [Read-Write] (RigPose)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugRectangle`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugPrimitives.h`

Rig Unit Debug Rectangle

**Properties** (7):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugRectangleItemSpace`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugPrimitives.h`

Draws a rectangle in the viewport given a transform

**Properties** (7):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugTransform`
Inherits: `RigUnit_DebugBase` | Header: `RigUnit_DebugTransform.h`

Rig Unit Debug Transform

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mode`: `RigUnitDebugTransformMode` — [Read-Write] (RigUnitDebugTransformMode)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugTransformArrayMutable`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugTransform.h`

Rig Unit Debug Transform Array Mutable

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mode`: `RigUnitDebugTransformMode` — [Read-Write] (RigUnitDebugTransformMode)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `transforms`: `None` — [Read-Write] (Array[Transform])
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugTransformArrayMutableItemSpace`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugTransform.h`

Given a transform array, will draw a point, axis, or a box in the viewport

**Properties** (9):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitDebugTransformMode` — [Read-Write] (RigUnitDebugTransformMode)
  - `parent_indices`: `None` — [Read-Write] (Array[int32])
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `transforms`: `None` — [Read-Write] (Array[Transform])
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugTransformMutable`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugTransform.h`

Rig Unit Debug Transform Mutable

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mode`: `RigUnitDebugTransformMode` — [Read-Write] (RigUnitDebugTransformMode)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `Name` — [Read-Write] (Name)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DebugTransformMutableItemSpace`
Inherits: `RigUnit_DebugBaseMutable` | Header: `RigUnit_DebugTransform.h`

Given a transform, will draw a point, axis, or a box in the viewport

**Properties** (8):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitDebugTransformMode` — [Read-Write] (RigUnitDebugTransformMode)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `world_offset`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DiscardMatches`
Inherits: `RigUnitMutable` | Header: `RigUnit_ConnectionCandidates.h`

Discards matches during a connector event

**Properties** (2):
  - `excluded`: `None` — [Read-Write] The items being interacted on (Array[RigElementKey])
  - `message`: `str` — [Read-Write] (str)

### `unreal.RigUnit_Distance_VectorVector`
Inherits: `RigUnit` | Header: `RigUnit_Vector.h`

Rig Unit Distance Vector Vector

**Properties** (3):
  - `argument0`: `Vector` — [Read-Write] (Vector)
  - `argument1`: `Vector` — [Read-Write] (Vector)
  - `result`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.RigUnit_DistributeRotation`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_DistributeRotation.h`

Distributes rotations provided along a chain. Each rotation is expressed by a quaternion and a ratio, where the ratio is between 0.0 and 1.0 Note: This node adds rotation in local space of each bone!

**Properties** (6):
  - `end_bone`: `Name` — [Read-Write] The name of the last bone to align (Name)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied (Array[RigUnit_DistributeRotation_Rotation])
  - `start_bone`: `Name` — [Read-Write] The name of the first bone to align (Name)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_DistributeRotation_Rotation`
Inherits: `StructBase` | Header: `RigUnit_DistributeRotation.h`

Rig Unit Distribute Rotation Rotation

**Properties** (2):
  - `ratio`: `float` [Read-Only] — [Read-Only] The ratio of where this rotation sits along the chain (float)
  - `rotation`: `Quat` — [Read-Write] The rotation to be applied (Quat)

### `unreal.RigUnit_DistributeRotationForCollection`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_DistributeRotation.h`

Distributes rotations provided across a collection of items. Each rotation is expressed by a quaternion and a ratio, where the ratio is between 0.0 and 1.0 Note: This node adds rotation in local space...

**Properties** (4):
  - `items`: `RigElementKeyCollection` — [Read-Write] The items to use to distribute the rotation (RigElementKeyCollection)
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied (Array[RigUnit_DistributeRotation_Rotation])
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_DistributeRotationForItemArray`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_DistributeRotation.h`

Distributes rotations provided across a array of items. Each rotation is expressed by a quaternion and a ratio, where the ratio is between 0.0 and 1.0 Note: This node adds rotation in local space of e...

**Properties** (4):
  - `items`: `None` — [Read-Write] The items to use to distribute the rotation (Array[RigElementKey])
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied (Array[RigUnit_DistributeRotation_Rotation])
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_Divide_FloatFloat`
Inherits: `RigUnit_BinaryFloatOp` | Header: `RigUnit_Float.h`

Rig Unit Divide Float Float

### `unreal.RigUnit_Divide_VectorVector`
Inherits: `RigUnit_BinaryVectorOp` | Header: `RigUnit_Vector.h`

Rig Unit Divide Vector Vector

### `unreal.RigUnit_DrawContainerGetInstruction`
Inherits: `RigUnit` | Header: `RigUnit_DrawContainer.h`

Get Imported Draw Container curve transform and color

**Properties** (3):
  - `color`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `instruction_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.RigUnit_DrawContainerSetColor`
Inherits: `RigUnitMutable` | Header: `RigUnit_DrawContainer.h`

Set Imported Draw Container curve color

**Properties** (2):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `instruction_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.RigUnit_DrawContainerSetThickness`
Inherits: `RigUnitMutable` | Header: `RigUnit_DrawContainer.h`

Set Imported Draw Container curve thickness

**Properties** (2):
  - `instruction_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `thickness`: `float` — [Read-Write] (float)

### `unreal.RigUnit_DrawContainerSetTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_DrawContainer.h`

Set Imported Draw Container curve transform

**Properties** (2):
  - `instruction_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_DynamicHierarchyBase`
Inherits: `RigUnit` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Dynamic Hierarchy Base

### `unreal.RigUnit_DynamicHierarchyBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Dynamic Hierarchy Base Mutable

### `unreal.RigUnit_EndProfilingTimer`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigUnit_ProfilingBracket.h`

Ends an existing profiling timer for debugging, used in conjunction with Start Profiling Timer

**Properties** (2):
  - `number_of_measurements`: `int` [Read-Only] — [Read-Only] (int32)
  - `prefix`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.RigUnit_FABRIK`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_FABRIK.h`

The FABRIK solver can solve N-Bone chains using the Forward and Backward Reaching Inverse Kinematics algorithm. For now this node supports single effector chains only.

**Properties** (8):
  - `effector_bone`: `Name` — [Read-Write] The last bone in the chain to solve - the effector (Name)
  - `effector_transform`: `Transform` — [Read-Write] The transform of the effector in global space (Transform)
  - `max_iterations`: `int` — [Read-Write] The maximum number of iterations. Values between 4 and 16 are common. (int32)
  - `precision`: `float` [Read-Only] — [Read-Only] The precision to use for the fabrik solver (float)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `set_effector_transform`: `bool` — [Read-Write] The option to set the effector transform (bool)
  - `start_bone`: `Name` — [Read-Write] The first bone in the chain to solve (Name)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_FABRIKItemArray`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_FABRIK.h`

The FABRIK solver can solve N-Bone chains using the Forward and Backward Reaching Inverse Kinematics algorithm. For now this node supports single effector chains only.

**Properties** (7):
  - `effector_transform`: `Transform` — [Read-Write] The transform of the effector in global space (Transform)
  - `items`: `None` — [Read-Write] The chain to use (Array[RigElementKey])
  - `max_iterations`: `int` — [Read-Write] The maximum number of iterations. Values between 4 and 16 are common. (int32)
  - `precision`: `float` [Read-Only] — [Read-Only] The precision to use for the fabrik solver (float)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `set_effector_transform`: `bool` — [Read-Write] The option to set the effector transform (bool)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_FABRIKPerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_FABRIK.h`

The FABRIK solver can solve N-Bone chains using the Forward and Backward Reaching Inverse Kinematics algorithm. For now this node supports single effector chains only.

**Properties** (7):
  - `effector_transform`: `Transform` — [Read-Write] The transform of the effector in global space (Transform)
  - `items`: `RigElementKeyCollection` — [Read-Write] The chain to use (RigElementKeyCollection)
  - `max_iterations`: `int` — [Read-Write] The maximum number of iterations. Values between 4 and 16 are common. (int32)
  - `precision`: `float` [Read-Only] — [Read-Only] The precision to use for the fabrik solver (float)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `set_effector_transform`: `bool` — [Read-Write] The option to set the effector transform (bool)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_FilterItemsByMetadataTags`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Filters an item array by a list of tags

**Properties** (5):
  - `inclusive`: `bool` — [Read-Write] If set to true only items with ALL of tags will be returned,
if set to false items with...
  - `items`: `None` — [Read-Write] The items to filter (Array[RigElementKey])
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `result`: `None` [Read-Only] — [Read-Only] The results of the filter (Array[RigElementKey])
  - `tags`: `None` — [Read-Write] The tags to find (Array[Name])

### `unreal.RigUnit_FindClosestItem`
Inherits: `RigUnitMutable` | Header: `RigUnit_FindClosestItem.h`

Rig Unit Find Closest Item

**Properties** (3):
  - `item`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)
  - `items`: `None` — [Read-Write] (Array[RigElementKey])
  - `point`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_FindItemsWithMetadata`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Returns all items containing a specific set of metadata

**Properties** (4):
  - `items`: `None` [Read-Only] — [Read-Only] The items containing the metadata (Array[RigElementKey])
  - `name`: `Name` — [Read-Write] The name of the metadata to find (Name)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `type`: `RigMetadataType` — [Read-Write] The type of metadata to find (RigMetadataType)

### `unreal.RigUnit_FindItemsWithMetadataTag`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Returns all items with a specific tag

**Properties** (3):
  - `items`: `None` [Read-Only] — [Read-Only] The items containing the metadata (Array[RigElementKey])
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `tag`: `Name` — [Read-Write] The name of the tag to find (Name)

### `unreal.RigUnit_FindItemsWithMetadataTagArray`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Returns all items with a specific tag

**Properties** (3):
  - `items`: `None` [Read-Only] — [Read-Only] The items containing the metadata (Array[RigElementKey])
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `tags`: `None` — [Read-Write] The tags to find (Array[Name])

### `unreal.RigUnit_FitChainToCurve`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_FitChainToCurve.h`

Fits a given chain to a four point bezier curve. Additionally provides rotational control matching the features of the Distribute Rotation node.

**Properties** (15):
  - `alignment`: `ControlRigCurveAlignment` [Read-Only] — [Read-Only] Specifies how to align the chain on the curve (ControlRigCurveAlignment)
  - `bezier`: `RigVMFourPointBezier` — [Read-Write] The curve to align to (RigVMFourPointBezier)
  - `debug_settings`: `RigUnit_FitChainToCurve_DebugSettings` — [Read-Write] (RigUnit_FitChainToCurve_DebugSettings)
  - `end_bone`: `Name` — [Read-Write] The name of the last bone to align (Name)
  - `maximum`: `float` [Read-Only] — [Read-Only] The maximum U value to use on the curve (float)
  - `minimum`: `float` [Read-Only] — [Read-Only] The minimum U value to use on the curve (float)
  - `pole_vector_position`: `Vector` — [Read-Write] The the position of the pole vector used for aligning the secondary axis.
Only has an e...
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied along the curve (Array[RigUnit_FitChainToCurve_Rota...
  - `sampling_precision`: `int` [Read-Only] — [Read-Only] The number of samples to use on the curve. Clamped at 64. (int32)
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the pole vector.
You can use (0.0, 0.0, 0.0) to ...
  - `start_bone`: `Name` — [Read-Write] The name of the first bone to align (Name)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_FitChainToCurve_DebugSettings`
Inherits: `StructBase` | Header: `RigUnit_FitChainToCurve.h`

Rig Unit Fit Chain to Curve Debug Settings

**Properties** (5):
  - `curve_color`: `LinearColor` — [Read-Write] The color to use for debug drawing (LinearColor)
  - `enabled`: `bool` — [Read-Write] If enabled debug information will be drawn (bool)
  - `scale`: `float` — [Read-Write] The size of the debug drawing information (float)
  - `segments_color`: `LinearColor` — [Read-Write] The color to use for debug drawing (LinearColor)
  - `world_offset`: `Transform` — [Read-Write] The offset at which to draw the debug information in the world (Transform)

### `unreal.RigUnit_FitChainToCurve_Rotation`
Inherits: `StructBase` | Header: `RigUnit_FitChainToCurve.h`

Rig Unit Fit Chain to Curve Rotation

**Properties** (2):
  - `ratio`: `float` [Read-Only] — [Read-Only] The ratio of where this rotation sits along the chain (float)
  - `rotation`: `Quat` — [Read-Write] The rotation to be applied (Quat)

### `unreal.RigUnit_FitChainToCurveItemArray`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_FitChainToCurve.h`

Fits a given chain to a four point bezier curve. Additionally provides rotational control matching the features of the Distribute Rotation node.

**Properties** (14):
  - `alignment`: `ControlRigCurveAlignment` [Read-Only] — [Read-Only] Specifies how to align the chain on the curve (ControlRigCurveAlignment)
  - `bezier`: `RigVMFourPointBezier` — [Read-Write] The curve to align to (RigVMFourPointBezier)
  - `debug_settings`: `RigUnit_FitChainToCurve_DebugSettings` — [Read-Write] (RigUnit_FitChainToCurve_DebugSettings)
  - `items`: `None` — [Read-Write] The items to align (Array[RigElementKey])
  - `maximum`: `float` [Read-Only] — [Read-Only] The maximum U value to use on the curve (float)
  - `minimum`: `float` [Read-Only] — [Read-Only] The minimum U value to use on the curve (float)
  - `pole_vector_position`: `Vector` — [Read-Write] The the position of the pole vector used for aligning the secondary axis.
Only has an e...
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied along the curve (Array[RigUnit_FitChainToCurve_Rota...
  - `sampling_precision`: `int` [Read-Only] — [Read-Only] The number of samples to use on the curve. Clamped at 64. (int32)
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the pole vector.
You can use (0.0, 0.0, 0.0) to ...
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_FitChainToCurvePerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_FitChainToCurve.h`

Fits a given chain to a four point bezier curve. Additionally provides rotational control matching the features of the Distribute Rotation node.

**Properties** (14):
  - `alignment`: `ControlRigCurveAlignment` [Read-Only] — [Read-Only] Specifies how to align the chain on the curve (ControlRigCurveAlignment)
  - `bezier`: `RigVMFourPointBezier` — [Read-Write] The curve to align to (RigVMFourPointBezier)
  - `debug_settings`: `RigUnit_FitChainToCurve_DebugSettings` — [Read-Write] (RigUnit_FitChainToCurve_DebugSettings)
  - `items`: `RigElementKeyCollection` — [Read-Write] The items to align (RigElementKeyCollection)
  - `maximum`: `float` [Read-Only] — [Read-Only] The maximum U value to use on the curve (float)
  - `minimum`: `float` [Read-Only] — [Read-Only] The minimum U value to use on the curve (float)
  - `pole_vector_position`: `Vector` — [Read-Write] The the position of the pole vector used for aligning the secondary axis.
Only has an e...
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between to rotations. (RigVMAnimEasingType)
  - `rotations`: `None` — [Read-Write] The list of rotations to be applied along the curve (Array[RigUnit_FitChainToCurve_Rota...
  - `sampling_precision`: `int` [Read-Only] — [Read-Only] The number of samples to use on the curve. Clamped at 64. (int32)
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the pole vector.
You can use (0.0, 0.0, 0.0) to ...
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_GetAnimationChannelBase`
Inherits: `RigUnit` | Header: `RigUnit_ControlChannel.h`

Get Animation Channel is used to retrieve a controlâs animation channel value

**Properties** (3):
  - `channel`: `Name` — [Read-Write] The name of the animation channel to retrieve the value for. (Name)
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the value for. (Name)
  - `initial`: `bool` — [Read-Write] If set to true the initial value will be returned (bool)

### `unreal.RigUnit_GetAnimationChannelFromItemBase`
Inherits: `RigUnit` | Header: `RigUnit_ControlChannelFromItem.h`

Get Animation Channel is used to retrieve a controlâs animation channel value

**Properties** (2):
  - `initial`: `bool` — [Read-Write] If set to true the initial value will be returned (bool)
  - `item`: `RigElementKey` — [Read-Write] The item representing the channel (RigElementKey)

### `unreal.RigUnit_GetBoneTransform`
Inherits: `RigUnit` | Header: `RigUnit_GetBoneTransform.h`

GetBoneTransform is used to retrieve a single transform from a hierarchy.

**Properties** (3):
  - `bone`: `Name` — [Read-Write] The name of the Bone to retrieve the transform for. (Name)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be retrieved
in local or global space. (RigVMT...
  - `transform`: `Transform` [Read-Only] — [Read-Only] The current transform of the given bone - or identity in case it wasnât found. (Transf...

### `unreal.RigUnit_GetBoolAnimationChannel`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Get Bool Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `bool` [Read-Only] — [Read-Only] The current value of the animation channel (bool)

### `unreal.RigUnit_GetBoolAnimationChannelFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Get Bool Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `bool` [Read-Only] — [Read-Only] The current value of the animation channel (bool)

### `unreal.RigUnit_GetCandidates`
Inherits: `RigUnit` | Header: `RigUnit_ConnectionCandidates.h`

Returns the connection candidates for one connector

**Properties** (2):
  - `candidates`: `None` [Read-Only] — [Read-Only] The items being interacted on (Array[RigElementKey])
  - `connector`: `RigElementKey` [Read-Only] — [Read-Only] The connector being resolved (RigElementKey)

### `unreal.RigUnit_GetControlBool`
Inherits: `RigUnit` | Header: `RigUnit_GetControlTransform.h`

GetControlBool is used to retrieve a single Bool from a hierarchy.

**Properties** (2):
  - `bool_value`: `bool` [Read-Only] — [Read-Only] The current bool of the given bone - or identity in case it wasnât found. (bool)
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the bool for. (Name)

### `unreal.RigUnit_GetControlColor`
Inherits: `RigUnit` | Header: `RigUnit_SetControlColor.h`

GetControlColor is used to retrieve the color of control

**Properties** (2):
  - `color`: `LinearColor` [Read-Only] — [Read-Only] The color of the control (LinearColor)
  - `control`: `Name` — [Read-Write] The name of the Control to get the color for. (Name)

### `unreal.RigUnit_GetControlDrivenList`
Inherits: `RigUnit` | Header: `RigUnit_SetControlDrivenList.h`

GetControlDrivenList is used to retrieve the list of affected controls of an indirect control

**Properties** (2):
  - `control`: `Name` — [Read-Write] The name of the Control to get the list for (Name)
  - `driven`: `None` [Read-Only] — [Read-Only] The list of affected controls (Array[RigElementKey])

### `unreal.RigUnit_GetControlFloat`
Inherits: `RigUnit` | Header: `RigUnit_GetControlTransform.h`

GetControlFloat is used to retrieve a single Float from a hierarchy.

**Properties** (4):
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the Float for. (Name)
  - `float_value`: `float` [Read-Only] — [Read-Only] The current value of the control. (float)
  - `maximum`: `float` [Read-Only] — [Read-Only] The maximum value of the control. (float)
  - `minimum`: `float` [Read-Only] — [Read-Only] The minimum value of the control. (float)

### `unreal.RigUnit_GetControlInitialTransform`
Inherits: `RigUnit` | Header: `RigUnit_GetControlInitialTransform.h`

GetControlTransform is used to retrieve a single transform from a hierarchy.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the transform for. (Name)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the Controlâs transform should be retrieved
in local or global space. (Rig...
  - `transform`: `Transform` [Read-Only] — [Read-Only] The current transform of the given bone - or identity in case it wasnât found. (Transf...

### `unreal.RigUnit_GetControlInteger`
Inherits: `RigUnit` | Header: `RigUnit_GetControlTransform.h`

GetControlFloat is used to retrieve a single Integer from a hierarchy.

**Properties** (4):
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the Integer for. (Name)
  - `integer_value`: `int` [Read-Only] — [Read-Only] The current value of the control. (int32)
  - `maximum`: `int` [Read-Only] — [Read-Only] The maximum value of the control. (int32)
  - `minimum`: `int` [Read-Only] — [Read-Only] The minimum value of the control. (int32)

### `unreal.RigUnit_GetControlOffset`
Inherits: `RigUnit` | Header: `RigUnit_GetControlOffset.h`

GetControlOffset is used to perform a change in the hierarchy by setting a single controlâs transform. This is typically only used during the Construction Event.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `offset_transform`: `Transform` [Read-Only] — [Read-Only] The current transform of the given item - or identity in case it wasnât found. (Transf...
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be retrieved in local or global space (RigVMTransformSp...

### `unreal.RigUnit_GetControlRotator`
Inherits: `RigUnit` | Header: `RigUnit_GetControlTransform.h`

GetControlRotator is used to retrieve a single Rotator from a hierarchy.

**Properties** (5):
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the Rotator for. (Name)
  - `maximum`: `Rotator` [Read-Only] — [Read-Only] The maximum value of the control. (Rotator)
  - `minimum`: `Rotator` [Read-Only] — [Read-Only] The minimum value of the control. (Rotator)
  - `rotator`: `Rotator` [Read-Only] — [Read-Only] The current value of the control. (Rotator)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the Controlâs Rotator should be retrieved
in local or global space. (RigVM...

### `unreal.RigUnit_GetControlTransform`
Inherits: `RigUnit` | Header: `RigUnit_GetControlTransform.h`

GetControlTransform is used to retrieve a single transform from a hierarchy.

**Properties** (5):
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the transform for. (Name)
  - `maximum`: `Transform` [Read-Only] — [Read-Only] The maximum value of the control. (Transform)
  - `minimum`: `Transform` [Read-Only] — [Read-Only] The minimum value of the control. (Transform)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the Controlâs transform should be retrieved
in local or global space. (Rig...
  - `transform`: `Transform` [Read-Only] — [Read-Only] The current value of the control. (Transform)

### `unreal.RigUnit_GetControlVector`
Inherits: `RigUnit` | Header: `RigUnit_GetControlTransform.h`

GetControlVector is used to retrieve a single Vector from a hierarchy, can be used for Controls of type âPositionâ or âScaleâ.

**Properties** (5):
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the Vector for. (Name)
  - `maximum`: `Vector` [Read-Only] — [Read-Only] The maximum value of the control. (Vector)
  - `minimum`: `Vector` [Read-Only] — [Read-Only] The minimum value of the control. (Vector)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the Controlâs Vector should be retrieved
in local or global space. (RigVMT...
  - `vector`: `Vector` [Read-Only] — [Read-Only] The current value of the control. (Vector)

### `unreal.RigUnit_GetControlVector2D`
Inherits: `RigUnit` | Header: `RigUnit_GetControlTransform.h`

GetControlVector2D is used to retrieve a single Vector2D from a hierarchy.

**Properties** (4):
  - `control`: `Name` — [Read-Write] The name of the Control to retrieve the Vector2D for. (Name)
  - `maximum`: `Vector2D` [Read-Only] — [Read-Only] The maximum value of the control. (Vector2D)
  - `minimum`: `Vector2D` [Read-Only] — [Read-Only] The minimum value of the control. (Vector2D)
  - `vector`: `Vector2D` [Read-Only] — [Read-Only] The current value of the control. (Vector2D)

### `unreal.RigUnit_GetControlVisibility`
Inherits: `RigUnit` | Header: `RigUnit_SetControlVisibility.h`

GetControlVisibility is used to retrieve the visibility of a control

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] The name of the Control to set the visibility for. (RigElementKey)
  - `visible`: `bool` [Read-Only] — [Read-Only] The visibility of the control (bool)

### `unreal.RigUnit_GetCurrentNameSpace`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns the currently used namespace of the module.

**Properties** (1):
  - `name_space`: `str` [Read-Only] — [Read-Only] * The current namespace of the rig module (str)

### `unreal.RigUnit_GetCurveValue`
Inherits: `RigUnit` | Header: `RigUnit_GetCurveValue.h`

GetCurveValue is used to retrieve a single float from a Curve

**Properties** (3):
  - `curve`: `Name` — [Read-Write] The name of the Curve to retrieve the transform for. (Name)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)
  - `value`: `float` [Read-Only] — [Read-Only] The current transform of the given Curve - or identity in case it wasnât found. (float...

### `unreal.RigUnit_GetFloatAnimationChannel`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Get Float Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `float` [Read-Only] — [Read-Only] The current value of the animation channel (float)

### `unreal.RigUnit_GetFloatAnimationChannelFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Get Float Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `float` [Read-Only] — [Read-Only] The current value of the animation channel (float)

### `unreal.RigUnit_GetInitialBoneTransform`
Inherits: `RigUnit` | Header: `RigUnit_GetInitialBoneTransform.h`

GetInitialBoneTransform is used to retrieve a single transform from a hierarchy.

**Properties** (3):
  - `bone`: `Name` — [Read-Write] The name of the Bone to retrieve the transform for. (Name)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be retrieved
in local or global space. (RigVMT...
  - `transform`: `Transform` [Read-Only] — [Read-Only] The current transform of the given bone - or identity in case it wasnât found. (Transf...

### `unreal.RigUnit_GetIntAnimationChannel`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Get Int Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `int` [Read-Only] — [Read-Only] The current value of the animation channel (int32)

### `unreal.RigUnit_GetIntAnimationChannelFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Get Int Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `int` [Read-Only] — [Read-Only] The current value of the animation channel (int32)

### `unreal.RigUnit_GetItemModuleName`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns the namespace of a given item. This may be an empty string if the item doesnât have a namespace.

**Properties** (3):
  - `is_part_of_module`: `bool` [Read-Only] — [Read-Only] * True if the item is part of a module (bool)
  - `item`: `RigElementKey` — [Read-Write] * The key of the item to return the module for (RigElementKey)
  - `module`: `str` [Read-Only] — [Read-Only] * The name of the module of the given item (str)

### `unreal.RigUnit_GetItemNameSpace`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns the namespace of a given item. This may be an empty string if the item doesnât have a namespace.

**Properties** (3):
  - `has_name_space`: `bool` [Read-Only] — [Read-Only] * True if the item has a valid namespace (bool)
  - `item`: `RigElementKey` — [Read-Write] * The key of the item to return the namespace for (RigElementKey)
  - `name_space`: `str` [Read-Only] — [Read-Only] * The namespace of the item (str)

### `unreal.RigUnit_GetItemShortName`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns the short name of the given item (without the namespace)

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] * The key of the item to return the short name for (RigElementKey)
  - `short_name`: `Name` [Read-Only] — [Read-Only] * The short name of the item (without the namespace) (Name)

### `unreal.RigUnit_GetItemsInModule`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns all items (based on a filter) in the current module.

**Properties** (2):
  - `items`: `None` [Read-Only] — [Read-Only] * The items within the module (Array[RigElementKey])
  - `type_to_search`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit_GetItemsInNameSpace`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns all items (based on a filter) in the current namespace.

**Properties** (2):
  - `items`: `None` [Read-Only] — [Read-Only] * The items within the namespace (Array[RigElementKey])
  - `type_to_search`: `RigElementType` — [Read-Write] (RigElementType)

### `unreal.RigUnit_GetJointTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_GetJointTransform.h`

Rig Unit Get Joint Transform

**Properties** (6):
  - `base_joint`: `Name` — [Read-Write] Transform op option. Use if ETransformSpace is BaseJoint (Name)
  - `base_transform`: `Transform` — [Read-Write] Transform op option. Use if ETransformSpace is BaseTransform (Transform)
  - `joint`: `Name` — [Read-Write] (Name)
  - `output`: `Transform` [Read-Only] — [Read-Only] possibly space, relative transform so on can be input (Transform)
  - `transform_space`: `TransformSpaceMode` — [Read-Write] (TransformSpaceMode)
  - `type`: `TransformGetterType` — [Read-Write] (TransformGetterType)

### `unreal.RigUnit_GetMetadataTags`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Returns the metadata tags on an item

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] The item to check the metadata for (RigElementKey)
  - `tags`: `None` [Read-Only] — [Read-Only] The name of the tag to check (Array[Name])

### `unreal.RigUnit_GetModuleName`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns the name of the current module instance.

**Properties** (1):
  - `module`: `str` [Read-Only] — [Read-Only] * The name of the module (str)

### `unreal.RigUnit_GetRelativeBoneTransform`
Inherits: `RigUnit` | Header: `RigUnit_GetRelativeBoneTransform.h`

GetBoneTransform is used to retrieve a single transform from a hierarchy.

**Properties** (3):
  - `bone`: `Name` — [Read-Write] The name of the Bone to retrieve the transform for. (Name)
  - `space`: `Name` — [Read-Write] The name of the Bone to retrieve the transform relative within. (Name)
  - `transform`: `Transform` [Read-Only] — [Read-Only] The current transform of the given bone - or identity in case it wasnât found. (Transf...

### `unreal.RigUnit_GetRelativeTransform`
Inherits: `RigUnit_BinaryTransformOp` | Header: `RigUnit_Transform.h`

Rig Unit Get Relative Transform

### `unreal.RigUnit_GetRelativeTransformForItem`
Inherits: `RigUnit` | Header: `RigUnit_GetRelativeTransform.h`

GetRelativeTransform is used to retrieve a single transform from a hierarchy in the space of another transform

**Properties** (5):
  - `child`: `RigElementKey` — [Read-Write] The child item to retrieve the transform for (RigElementKey)
  - `child_initial`: `bool` — [Read-Write] Defines if the childâs transform should be retrieved as current (false) or initial (t...
  - `parent`: `RigElementKey` — [Read-Write] The parent item to use.
The child transform will be retrieve in the space of the parent...
  - `parent_initial`: `bool` — [Read-Write] Defines if the parentâs transform should be retrieved as current (false) or initial (...
  - `relative_transform`: `Transform` [Read-Only] — [Read-Only] The transform of the given child item relative to the provided parent (Transform)

### `unreal.RigUnit_GetRotatorAnimationChannel`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Get Rotator Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Rotator` [Read-Only] — [Read-Only] The current value of the animation channel (Rotator)

### `unreal.RigUnit_GetRotatorAnimationChannelFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Get Rotator Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Rotator` [Read-Only] — [Read-Only] The current value of the animation channel (Rotator)

### `unreal.RigUnit_GetShapeTransform`
Inherits: `RigUnit` | Header: `RigUnit_SetControlOffset.h`

GetShapeTransform is used to retrieve single controlâs shape transform. This is typically only used during the Construction Event.

**Properties** (2):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `transform`: `Transform` [Read-Only] — [Read-Only] The shape transform to set for the control (Transform)

### `unreal.RigUnit_GetSpaceTransform`
Inherits: `RigUnit` | Header: `RigUnit_GetSpaceTransform.h`

GetSpaceTransform is used to retrieve a single transform from a hierarchy.

**Properties** (3):
  - `space`: `Name` — [Read-Write] The name of the Space to retrieve the transform for. (Name)
  - `space_type`: `RigVMTransformSpace` — [Read-Write] Defines if the Spaceâs transform should be retrieved
in local or global space. (RigVM...
  - `transform`: `Transform` [Read-Only] — [Read-Only] The current transform of the given bone - or identity in case it wasnât found. (Transf...

### `unreal.RigUnit_GetTransform`
Inherits: `RigUnit` | Header: `RigUnit_GetTransform.h`

GetTransform is used to retrieve a single transform from a hierarchy.

**Properties** (4):
  - `initial`: `bool` — [Read-Write] Defines if the transform should be retrieved as current (false) or initial (true).
Init...
  - `item`: `RigElementKey` — [Read-Write] The item to retrieve the transform for (RigElementKey)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be retrieved in local or global space (RigVMTransformSp...
  - `transform`: `Transform` [Read-Only] — [Read-Only] The current transform of the given item - or identity in case it wasnât found. (Transf...

### `unreal.RigUnit_GetTransformAnimationChannel`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Get Transform Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Transform` [Read-Only] — [Read-Only] The current value of the animation channel (Transform)

### `unreal.RigUnit_GetTransformAnimationChannelFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Get Transform Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Transform` [Read-Only] — [Read-Only] The current value of the animation channel (Transform)

### `unreal.RigUnit_GetTransformArray`
Inherits: `RigUnit` | Header: `RigUnit_GetTransform.h`

GetTransformArray is used to retrieve an array of transforms from the hierarchy.

**Properties** (4):
  - `initial`: `bool` — [Read-Write] Defines if the transforms should be retrieved as current (false) or initial (true).
Ini...
  - `items`: `RigElementKeyCollection` — [Read-Write] The items to retrieve the transforms for (RigElementKeyCollection)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transforms should be retrieved in local or global space (RigVMTransformS...
  - `transforms`: `None` [Read-Only] — [Read-Only] The current transform of the given item - or identity in case it wasnât found. (Array[...

### `unreal.RigUnit_GetTransformItemArray`
Inherits: `RigUnit` | Header: `RigUnit_GetTransform.h`

GetTransformArray is used to retrieve an array of transforms from the hierarchy.

**Properties** (4):
  - `initial`: `bool` — [Read-Write] Defines if the transforms should be retrieved as current (false) or initial (true).
Ini...
  - `items`: `None` — [Read-Write] The items to retrieve the transforms for (Array[RigElementKey])
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transforms should be retrieved in local or global space (RigVMTransformS...
  - `transforms`: `None` [Read-Only] — [Read-Only] The current transform of the given item - or identity in case it wasnât found. (Array[...

### `unreal.RigUnit_GetVector2DAnimationChannel`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Get Vector2D Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector2D` [Read-Only] — [Read-Only] The current value of the animation channel (Vector2D)

### `unreal.RigUnit_GetVector2DAnimationChannelFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Get Vector2D Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector2D` [Read-Only] — [Read-Only] The current value of the animation channel (Vector2D)

### `unreal.RigUnit_GetVectorAnimationChannel`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Get Vector Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector` [Read-Only] — [Read-Only] The current value of the animation channel (Vector)

### `unreal.RigUnit_GetVectorAnimationChannelFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Get Vector Channel is used to retrieve a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector` [Read-Only] — [Read-Only] The current value of the animation channel (Vector)

### `unreal.RigUnit_Harmonics_TargetItem`
Inherits: `StructBase` | Header: `RigUnit_BoneHarmonics.h`

Rig Unit Harmonics Target Item

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] The name of the item to drive (RigElementKey)
  - `ratio`: `float` [Read-Only] — [Read-Only] The ratio of where the item sits within the harmonics system.
Valid values reach from 0....

### `unreal.RigUnit_HasMetadata`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Returns true if a given item in the hierarchy has a specific set of metadata

**Properties** (5):
  - `found`: `bool` [Read-Only] — [Read-Only] True if the item has the metadata (bool)
  - `item`: `RigElementKey` — [Read-Write] The item to check the metadata for (RigElementKey)
  - `name`: `Name` — [Read-Write] The name of the metadata to check (Name)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `type`: `RigMetadataType` — [Read-Write] The type of metadata to check for (RigMetadataType)

### `unreal.RigUnit_HasMetadataTag`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Returns true if a given item in the hierarchy has a specific tag stored in the metadata

**Properties** (4):
  - `found`: `bool` [Read-Only] — [Read-Only] True if the item has the metadata (bool)
  - `item`: `RigElementKey` — [Read-Write] The item to check the metadata for (RigElementKey)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `tag`: `Name` — [Read-Write] The name of the tag to check (Name)

### `unreal.RigUnit_HasMetadataTagArray`
Inherits: `RigUnit` | Header: `RigUnit_Metadata.h`

Returns true if a given item in the hierarchy has all of the provided tags

**Properties** (4):
  - `found`: `bool` [Read-Only] — [Read-Only] True if the item has the metadata (bool)
  - `item`: `RigElementKey` — [Read-Write] The item to check the metadata for (RigElementKey)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `tags`: `None` — [Read-Write] The name of the tag to check (Array[Name])

### `unreal.RigUnit_HierarchyAddAnimationChannel2DLimitSettings`
Inherits: `RigUnit_HierarchyAddAnimationChannelEmptyLimitSettings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Animation Channel 2DLimit Settings

**Properties** (2):
  - `x`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `y`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)

### `unreal.RigUnit_HierarchyAddAnimationChannelBool`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `initial_value`: `bool` — [Read-Write] * The initial value of the new animation channel (bool)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannelEmptyLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannelEmptyLimitSet...
  - `maximum_value`: `bool` — [Read-Write] * The maximum value for the animation channel (bool)
  - `minimum_value`: `bool` — [Read-Write] * The initial value of the new animation channel (bool)

### `unreal.RigUnit_HierarchyAddAnimationChannelEmptyLimitSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Animation Channel Empty Limit Settings

### `unreal.RigUnit_HierarchyAddAnimationChannelFloat`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `initial_value`: `float` — [Read-Write] * The initial value of the new animation channel (float)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannelSingleLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannelSingleLimitSe...
  - `maximum_value`: `float` — [Read-Write] * The maximum value for the animation channel (float)
  - `minimum_value`: `float` — [Read-Write] * The initial value of the new animation channel (float)

### `unreal.RigUnit_HierarchyAddAnimationChannelInteger`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (5):
  - `control_enum`: `Enum` — [Read-Write] * The enum to use to find valid values (Enum)
  - `initial_value`: `int` — [Read-Write] * The initial value of the new animation channel (int32)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannelSingleLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannelSingleLimitSe...
  - `maximum_value`: `int` — [Read-Write] * The maximum value for the animation channel (int32)
  - `minimum_value`: `int` — [Read-Write] * The initial value of the new animation channel (int32)

### `unreal.RigUnit_HierarchyAddAnimationChannelRotator`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `initial_value`: `Rotator` — [Read-Write] * The initial value of the new animation channel (Rotator)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannelRotatorLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannelRotatorLimitS...
  - `maximum_value`: `Rotator` — [Read-Write] * The maximum value for the animation channel (Rotator)
  - `minimum_value`: `Rotator` — [Read-Write] * The initial value of the new animation channel (Rotator)

### `unreal.RigUnit_HierarchyAddAnimationChannelRotatorLimitSettings`
Inherits: `RigUnit_HierarchyAddAnimationChannelEmptyLimitSettings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Animation Channel Rotator Limit Settings

**Properties** (3):
  - `pitch`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `roll`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `yaw`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)

### `unreal.RigUnit_HierarchyAddAnimationChannelScaleFloat`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `initial_value`: `float` — [Read-Write] * The initial value of the new animation channel (float)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannelSingleLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannelSingleLimitSe...
  - `maximum_value`: `float` — [Read-Write] * The maximum value for the animation channel (float)
  - `minimum_value`: `float` — [Read-Write] * The initial value of the new animation channel (float)

### `unreal.RigUnit_HierarchyAddAnimationChannelScaleVector`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `initial_value`: `Vector` — [Read-Write] * The initial value of the new animation channel (Vector)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannelVectorLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannelVectorLimitSe...
  - `maximum_value`: `Vector` — [Read-Write] * The maximum value for the animation channel (Vector)
  - `minimum_value`: `Vector` — [Read-Write] * The initial value of the new animation channel (Vector)

### `unreal.RigUnit_HierarchyAddAnimationChannelSingleLimitSettings`
Inherits: `RigUnit_HierarchyAddAnimationChannelEmptyLimitSettings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Animation Channel Single Limit Settings

**Properties** (1):
  - `enabled`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)

### `unreal.RigUnit_HierarchyAddAnimationChannelVector`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `initial_value`: `Vector` — [Read-Write] * The initial value of the new animation channel (Vector)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannelVectorLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannelVectorLimitSe...
  - `maximum_value`: `Vector` — [Read-Write] * The maximum value for the animation channel (Vector)
  - `minimum_value`: `Vector` — [Read-Write] * The initial value of the new animation channel (Vector)

### `unreal.RigUnit_HierarchyAddAnimationChannelVector2D`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new animation channel to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `initial_value`: `Vector2D` — [Read-Write] * The initial value of the new animation channel (Vector2D)
  - `limits_enabled`: `RigUnit_HierarchyAddAnimationChannel2DLimitSettings` — [Read-Write] * The enable settings for the limits (RigUnit_HierarchyAddAnimationChannel2DLimitSettin...
  - `maximum_value`: `Vector2D` — [Read-Write] * The maximum value for the animation channel (Vector2D)
  - `minimum_value`: `Vector2D` — [Read-Write] * The initial value of the new animation channel (Vector2D)

### `unreal.RigUnit_HierarchyAddAnimationChannelVectorLimitSettings`
Inherits: `RigUnit_HierarchyAddAnimationChannelEmptyLimitSettings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Animation Channel Vector Limit Settings

**Properties** (3):
  - `x`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `y`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `z`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)

### `unreal.RigUnit_HierarchyAddBone`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new bone to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be interpreted in local or global space (RigVMTransform...
  - `transform`: `Transform` — [Read-Write] * The initial transform of the new element (Transform)

### `unreal.RigUnit_HierarchyAddControl_ProxySettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Proxy Settings

**Properties** (3):
  - `driven_controls`: `None` — [Read-Write] (Array[RigElementKey])
  - `is_proxy`: `bool` — [Read-Write] (bool)
  - `shape_visibility`: `RigControlVisibility` — [Read-Write] (RigControlVisibility)

### `unreal.RigUnit_HierarchyAddControl_Settings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Settings

**Properties** (1):
  - `display_name`: `Name` — [Read-Write] (Name)

### `unreal.RigUnit_HierarchyAddControl_ShapeSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Shape Settings

**Properties** (4):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `name`: `Name` — [Read-Write] (Name)
  - `transform`: `Transform` — [Read-Write] (Transform)
  - `visible`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_HierarchyAddControlElement`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new control to the hierarchy

**Properties** (2):
  - `offset_space`: `RigVMTransformSpace` — [Read-Write] * The space the offset is in (RigVMTransformSpace)
  - `offset_transform`: `Transform` — [Read-Write] * The offset transform of the new control (Transform)

### `unreal.RigUnit_HierarchyAddControlFloat`
Inherits: `RigUnit_HierarchyAddControlElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new control to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `initial_value`: `float` — [Read-Write] * The initial value of the new control (float)
  - `settings`: `RigUnit_HierarchyAddControlFloat_Settings` — [Read-Write] * The settings for the control (RigUnit_HierarchyAddControlFloat_Settings)

### `unreal.RigUnit_HierarchyAddControlFloat_LimitSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Float Limit Settings

**Properties** (4):
  - `draw_limits`: `bool` — [Read-Write] (bool)
  - `limit`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `max_value`: `float` — [Read-Write] (float)
  - `min_value`: `float` — [Read-Write] (float)

### `unreal.RigUnit_HierarchyAddControlFloat_Settings`
Inherits: `RigUnit_HierarchyAddControl_Settings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Float Settings

**Properties** (5):
  - `is_scale`: `bool` — [Read-Write] (bool)
  - `limits`: `RigUnit_HierarchyAddControlFloat_LimitSettings` — [Read-Write] (RigUnit_HierarchyAddControlFloat_LimitSettings)
  - `primary_axis`: `RigControlAxis` — [Read-Write] (RigControlAxis)
  - `proxy`: `RigUnit_HierarchyAddControl_ProxySettings` — [Read-Write] (RigUnit_HierarchyAddControl_ProxySettings)
  - `shape`: `RigUnit_HierarchyAddControl_ShapeSettings` — [Read-Write] (RigUnit_HierarchyAddControl_ShapeSettings)

### `unreal.RigUnit_HierarchyAddControlInteger`
Inherits: `RigUnit_HierarchyAddControlElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new control to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `initial_value`: `int` — [Read-Write] * The initial value of the new control (int32)
  - `settings`: `RigUnit_HierarchyAddControlInteger_Settings` — [Read-Write] * The settings for the control (RigUnit_HierarchyAddControlInteger_Settings)

### `unreal.RigUnit_HierarchyAddControlInteger_LimitSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Integer Limit Settings

**Properties** (4):
  - `draw_limits`: `bool` — [Read-Write] (bool)
  - `limit`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `max_value`: `int` — [Read-Write] (int32)
  - `min_value`: `int` — [Read-Write] (int32)

### `unreal.RigUnit_HierarchyAddControlInteger_Settings`
Inherits: `RigUnit_HierarchyAddControl_Settings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Integer Settings

**Properties** (5):
  - `control_enum`: `Enum` — [Read-Write] (Enum)
  - `limits`: `RigUnit_HierarchyAddControlInteger_LimitSettings` — [Read-Write] (RigUnit_HierarchyAddControlInteger_LimitSettings)
  - `primary_axis`: `RigControlAxis` — [Read-Write] (RigControlAxis)
  - `proxy`: `RigUnit_HierarchyAddControl_ProxySettings` — [Read-Write] (RigUnit_HierarchyAddControl_ProxySettings)
  - `shape`: `RigUnit_HierarchyAddControl_ShapeSettings` — [Read-Write] (RigUnit_HierarchyAddControl_ShapeSettings)

### `unreal.RigUnit_HierarchyAddControlRotator`
Inherits: `RigUnit_HierarchyAddControlElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new control to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `initial_value`: `Rotator` — [Read-Write] * The initial value of the new control (Rotator)
  - `settings`: `RigUnit_HierarchyAddControlRotator_Settings` — [Read-Write] * The settings for the control (RigUnit_HierarchyAddControlRotator_Settings)

### `unreal.RigUnit_HierarchyAddControlRotator_LimitSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Rotator Limit Settings

**Properties** (6):
  - `draw_limits`: `bool` — [Read-Write] (bool)
  - `limit_pitch`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_roll`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_yaw`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `max_value`: `Rotator` — [Read-Write] (Rotator)
  - `min_value`: `Rotator` — [Read-Write] (Rotator)

### `unreal.RigUnit_HierarchyAddControlRotator_Settings`
Inherits: `RigUnit_HierarchyAddControl_Settings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Rotator Settings

**Properties** (7):
  - `filtered_channels`: `None` — [Read-Write] (Array[RigControlTransformChannel])
  - `initial_space`: `RigVMTransformSpace` — [Read-Write] (RigVMTransformSpace)
  - `limits`: `RigUnit_HierarchyAddControlRotator_LimitSettings` — [Read-Write] (RigUnit_HierarchyAddControlRotator_LimitSettings)
  - `preferred_rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)
  - `proxy`: `RigUnit_HierarchyAddControl_ProxySettings` — [Read-Write] (RigUnit_HierarchyAddControl_ProxySettings)
  - `shape`: `RigUnit_HierarchyAddControl_ShapeSettings` — [Read-Write] (RigUnit_HierarchyAddControl_ShapeSettings)
  - `use_preferred_rotation_order`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_HierarchyAddControlTransform`
Inherits: `RigUnit_HierarchyAddControlElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new control to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `initial_value`: `Transform` — [Read-Write] * The initial value of the new control (Transform)
  - `settings`: `RigUnit_HierarchyAddControlTransform_Settings` — [Read-Write] * The settings for the control (RigUnit_HierarchyAddControlTransform_Settings)

### `unreal.RigUnit_HierarchyAddControlTransform_LimitSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Transform Limit Settings

**Properties** (12):
  - `draw_limits`: `bool` — [Read-Write] (bool)
  - `limit_pitch`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_roll`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_scale_x`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_scale_y`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_scale_z`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_translation_x`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_translation_y`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_translation_z`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_yaw`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `max_value`: `EulerTransform` — [Read-Write] (EulerTransform)
  - `min_value`: `EulerTransform` — [Read-Write] (EulerTransform)

### `unreal.RigUnit_HierarchyAddControlTransform_Settings`
Inherits: `RigUnit_HierarchyAddControl_Settings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Transform Settings

**Properties** (7):
  - `filtered_channels`: `None` — [Read-Write] (Array[RigControlTransformChannel])
  - `initial_space`: `RigVMTransformSpace` — [Read-Write] (RigVMTransformSpace)
  - `limits`: `RigUnit_HierarchyAddControlTransform_LimitSettings` — [Read-Write] (RigUnit_HierarchyAddControlTransform_LimitSettings)
  - `preferred_rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)
  - `proxy`: `RigUnit_HierarchyAddControl_ProxySettings` — [Read-Write] (RigUnit_HierarchyAddControl_ProxySettings)
  - `shape`: `RigUnit_HierarchyAddControl_ShapeSettings` — [Read-Write] (RigUnit_HierarchyAddControl_ShapeSettings)
  - `use_preferred_rotation_order`: `bool` — [Read-Write] Enables overriding the preferred rotation order (bool)

### `unreal.RigUnit_HierarchyAddControlVector`
Inherits: `RigUnit_HierarchyAddControlElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new control to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `initial_value`: `Vector` — [Read-Write] * The initial value of the new control (Vector)
  - `settings`: `RigUnit_HierarchyAddControlVector_Settings` — [Read-Write] * The settings for the control (RigUnit_HierarchyAddControlVector_Settings)

### `unreal.RigUnit_HierarchyAddControlVector2D`
Inherits: `RigUnit_HierarchyAddControlElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new control to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `initial_value`: `Vector2D` — [Read-Write] * The initial value of the new control (Vector2D)
  - `settings`: `RigUnit_HierarchyAddControlVector2D_Settings` — [Read-Write] * The settings for the control (RigUnit_HierarchyAddControlVector2D_Settings)

### `unreal.RigUnit_HierarchyAddControlVector2D_LimitSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Vector 2D Limit Settings

**Properties** (5):
  - `draw_limits`: `bool` — [Read-Write] (bool)
  - `limit_x`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_y`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `max_value`: `Vector2D` — [Read-Write] (Vector2D)
  - `min_value`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.RigUnit_HierarchyAddControlVector2D_Settings`
Inherits: `RigUnit_HierarchyAddControl_Settings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Vector 2D Settings

**Properties** (5):
  - `filtered_channels`: `None` — [Read-Write] (Array[RigControlTransformChannel])
  - `limits`: `RigUnit_HierarchyAddControlVector2D_LimitSettings` — [Read-Write] (RigUnit_HierarchyAddControlVector2D_LimitSettings)
  - `primary_axis`: `RigControlAxis` — [Read-Write] (RigControlAxis)
  - `proxy`: `RigUnit_HierarchyAddControl_ProxySettings` — [Read-Write] (RigUnit_HierarchyAddControl_ProxySettings)
  - `shape`: `RigUnit_HierarchyAddControl_ShapeSettings` — [Read-Write] (RigUnit_HierarchyAddControl_ShapeSettings)

### `unreal.RigUnit_HierarchyAddControlVector_LimitSettings`
Inherits: `StructBase` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Vector Limit Settings

**Properties** (6):
  - `draw_limits`: `bool` — [Read-Write] (bool)
  - `limit_x`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_y`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `limit_z`: `RigControlLimitEnabled` — [Read-Write] (RigControlLimitEnabled)
  - `max_value`: `Vector` — [Read-Write] (Vector)
  - `min_value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_HierarchyAddControlVector_Settings`
Inherits: `RigUnit_HierarchyAddControl_Settings` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Control Vector Settings

**Properties** (6):
  - `filtered_channels`: `None` — [Read-Write] (Array[RigControlTransformChannel])
  - `initial_space`: `RigVMTransformSpace` — [Read-Write] (RigVMTransformSpace)
  - `is_position`: `bool` — [Read-Write] (bool)
  - `limits`: `RigUnit_HierarchyAddControlVector_LimitSettings` — [Read-Write] (RigUnit_HierarchyAddControlVector_LimitSettings)
  - `proxy`: `RigUnit_HierarchyAddControl_ProxySettings` — [Read-Write] (RigUnit_HierarchyAddControl_ProxySettings)
  - `shape`: `RigUnit_HierarchyAddControl_ShapeSettings` — [Read-Write] (RigUnit_HierarchyAddControl_ShapeSettings)

### `unreal.RigUnit_HierarchyAddElement`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Rig Unit Hierarchy Add Element

**Properties** (3):
  - `item`: `RigElementKey` [Read-Only] — [Read-Only] * The resulting item (RigElementKey)
  - `name`: `Name` — [Read-Write] * The name of the new element to add (Name)
  - `parent`: `RigElementKey` — [Read-Write] * The parent of the new element to add (RigElementKey)

### `unreal.RigUnit_HierarchyAddNull`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new null to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be interpreted in local or global space (RigVMTransform...
  - `transform`: `Transform` — [Read-Write] * The initial transform of the new element (Transform)

### `unreal.RigUnit_HierarchyAddPhysicsJoint`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_Physics.h`

Rig Unit Hierarchy Add Physics Joint

**Properties** (2):
  - `solver`: `RigPhysicsSolverID` — [Read-Write] (RigPhysicsSolverID)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_HierarchyAddPhysicsSolver`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_Physics.h`

Rig Unit Hierarchy Add Physics Solver

**Properties** (2):
  - `name`: `Name` — [Read-Write] (Name)
  - `solver`: `RigPhysicsSolverID` [Read-Only] — [Read-Only] (RigPhysicsSolverID)

### `unreal.RigUnit_HierarchyAddSocket`
Inherits: `RigUnit_HierarchyAddElement` | Header: `RigUnit_DynamicHierarchy.h`

Adds a new socket to the hierarchy Note: This node only runs as part of the construction event.

**Properties** (4):
  - `color`: `LinearColor` — [Read-Write] * The color of the socket (LinearColor)
  - `description`: `str` — [Read-Write] * The (optional) description of the socket (str)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be interpreted in local or global space (RigVMTransform...
  - `transform`: `Transform` — [Read-Write] * The initial transform of the new element (Transform)

### `unreal.RigUnit_HierarchyBase`
Inherits: `RigUnit` | Header: `RigUnit_Hierarchy.h`

Rig Unit Hierarchy Base

### `unreal.RigUnit_HierarchyBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigUnit_Hierarchy.h`

Rig Unit Hierarchy Base Mutable

### `unreal.RigUnit_HierarchyCreatePoseItemArray`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Creates the hierarchyâs pose

**Properties** (2):
  - `entries`: `None` — [Read-Write] The entries to create (Array[RigUnit_HierarchyCreatePoseItemArray_Entry])
  - `pose`: `RigPose` [Read-Only] — [Read-Only] (RigPose)

### `unreal.RigUnit_HierarchyCreatePoseItemArray_Entry`
Inherits: `StructBase` | Header: `RigUnit_Hierarchy.h`

Rig Unit Hierarchy Create Pose Item Array Entry

**Properties** (6):
  - `curve_value`: `float` — [Read-Write] in case of a curve this can be used to drive the curve value (float)
  - `euler_angles`: `Vector` — [Read-Write] in case of a control this can be used to drive the preferred euler angles (Vector)
  - `global_transform`: `Transform` — [Read-Write] (Transform)
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `local_transform`: `Transform` — [Read-Write] (Transform)
  - `use_euler_angles`: `bool` — [Read-Write] in case of a control this can be used to drive the preferred euler angles (bool)

### `unreal.RigUnit_HierarchyGetChainItemArray`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns a chain between two items

**Properties** (6):
  - `chain`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `end`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `include_end`: `bool` — [Read-Write] (bool)
  - `include_start`: `bool` — [Read-Write] (bool)
  - `reverse`: `bool` — [Read-Write] (bool)
  - `start`: `RigElementKey` — [Read-Write] (RigElementKey)

### `unreal.RigUnit_HierarchyGetChildren`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the itemâs children

**Properties** (4):
  - `children`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `include_parent`: `bool` — [Read-Write] (bool)
  - `parent`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `recursive`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_HierarchyGetParent`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the itemâs parent

**Properties** (3):
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `default_parent`: `bool` — [Read-Write] When true, it will return the default parent, regardless of whether the parent incluenc...
  - `parent`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)

### `unreal.RigUnit_HierarchyGetParents`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the itemâs parents

**Properties** (4):
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `include_child`: `bool` — [Read-Write] (bool)
  - `parents`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `reverse`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_HierarchyGetParentsItemArray`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the itemâs parents

**Properties** (5):
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `default_parent`: `bool` — [Read-Write] (bool)
  - `include_child`: `bool` — [Read-Write] (bool)
  - `parents`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `reverse`: `bool` — [Read-Write] (bool)

### `unreal.RigUnit_HierarchyGetParentWeights`
Inherits: `RigUnit_DynamicHierarchyBase` | Header: `RigUnit_DynamicHierarchy.h`

Returns the itemâs parentsâ weights

**Properties** (3):
  - `child`: `RigElementKey` — [Read-Write] * The child to retrieve the weights for (RigElementKey)
  - `parents`: `RigElementKeyCollection` [Read-Only] — [Read-Only] * The key for each parent (RigElementKeyCollection)
  - `weights`: `None` [Read-Only] — [Read-Only] * The weight of each parent (Array[RigElementWeight])

### `unreal.RigUnit_HierarchyGetParentWeightsArray`
Inherits: `RigUnit_DynamicHierarchyBase` | Header: `RigUnit_DynamicHierarchy.h`

Returns the itemâs parentsâ weights

**Properties** (3):
  - `child`: `RigElementKey` — [Read-Write] * The child to retrieve the weights for (RigElementKey)
  - `parents`: `None` [Read-Only] — [Read-Only] * The key for each parent (Array[RigElementKey])
  - `weights`: `None` [Read-Only] — [Read-Only] * The weight of each parent (Array[RigElementWeight])

### `unreal.RigUnit_HierarchyGetPose`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the hierarchyâs pose

**Properties** (4):
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)
  - `initial`: `bool` — [Read-Write] (bool)
  - `items_to_get`: `RigElementKeyCollection` — [Read-Write] An optional collection to filter against (RigElementKeyCollection)
  - `pose`: `RigPose` [Read-Only] — [Read-Only] (RigPose)

### `unreal.RigUnit_HierarchyGetPoseItemArray`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the hierarchyâs pose

**Properties** (4):
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)
  - `initial`: `bool` — [Read-Write] (bool)
  - `items_to_get`: `None` — [Read-Write] An optional collection to filter against (Array[RigElementKey])
  - `pose`: `RigPose` [Read-Only] — [Read-Only] (RigPose)

### `unreal.RigUnit_HierarchyGetShapeSettings`
Inherits: `RigUnit_DynamicHierarchyBase` | Header: `RigUnit_DynamicHierarchy.h`

Retrieves the shape settings of a control

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] * The item to change (RigElementKey)
  - `settings`: `RigUnit_HierarchyAddControl_ShapeSettings` [Read-Only] — [Read-Only] * The shape settings for the control (RigUnit_HierarchyAddControl_ShapeSettings)

### `unreal.RigUnit_HierarchyGetSiblings`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the itemâs siblings

**Properties** (3):
  - `include_item`: `bool` — [Read-Write] (bool)
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `siblings`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)

### `unreal.RigUnit_HierarchyGetSiblingsItemArray`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the itemâs siblings

**Properties** (4):
  - `default_siblings`: `bool` — [Read-Write] When true, it will return all siblings, regardless of whether the parent is active or n...
  - `include_item`: `bool` — [Read-Write] (bool)
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `siblings`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])

### `unreal.RigUnit_HierarchyImportFromSkeleton`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Imports all bones (and curves) from the currently assigned skeleton. Note: This node only runs as part of the construction event.

**Properties** (5):
  - `include_curves`: `bool` — [Read-Write] (bool)
  - `include_mesh_sockets`: `bool` — [Read-Write] (bool)
  - `include_virtual_bones`: `bool` — [Read-Write] (bool)
  - `items`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `name_space`: `Name` — [Read-Write] (Name)

### `unreal.RigUnit_HierarchyRemoveElement`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Removes an element from the hierarchy Note: This node only runs as part of the construction event.

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] * The item to remove (RigElementKey)
  - `success`: `bool` [Read-Only] — [Read-Only] * True if the element has been removed successfuly (bool)

### `unreal.RigUnit_HierarchyReset`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Removes all elements from the hierarchy Note: This node only runs as part of the construction event.

### `unreal.RigUnit_HierarchySetParentWeights`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Sets the itemâs parentsâ weights

**Properties** (2):
  - `child`: `RigElementKey` — [Read-Write] * The child to set the parentsâ weights for (RigElementKey)
  - `weights`: `None` — [Read-Write] * The weights to set for the childâs parents.
* The number of weights needs to match ...

### `unreal.RigUnit_HierarchySetPose`
Inherits: `RigUnit_HierarchyBaseMutable` | Header: `RigUnit_Hierarchy.h`

Sets the hierarchyâs pose

**Properties** (5):
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)
  - `items_to_set`: `RigElementKeyCollection` — [Read-Write] An optional collection to filter against (RigElementKeyCollection)
  - `pose`: `RigPose` — [Read-Write] (RigPose)
  - `space`: `RigVMTransformSpace` — [Read-Write] (RigVMTransformSpace)
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_HierarchySetPoseItemArray`
Inherits: `RigUnit_HierarchyBaseMutable` | Header: `RigUnit_Hierarchy.h`

Sets the hierarchyâs pose

**Properties** (5):
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)
  - `items_to_set`: `None` — [Read-Write] An optional collection to filter against (Array[RigElementKey])
  - `pose`: `RigPose` — [Read-Write] (RigPose)
  - `space`: `RigVMTransformSpace` — [Read-Write] (RigVMTransformSpace)
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_HierarchySetShapeSettings`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Changes the shape settings of a control Note: This node only runs as part of the construction event.

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] * The item to change (RigElementKey)
  - `settings`: `RigUnit_HierarchyAddControl_ShapeSettings` — [Read-Write] * The shape settings for the control (RigUnit_HierarchyAddControl_ShapeSettings)

### `unreal.RigUnit_HighlevelBase`
Inherits: `RigUnit` | Header: `RigUnit_HighlevelBase.h`

Rig Unit Highlevel Base

### `unreal.RigUnit_HighlevelBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigUnit_HighlevelBase.h`

Rig Unit Highlevel Base Mutable

### `unreal.RigUnit_InteractionExecution`
Inherits: `RigUnit` | Header: `RigUnit_InteractionExecution.h`

Event for executing logic during an interaction

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigUnit_InverseExecution`
Inherits: `RigUnit` | Header: `RigUnit_InverseExecution.h`

Event for driving elements based off the skeleton hierarchy

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigUnit_InverseQuaterion`
Inherits: `RigUnit_UnaryQuaternionOp` | Header: `RigUnit_Quaternion.h`

Rig Unit Inverse Quaterion

### `unreal.RigUnit_IsInteracting`
Inherits: `RigUnit` | Header: `RigUnit_IsInteracting.h`

Returns true if the Control Rig is being interacted

**Properties** (5):
  - `is_interacting`: `bool` [Read-Only] — [Read-Only] True if there is currently an interaction happening (bool)
  - `is_rotating`: `bool` [Read-Only] — [Read-Only] True if the current interaction is a rotation (bool)
  - `is_scaling`: `bool` [Read-Only] — [Read-Only] True if the current interaction is scaling (bool)
  - `is_translating`: `bool` [Read-Only] — [Read-Only] True if the current interaction is a translation (bool)
  - `items`: `None` [Read-Only] — [Read-Only] The items being interacted on (Array[RigElementKey])

### `unreal.RigUnit_IsItemInCurrentModule`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns true if the given item has been created by this module.

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] * The key of the item to check the module for (RigElementKey)
  - `result`: `bool` [Read-Only] — [Read-Only] * True if the item is owned by this module. (bool)

### `unreal.RigUnit_IsItemInCurrentNameSpace`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns true if the given item has been created by this module, which means that the itemâs namespace is the module namespace.

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] * The key of the item to return the namespace for (RigElementKey)
  - `result`: `bool` [Read-Only] — [Read-Only] * True if the item is in this namespace / owned by this module. (bool)

### `unreal.RigUnit_Item`
Inherits: `RigUnit` | Header: `RigUnit_BoneName.h`

The Item node is used to share a specific item across the graph

**Properties** (1):
  - `item`: `RigElementKey` — [Read-Write] The item (RigElementKey)

### `unreal.RigUnit_ItemArray`
Inherits: `RigUnit` | Header: `RigUnit_BoneName.h`

The Item Array node is used to share an array of items across the graph

**Properties** (1):
  - `items`: `None` — [Read-Write] The items (Array[RigElementKey])

### `unreal.RigUnit_ItemBase`
Inherits: `RigUnit` | Header: `RigUnit_Item.h`

Rig Unit Item Base

### `unreal.RigUnit_ItemBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigUnit_Item.h`

Rig Unit Item Base Mutable

### `unreal.RigUnit_ItemEquals`
Inherits: `RigUnit_ItemBase` | Header: `RigUnit_Item.h`

Returns true if the two items are equal

**Properties** (3):
  - `a`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `b`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigUnit_ItemExists`
Inherits: `RigUnit_ItemBase` | Header: `RigUnit_Item.h`

Returns true or false if a given item exists

**Properties** (2):
  - `exists`: `bool` [Read-Only] — [Read-Only] (bool)
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)

### `unreal.RigUnit_ItemHarmonics`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_BoneHarmonics.h`

Drives an array of items through a harmonics spectrum

**Properties** (10):
  - `rotation_order`: `EulerRotationOrder` — [Read-Write] (EulerRotationOrder)
  - `targets`: `None` [Read-Only] — [Read-Only] The items to drive. (Array[RigUnit_Harmonics_TargetItem])
  - `wave_amplitude`: `Vector` — [Read-Write] The amplitude in degrees per axis (Vector)
  - `wave_ease`: `RigVMAnimEasingType` — [Read-Write] (RigVMAnimEasingType)
  - `wave_frequency`: `Vector` — [Read-Write] (Vector)
  - `wave_maximum`: `float` — [Read-Write] (float)
  - `wave_minimum`: `float` — [Read-Write] (float)
  - `wave_noise`: `Vector` — [Read-Write] (Vector)
  - `wave_offset`: `Vector` — [Read-Write] (Vector)
  - `wave_speed`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_ItemNotEquals`
Inherits: `RigUnit_ItemBase` | Header: `RigUnit_Item.h`

Returns true if the two items are not equal

**Properties** (3):
  - `a`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `b`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigUnit_ItemReplace`
Inherits: `RigUnit_ItemBase` | Header: `RigUnit_Item.h`

Replaces the text within the name of the item

**Properties** (4):
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `new`: `Name` — [Read-Write] (Name)
  - `old`: `Name` — [Read-Write] (Name)
  - `result`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)

### `unreal.RigUnit_ItemToName`
Inherits: `RigUnit_ItemBase` | Header: `RigUnit_Item.h`

Casts the provided item key to its name

**Properties** (2):
  - `result`: `Name` [Read-Only] — [Read-Only] (Name)
  - `value`: `RigElementKey` — [Read-Write] (RigElementKey)

### `unreal.RigUnit_ItemTypeEquals`
Inherits: `RigUnit_ItemBase` | Header: `RigUnit_Item.h`

Returns true if the two itemsâ types are equal

**Properties** (3):
  - `a`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `b`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigUnit_ItemTypeNotEquals`
Inherits: `RigUnit_ItemBase` | Header: `RigUnit_Item.h`

Returns true if the two itemsâs types are not equal

**Properties** (3):
  - `a`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `b`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `result`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigUnit_MapRange_Float`
Inherits: `RigUnit` | Header: `RigUnit_Float.h`

Two args and a result of float type

**Properties** (6):
  - `max_in`: `float` — [Read-Write] (float)
  - `max_out`: `float` — [Read-Write] (float)
  - `min_in`: `float` — [Read-Write] (float)
  - `min_out`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `value`: `float` — [Read-Write] (float)

### `unreal.RigUnit_ModifyBoneTransforms`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_ModifyBoneTransforms.h`

ModifyBonetransforms is used to perform a change in the hierarchy by setting one or more bonesâ transforms.

**Properties** (5):
  - `bone_to_modify`: `None` — [Read-Write] The bones to modify. (Array[RigUnit_ModifyBoneTransforms_PerBone])
  - `mode`: `ControlRigModifyBoneMode` [Read-Only] — [Read-Only] Defines if the boneâs transform should be set
in local or global space, additive or ov...
  - `weight`: `float` — [Read-Write] At 1 this sets the transform, between 0 and 1 the transform is blended with previous re...
  - `weight_maximum`: `float` [Read-Only] — [Read-Only] The maximum of the weight - defaults to 1.0 (float)
  - `weight_minimum`: `float` [Read-Only] — [Read-Only] The minimum of the weight - defaults to 0.0 (float)

### `unreal.RigUnit_ModifyBoneTransforms_PerBone`
Inherits: `StructBase` | Header: `RigUnit_ModifyBoneTransforms.h`

Rig Unit Modify Bone Transforms Per Bone

**Properties** (2):
  - `bone`: `Name` — [Read-Write] The name of the Bone to set the transform for. (Name)
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Bone. (Transform)

### `unreal.RigUnit_ModifyTransforms`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_ModifyTransforms.h`

Modify Transforms is used to perform a change in the hierarchy by setting one or more bonesâ transforms

**Properties** (5):
  - `item_to_modify`: `None` — [Read-Write] The items to modify. (Array[RigUnit_ModifyTransforms_PerItem])
  - `mode`: `ControlRigModifyBoneMode` [Read-Only] — [Read-Only] Defines if the boneâs transform should be set
in local or global space, additive or ov...
  - `weight`: `float` — [Read-Write] At 1 this sets the transform, between 0 and 1 the transform is blended with previous re...
  - `weight_maximum`: `float` [Read-Only] — [Read-Only] The maximum of the weight - defaults to 1.0 (float)
  - `weight_minimum`: `float` [Read-Only] — [Read-Only] The minimum of the weight - defaults to 0.0 (float)

### `unreal.RigUnit_ModifyTransforms_PerItem`
Inherits: `StructBase` | Header: `RigUnit_ModifyTransforms.h`

Rig Unit Modify Transforms Per Item

**Properties** (2):
  - `item`: `RigElementKey` — [Read-Write] The item to set the transform for. (RigElementKey)
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Bone. (Transform)

### `unreal.RigUnit_MultiFABRIK`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_MultiFABRIK.h`

The FABRIK solver can solve multi chains within a root using multi effectors the Forward and Backward Reaching Inverse Kinematics algorithm. For now this node supports single effector chains only.

**Properties** (5):
  - `effectors`: `None` — [Read-Write] (Array[RigUnit_MultiFABRIK_EndEffector])
  - `max_iterations`: `int` — [Read-Write] The maximum number of iterations. Values between 4 and 16 are common. (int32)
  - `precision`: `float` [Read-Only] — [Read-Only] The precision to use for the fabrik solver (float)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true all of the global transforms of the children
of this bone will be recalc...
  - `root_bone`: `Name` — [Read-Write] The first bone in the chain to solve (Name)

### `unreal.RigUnit_MultiFABRIK_EndEffector`
Inherits: `StructBase` | Header: `RigUnit_MultiFABRIK.h`

Rig Unit Multi FABRIK End Effector

**Properties** (2):
  - `bone`: `Name` — [Read-Write] The last bone in the chain to solve - the effector (Name)
  - `location`: `Vector` — [Read-Write] The transform of the effector in global space (Vector)

### `unreal.RigUnit_Multiply_FloatFloat`
Inherits: `RigUnit_BinaryFloatOp` | Header: `RigUnit_Float.h`

Rig Unit Multiply Float Float

### `unreal.RigUnit_Multiply_VectorVector`
Inherits: `RigUnit_BinaryVectorOp` | Header: `RigUnit_Vector.h`

Rig Unit Multiply Vector Vector

### `unreal.RigUnit_MultiplyQuaternion`
Inherits: `RigUnit_BinaryQuaternionOp` | Header: `RigUnit_Quaternion.h`

Rig Unit Multiply Quaternion

### `unreal.RigUnit_MultiplyTransform`
Inherits: `RigUnit_BinaryTransformOp` | Header: `RigUnit_Transform.h`

Rig Unit Multiply Transform

### `unreal.RigUnit_OffsetTransformForItem`
Inherits: `RigUnitMutable` | Header: `RigUnit_OffsetTransform.h`

Offset Transform is used to add an offset to an existing transform in the hierarchy. The offset is post multiplied.

**Properties** (4):
  - `item`: `RigElementKey` — [Read-Write] The item to offset the transform for (RigElementKey)
  - `offset_transform`: `Transform` — [Read-Write] The transform of the item relative to its previous transform (Transform)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_ParentConstraint`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs transform to multiple itemsâ transforms

**Properties** (6):
  - `advanced_settings`: `RigUnit_ParentConstraint_AdvancedSettings` — [Read-Write] (RigUnit_ParentConstraint_AdvancedSettings)
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `filter`: `TransformFilter` — [Read-Write] (TransformFilter)
  - `maintain_offset`: `bool` — [Read-Write] (bool)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_ParentConstraint_AdvancedSettings`
Inherits: `StructBase` | Header: `RigUnit_TransformConstraint.h`

Rig Unit Parent Constraint Advanced Settings

**Properties** (2):
  - `interpolation_type`: `ConstraintInterpType` — [Read-Write] Options for interpolating rotations (ConstraintInterpType)
  - `rotation_order_for_filter`: `EulerRotationOrder` — [Read-Write] Rotation is converted to euler angles using the specified order such that individual ax...

### `unreal.RigUnit_ParentConstraintMath`
Inherits: `RigUnit_HighlevelBase` | Header: `RigUnit_TransformConstraint.h`

Computes the output transform by constraining the input transform to multiple parents

**Properties** (4):
  - `advanced_settings`: `RigUnit_ParentConstraintMath_AdvancedSettings` — [Read-Write] (RigUnit_ParentConstraintMath_AdvancedSettings)
  - `input`: `Transform` — [Read-Write] Input is used to calculate offsets from parentsâ initial transform (Transform)
  - `output`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])

### `unreal.RigUnit_ParentConstraintMath_AdvancedSettings`
Inherits: `StructBase` | Header: `RigUnit_TransformConstraint.h`

Rig Unit Parent Constraint Math Advanced Settings

**Properties** (1):
  - `interpolation_type`: `ConstraintInterpType` — [Read-Write] Options for interpolating rotations (ConstraintInterpType)

### `unreal.RigUnit_ParentSwitchConstraint`
Inherits: `RigUnitMutable` | Header: `RigUnit_ParentSwitchConstraint.h`

The Parent Switch Constraint is used to have an item follow one of multiple parents, and allowing to switch between the parent in question.

**Properties** (7):
  - `initial_global_transform`: `Transform` — [Read-Write] The initial global transform for the subject (Transform)
  - `parent_index`: `int` — [Read-Write] The parent index to use for constraining the subject (int32)
  - `parents`: `RigElementKeyCollection` — [Read-Write] The list of parents to constrain to (RigElementKeyCollection)
  - `subject`: `RigElementKey` — [Read-Write] The subject to constrain (RigElementKey)
  - `switched`: `bool` [Read-Only] — [Read-Only] Returns true if the parent has changed (bool)
  - `transform`: `Transform` [Read-Only] — [Read-Only] The transform result (full without weighting) (Transform)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_ParentSwitchConstraintArray`
Inherits: `RigUnitMutable` | Header: `RigUnit_ParentSwitchConstraint.h`

The Parent Switch Constraint is used to have an item follow one of multiple parents, and allowing to switch between the parent in question.

**Properties** (7):
  - `initial_global_transform`: `Transform` — [Read-Write] The initial global transform for the subject (Transform)
  - `parent_index`: `int` — [Read-Write] The parent index to use for constraining the subject (int32)
  - `parents`: `None` — [Read-Write] The list of parents to constrain to (Array[RigElementKey])
  - `subject`: `RigElementKey` — [Read-Write] The subject to constrain (RigElementKey)
  - `switched`: `bool` [Read-Only] — [Read-Only] Returns true if the parent has changed (bool)
  - `transform`: `Transform` [Read-Only] — [Read-Only] The transform result (full without weighting) (Transform)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_PointSimulation`
Inherits: `RigVMFunction_SimBaseMutable` | Header: `RigUnit_PointSimulation.h`

Performs point based simulation Note: Disabled for now.

**Properties** (14):
  - `bezier`: `RigVMFourPointBezier` [Read-Only] — [Read-Only] If the simulation has at least four points they will be stored in here. (RigVMFourPointB...
  - `bone_targets`: `None` [Read-Only] — [Read-Only] The bones to map to the simulated points. (Array[RigUnit_PointSimulation_BoneTarget])
  - `collision_volumes`: `None` — [Read-Write] The collision volumes to define (Array[CRSimSoftCollision])
  - `debug_settings`: `RigUnit_PointSimulation_DebugSettings` — [Read-Write] Debug draw settings for this simulation (RigUnit_PointSimulation_DebugSettings)
  - `forces`: `None` — [Read-Write] The forces to apply (Array[CRSimPointForce])
  - `integrator_type`: `RigVMSimPointIntegrateType` [Read-Only] — [Read-Only] The type of integrator to use (RigVMSimPointIntegrateType)
  - `limit_local_position`: `bool` — [Read-Write] If set to true bones are placed within the original distance of
the previous local tran...
  - `links`: `None` — [Read-Write] The links to connect the points with (Array[CRSimLinearSpring])
  - `points`: `None` — [Read-Write] The points to simulate (Array[RigVMSimPoint])
  - `primary_aim_axis`: `Vector` — [Read-Write] The primary axis to use for the aim (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `secondary_aim_axis`: `Vector` — [Read-Write] The secondary axis to use for the aim (Vector)
  - `simulated_steps_per_second`: `float` [Read-Only] — [Read-Only] The frame rate of the simulation (float)
  - `verlet_blend`: `float` — [Read-Write] The amount of blending to apply per second ( only for verlet integrations ) (float)

### `unreal.RigUnit_PointSimulation_BoneTarget`
Inherits: `StructBase` | Header: `RigUnit_PointSimulation.h`

Rig Unit Point Simulation Bone Target

**Properties** (4):
  - `bone`: `Name` — [Read-Write] The name of the bone to map (Name)
  - `primary_aim_point`: `int` [Read-Only] — [Read-Only] The index of the point to use for aiming the primary axis.
Use -1 to indicate that you d...
  - `secondary_aim_point`: `int` [Read-Only] — [Read-Only] The index of the point to use for aiming the secondary axis.
Use -1 to indicate that you...
  - `translation_point`: `int` [Read-Only] — [Read-Only] The index of the point to use for translation (int32)

### `unreal.RigUnit_PointSimulation_DebugSettings`
Inherits: `StructBase` | Header: `RigUnit_PointSimulation.h`

Rig Unit Point Simulation Debug Settings

**Properties** (6):
  - `collision_scale`: `float` — [Read-Write] The size of the debug drawing information (float)
  - `color`: `LinearColor` — [Read-Write] The color to use for debug drawing (LinearColor)
  - `draw_points_as_spheres`: `bool` — [Read-Write] If set to true points will be drawn as spheres with their sizes reflected (bool)
  - `enabled`: `bool` — [Read-Write] If enabled debug information will be drawn (bool)
  - `scale`: `float` — [Read-Write] The size of the debug drawing information (float)
  - `world_offset`: `Transform` — [Read-Write] The offset at which to draw the debug information in the world (Transform)

### `unreal.RigUnit_PoseGetCurve`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the hierarchyâs pose curve value

**Properties** (4):
  - `curve`: `Name` — [Read-Write] (Name)
  - `curve_value`: `float` [Read-Only] — [Read-Only] (float)
  - `pose`: `RigPose` — [Read-Write] (RigPose)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigUnit_PoseGetDelta`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Compares two pose caches and compares their values.

**Properties** (11):
  - `curve_threshold`: `float` — [Read-Write] The delta threshold for curve value difference. 0.0 disables curve differences. (float)
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)
  - `items_to_compare`: `RigElementKeyCollection` — [Read-Write] An optional list of items to compare (RigElementKeyCollection)
  - `items_with_delta`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `pose_a`: `RigPose` — [Read-Write] (RigPose)
  - `pose_b`: `RigPose` — [Read-Write] (RigPose)
  - `poses_are_equal`: `bool` [Read-Only] — [Read-Only] (bool)
  - `position_threshold`: `float` — [Read-Write] The delta threshold for a translation / position difference. 0.0 disables position diff...
  - `rotation_threshold`: `float` — [Read-Write] The delta threshold for a rotation difference (in degrees). 0.0 disables rotation diffe...
  - `scale_threshold`: `float` — [Read-Write] The delta threshold for a scale difference. 0.0 disables scale differences. (float)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines in which space transform deltas should be computed (RigVMTransformSpace)

### `unreal.RigUnit_PoseGetItems`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the items in the hierarchy pose

**Properties** (3):
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)
  - `items`: `RigElementKeyCollection` [Read-Only] — [Read-Only] (RigElementKeyCollection)
  - `pose`: `RigPose` — [Read-Write] (RigPose)

### `unreal.RigUnit_PoseGetItemsItemArray`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the items in the hierarchy pose

**Properties** (3):
  - `element_type`: `RigElementType` — [Read-Write] (RigElementType)
  - `items`: `None` [Read-Only] — [Read-Only] (Array[RigElementKey])
  - `pose`: `RigPose` — [Read-Write] (RigPose)

### `unreal.RigUnit_PoseGetTransform`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns the hierarchyâs pose transform

**Properties** (6):
  - `curve_value`: `float` [Read-Only] — [Read-Only] (float)
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `pose`: `RigPose` — [Read-Write] (RigPose)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be retrieved in local or global space (RigVMTransformSp...
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigUnit_PoseGetTransformArray`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns an array of transforms from a given hierarchy pose

**Properties** (4):
  - `pose`: `RigPose` — [Read-Write] (RigPose)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be retrieved in local or global space (RigVMTransformSp...
  - `transforms`: `None` [Read-Only] — [Read-Only] (Array[Transform])
  - `valid`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.RigUnit_PoseIsEmpty`
Inherits: `RigUnit_HierarchyBase` | Header: `RigUnit_Hierarchy.h`

Returns true if the hierarchy pose is empty (has no items)

**Properties** (2):
  - `is_empty`: `bool` [Read-Only] — [Read-Only] (bool)
  - `pose`: `RigPose` — [Read-Write] (RigPose)

### `unreal.RigUnit_PoseLoop`
Inherits: `RigUnit_HierarchyBaseMutable` | Header: `RigUnit_Hierarchy.h`

Given a pose, execute iteratively across all items in the pose

**Properties** (9):
  - `completed`: `ControlRigExecuteContext` [Read-Only] — [Read-Only] (ControlRigExecuteContext)
  - `count`: `int` [Read-Only] — [Read-Only] (int32)
  - `curve_value`: `float` [Read-Only] — [Read-Only] (float)
  - `global_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `index`: `int` [Read-Only] — [Read-Only] (int32)
  - `item`: `RigElementKey` [Read-Only] — [Read-Only] (RigElementKey)
  - `local_transform`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `pose`: `RigPose` — [Read-Write] (RigPose)
  - `ratio`: `float` [Read-Only] — [Read-Only] Ranging from 0.0 (first item) and 1.0 (last item)
This is useful to drive a consecutive ...

### `unreal.RigUnit_PositionConstraint`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs position to multiple itemsâ positions

**Properties** (5):
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `maintain_offset`: `bool` — [Read-Write] (bool)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_PositionConstraintLocalSpaceOffset`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs position to multiple itemsâ positions

**Properties** (5):
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `maintain_offset`: `bool` — [Read-Write] (bool)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_PostBeginExecution`
Inherits: `RigUnit` | Header: `RigUnit_BeginExecution.h`

Event always executed after the forward solve

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigUnit_PostPrepareForExecution`
Inherits: `RigUnit` | Header: `RigUnit_PrepareForExecution.h`

Event to further configure elements. Runs after the Construction Event

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigUnit_PreBeginExecution`
Inherits: `RigUnit` | Header: `RigUnit_BeginExecution.h`

Event always executed before the forward solve

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigUnit_PrepareForExecution`
Inherits: `RigUnit` | Header: `RigUnit_PrepareForExecution.h`

Event to create / configure elements before any other event

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` [Read-Only] — [Read-Only] The execution result (RigVMExecutePin)

### `unreal.RigUnit_ProjectTransformToNewParent`
Inherits: `RigUnit` | Header: `RigUnit_ProjectTransformToNewParent.h`

Gets the relative offset between the child and the old parent, then multiplies by new parentâs transform.

**Properties** (7):
  - `child`: `RigElementKey` — [Read-Write] The element to project between parents (RigElementKey)
  - `child_initial`: `bool` — [Read-Write] If set to true the child will be retrieved in its initial transform (bool)
  - `new_parent`: `RigElementKey` — [Read-Write] The new parent of the child. (RigElementKey)
  - `new_parent_initial`: `bool` — [Read-Write] If set to true the new parent will be retrieved in its initial transform (bool)
  - `old_parent`: `RigElementKey` — [Read-Write] The original parent of the child.
Can be an actual parent in the hierarchy or any other...
  - `old_parent_initial`: `bool` — [Read-Write] If set to true the old parent will be retrieved in its initial transform (bool)
  - `transform`: `Transform` [Read-Only] — [Read-Only] The resulting transform (Transform)

### `unreal.RigUnit_PropagateTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_PropagateTransform.h`

Propagate Transform can be used to force a recalculation of a boneâs global transform from its local - as well as propagating that change onto the children.

**Properties** (4):
  - `apply_to_children`: `bool` — [Read-Write] If set to true the direct children of this item will be recomputed as well.
Combined wi...
  - `item`: `RigElementKey` — [Read-Write] The item to offset the transform for (RigElementKey)
  - `recompute_global`: `bool` — [Read-Write] If set to true the itemâs global transform will be recomputed from
its parentâs tra...
  - `recursive`: `bool` — [Read-Write] If set to true and with bApplyToChildren enabled
all children will be affected recursiv...

### `unreal.RigUnit_QuaternionFromAxisAndAngle`
Inherits: `RigUnit` | Header: `RigUnit_Quaternion.h`

Rig Unit Quaternion from Axis and Angle

**Properties** (3):
  - `angle`: `float` — [Read-Write] (float)
  - `axis`: `Vector` — [Read-Write] (Vector)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigUnit_QuaternionToAngle`
Inherits: `RigUnit` | Header: `RigUnit_Quaternion.h`

Rig Unit Quaternion to Angle

**Properties** (3):
  - `angle`: `float` [Read-Only] — [Read-Only] (float)
  - `argument`: `Quat` — [Read-Write] (Quat)
  - `axis`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_QuaternionToAxisAndAngle`
Inherits: `RigUnit` | Header: `RigUnit_Quaternion.h`

Rig Unit Quaternion to Axis and Angle

**Properties** (3):
  - `angle`: `float` [Read-Only] — [Read-Only] (float)
  - `argument`: `Quat` — [Read-Write] (Quat)
  - `axis`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.RigUnit_RemoveAllMetadata`
Inherits: `RigUnitMutable` | Header: `RigUnit_Metadata.h`

Removes an existing metadata filed from an item

**Properties** (3):
  - `item`: `RigElementKey` — [Read-Write] The item to remove the metadata from (RigElementKey)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `removed`: `bool` [Read-Only] — [Read-Only] True if any metadata has been removed (bool)

### `unreal.RigUnit_RemoveMetadata`
Inherits: `RigUnitMutable` | Header: `RigUnit_Metadata.h`

Removes an existing metadata filed from an item

**Properties** (4):
  - `item`: `RigElementKey` — [Read-Write] The item to remove the metadata from (RigElementKey)
  - `name`: `Name` — [Read-Write] The name of the metadata to remove (Name)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `removed`: `bool` [Read-Only] — [Read-Only] True if the metadata has been removed (bool)

### `unreal.RigUnit_RemoveMetadataTag`
Inherits: `RigUnitMutable` | Header: `RigUnit_Metadata.h`

Removes a tag from an item

**Properties** (4):
  - `item`: `RigElementKey` — [Read-Write] The item to set the metadata for (RigElementKey)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `removed`: `bool` [Read-Only] — [Read-Only] Returns true if the removal was successful (bool)
  - `tag`: `Name` — [Read-Write] The name of the tag to set (Name)

### `unreal.RigUnit_ResolveArrayConnector`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns the resolved item of the connector.

**Properties** (4):
  - `connector`: `RigElementKey` — [Read-Write] * The key of the connector to resolve (RigElementKey)
  - `is_connected`: `bool` [Read-Only] — [Read-Only] * Returns true if the connector is resolved to a target. (bool)
  - `result`: `None` [Read-Only] — [Read-Only] * The resulting item the connector is resolved to (Array[RigElementKey])
  - `skip_socket`: `bool` — [Read-Write] * If the connector is resolved to a socket the node
* will return the socketâs direct...

### `unreal.RigUnit_ResolveConnector`
Inherits: `RigUnit_RigModulesBase` | Header: `RigUnit_RigModules.h`

Returns the resolved item of the connector.

**Properties** (4):
  - `connector`: `RigElementKey` — [Read-Write] * The key of the connector to resolve (RigElementKey)
  - `is_connected`: `bool` [Read-Only] — [Read-Only] * Returns true if the connector is resolved to a target. (bool)
  - `result`: `RigElementKey` [Read-Only] — [Read-Only] * The resulting item the connector is resolved to (RigElementKey)
  - `skip_socket`: `bool` — [Read-Write] * If the connector is resolved to a socket the node
* will return the socketâs direct...

### `unreal.RigUnit_RigModulesBase`
Inherits: `RigUnit` | Header: `RigUnit_RigModules.h`

Rig Unit Rig Modules Base

### `unreal.RigUnit_RigModulesBaseMutable`
Inherits: `RigUnitMutable` | Header: `RigUnit_RigModules.h`

Rig Unit Rig Modules Base Mutable

### `unreal.RigUnit_RotationConstraint`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs rotation to multiple itemsâ rotations

**Properties** (6):
  - `advanced_settings`: `RigUnit_RotationConstraint_AdvancedSettings` — [Read-Write] (RigUnit_RotationConstraint_AdvancedSettings)
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `maintain_offset`: `bool` — [Read-Write] (bool)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_RotationConstraint_AdvancedSettings`
Inherits: `StructBase` | Header: `RigUnit_TransformConstraint.h`

Rig Unit Rotation Constraint Advanced Settings

**Properties** (2):
  - `interpolation_type`: `ConstraintInterpType` — [Read-Write] Options for interpolating rotations (ConstraintInterpType)
  - `rotation_order_for_filter`: `EulerRotationOrder` — [Read-Write] Rotation is converted to euler angles using the specified order such that individual ax...

### `unreal.RigUnit_RotationConstraintLocalSpaceOffset`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs rotation to multiple itemsâ rotations

**Properties** (6):
  - `advanced_settings`: `RigUnit_RotationConstraint_AdvancedSettings` — [Read-Write] (RigUnit_RotationConstraint_AdvancedSettings)
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `maintain_offset`: `bool` — [Read-Write] (bool)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_ScaleConstraint`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs scale to multiple itemsâ scales

**Properties** (5):
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `maintain_offset`: `bool` — [Read-Write] (bool)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_ScaleConstraintLocalSpaceOffset`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs scale to multiple itemsâ scales

**Properties** (5):
  - `child`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `filter`: `FilterOptionPerAxis` — [Read-Write] (FilterOptionPerAxis)
  - `maintain_offset`: `bool` — [Read-Write] (bool)
  - `parents`: `None` — [Read-Write] (Array[ConstraintParent])
  - `weight`: `float` — [Read-Write] (float)

### `unreal.RigUnit_SendEvent`
Inherits: `RigUnitMutable` | Header: `RigUnit_SendEvent.h`

SendEvent is used to notify the engine / editor of a change that happend within the Control Rig.

**Properties** (5):
  - `enable`: `bool` — [Read-Write] The event will be sent if this is checked (bool)
  - `event`: `RigEvent` — [Read-Write] The event to send to the engine (RigEvent)
  - `item`: `RigElementKey` — [Read-Write] The item to send the event for (RigElementKey)
  - `offset_in_seconds`: `float` — [Read-Write] The time offset to use for the send event (float)
  - `only_during_interaction`: `bool` — [Read-Write] The event will be sent if this only during an interaction (bool)

### `unreal.RigUnit_SequenceExecution`
Inherits: `RigUnit` | Header: `RigUnit_SequenceExecution.h`

Allows for a single execution pulse to trigger a series of events in order.

**Properties** (5):
  - `a`: `ControlRigExecuteContext` [Read-Only] — [Read-Only] The execution result A (ControlRigExecuteContext)
  - `b`: `ControlRigExecuteContext` [Read-Only] — [Read-Only] The execution result B (ControlRigExecuteContext)
  - `c`: `ControlRigExecuteContext` [Read-Only] — [Read-Only] The execution result C (ControlRigExecuteContext)
  - `d`: `ControlRigExecuteContext` [Read-Only] — [Read-Only] The execution result D (ControlRigExecuteContext)
  - `execute_context`: `ControlRigExecuteContext` — [Read-Write] The execution input (ControlRigExecuteContext)

### `unreal.RigUnit_SetAnimationChannelBase`
Inherits: `RigUnit_GetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Animation Channel is used to change a controlâs animation channel value

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` — [Read-Write] (RigVMExecutePin)

### `unreal.RigUnit_SetAnimationChannelBaseFromItem`
Inherits: `RigUnit_GetAnimationChannelFromItemBase` | Header: `RigUnit_ControlChannelFromItem.h`

Set Animation Channel is used to change a controlâs animation channel value

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` — [Read-Write] (RigVMExecutePin)

### `unreal.RigUnit_SetBoneInitialTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetBoneInitialTransform.h`

SetBoneInitialTransform is used to perform a change in the hierarchy by setting a single boneâs transform.

**Properties** (5):
  - `bone`: `Name` — [Read-Write] The name of the Bone to set the transform for. (Name)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `result`: `Transform` [Read-Only] — [Read-Only] The transform value result (after weighting) (Transform)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Bone. (Transform)

### `unreal.RigUnit_SetBoneRotation`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetBoneRotation.h`

SetBoneRotation is used to perform a change in the hierarchy by setting a single boneâs rotation.

**Properties** (5):
  - `bone`: `Name` — [Read-Write] The name of the Bone to set the rotation for. (Name)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `rotation`: `Quat` — [Read-Write] The rotation value to set for the given Bone. (Quat)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs rotation should be set
in local or global space. (RigVMTransfor...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetBoneTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetBoneTransform.h`

SetBoneTransform is used to perform a change in the hierarchy by setting a single boneâs transform.

**Properties** (6):
  - `bone`: `Name` — [Read-Write] The name of the Bone to set the transform for. (Name)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `result`: `Transform` [Read-Only] — [Read-Only] The transform value result (after weighting) (Transform)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Bone. (Transform)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetBoneTranslation`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetBoneTranslation.h`

SetBoneTranslation is used to perform a change in the hierarchy by setting a single boneâs Translation.

**Properties** (5):
  - `bone`: `Name` — [Read-Write] The name of the Bone to set the Translation for. (Name)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs Translation should be set
in local or global space. (RigVMTrans...
  - `translation`: `Vector` — [Read-Write] The Translation value to set for the given Bone. (Vector)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetBoolAnimationChannel`
Inherits: `RigUnit_SetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Bool Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `bool` — [Read-Write] The new value of the animation channel (bool)

### `unreal.RigUnit_SetBoolAnimationChannelFromItem`
Inherits: `RigUnit_SetAnimationChannelBaseFromItem` | Header: `RigUnit_ControlChannelFromItem.h`

Set Bool Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `bool` — [Read-Write] The new value of the animation channel (bool)

### `unreal.RigUnit_SetChannelHosts`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Allows an animation channel to be hosted by multiple controls

**Properties** (2):
  - `channel`: `RigElementKey` — [Read-Write] * The channel to receive more hosts (RigElementKey)
  - `hosts`: `None` — [Read-Write] * The hosts to add to the channel (Array[RigElementKey])

### `unreal.RigUnit_SetControlBool`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetControlBool is used to perform a change in the hierarchy by setting a single controlâs bool value.

**Properties** (2):
  - `bool_value`: `bool` — [Read-Write] The bool value to set for the given Control. (bool)
  - `control`: `Name` — [Read-Write] The name of the Control to set the bool for. (Name)

### `unreal.RigUnit_SetControlColor`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlColor.h`

SetControlColor is used to change the controlâs color

**Properties** (2):
  - `color`: `LinearColor` — [Read-Write] The color to set for the control (LinearColor)
  - `control`: `Name` — [Read-Write] The name of the Control to set the color for. (Name)

### `unreal.RigUnit_SetControlDrivenList`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlDrivenList.h`

SetControlDrivenList is used to change the list of affected controls of an indirect control

**Properties** (2):
  - `control`: `Name` — [Read-Write] The name of the Control to set the list for (Name)
  - `driven`: `None` — [Read-Write] The list of affected controls (Array[RigElementKey])

### `unreal.RigUnit_SetControlFloat`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetControlFloat is used to perform a change in the hierarchy by setting a single controlâs float value.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `float_value`: `float` — [Read-Write] The transform value to set for the given Control. (float)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetControlInteger`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetControlInteger is used to perform a change in the hierarchy by setting a single controlâs int32 value.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `integer_value`: `int` — [Read-Write] The transform value to set for the given Control. (int32)
  - `weight`: `int` — [Read-Write] The weight of the change - how much the change should be applied (int32)

### `unreal.RigUnit_SetControlOffset`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlOffset.h`

SetControlOffset is used to perform a change in the hierarchy by setting a single controlâs transform. This is typically only used during the Construction Event.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `offset`: `Transform` — [Read-Write] The offset transform to set on the control (Transform)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the controlâs transform should be set
in local or global space. (RigVMTran...

### `unreal.RigUnit_SetControlRotationOffset`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlOffset.h`

SetControlRotationOffset is used to perform a change in the hierarchy by setting a single controlâs rotation offset. This is typically only used during the Construction Event.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `offset`: `Quat` — [Read-Write] The input rotation offset to set on the control (Quat)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the controlâs transform should be set
in local or global space. (RigVMTran...

### `unreal.RigUnit_SetControlRotator`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetControlRotator is used to perform a change in the hierarchy by setting a single controlâs Rotator value.

**Properties** (4):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `rotator`: `Rotator` — [Read-Write] The transform value to set for the given Control. (Rotator)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetControlScaleOffset`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlOffset.h`

SetControlScaleOffset is used to perform a change in the hierarchy by setting a single controlâs scale offset. This is typically only used during the Construction Event.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `scale`: `Vector` — [Read-Write] The new scale offset to set on the control (Vector)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the controlâs transform should be set
in local or global space. (RigVMTran...

### `unreal.RigUnit_SetControlTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetControlTransform is used to perform a change in the hierarchy by setting a single controlâs transform.

**Properties** (4):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Control. (Transform)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetControlTranslationOffset`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlOffset.h`

SetControlTranslationOffset is used to perform a change in the hierarchy by setting a single controlâs translation offset. This is typically only used during the Construction Event.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `offset`: `Vector` — [Read-Write] The input translation offset to set on the control (Vector)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the controlâs transform should be set
in local or global space. (RigVMTran...

### `unreal.RigUnit_SetControlVector`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetControlVector is used to perform a change in the hierarchy by setting a single controlâs Vector value.

**Properties** (4):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...
  - `vector`: `Vector` — [Read-Write] The transform value to set for the given Control. (Vector)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetControlVector2D`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetControlVector2D is used to perform a change in the hierarchy by setting a single controlâs Vector2D value.

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `vector`: `Vector2D` — [Read-Write] The transform value to set for the given Control. (Vector2D)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetControlVisibility`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlVisibility.h`

SetControlVisibility is used to change the visibility on a control at runtime

**Properties** (3):
  - `item`: `RigElementKey` — [Read-Write] The name of the Control to set the visibility for. (RigElementKey)
  - `pattern`: `str` [Read-Only] — [Read-Only] If the ControlName is set to None this can be used to look for a series of Controls (str...
  - `visible`: `bool` — [Read-Write] The visibility to set for the control (bool)

### `unreal.RigUnit_SetCurveValue`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetCurveValue.h`

SetCurveValue is used to perform a change in the curve container by setting a single Curve value.

**Properties** (2):
  - `curve`: `Name` — [Read-Write] The name of the Curve to set the Value for. (Name)
  - `value`: `float` — [Read-Write] The value to set for the given Curve. (float)

### `unreal.RigUnit_SetDefaultMatch`
Inherits: `RigUnitMutable` | Header: `RigUnit_ConnectionCandidates.h`

Set default match during a connector event

**Properties** (1):
  - `default`: `RigElementKey` — [Read-Write] The items being interacted on (RigElementKey)

### `unreal.RigUnit_SetDefaultParent`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Changes the default parent for an item - this removes all other current parents.

**Properties** (2):
  - `child`: `RigElementKey` — [Read-Write] * The child to be parented under the new default parent (RigElementKey)
  - `parent`: `RigElementKey` — [Read-Write] * The default parent to be used for the child (RigElementKey)

### `unreal.RigUnit_SetFloatAnimationChannel`
Inherits: `RigUnit_SetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Float Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `float` — [Read-Write] The new value of the animation channel (float)

### `unreal.RigUnit_SetFloatAnimationChannelFromItem`
Inherits: `RigUnit_SetAnimationChannelBaseFromItem` | Header: `RigUnit_ControlChannelFromItem.h`

Set Float Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `float` — [Read-Write] The new value of the animation channel (float)

### `unreal.RigUnit_SetIntAnimationChannel`
Inherits: `RigUnit_SetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Int Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `int` — [Read-Write] The new value of the animation channel (int32)

### `unreal.RigUnit_SetIntAnimationChannelFromItem`
Inherits: `RigUnit_SetAnimationChannelBaseFromItem` | Header: `RigUnit_ControlChannelFromItem.h`

Set Int Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `int` — [Read-Write] The new value of the animation channel (int32)

### `unreal.RigUnit_SetMetadataTag`
Inherits: `RigUnitMutable` | Header: `RigUnit_Metadata.h`

Sets a single tag on an item

**Properties** (3):
  - `item`: `RigElementKey` — [Read-Write] The item to set the metadata for (RigElementKey)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `tag`: `Name` — [Read-Write] The name of the tag to set (Name)

### `unreal.RigUnit_SetMetadataTagArray`
Inherits: `RigUnitMutable` | Header: `RigUnit_Metadata.h`

Sets multiple tags on an item

**Properties** (3):
  - `item`: `RigElementKey` — [Read-Write] The item to set the metadata for (RigElementKey)
  - `name_space`: `RigMetaDataNameSpace` — [Read-Write] Defines in which namespace the metadata will be looked up (RigMetaDataNameSpace)
  - `tags`: `None` — [Read-Write] The tags to set for the item (Array[Name])

### `unreal.RigUnit_SetMultiControlBool`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetMultiControlBool is used to perform a change in the hierarchy by setting multiple controlsâ bool value.

**Properties** (1):
  - `entries`: `None` — [Read-Write] The array of control-Bool pairs to be processed (Array[RigUnit_SetMultiControlBool_Entr...

### `unreal.RigUnit_SetMultiControlBool_Entry`
Inherits: `StructBase` | Header: `RigUnit_SetControlTransform.h`

Rig Unit Set Multi Control Bool Entry

**Properties** (2):
  - `bool_value`: `bool` — [Read-Write] The bool value to set for the given Control. (bool)
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)

### `unreal.RigUnit_SetMultiControlFloat`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetMultiControlFloat is used to perform a change in the hierarchy by setting multiple controlsâ float value.

**Properties** (2):
  - `entries`: `None` — [Read-Write] The array of control-float pairs to be processed (Array[RigUnit_SetMultiControlFloat_En...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetMultiControlFloat_Entry`
Inherits: `StructBase` | Header: `RigUnit_SetControlTransform.h`

Rig Unit Set Multi Control Float Entry

**Properties** (2):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `float_value`: `float` — [Read-Write] The transform value to set for the given Control. (float)

### `unreal.RigUnit_SetMultiControlInteger`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetMultiControlInteger is used to perform a change in the hierarchy by setting multiple controlsâ integer value.

**Properties** (2):
  - `entries`: `None` — [Read-Write] The array of control-integer pairs to be processed (Array[RigUnit_SetMultiControlIntege...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetMultiControlInteger_Entry`
Inherits: `StructBase` | Header: `RigUnit_SetControlTransform.h`

Rig Unit Set Multi Control Integer Entry

**Properties** (2):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `integer_value`: `int` — [Read-Write] The transform value to set for the given Control. (int32)

### `unreal.RigUnit_SetMultiControlRotator`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetMultiControlRotator is used to perform a change in the hierarchy by setting multiple controlsâ rotator value.

**Properties** (2):
  - `entries`: `None` — [Read-Write] The array of control-rotator pairs to be processed (Array[RigUnit_SetMultiControlRotato...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetMultiControlRotator_Entry`
Inherits: `StructBase` | Header: `RigUnit_SetControlTransform.h`

Rig Unit Set Multi Control Rotator Entry

**Properties** (3):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `rotator`: `Rotator` — [Read-Write] The transform value to set for the given Control. (Rotator)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...

### `unreal.RigUnit_SetMultiControlVector2D`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlTransform.h`

SetMultiControlVector2D is used to perform a change in the hierarchy by setting multiple controlsâ vector2D value.

**Properties** (2):
  - `entries`: `None` — [Read-Write] The array of control-vector2D pairs to be processed (Array[RigUnit_SetMultiControlVecto...
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetMultiControlVector2D_Entry`
Inherits: `StructBase` | Header: `RigUnit_SetControlTransform.h`

Rig Unit Set Multi Control Vector 2D Entry

**Properties** (2):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `vector`: `Vector2D` — [Read-Write] The transform value to set for the given Control. (Vector2D)

### `unreal.RigUnit_SetRelativeBoneTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetRelativeBoneTransform.h`

SetRelativeBoneTransform is used to perform a change in the hierarchy by setting a single boneâs transform.

**Properties** (5):
  - `bone`: `Name` — [Read-Write] The name of the Bone to set the transform for. (Name)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `space`: `Name` — [Read-Write] The name of the Bone to set the transform relative within. (Name)
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Bone. (Transform)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetRelativeRotationForItem`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetRelativeTransform.h`

SetRelativeRotation is used to set a single rotation from a hierarchy in the space of another item

**Properties** (6):
  - `child`: `RigElementKey` — [Read-Write] The child item to set the transform for (RigElementKey)
  - `parent`: `RigElementKey` — [Read-Write] The parent item to use.
The child transform will be set in the space of the parent. (Ri...
  - `parent_initial`: `bool` — [Read-Write] Defines if the parentâs transform should be determined as current (false) or initial ...
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `value`: `Quat` — [Read-Write] The transform of the child item relative to the provided parent (Quat)
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetRelativeTransformForItem`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetRelativeTransform.h`

SetRelativeTransform is used to set a single transform from a hierarchy in the space of another item

**Properties** (7):
  - `child`: `RigElementKey` — [Read-Write] The child item to set the transform for (RigElementKey)
  - `parent`: `RigElementKey` — [Read-Write] The parent item to use.
The child transform will be set in the space of the parent. (Ri...
  - `parent_initial`: `bool` — [Read-Write] Defines if the parentâs transform should be determined as current (false) or initial ...
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `relative_transform`: `Transform` — ârelative_transformâ was renamed to âvalueâ. deprecated
  - `value`: `Transform` — [Read-Write] The transform of the child item relative to the provided parent (Transform)
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetRelativeTranslationForItem`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetRelativeTransform.h`

SetRelativeTranslation is used to set a single translation from a hierarchy in the space of another item

**Properties** (6):
  - `child`: `RigElementKey` — [Read-Write] The child item to set the transform for (RigElementKey)
  - `parent`: `RigElementKey` — [Read-Write] The parent item to use.
The child transform will be set in the space of the parent. (Ri...
  - `parent_initial`: `bool` — [Read-Write] Defines if the parentâs transform should be determined as current (false) or initial ...
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `value`: `Vector` — [Read-Write] The transform of the child item relative to the provided parent (Vector)
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetRotation`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetTransform.h`

SetRotation is used to set a single rotation on hierarchy.

**Properties** (7):
  - `initial`: `bool` — [Read-Write] Defines if the transform should be set as current (false) or initial (true).
Initial tr...
  - `item`: `RigElementKey` — [Read-Write] The item to set the rotation for (RigElementKey)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `rotation`: `Quat` — ârotationâ was renamed to âvalueâ. deprecated
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the rotation should be set in local or global space (RigVMTransformSpace)
  - `value`: `Quat` — [Read-Write] The new rotation of the given item (Quat)
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetRotatorAnimationChannel`
Inherits: `RigUnit_SetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Rotator Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Rotator` — [Read-Write] The new value of the animation channel (Rotator)

### `unreal.RigUnit_SetRotatorAnimationChannelFromItem`
Inherits: `RigUnit_SetAnimationChannelBaseFromItem` | Header: `RigUnit_ControlChannelFromItem.h`

Set Rotator Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Rotator` — [Read-Write] The new value of the animation channel (Rotator)

### `unreal.RigUnit_SetScale`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetTransform.h`

SetScale is used to set a single scale on hierarchy.

**Properties** (6):
  - `initial`: `bool` — [Read-Write] Defines if the transform should be set as current (false) or initial (true).
Initial tr...
  - `item`: `RigElementKey` — [Read-Write] The item to set the scale for (RigElementKey)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `scale`: `Vector` — [Read-Write] The new scale of the given item (Vector)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the scale should be set in local or global space (RigVMTransformSpace)
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetShapeTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetControlOffset.h`

SetShapeTransform is used to perform a change in the hierarchy by setting a single controlâs shape transform. This is typically only used during the Construction Event.

**Properties** (2):
  - `control`: `Name` — [Read-Write] The name of the Control to set the transform for. (Name)
  - `transform`: `Transform` — [Read-Write] The shape transform to set for the control (Transform)

### `unreal.RigUnit_SetSpaceInitialTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetSpaceInitialTransform.h`

SetSpaceInitialTransform is used to perform a change in the hierarchy by setting a single spaceâs initial transform.

**Properties** (4):
  - `result`: `Transform` [Read-Only] — [Read-Only] The transform value result (after weighting) (Transform)
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...
  - `space_name`: `Name` — [Read-Write] The name of the Space to set the transform for. (Name)
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given space. (Transform)

### `unreal.RigUnit_SetSpaceTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetSpaceTransform.h`

SetSpaceTransform is used to perform a change in the hierarchy by setting a single spaceâs transform.

**Properties** (4):
  - `space`: `Name` — [Read-Write] The name of the Space to set the transform for. (Name)
  - `space_type`: `RigVMTransformSpace` — [Read-Write] Defines if the boneâs transform should be set
in local or global space. (RigVMTransfo...
  - `transform`: `Transform` — [Read-Write] The transform value to set for the given Space. (Transform)
  - `weight`: `float` — [Read-Write] The weight of the change - how much the change should be applied (float)

### `unreal.RigUnit_SetTransform`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetTransform.h`

SetTransform is used to set a single transform on hierarchy.

**Properties** (7):
  - `initial`: `bool` — [Read-Write] Defines if the transform should be set as current (false) or initial (true).
Initial tr...
  - `item`: `RigElementKey` — [Read-Write] The item to set the transform for (RigElementKey)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be set in local or global space (RigVMTransformSpace)
  - `transform`: `Transform` — âtransformâ was renamed to âvalueâ. deprecated
  - `value`: `Transform` — [Read-Write] The new transform of the given item (Transform)
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetTransformAnimationChannel`
Inherits: `RigUnit_SetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Transform Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Transform` — [Read-Write] The new value of the animation channel (Transform)

### `unreal.RigUnit_SetTransformAnimationChannelFromItem`
Inherits: `RigUnit_SetAnimationChannelBaseFromItem` | Header: `RigUnit_ControlChannelFromItem.h`

Set Transform Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Transform` — [Read-Write] The new value of the animation channel (Transform)

### `unreal.RigUnit_SetTransformArray`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetTransform.h`

SetTransformArray is used to set an array of transforms on the hierarchy.

**Properties** (6):
  - `initial`: `bool` — [Read-Write] Defines if the transform should be set as current (false) or initial (true).
Initial tr...
  - `items`: `RigElementKeyCollection` — [Read-Write] The item to set the transform for (RigElementKeyCollection)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be set in local or global space (RigVMTransformSpace)
  - `transforms`: `None` — [Read-Write] The new transform of the given item (Array[Transform])
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetTransformItemArray`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetTransform.h`

SetTransformArray is used to set an array of transforms on the hierarchy.

**Properties** (6):
  - `initial`: `bool` — [Read-Write] Defines if the transform should be set as current (false) or initial (true).
Initial tr...
  - `items`: `None` — [Read-Write] The item to set the transform for (Array[RigElementKey])
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the transform should be set in local or global space (RigVMTransformSpace)
  - `transforms`: `None` — [Read-Write] The new transform of the given item (Array[Transform])
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetTranslation`
Inherits: `RigUnitMutable` | Header: `RigUnit_SetTransform.h`

SetTranslation is used to set a single translation on hierarchy.

**Properties** (7):
  - `initial`: `bool` — [Read-Write] Defines if the transform should be set as current (false) or initial (true).
Initial tr...
  - `item`: `RigElementKey` — [Read-Write] The item to set the translation for (RigElementKey)
  - `propagate_to_children`: `bool` — [Read-Write] If set to true children of affected items in the hierarchy
will follow the transform ch...
  - `space`: `RigVMTransformSpace` — [Read-Write] Defines if the translation should be set in local or global space (RigVMTransformSpace)
  - `translation`: `Vector` — âtranslationâ was renamed to âvalueâ. deprecated
  - `value`: `Vector` — [Read-Write] The new translation of the given item (Vector)
  - `weight`: `float` — [Read-Write] Defines how much the change will be applied (float)

### `unreal.RigUnit_SetupShapeLibraryFromUserData`
Inherits: `RigUnitMutable` | Header: `RigUnit_UserData.h`

Allows to set / add a shape library on the running control rig from user data

**Properties** (4):
  - `library_name`: `str` — [Read-Write] * Optionally provide the namespace of the shape library to use.
* This is only useful i...
  - `log_shape_libraries`: `bool` — [Read-Write] * If this is checked weâll output the resulting shape libraries to the log for debugg...
  - `name_space`: `str` — [Read-Write] * The name space of the user data to look the shape library up within (str)
  - `path`: `str` — [Read-Write] * The path within the user data for the shape library (str)

### `unreal.RigUnit_SetVector2DAnimationChannel`
Inherits: `RigUnit_SetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Vector2D Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector2D` — [Read-Write] The new value of the animation channel (Vector2D)

### `unreal.RigUnit_SetVector2DAnimationChannelFromItem`
Inherits: `RigUnit_SetAnimationChannelBaseFromItem` | Header: `RigUnit_ControlChannelFromItem.h`

Set Vector2D Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector2D` — [Read-Write] The new value of the animation channel (Vector2D)

### `unreal.RigUnit_SetVectorAnimationChannel`
Inherits: `RigUnit_SetAnimationChannelBase` | Header: `RigUnit_ControlChannel.h`

Set Vector Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector` — [Read-Write] The new value of the animation channel (Vector)

### `unreal.RigUnit_SetVectorAnimationChannelFromItem`
Inherits: `RigUnit_SetAnimationChannelBaseFromItem` | Header: `RigUnit_ControlChannelFromItem.h`

Set Vector Channel is used to set a controlâs animation channel value

**Properties** (1):
  - `value`: `Vector` — [Read-Write] The new value of the animation channel (Vector)

### `unreal.RigUnit_ShapeExists`
Inherits: `RigUnit` | Header: `RigUnit_UserData.h`

Checks whether or not a shape is available in the rigâs shape libraries

**Properties** (2):
  - `result`: `bool` [Read-Only] — [Read-Only] * True if the shape name exists in any of the shape libraries (bool)
  - `shape_name`: `Name` — [Read-Write] * The name of the shape to search for (Name)

### `unreal.RigUnit_SlideChain`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_SlideChain.h`

Slides an existing chain along itself with control over extrapolation.

**Properties** (4):
  - `end_bone`: `Name` — [Read-Write] The name of the last bone to slide (Name)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `slide_amount`: `float` — [Read-Write] The amount of sliding. This unit is multiple of the chain length. (float)
  - `start_bone`: `Name` — [Read-Write] The name of the first bone to slide (Name)

### `unreal.RigUnit_SlideChainItemArray`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_SlideChain.h`

Slides an existing chain along itself with control over extrapolation.

**Properties** (3):
  - `items`: `None` — [Read-Write] The items to slide (Array[RigElementKey])
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `slide_amount`: `float` — [Read-Write] The amount of sliding. This unit is multiple of the chain length. (float)

### `unreal.RigUnit_SlideChainPerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_SlideChain.h`

Slides an existing chain along itself with control over extrapolation.

**Properties** (3):
  - `items`: `RigElementKeyCollection` — [Read-Write] The items to slide (RigElementKeyCollection)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `slide_amount`: `float` — [Read-Write] The amount of sliding. This unit is multiple of the chain length. (float)

### `unreal.RigUnit_SpaceName`
Inherits: `RigUnit` | Header: `RigUnit_BoneName.h`

SpaceName is used to represent a Space name in the graph

**Properties** (1):
  - `space`: `Name` — [Read-Write] The name of the Space (Name)

### `unreal.RigUnit_SphereTraceByObjectTypes`
Inherits: `RigUnit` | Header: `RigUnit_WorldCollision.h`

Sweeps a sphere against the world and return the first blocking hit. The trace is filtered by object types only, the collision response settings are ignored. You can create custom object types in Proj...

**Properties** (7):
  - `end`: `Vector` — [Read-Write] End of the trace in rig / global space (Vector)
  - `hit`: `bool` [Read-Only] — [Read-Only] Returns true if there was a hit (bool)
  - `hit_location`: `Vector` [Read-Only] — [Read-Only] Hit location in rig / global Space (Vector)
  - `hit_normal`: `Vector` [Read-Only] — [Read-Only] Hit normal in rig / global Space (Vector)
  - `object_types`: `None` — [Read-Write] The types of objects that this trace can hit (Array[ObjectTypeQuery])
  - `radius`: `float` — [Read-Write] Radius of the sphere to use for sweeping / tracing (float)
  - `start`: `Vector` — [Read-Write] Start of the trace in rig / global space (Vector)

### `unreal.RigUnit_SphereTraceByTraceChannel`
Inherits: `RigUnit` | Header: `RigUnit_WorldCollision.h`

Sweeps a sphere against the world and return the first blocking hit using a specific channel. Target objects can have different object types, but they need to have the same trace channel set to âblo...

**Properties** (7):
  - `end`: `Vector` — [Read-Write] End of the trace in rig / global space (Vector)
  - `hit`: `bool` [Read-Only] — [Read-Only] Returns true if there was a hit (bool)
  - `hit_location`: `Vector` [Read-Only] — [Read-Only] Hit location in rig / global Space (Vector)
  - `hit_normal`: `Vector` [Read-Only] — [Read-Only] Hit normal in rig / global Space (Vector)
  - `radius`: `float` — [Read-Write] Radius of the sphere to use for sweeping / tracing (float)
  - `start`: `Vector` — [Read-Write] Start of the trace in rig / global space (Vector)
  - `trace_channel`: `TraceTypeQuery` — [Read-Write] The âchannelâ that this trace is in, used to determine which components to hit (Tra...

### `unreal.RigUnit_SphereTraceWorld`
Inherits: `RigUnit` | Header: `RigUnit_WorldCollision.h`

Sweeps a sphere against the world and return the first blocking hit using a specific channel

**Properties** (7):
  - `channel`: `CollisionChannel` — [Read-Write] The âchannelâ that this trace is in, used to determine which components to hit (Col...
  - `end`: `Vector` — [Read-Write] End of the trace in rig / global space (Vector)
  - `hit`: `bool` [Read-Only] — [Read-Only] Returns true if there was a hit (bool)
  - `hit_location`: `Vector` [Read-Only] — [Read-Only] Hit location in rig / global Space (Vector)
  - `hit_normal`: `Vector` [Read-Only] — [Read-Only] Hit normal in rig / global Space (Vector)
  - `radius`: `float` — [Read-Write] Radius of the sphere to use for sweeping / tracing (float)
  - `start`: `Vector` — [Read-Write] Start of the trace in rig / global space (Vector)

### `unreal.RigUnit_SphericalPoseReader`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_SphericalPoseReader.h`

Outputs a float value between 0-1 based off of the driver itemâs rotation in a specified region.

**Properties** (12):
  - `active_region_scale_factors`: `RegionScaleFactors` — [Read-Write] The directional scaling parameters for the active region (green). (RegionScaleFactors)
  - `active_region_size`: `float` — [Read-Write] The size of the active region (green) that outputs the full value (1.0). Range is 0-1. ...
  - `debug`: `SphericalPoseReaderDebugSettings` — [Read-Write] (SphericalPoseReaderDebugSettings)
  - `driver_axis`: `Vector` — [Read-Write] The axis of the driver transform that is compared against the falloff regions. Typicall...
  - `driver_item`: `RigElementKey` — [Read-Write] The bone that will drive the output parameter when rotated into the active regions of t...
  - `falloff_region_scale_factors`: `RegionScaleFactors` — [Read-Write] The directional scaling parameters for the falloff region (yellow). (RegionScaleFactors...
  - `falloff_size`: `float` — [Read-Write] The size of the falloff region (yellow) that defines the start of the output range. A v...
  - `flip_height_scaling`: `bool` — [Read-Write] Flip the positive / negative directions of the height scale factors. (bool)
  - `flip_width_scaling`: `bool` — [Read-Write] Flip the positive / negative directions of the width scale factors. (bool)
  - `optional_parent_item`: `RigElementKey` — [Read-Write] An optional parent to use as a stable frame of reference for the active regions (defaul...
  - `output_param`: `float` [Read-Only] — [Read-Only] The normalized output parameter; ranges from 0 (when outside yellow region) to 1 (in the...
  - `rotation_offset`: `Vector` — [Read-Write] Rotate the entire falloff region to align with the desired area of effect. (Vector)

### `unreal.RigUnit_SpringIK`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_SpringIK.h`

The Spring IK solver uses a verlet integrator to perform an IK solve. It support custom constraints including distance, length etc. Note: This node operates in world space!

**Properties** (19):
  - `damping`: `float` [Read-Only] — [Read-Only] The higher the value to more quickly the simulation calms down. Values between 0.0001 an...
  - `debug_settings`: `RigUnit_SpringIK_DebugSettings` — [Read-Write] The debug setting for the node (RigUnit_SpringIK_DebugSettings)
  - `effector_ratio`: `float` [Read-Only] — [Read-Only] Defines the equilibrium of the effector springs.
This value ranges from 0.0 (zero distan...
  - `effector_strength`: `float` [Read-Only] — [Read-Only] Sets the coefficient of the springs towards the effector. Values between 1 and 2048 are ...
  - `end_bone`: `Name` — [Read-Write] The name of the second bone to solve (Name)
  - `flip_pole_plane`: `bool` — [Read-Write] If set to true the pole plane will be flipped (bool)
  - `hierarchy_strength`: `float` [Read-Only] — [Read-Only] Sets the coefficient of the springs along the hierarchy. Values between 1 and 2048 are c...
  - `iterations`: `int` [Read-Only] — [Read-Only] Drives how precise the solver operates. Values between 4 and 24 are common.
This is only...
  - `limit_local_position`: `bool` — [Read-Write] If set to true bones are placed within the original distance of
the previous local tran...
  - `live_simulation`: `bool` — [Read-Write] If set to true simulation will continue for all intermediate bones over time. (bool)
  - `pole_vector`: `Vector` — [Read-Write] The polevector to use for the IK solver
This can be a location or direction. (Vector)
  - `pole_vector_kind`: `ControlRigVectorKind` — [Read-Write] The kind of pole vector this is representing - can be a direction or a location (Contro...
  - `pole_vector_space`: `Name` — [Read-Write] The space in which the pole vector is expressed (Name)
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `root_ratio`: `float` [Read-Only] — [Read-Only] Defines the equilibrium of the root springs.
This value ranges from 0.0 (zero distance) ...
  - `root_strength`: `float` [Read-Only] — [Read-Only] Sets the coefficient of the springs towards the root. Values between 1 and 2048 are comm...
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the pole vector (Vector)
  - `start_bone`: `Name` — [Read-Write] The name of the first bone to solve (Name)

### `unreal.RigUnit_SpringIK_DebugSettings`
Inherits: `StructBase` | Header: `RigUnit_SpringIK.h`

Rig Unit Spring IK Debug Settings

**Properties** (4):
  - `color`: `LinearColor` — [Read-Write] The color to use for debug drawing (LinearColor)
  - `enabled`: `bool` — [Read-Write] If enabled debug information will be drawn (bool)
  - `scale`: `float` — [Read-Write] The size of the debug drawing information (float)
  - `world_offset`: `Transform` — [Read-Write] The offset at which to draw the debug information in the world (Transform)

### `unreal.RigUnit_SpringInterp`
Inherits: `RigVMFunction_SimBase` | Header: `RigUnit_SpringInterp.h`

Uses a simple spring model to interpolate a float from Current to Target.

**Properties** (6):
  - `critical_damping`: `float` — [Read-Write] (float)
  - `current`: `float` — [Read-Write] (float)
  - `mass`: `float` — [Read-Write] (float)
  - `result`: `float` [Read-Only] — [Read-Only] (float)
  - `stiffness`: `float` — [Read-Write] (float)
  - `target`: `float` — [Read-Write] (float)

### `unreal.RigUnit_SpringInterpQuaternionV2`
Inherits: `RigVMFunction_SimBase` | Header: `RigUnit_SpringInterp.h`

Uses a simple spring model to interpolate a quaternion from Current to Target.

**Properties** (10):
  - `angular_velocity`: `Vector` [Read-Only] — [Read-Only] Angular velocity (Vector)
  - `critical_damping`: `float` — [Read-Write] The amount of damping in the spring.
Set it smaller than 1 to make the spring oscillate...
  - `current`: `Quat` — [Read-Write] Current position of the spring. (Quat)
  - `initialize_from_target`: `bool` [Read-Only] — [Read-Only] If true, then the initial value will be taken from the target value, and not from the cu...
  - `result`: `Quat` [Read-Only] — [Read-Only] New position of the spring after delta time. (Quat)
  - `strength`: `float` — [Read-Write] The spring strength determines how hard it will pull towards the target. The value is t...
  - `target`: `Quat` — [Read-Write] Rest/target position of the spring. (Quat)
  - `target_velocity_amount`: `float` — [Read-Write] The amount that the velocity should be passed through to the spring. A value of 1 will ...
  - `torque`: `Vector` — [Read-Write] Extra torque to apply (since the moment of inertia is 1, this is also the angular accel...
  - `use_current_input`: `bool` [Read-Only] — [Read-Only] If true, then the Current input will be used to initialize the state, and is required to...

### `unreal.RigUnit_SpringInterpV2`
Inherits: `RigVMFunction_SimBase` | Header: `RigUnit_SpringInterp.h`

Uses a simple spring model to interpolate a float from Current to Target.

**Properties** (10):
  - `critical_damping`: `float` — [Read-Write] The amount of damping in the spring.
Set it smaller than 1 to make the spring oscillate...
  - `current`: `float` — [Read-Write] Current position of the spring. (float)
  - `force`: `float` — [Read-Write] Extra force to apply (since the mass is 1, this is also the acceleration). (float)
  - `initialize_from_target`: `bool` [Read-Only] — [Read-Only] If true, then the initial value will be taken from the target value, and not from the cu...
  - `result`: `float` [Read-Only] — [Read-Only] New position of the spring after delta time. (float)
  - `strength`: `float` — [Read-Write] The spring strength determines how hard it will pull towards the target. The value is t...
  - `target`: `float` — [Read-Write] Rest/target position of the spring. (float)
  - `target_velocity_amount`: `float` — [Read-Write] The amount that the velocity should be passed through to the spring. A value of 1 will ...
  - `use_current_input`: `bool` [Read-Only] — [Read-Only] If true, then the Current input will be used to initialize the state, and is required to...
  - `velocity`: `float` [Read-Only] — [Read-Only] Velocity (float)

### `unreal.RigUnit_SpringInterpVector`
Inherits: `RigVMFunction_SimBase` | Header: `RigUnit_SpringInterp.h`

Uses a simple spring model to interpolate a vector from Current to Target.

**Properties** (6):
  - `critical_damping`: `float` — [Read-Write] (float)
  - `current`: `Vector` — [Read-Write] (Vector)
  - `mass`: `float` — [Read-Write] (float)
  - `result`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `stiffness`: `float` — [Read-Write] (float)
  - `target`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_SpringInterpVectorV2`
Inherits: `RigVMFunction_SimBase` | Header: `RigUnit_SpringInterp.h`

Uses a simple spring model to interpolate a vector from Current to Target.

**Properties** (10):
  - `critical_damping`: `float` — [Read-Write] The amount of damping in the spring.
Set it smaller than 1 to make the spring oscillate...
  - `current`: `Vector` — [Read-Write] Current position of the spring. (Vector)
  - `force`: `Vector` — [Read-Write] Extra force to apply (since the mass is 1, this is also the acceleration). (Vector)
  - `initialize_from_target`: `bool` [Read-Only] — [Read-Only] If true, then the initial value will be taken from the target value, and not from the cu...
  - `result`: `Vector` [Read-Only] — [Read-Only] New position of the spring after delta time. (Vector)
  - `strength`: `float` — [Read-Write] The spring strength determines how hard it will pull towards the target. The value is t...
  - `target`: `Vector` — [Read-Write] Rest/target position of the spring. (Vector)
  - `target_velocity_amount`: `float` — [Read-Write] The amount that the velocity should be passed through to the spring. A value of 1 will ...
  - `use_current_input`: `bool` [Read-Only] — [Read-Only] If true, then the Current input will be used to initialize the state, and is required to...
  - `velocity`: `Vector` [Read-Only] — [Read-Only] Velocity (Vector)

### `unreal.RigUnit_StartProfilingTimer`
Inherits: `RigVMFunction_DebugBaseMutable` | Header: `RigUnit_ProfilingBracket.h`

Starts a profiling timer for debugging, used in conjunction with End Profiling Timer

### `unreal.RigUnit_Subtract_FloatFloat`
Inherits: `RigUnit_BinaryFloatOp` | Header: `RigUnit_Float.h`

Rig Unit Subtract Float Float

### `unreal.RigUnit_Subtract_VectorVector`
Inherits: `RigUnit_BinaryVectorOp` | Header: `RigUnit_Vector.h`

Rig Unit Subtract Vector Vector

### `unreal.RigUnit_SwitchParent`
Inherits: `RigUnit_DynamicHierarchyBaseMutable` | Header: `RigUnit_DynamicHierarchy.h`

Switches an element to a new parent.

**Properties** (4):
  - `child`: `RigElementKey` — [Read-Write] The child to switch to a new parent (RigElementKey)
  - `maintain_global`: `bool` — [Read-Write] If set to true the item will maintain its global transform,
* otherwise it will maintai...
  - `mode`: `RigSwitchParentMode` — [Read-Write] Depending on this the child will switch to the world,
* back to its default or to the i...
  - `parent`: `RigElementKey` — [Read-Write] The optional parent to switch to. This is only used if the mode is set to âParent Ite...

### `unreal.RigUnit_ToRigSpace_Location`
Inherits: `RigUnit` | Header: `RigUnit_WorldSpace.h`

Converts a position / location from world space to rig (global) space

**Properties** (3):
  - `global_`: `Vector` [Read-Only] — [Read-Only] The result position / location in global / rig space (Vector)
  - `location`: `Vector` — âlocationâ was renamed to âvalueâ. deprecated
  - `value`: `Vector` — [Read-Write] The input position / location in world (Vector)

### `unreal.RigUnit_ToRigSpace_Rotation`
Inherits: `RigUnit` | Header: `RigUnit_WorldSpace.h`

Converts a rotation from world space to rig (global) space

**Properties** (3):
  - `global_`: `Quat` [Read-Only] — [Read-Only] The result rotation in global / rig space (Quat)
  - `rotation`: `Quat` — ârotationâ was renamed to âvalueâ. deprecated
  - `value`: `Quat` — [Read-Write] The input rotation in world (Quat)

### `unreal.RigUnit_ToRigSpace_Transform`
Inherits: `RigUnit` | Header: `RigUnit_WorldSpace.h`

Converts a transform from world space to rig (global) space

**Properties** (3):
  - `global_`: `Transform` [Read-Only] — [Read-Only] The result transform in global / rig space (Transform)
  - `transform`: `Transform` — âtransformâ was renamed to âvalueâ. deprecated
  - `value`: `Transform` — [Read-Write] The input transform in world (Transform)

### `unreal.RigUnit_ToSwingAndTwist`
Inherits: `RigUnit` | Header: `RigUnit_Converter.h`

Rig Unit to Swing and Twist

**Properties** (4):
  - `input`: `Quat` — [Read-Write] (Quat)
  - `swing`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `twist`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `twist_axis`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_ToWorldSpace_Location`
Inherits: `RigUnit` | Header: `RigUnit_WorldSpace.h`

Converts a position / location from rig (global) space to world space

**Properties** (3):
  - `location`: `Vector` — âlocationâ was renamed to âvalueâ. deprecated
  - `value`: `Vector` — [Read-Write] The input position / location in global / rig space (Vector)
  - `world`: `Vector` [Read-Only] — [Read-Only] The result position / location in world space (Vector)

### `unreal.RigUnit_ToWorldSpace_Rotation`
Inherits: `RigUnit` | Header: `RigUnit_WorldSpace.h`

Converts a rotation from rig (global) space to world space

**Properties** (3):
  - `rotation`: `Quat` — ârotationâ was renamed to âvalueâ. deprecated
  - `value`: `Quat` — [Read-Write] The input rotation in global / rig space (Quat)
  - `world`: `Quat` [Read-Only] — [Read-Only] The result rotation in world space (Quat)

### `unreal.RigUnit_ToWorldSpace_Transform`
Inherits: `RigUnit` | Header: `RigUnit_WorldSpace.h`

Converts a transform from rig (global) space to world space

**Properties** (3):
  - `transform`: `Transform` — âtransformâ was renamed to âvalueâ. deprecated
  - `value`: `Transform` — [Read-Write] The input transform in global / rig space (Transform)
  - `world`: `Transform` [Read-Only] — [Read-Only] The result transform in world space (Transform)

### `unreal.RigUnit_TransformConstraint`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Rig Unit Transform Constraint

**Properties** (6):
  - `base_bone`: `Name` — [Read-Write] Transform op option. Use if ETransformSpace is BaseJoint (Name)
  - `base_transform`: `Transform` — [Read-Write] Transform op option. Use if ETransformSpace is BaseTransform (Transform)
  - `base_transform_space`: `TransformSpaceMode` — [Read-Write] (TransformSpaceMode)
  - `bone`: `Name` — [Read-Write] (Name)
  - `targets`: `None` — [Read-Write] (Array[ConstraintTarget])
  - `use_initial_transforms`: `bool` [Read-Only] — [Read-Only] If checked the initial transform will be used for the constraint data (bool)

### `unreal.RigUnit_TransformConstraintPerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TransformConstraint.h`

Constrains an itemâs transform to multiple itemsâ transforms

**Properties** (6):
  - `base_item`: `RigElementKey` — [Read-Write] Transform op option. Use if ETransformSpace is BaseJoint (RigElementKey)
  - `base_transform`: `Transform` — [Read-Write] Transform op option. Use if ETransformSpace is BaseTransform (Transform)
  - `base_transform_space`: `TransformSpaceMode` — [Read-Write] (TransformSpaceMode)
  - `item`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `targets`: `None` — [Read-Write] (Array[ConstraintTarget])
  - `use_initial_transforms`: `bool` [Read-Only] — [Read-Only] If checked the initial transform will be used for the constraint data (bool)

### `unreal.RigUnit_TwistBones`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TwistBones.h`

Creates a gradient of twist rotation along a chain.

**Properties** (7):
  - `end_bone`: `Name` — [Read-Write] The name of the last bone to twist (Name)
  - `pole_axis`: `Vector` [Read-Only] — [Read-Only] The axis to use for the pole vector for each bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `start_bone`: `Name` — [Read-Write] The name of the first bone to twist (Name)
  - `twist_axis`: `Vector` [Read-Only] — [Read-Only] The axis to twist the bones around (Vector)
  - `twist_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between two twists. (RigVMAnimEasingType)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_TwistBonesPerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TwistBones.h`

Creates a gradient of twist rotation along a collection of items.

**Properties** (6):
  - `items`: `RigElementKeyCollection` — [Read-Write] The items to twist (RigElementKeyCollection)
  - `pole_axis`: `Vector` [Read-Only] — [Read-Only] The axis to use for the pole vector for each bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `twist_axis`: `Vector` [Read-Only] — [Read-Only] The axis to twist the bones around (Vector)
  - `twist_ease_type`: `RigVMAnimEasingType` [Read-Only] — [Read-Only] The easing to use between two twists. (RigVMAnimEasingType)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the rotation should be applied (float)

### `unreal.RigUnit_TwoBoneIKFK`
Inherits: `RigUnitMutable` | Header: `RigUnit_TwoBoneIKFK.h`

Rig Unit Two Bone IKFK

**Properties** (6):
  - `end_effector`: `Transform` — [Read-Write] # Transform to use as the end effector of the IK system (Transform)
  - `end_joint`: `Name` — [Read-Write] (Name)
  - `ik_blend`: `float` — IKBlend(Default : 0.0)             # Blend between 0.0 (FK) and 1.0 (IK)solutions (float) [Read-Writ...
  - `pole_target`: `Vector` — [Read-Write] # Transform to use as the pole target(specifies the plane of solution) (Vector)
  - `spin`: `float` — Spin(Default : 0.0) # Amount of twist to apply to the solution plane(Additive after application of P...
  - `start_joint`: `Name` — [Read-Write] (Name)

### `unreal.RigUnit_TwoBoneIKSimple`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TwoBoneIKSimple.h`

Solves the two bone IK given two bones. Note: This node operates in world space!

**Properties** (18):
  - `bone_a`: `Name` — [Read-Write] The name of first bone (Name)
  - `bone_a_length`: `float` — [Read-Write] The length of the first bone.
If set to 0.0 it will be determined by the hierarchy (flo...
  - `bone_b`: `Name` — [Read-Write] The name of second bone (Name)
  - `bone_b_length`: `float` — [Read-Write] The length of the second  bone.
If set to 0.0 it will be determined by the hierarchy (f...
  - `debug_settings`: `RigUnit_TwoBoneIKSimple_DebugSettings` — [Read-Write] The settings for debug drawing (RigUnit_TwoBoneIKSimple_DebugSettings)
  - `effector`: `Transform` — [Read-Write] The transform of the effector (Transform)
  - `effector_bone`: `Name` — [Read-Write] The name of the effector bone (if exists) (Name)
  - `enable_stretch`: `bool` — [Read-Write] If set to true the stretch feature of the solver will be enabled (bool)
  - `pole_vector`: `Vector` — [Read-Write] The polevector to use for the IK solver
This can be a location or direction. (Vector)
  - `pole_vector_kind`: `ControlRigVectorKind` — [Read-Write] The kind of pole vector this is representing - can be a direction or a location (Contro...
  - `pole_vector_space`: `Name` — [Read-Write] The space in which the pole vector is expressed (Name)
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the polevector (Vector)
  - `secondary_axis_weight`: `float` — [Read-Write] Determines how much the secondary axis roll is being applied (float)
  - `stretch_maximum_ratio`: `float` — [Read-Write] The maximum allowed stretch ratio (float)
  - `stretch_start_ratio`: `float` — [Read-Write] The ratio where the stretch starts (float)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_TwoBoneIKSimple_DebugSettings`
Inherits: `StructBase` | Header: `RigUnit_TwoBoneIKSimple.h`

Rig Unit Two Bone IKSimple Debug Settings

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] If enabled debug information will be drawn (bool)
  - `scale`: `float` — [Read-Write] The size of the debug drawing information (float)
  - `world_offset`: `Transform` — [Read-Write] The offset at which to draw the debug information in the world (Transform)

### `unreal.RigUnit_TwoBoneIKSimplePerItem`
Inherits: `RigUnit_HighlevelBaseMutable` | Header: `RigUnit_TwoBoneIKSimple.h`

Solves the two bone IK given two bones. Note: This node operates in world space!

**Properties** (18):
  - `debug_settings`: `RigUnit_TwoBoneIKSimple_DebugSettings` — [Read-Write] The settings for debug drawing (RigUnit_TwoBoneIKSimple_DebugSettings)
  - `effector`: `Transform` — [Read-Write] The transform of the effector (Transform)
  - `effector_item`: `RigElementKey` — [Read-Write] The name of the effector item (if exists) (RigElementKey)
  - `enable_stretch`: `bool` — [Read-Write] If set to true the stretch feature of the solver will be enabled (bool)
  - `item_a`: `RigElementKey` — [Read-Write] The name of first item (RigElementKey)
  - `item_a_length`: `float` — [Read-Write] The length of the first item.
If set to 0.0 it will be determined by the hierarchy (flo...
  - `item_b`: `RigElementKey` — [Read-Write] The name of second item (RigElementKey)
  - `item_b_length`: `float` — [Read-Write] The length of the second item.
If set to 0.0 it will be determined by the hierarchy (fl...
  - `pole_vector`: `Vector` — [Read-Write] The polevector to use for the IK solver
This can be a location or direction. (Vector)
  - `pole_vector_kind`: `ControlRigVectorKind` — [Read-Write] The kind of pole vector this is representing - can be a direction or a location (Contro...
  - `pole_vector_space`: `RigElementKey` — [Read-Write] The space in which the pole vector is expressed (RigElementKey)
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the item (Vector)
  - `propagate_to_children`: `bool` [Read-Only] — [Read-Only] If set to true all of the global transforms of the children
of this bone will be recalcu...
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the polevector (Vector)
  - `secondary_axis_weight`: `float` — [Read-Write] Determines how much the secondary axis roll is being applied (float)
  - `stretch_maximum_ratio`: `float` — [Read-Write] The maximum allowed stretch ratio (float)
  - `stretch_start_ratio`: `float` — [Read-Write] The ratio where the stretch starts (float)
  - `weight`: `float` — [Read-Write] The weight of the solver - how much the IK should be applied. (float)

### `unreal.RigUnit_TwoBoneIKSimpleTransforms`
Inherits: `RigUnit_HighlevelBase` | Header: `RigUnit_TwoBoneIKSimple.h`

Solves the two bone IK given transforms Note: This node operates in world space!

**Properties** (12):
  - `bone_a_length`: `float` — [Read-Write] The length of the first bone.
If set to 0.0 it will be determined by the hierarchy (flo...
  - `bone_b_length`: `float` — [Read-Write] The length of the second  bone.
If set to 0.0 it will be determined by the hierarchy (f...
  - `effector`: `Transform` — [Read-Write] The transform of the effector (Transform)
  - `elbow`: `Transform` — [Read-Write] The resulting elbow transform (Transform)
  - `enable_stretch`: `bool` — [Read-Write] If set to true the stretch feature of the solver will be enabled (bool)
  - `pole_vector`: `Vector` — [Read-Write] The position of the pole of the triangle (Vector)
  - `primary_axis`: `Vector` — [Read-Write] The major axis being aligned - along the bone (Vector)
  - `root`: `Transform` — [Read-Write] The transform of the root of the triangle (Transform)
  - `secondary_axis`: `Vector` — [Read-Write] The minor axis being aligned - towards the polevector (Vector)
  - `secondary_axis_weight`: `float` — [Read-Write] Determines how much the secondary axis roll is being applied (float)
  - `stretch_maximum_ratio`: `float` — [Read-Write] The maximum allowed stretch ratio (float)
  - `stretch_start_ratio`: `float` — [Read-Write] The ratio where the stretch starts (float)

### `unreal.RigUnit_TwoBoneIKSimpleVectors`
Inherits: `RigUnit_HighlevelBase` | Header: `RigUnit_TwoBoneIKSimple.h`

Solves the two bone IK given positions Note: This node operates in world space!

**Properties** (9):
  - `bone_a_length`: `float` — [Read-Write] The length of the first bone.
If set to 0.0 it will be determined by the hierarchy (flo...
  - `bone_b_length`: `float` — [Read-Write] The length of the second  bone.
If set to 0.0 it will be determined by the hierarchy (f...
  - `effector`: `Vector` — [Read-Write] The position of the effector (Vector)
  - `elbow`: `Vector` [Read-Only] — [Read-Only] The resulting elbow position (Vector)
  - `enable_stretch`: `bool` — [Read-Write] If set to true the stretch feature of the solver will be enabled (bool)
  - `pole_vector`: `Vector` — [Read-Write] The position of the pole of the triangle (Vector)
  - `root`: `Vector` — [Read-Write] The position of the root of the triangle (Vector)
  - `stretch_maximum_ratio`: `float` — [Read-Write] The maximum allowed stretch ratio (float)
  - `stretch_start_ratio`: `float` — [Read-Write] The ratio where the stretch starts (float)

### `unreal.RigUnit_UnaryQuaternionOp`
Inherits: `RigUnit` | Header: `RigUnit_Quaternion.h`

Two args and a result of Quaternion type

**Properties** (2):
  - `argument`: `Quat` — [Read-Write] (Quat)
  - `result`: `Quat` [Read-Only] — [Read-Only] (Quat)

### `unreal.RigUnit_UnsetCurveValue`
Inherits: `RigUnitMutable` | Header: `RigUnit_UnsetCurveValue.h`

UnsetCurveValue is used to perform a change in the curve container by invalidating a single Curve value.

**Properties** (1):
  - `curve`: `Name` — [Read-Write] The name of the Curve to set the Value for. (Name)

### `unreal.RigUnit_VisualDebugQuat`
Inherits: `RigUnit_DebugBase` | Header: `RigUnit_VisualDebug.h`

Rig Unit Visual Debug Quat

**Properties** (5):
  - `bone_space`: `Name` — [Read-Write] (Name)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigUnit_VisualDebugQuatItemSpace`
Inherits: `RigUnit_DebugBase` | Header: `RigUnit_VisualDebug.h`

Debug draw parameters for an Axis given a quaternion

**Properties** (5):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Quat` — [Read-Write] (Quat)

### `unreal.RigUnit_VisualDebugTransform`
Inherits: `RigUnit_DebugBase` | Header: `RigUnit_VisualDebug.h`

Rig Unit Visual Debug Transform

**Properties** (5):
  - `bone_space`: `Name` — [Read-Write] (Name)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_VisualDebugTransformItemSpace`
Inherits: `RigUnit_DebugBase` | Header: `RigUnit_VisualDebug.h`

Debug draw parameters for an Axis given a transform

**Properties** (5):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Transform` — [Read-Write] (Transform)

### `unreal.RigUnit_VisualDebugVector`
Inherits: `RigUnit_DebugBase` | Header: `RigUnit_VisualDebug.h`

Rig Unit Visual Debug Vector

**Properties** (7):
  - `bone_space`: `Name` — [Read-Write] (Name)
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitVisualDebugPointMode` — [Read-Write] (RigUnitVisualDebugPointMode)
  - `scale`: `float` — [Read-Write] (float)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnit_VisualDebugVectorItemSpace`
Inherits: `RigUnit_DebugBase` | Header: `RigUnit_VisualDebug.h`

Debug draw parameters for a Point or Vector given a vector

**Properties** (7):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `mode`: `RigUnitVisualDebugPointMode` — [Read-Write] (RigUnitVisualDebugPointMode)
  - `scale`: `float` — [Read-Write] (float)
  - `space`: `RigElementKey` — [Read-Write] (RigElementKey)
  - `thickness`: `float` — [Read-Write] (float)
  - `value`: `Vector` — [Read-Write] (Vector)

### `unreal.RigUnitMutable`
Inherits: `RigUnit` | Header: `RigUnit.h`

Base class for all rig units that can change data

**Properties** (1):
  - `execute_pin`: `RigVMExecutePin` — [Read-Write] * This property is used to chain multiple mutable units together (RigVMExecutePin)

### `unreal.SampleTrackHost`
Inherits: `StructBase` | Header: `SampleTrackContainer.h`

Sample Track Host

### `unreal.SphericalPoseReaderDebugSettings`
Inherits: `StructBase` | Header: `RigUnit_SphericalPoseReader.h`

Spherical Pose Reader Debug Settings

**Properties** (6):
  - `debug_scale`: `float` — [Read-Write] (float)
  - `debug_segments`: `int` — [Read-Write] (int32)
  - `debug_thickness`: `float` — [Read-Write] (float)
  - `draw2d`: `bool` — [Read-Write] (bool)
  - `draw_debug`: `bool` — [Read-Write] (bool)
  - `draw_local_axes`: `bool` — [Read-Write] (bool)

### `unreal.AdditiveControlRig`
Inherits: `ControlRig` | Header: `AdditiveControlRig.h`

Rig that allows additive layer editing per joint

### `unreal.AnimNodeControlRigLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimNode_ControlRig_Library.h`

Exposes operations to be performed on a control rig anim node

**Methods** (3):
  - `convert_to_control_rig(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a control rig context from an anim node context
  - `convert_to_control_rig_pure(result=bool)` [classmethod] — Get a control rig context from an anim node context (pure)
  - `set_control_rig_class(node, control_rig_class)` -> `ControlRigReference` [classmethod] — Set the control rig class on the node

### `unreal.ControlRig`
Inherits: `RigVMHost` | Header: `ControlRig.h`

Runs logic for mapping input data to transforms (the âRigâ)

**Methods** (10):
  - `clear_control_selection()` -> `bool` — Clear Control Selection
  - `create_transformable_control_handle(control_name)` -> `TransformableControlHandle`
  - `current_control_selection()` -> `Array [ Name ]` — Current Control Selection
  - `find_control_rigs(outer, optional_class)` -> `Array [ ControlRig ]` [classmethod] — Find Control Rigs
  - `get_hierarchy()` -> `RigHierarchy` — Get Hierarchy
  - `get_hosting_actor()` -> `Actor` — Find the actor the rig is bound to, if any
  - `is_control_selected(control_name)` -> `bool` — Is Control Selected
  - `request_construction()` -> `None` — Requests to perform construction during the next execution
  - `select_control(control_name, select = True)` -> `None` — Select Control
  - `supports_backwards_solve()` -> `bool` — Contains a backwards solve event

**Properties** (1):
  - `on_control_selected_bp`: `OnControlSelectedBP` — [Read-Write] (OnControlSelectedBP)

### `unreal.ControlRigAnimInstance`
Inherits: `AnimInstance` | Header: `ControlRigAnimInstance.h`

Control Rig Anim Instance

### `unreal.ControlRigComponent`
Inherits: `PrimitiveComponent` | Header: `ControlRigComponent.h`

A component that hosts an animation ControlRig, manages control components and marshals data between the two

**Methods** (47):
  - `add_mapped_complete_skeletal_mesh(skeletal_mesh_component, direction = ControlRigComponentMapDirection.OUTPUT)` -> `None` — Adds all matching bones to the rig, should not be used before OnPreInitialize Event
  - `add_mapped_components(components)` -> `None` — Adds a series of mapped bones to the rig, should not be used before OnPreInitialize Event
  - `add_mapped_elements(new_mapped_elements)` -> `None` — Adds the provided mapped elements to the component, should not be used before OnPreInitialize Event
  - `add_mapped_skeletal_mesh(skeletal_mesh_component, bones, curves, direction = ControlRigComponentMapDirection.OUTPUT)` -> `None` — Adds a series of mapped bones to the rig, should not be used before OnPreInitialize Event
  - `can_execute()` -> `bool` — Returns true if the Component can execute its Control Rig
  - `clear_mapped_elements()` -> `None` — Removes all mapped elements from the component
  - `does_element_exist(name, element_type = RigElementType.BONE)` -> `bool` — Returns true if an element given a type and name exists in the rig
  - `get_absolute_time()` -> `float` — Get the ControlRigâs local time in seconds since its last initialize
  - `get_bone_transform(bone_name, space = ControlRigComponentSpace.RIG_SPACE)` -> `Transform` — Returns the transform of the bone in the requested space
  - `get_control_bool(control_name)` -> `bool` — Returns the value of a bool control
  - `get_control_float(control_name)` -> `float` — Returns the value of a float control
  - `get_control_int(control_name)` -> `int32` — Returns the value of an integer control
  - `get_control_offset(control_name, space = ControlRigComponentSpace.RIG_SPACE)` -> `Transform` — Returns the offset transform of a control
  - `get_control_position(control_name, space = ControlRigComponentSpace.LOCAL_SPACE)` -> `Vector` — Returns the value of a position control
  - `get_control_rig()` -> `ControlRig` — Get the ControlRig hosted by this component
  - `get_control_rotator(control_name, space = ControlRigComponentSpace.LOCAL_SPACE)` -> `Rotator` — Returns the value of a rotator control
  - `get_control_scale(control_name, space = ControlRigComponentSpace.LOCAL_SPACE)` -> `Vector` — Returns the value of a scale control
  - `get_control_transform(control_name, space = ControlRigComponentSpace.RIG_SPACE)` -> `Transform` — Returns the value of a transform control
  - `get_control_vector2d(control_name)` -> `Vector2D` — Returns the value of a Vector3D control
  - `get_element_names(element_type = RigElementType.BONE)` -> `Array [ Name ]` — Returns all of the names for a given element type (Bone, Control, etc)
  - `get_initial_bone_transform(bone_name, space = ControlRigComponentSpace.RIG_SPACE)` -> `Transform` — Returns the initial transform of the bone in the requested space
  - `get_initial_space_transform(space_name, space = ControlRigComponentSpace.RIG_SPACE)` -> `Transform` — Returns the initial transform of the space in the requested space
  - `get_space_transform(space_name, space = ControlRigComponentSpace.RIG_SPACE)` -> `Transform` — Returns the transform of the space in the requested space
  - `initialize()` -> `None` — Initializes the rigâs memory and calls the construction event
  - `on_post_construction(component)` -> `None` — On Post Construction
  - `on_post_forwards_solve(component)` -> `None` — On Post Forwards Solve
  - `on_post_initialize(component)` -> `None` — On Post Initialize
  - `on_pre_construction(component)` -> `None` — On Pre Construction
  - `on_pre_forwards_solve(component)` -> `None` — On Pre Forwards Solve
  - `on_pre_initialize(component)` -> `None` — On Pre Initialize
  - `set_bone_initial_transforms_from_skeletal_mesh(skeletal_mesh)` -> `None` — Setup the initial transforms / ref pose of the bones based on a skeletal mesh
  - `set_bone_transform(bone_name, transform, space = ControlRigComponentSpace.RIG_SPACE, weight = 1.000000, propagate_to_children = True)` -> `None` — Sets the transform of the bone in the requested space
  - `set_control_bool(control_name, value)` -> `None` — Sets the value of a bool control
  - `set_control_float(control_name, value)` -> `None` — Sets the value of a float control
  - `set_control_int(control_name, value)` -> `None` — Sets the value of an integer control
  - `set_control_offset(control_name, offset_transform, space = ControlRigComponentSpace.RIG_SPACE)` -> `None` — Sets the offset transform of a control
  - `set_control_position(control_name, value, space = ControlRigComponentSpace.LOCAL_SPACE)` -> `None` — Sets the value of a position control
  - `set_control_rig_class(control_rig_class)` -> `None` — Set Control Rig Class
  - `set_control_rotator(control_name, value, space = ControlRigComponentSpace.LOCAL_SPACE)` -> `None` — Sets the value of a rotator control
  - `set_control_scale(control_name, value, space = ControlRigComponentSpace.LOCAL_SPACE)` -> `None` — Sets the value of a scale control
  - `set_control_transform(control_name, value, space = ControlRigComponentSpace.RIG_SPACE)` -> `None` — Sets the value of a transform control
  - `set_control_vector2d(control_name, value)` -> `None` — Sets the value of a vector2D control
  - `set_initial_bone_transform(bone_name, initial_transform, space = ControlRigComponentSpace.RIG_SPACE, propagate_to_children = False)` -> `None` — Sets the initial transform of the bone in the requested space
  - `set_initial_space_transform(space_name, initial_transform, space = ControlRigComponentSpace.RIG_SPACE)` -> `None` — Sets the transform of the space in the requested space
  - `set_mapped_elements(new_mapped_elements)` -> `None` — Replaces the mapped elements on the component with the provided array, should not be used before OnPreInitialize Event
  - `set_object_binding(object_to_bind)` -> `None` — Set Object Binding
  - `update(delta_time = 0.000000)` -> `None` — Updates and ticks the rig.

**Properties** (11):
  - `control_rig_class`: `Class` — [Read-Write] The class of control rig to instantiate (type(Class))
  - `on_post_construction_delegate`: `ControlRigComponentDelegate` — [Read-Write] Event fired after this componentâs ControlRig is setup (ControlRigComponentDelegate)
  - `on_post_forwards_solve_delegate`: `ControlRigComponentDelegate` — [Read-Write] Event fired after this componentâs ControlRigâs forwards solve (ControlRigComponent...
  - `on_post_initialize_delegate`: `ControlRigComponentDelegate` — [Read-Write] Event fired after this componentâs ControlRig is initialized (ControlRigComponentDele...
  - `on_post_setup_delegate`: `ControlRigComponentDelegate` — âon_post_setup_delegateâ was renamed to âon_post_construction_delegateâ. deprecated
  - `on_post_update_delegate`: `ControlRigComponentDelegate` — âon_post_update_delegateâ was renamed to âon_post_forwards_solve_delegateâ. deprecated
  - `on_pre_construction_delegate`: `ControlRigComponentDelegate` — [Read-Write] Event fired before this componentâs ControlRig is setup (ControlRigComponentDelegate)
  - `on_pre_forwards_solve_delegate`: `ControlRigComponentDelegate` — [Read-Write] Event fired before this componentâs ControlRigâs forwards solve (ControlRigComponen...
  - `on_pre_initialize_delegate`: `ControlRigComponentDelegate` — [Read-Write] Event fired just before this componentâs ControlRig is initialized (ControlRigCompone...
  - `on_pre_setup_delegate`: `ControlRigComponentDelegate` — âon_pre_setup_delegateâ was renamed to âon_pre_construction_delegateâ. deprecated
  - `on_pre_update_delegate`: `ControlRigComponentDelegate` — âon_pre_update_delegateâ was renamed to âon_pre_forwards_solve_delegateâ. deprecated

### `unreal.ControlRigControlActor`
Inherits: `Actor` | Header: `ControlRigControlActor.h`

Control Rig Control Actor

**Methods** (3):
  - `clear()` -> `None` — Clear
  - `refresh()` -> `None` — Refresh
  - `reset_control_actor()` -> `None` — Reset Control Actor

**Properties** (7):
  - `actor_to_track`: `Actor` — [Read-Write] (Actor)
  - `cast_shadows`: `bool` — [Read-Write] (bool)
  - `color_parameter`: `str` — [Read-Write] (str)
  - `control_rig_class`: `Class` — [Read-Write] (type(Class))
  - `is_selectable`: `bool` — [Read-Write] (bool)
  - `material_override`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `refresh_on_tick`: `bool` — [Read-Write] (bool)

### `unreal.ControlRigLayerInstance`
Inherits: `AnimInstance` | Header: `ControlRigLayerInstance.h`

Control Rig Layer Instance

### `unreal.ControlRigOverrideAsset`
Inherits: `Object` | Header: `ControlRigOverride.h`

Control Rig Override Asset

### `unreal.ControlRigPoseAsset`
Inherits: `Object` | Header: `ControlRigPose.h`

An individual Pose made of Control Rig Controls

**Methods** (7):
  - `does_mirror_match(control_rig, control_name)` -> `bool` — Does Mirror Match
  - `get_control_names()` -> `Array [ Name ]` — Get Control Names
  - `get_current_pose(control_rig)` -> `ControlRigControlPose` — Get Current Pose
  - `paste_pose(control_rig, do_key = False, do_mirror = False, do_additive = False)` -> `None` — Paste Pose
  - `replace_control_name(current_name, new_name)` -> `None` — Replace Control Name
  - `save_pose(control_rig, use_all)` -> `None` — Save Pose
  - `select_controls(control_rig, do_mirror = False, clear_selection = True)` -> `None` — Select Controls

**Properties** (1):
  - `pose`: `ControlRigControlPose` — [Read-Write] (ControlRigControlPose)

### `unreal.ControlRigPoseMirrorSettings`
Inherits: `Object` | Header: `ControlRigPoseMirrorSettings.h`

Control Rig Pose Mirror Settings

**Properties** (4):
  - `axis_to_flip`: `AxisType` — [Read-Write] Axis to Flip for Rotations (AxisType)
  - `left_side`: `str` — [Read-Write] String To Denote Left Side (str)
  - `mirror_axis`: `AxisType` — [Read-Write] Axis to Mirror Translations (AxisType)
  - `right_side`: `str` — [Read-Write] String To Denote Right Side (str)

### `unreal.ControlRigPoseProjectSettings`
Inherits: `Object` | Header: `ControlRigPoseProjectSettings.h`

Control Rig Pose Project Settings

**Properties** (1):
  - `root_save_dirs`: `None` — [Read-Write] The root of the directory in which to save poses (Array[DirectoryPath])

### `unreal.ControlRigReplay`
Inherits: `Object` | Header: `ControlRigReplay.h`

Control Rig Replay

**Methods** (12):
  - `create_new_asset(desired_package_path, blueprint_path_name, asset_class)` -> `ControlRigReplay` [classmethod] — Create New Asset
  - `get_playback_mode()` -> `ControlRigReplayPlaybackMode` — Get Playback Mode
  - `get_time_range()` -> `Vector2D` — Get Time Range
  - `is_paused()` -> `bool` — Is Paused
  - `is_recording()` -> `bool` — Is Recording
  - `is_replaying()` -> `bool` — Is Replaying
  - `pause_replay()` -> `bool` — Pause Replay
  - `set_playback_mode(mode)` -> `None` — Set Playback Mode
  - `start_recording(control_rig)` -> `bool` — Start Recording
  - `start_replay(control_rig, mode = ControlRigReplayPlaybackMode.REPLAY_INPUTS)` -> `bool` — Start Replay
  - `stop_recording()` -> `bool` — Stop Recording
  - `stop_replay()` -> `bool` — Stop Replay

**Properties** (10):
  - `control_rig_object_path`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)
  - `description`: `Text` [Read-Only] — [Read-Only] (Text)
  - `enable_test`: `bool` [Read-Only] — [Read-Only] (bool)
  - `frames_to_skip`: `None` [Read-Only] — [Read-Only] (Array[int32])
  - `preview_skeletal_mesh_object_path`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)
  - `tolerance`: `float` [Read-Only] — [Read-Only] (double)
  - `validate_hierarchy_topology`: `bool` [Read-Only] — [Read-Only] (bool)
  - `validate_metadata`: `bool` [Read-Only] — [Read-Only] (bool)
  - `validate_pose`: `bool` [Read-Only] — [Read-Only] (bool)
  - `validate_variables`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.ControlRigShapeActor`
Inherits: `Actor` | Header: `ControlRigGizmoActor.h`

An actor used to represent a rig control

**Methods** (7):
  - `get_global_transform()` -> `Transform` — Get Global Transform
  - `on_enabled_changed(is_enabled)` -> `None` — Event called when the enabled state of this control has changed
  - `on_hovered_changed(is_selected)` -> `None` — Event called when the hovered state of this control has changed
  - `on_manipulating_changed(is_manipulating)` -> `None` — Event called when the manipulating state of this control has changed
  - `on_selection_changed(is_selected)` -> `None` — Event called when the selection state of this control has changed
  - `on_transform_changed(new_transform)` -> `None` — Event called when the transform of this control has changed
  - `set_global_transform(transform)` -> `None` — this returns root component transform based on attach when there is no attach, it is based on 0

**Properties** (3):
  - `hovered`: `bool` — [Read-Write] Whether this control is hovered (bool)
  - `selected`: `bool` — [Read-Write] Whether this control is selected (bool)
  - `static_mesh_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] this is visual representation of the transform (StaticMeshComponent)

### `unreal.ControlRigShapeLibrary`
Inherits: `Object` | Header: `ControlRigGizmoLibrary.h`

Control Rig Shape Library

### `unreal.ControlRigShapeLibraryLink`
Inherits: `NameSpacedUserData` | Header: `ControlRigAssetUserData.h`

Namespaced user data which provides access to a linked shape library

**Properties** (1):
  - `shape_library`: `ControlRigShapeLibrary` — [Read-Write] If assigned, the data asset link will provide access to the data assetâs content. (Co...

### `unreal.ControlRigTestData`
Inherits: `ControlRigReplay` | Header: `ControlRigTestData.h`

Control Rig Test Data

**Methods** (1):
  - `get_frame_index_for_time(seconds, input = False)` -> `int32` — Get Frame Index for Time

**Properties** (4):
  - `event_queue`: `None` [Read-Only] — [Read-Only] (Array[Name])
  - `initial`: `ControlRigTestDataFrame` [Read-Only] — [Read-Only] (ControlRigTestDataFrame)
  - `input_frames`: `None` [Read-Only] — [Read-Only] (Array[ControlRigTestDataFrame])
  - `output_frames`: `None` [Read-Only] — [Read-Only] (Array[ControlRigTestDataFrame])

### `unreal.ControlRigTransformWorkflowOptions`
Inherits: `ControlRigWorkflowOptions` | Header: `ControlRigNodeWorkflow.h`

Control Rig Transform Workflow Options

**Properties** (1):
  - `transform_type`: `RigTransformType` — [Read-Write] The type of transform to retrieve from the hierarchy (RigTransformType)

### `unreal.ControlRigWorkflowOptions`
Inherits: `RigVMUserWorkflowOptions` | Header: `ControlRigNodeWorkflow.h`

Control Rig Workflow Options

**Methods** (1):
  - `ensure_at_least_one_rig_element_selected()` -> `bool` — Ensure at Least One Rig Element Selected

**Properties** (2):
  - `hierarchy`: `RigHierarchy` — [Read-Write] (RigHierarchy)
  - `selection`: `None` — [Read-Write] (Array[RigElementKey])

### `unreal.FKControlRig`
Inherits: `ControlRig` | Header: `FKControlRig.h`

Rig that allows override editing per joint

### `unreal.ModularRig`
Inherits: `ControlRig` | Header: `ModularRig.h`

Runs logic for mapping input data to transforms (the âRigâ)

**Methods** (12):
  - `execute_event_on_all_modules(event)` -> `Array [ Name ]`
  - `execute_event_on_module(event, module_path)` -> `bool` — deprecated: Function has been deprecated, please rely on ExecuteEventOnModuleByName instead.
  - `execute_event_on_module_by_name(event, module_name)` -> `bool`
  - `get_events_for_all_modules()` -> `Array [ Name ]`
  - `get_events_for_module(module_path)` -> `Array [ Name ]` — deprecated: Function has been deprecated, please rely on GetEventsForModuleByName instead.
  - `get_events_for_module_by_name(module_name)` -> `Array [ Name ]`
  - `get_module_names()` -> `Array [ Name ]`
  - `get_module_paths()` -> `Array [ str ]` — deprecated: Function has been deprecated, please rely on GetModuleNames instead.
  - `get_module_rig(module_path)` -> `ControlRig` — deprecated: Function has been deprecated, please rely on GetModuleRigByName instead.
  - `get_module_rig_by_name(module_name)` -> `ControlRig`
  - `get_parent_module_name(module_name)` -> `Name`
  - `get_parent_path(module_path)` -> `str` — deprecated: Function has been deprecated, please rely on GetParentModuleName instead.

### `unreal.ModularRigController`
Inherits: `Object` | Header: `ModularRigController.h`

Modular Rig Controller

**Methods** (27):
  - `add_module(module_name, class_, parent_module_name, setup_undo = True)` -> `Name` — Add Module
  - `add_target_to_array_connector(connector_key, target_key, setup_undo = True, auto_resolve_other_connectors = True, check_valid_connection = True)` -> `bool` — Add Target to Array Connector
  - `auto_connect_modules(module_names, replace_existing_connections, setup_undo = True)` -> `bool` — Auto Connect Modules
  - `auto_connect_secondary_connectors(connector_keys, replace_existing_connections, setup_undo = True)` -> `bool` — Auto Connect Secondary Connectors
  - `bind_module_variable(module_name, variable_name, source_path, setup_undo = True)` -> `bool` — Bind Module Variable
  - `can_connect_connector_to_element(connector_key, target_key)` -> `Text or None` — Can Connect Connector to Element
  - `can_connect_connector_to_elements(connector_key, target_keys)` -> `Text or None` — Can Connect Connector to Elements
  - `connect_connector_to_element(connector_key, target_key, setup_undo = True, auto_resolve_other_connectors = True, check_valid_connection = True)` -> `bool` — Connect Connector to Element
  - `connect_connector_to_elements(connector_key, target_keys, setup_undo = True, auto_resolve_other_connectors = True, check_valid_connection = True)` -> `bool` — Connect Connector to Elements
  - `delete_module(module_name, setup_undo = True)` -> `bool` — Delete Module
  - `deselect_module(module_name)` -> `bool` — Deselect Module
  - `disconnect_connector(connector_key, disconnect_sub_modules = False, setup_undo = True)` -> `bool` — Disconnect Connector
  - `disconnect_cyclic_connectors(setup_undo = True)` -> `Array [ RigElementKey ]` — Disconnect Cyclic Connectors
  - `get_all_modules()` -> `Array [ Name ]` — Get All Modules
  - `get_connectors_for_module(module_name)` -> `Array [ RigElementKey ]`
  - `get_module_reference(module_name)` -> `RigModuleReference`
  - `get_selected_modules()` -> `Array [ Name ]` — Get Selected Modules
  - `mirror_module(module_name, settings, setup_undo = True)` -> `Name` — Mirror Module
  - `rename_module(module_name, new_name, setup_undo = True)` -> `Name` — Rename Module
  - `reparent_module(module_name, new_parent_module_name, setup_undo = True)` -> `bool` — Reparent Module
  - `reset_config_value_in_module(module_name, path, clear_override = True, setup_undo = True)` -> `bool` — Reset Config Value in Module
  - `select_module(module_name, selected = True)` -> `bool` — Select Module
  - `set_config_value_in_module(module_name, variable_name, value, setup_undo = True)` -> `bool` — Set Config Value in Module
  - `set_module_selection(module_names)` -> `bool` — Set Module Selection
  - `swap_module_class(module_name, new_class, setup_undo = True)` -> `bool` — Swap Module Class
  - `swap_modules_of_class(old_class, new_class, setup_undo = True)` -> `bool` — Swap Modules Of Class
  - `un_bind_module_variable(module_name, variable_name, setup_undo = True)` -> `bool` — Un Bind Module Variable

### `unreal.ModularRigRuleManager`
Inherits: `Object` | Header: `ModularRigRuleManager.h`

A management class to validate rules and pattern match

### `unreal.MovieSceneControlRigParameterSection`
Inherits: `MovieSceneParameterSection` | Header: `MovieSceneControlRigParameterSection.h`

Movie scene section that controls animation controller animation

### `unreal.MovieSceneControlRigParameterTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneControlRigParameterTrack.h`

Handles animation of skeletal mesh actors using animation ControlRigs

### `unreal.RigHierarchy`
Inherits: `Object` | Header: `RigHierarchy.h`

Rig Hierarchy

**Methods** (193):
  - `contains(key)` -> `bool` — Returns true if the provided element key is valid
  - `copy_hierarchy(hierarchy)` -> `None` — Copies the contents of a hierarchy onto this one
  - `copy_pose(hierarchy, current, initial, weights, match_pose_in_global_if_needed = False)` -> `None` — Copies the contents of a hierarchy onto this one
  - `find_bone(key)` -> `RigBoneElement` — Returns bone element for a given key, for scripting purpose only, for cpp usage, use Find<FRigBoneElement>()
  - `find_control(key)` -> `RigControlElement` — Returns control element for a given key, for scripting purpose only, for cpp usage, use Find<FRigControlElement>()
  - `find_null(key)` -> `RigNullElement` — Returns null element for a given key, for scripting purpose only, for cpp usage, use Find<FRigControlElement>()
  - `get_all_component_keys()` -> `Array [ RigComponentKey ]` — Get All Component Keys
  - `get_all_keys(traverse = True)` -> `Array [ RigElementKey ]` — Returns all element keys of this hierarchy
  - `get_bones(traverse = True)` -> `Array [ RigElementKey ]` — Returns all Bone elements
  - `get_bool_array_metadata(item, metadata_name)` -> `Array [ bool ]` — Queries and returns the value of bool array metadata
  - `get_bool_metadata(item, metadata_name, default_value)` -> `bool` — Queries and returns the value of bool metadata
  - `get_children(key, recursive = False)` -> `Array [ RigElementKey ]` — Returns the child elements of a given element key
  - `get_component_content(element, component_index)` -> `str` — Get Component Content
  - `get_component_key(element, component_index)` -> `RigComponentKey` — Get Component Key
  - `get_component_keys(element)` -> `Array [ RigComponentKey ]` — Get Component Keys
  - `get_component_name(element, component_index)` -> `Name` — Get Component Name
  - `get_component_type(element, component_index)` -> `ScriptStruct` — Get Component Type
  - `get_connector_states()` -> `Array [ RigConnectorState ]` — Returns all of the connectorsâ state
  - `get_connectors(traverse = True)` -> `Array [ RigElementKey ]` — Returns all Connector elements
  - `get_control_preferred_euler_angles(key, rotation_order, initial = False)` -> `Vector` — Returns a controlâs preferred euler angles (local transform rotation)
  - `get_control_preferred_euler_angles_by_index(element_index, rotation_order, initial = False)` -> `Vector` — Returns a controlâs preferred euler angles (local transform rotation)
  - `get_control_preferred_euler_rotation_order(key, from_settings = True)` -> `EulerRotationOrder` — Returns a controlâs preferred euler rotation order
  - `get_control_preferred_euler_rotation_order_by_index(element_index, from_settings = True)` -> `EulerRotationOrder` — Returns a controlâs preferred euler rotation order
  - `get_control_preferred_rotator(key, initial = False)` -> `Rotator` — Returns a controlâs preferred rotator (local transform rotation)
  - `get_control_preferred_rotator_by_index(element_index, initial = False)` -> `Rotator` — Returns a controlâs preferred rotator (local transform rotation)
  - `get_control_value(key, value_type = RigControlValueType.CURRENT)` -> `RigControlValue` — Returns a controlâs current value given its key
  - `get_control_value_by_index(element_index, value_type = RigControlValueType.CURRENT)` -> `RigControlValue` — Returns a controlâs current value given its index
  - `get_controller(create_if_needed = True)` -> `RigHierarchyController` — Returns a controller for this hierarchy. Note: If the controller is not available this will return nullptr even if the b...
  - `get_controls(traverse = True)` -> `Array [ RigElementKey ]` — Returns all Control elements
  - `get_curve_value(key)` -> `float` — Returns a curveâs value given its key
  - `get_curve_value_by_index(element_index)` -> `float` — Returns a curveâs value given its index
  - `get_curves()` -> `Array [ RigElementKey ]` — Returns all Curve elements
  - `get_default_parent(key)` -> `RigElementKey` — Returns the default parent elementâs key of a given child key
  - `get_euler_transform_from_control_value(value)` -> `EulerTransform` [classmethod] — Returns the contained FEulerTransform value from a a Rig Control Value
  - `get_first_parent(key)` -> `RigElementKey` — Returns the first parent element of a given element key
  - `get_float_array_metadata(item, metadata_name)` -> `Array [ float ]` — Queries and returns the value of float array metadata
  - `get_float_from_control_value(value)` -> `float` [classmethod] — Returns the contained float value from a a Rig Control Value
  - `get_float_metadata(item, metadata_name, default_value)` -> `float` — Queries and returns the value of float metadata
  - `get_global_control_offset_transform(key, initial = False)` -> `Transform` — Returns the global offset transform for a given control element.
  - `get_global_control_offset_transform_by_index(element_index, initial = False)` -> `Transform` — Returns the global offset transform for a given control element.
  - `get_global_control_shape_transform(key, initial = False)` -> `Transform` — Returns the global shape transform for a given control element.
  - `get_global_control_shape_transform_by_index(element_index, initial = False)` -> `Transform` — Returns the global shape transform for a given control element.
  - `get_global_transform(key, initial = False)` -> `Transform` — Returns the global current or initial value for a given key. If the key is invalid FTransform::Identity will be returned...
  - `get_global_transform_by_index(element_index, initial = False)` -> `Transform` — Returns the global current or initial value for a element index. If the index is invalid FTransform::Identity will be re...
  - `get_index(key)` -> `int32` — Returns the index of an element given its key
  - `get_int32_array_metadata(item, metadata_name)` -> `Array [ int32 ]` — Queries and returns the value of int32 array metadata
  - `get_int32_metadata(item, metadata_name, default_value)` -> `int32` — Queries and returns the value of int32 metadata
  - `get_int_from_control_value(value)` -> `int32` [classmethod] — Returns the contained int32 value from a a Rig Control Value
  - `get_key(element_index)` -> `RigElementKey` — Returns the key of an element given its index
  - `get_keys(element_indices)` -> `Array [ RigElementKey ]` — Returns the keys of an array of indices
  - `get_linear_color_array_metadata(item, metadata_name)` -> `Array [ LinearColor ]` — Queries and returns the value of FLinearColor array metadata
  - `get_linear_color_metadata(item, metadata_name, default_value)` -> `LinearColor` — Queries and returns the value of FLinearColor metadata
  - `get_local_control_shape_transform(key, initial = False)` -> `Transform` — Returns the local shape transform for a given control element.
  - `get_local_control_shape_transform_by_index(element_index, initial = False)` -> `Transform` — Returns the local shape transform for a given control element.
  - `get_local_index(key)` -> `int32` — Returns the index of an element given its key within its default parent (or root)
  - `get_local_transform(key, initial = False)` -> `Transform` — Returns the local current or initial value for a given key. If the key is invalid FTransform::Identity will be returned.
  - `get_local_transform_by_index(element_index, initial = False)` -> `Transform` — Returns the local current or initial value for a element index. If the index is invalid FTransform::Identity will be ret...
  - `get_metadata_names(item)` -> `Array [ Name ]` — Returns the name of metadata for a given element
  - `get_metadata_type(item, metadata_name)` -> `RigMetadataType` — Returns the type of metadata given its name the item it is stored under
  - `get_module_f_name(item)` -> `Name` — Returns the name of the module an element belong to (or NAME_None in case the element doesnât belong to a module)
  - `get_module_name(item)` -> `str` — Returns the name of the module an element belong to (or an empty string in case the element doesnât belong to a module...
  - `get_module_path(item)` -> `str` — Returns the path of the module an element belong to (or an empty string in case the element doesnât belong to a module...
  - `get_module_path_f_name(item)` -> `Name` — Returns the path of the module an element belong to (or NAME_None in case the element doesnât belong to a module) depr...
  - `get_module_prefix(item)` -> `str` — Returns the prefix of the module an element belong to (or an empty string in case the element doesnât belong to a modu...
  - `get_name_array_metadata(item, metadata_name)` -> `Array [ Name ]` — Queries and returns the value of FName array metadata
  - `get_name_metadata(item, metadata_name, default_value)` -> `Name` — Queries and returns the value of FName metadata
  - `get_name_space(item)` -> `str` — Returns the namespace of an element belong to (or an empty string in case the element doesnât belong to a module / nam...
  - `get_name_space_f_name(item)` -> `Name` — Returns the namespace of an element belong to (or NAME_None in case the element doesnât belong to a module / namespace...
  - `get_nulls(traverse = True)` -> `Array [ RigElementKey ]` — Returns all Null elements
  - `get_number_of_parents(key)` -> `int32` — Returns the number of parents of an element
  - `get_parent_transform(key, initial = False)` -> `Transform` — Returns the global current or initial value for a given key. If the element does not have a parent FTransform::Identity ...
  - `get_parent_transform_by_index(element_index, initial = False)` -> `Transform` — Returns the global current or initial value for a given element index. If the element does not have a parent FTransform:...
  - `get_parent_weight(child, parent, initial = False)` -> `RigElementWeight` — Returns the weight of a parent below a multi parent element
  - `get_parent_weight_array(child, initial = False)` -> `Array [ RigElementWeight ]` — Returns the weights of all parents below a multi parent element
  - `get_parents(key, recursive = False)` -> `Array [ RigElementKey ]` — Returns the parent elements of a given element key
  - `get_pose(initial = False, include_transient_controls = True)` -> `RigPose` — Returns the current / initial pose of the hierarchy
  - `get_previous_hierarchy_name(key)` -> `Name` — Returns the previous name of an element or a component prior to a rename operation
  - `get_previous_hierarchy_parent(key)` -> `RigHierarchyKey` — Returns the previous parent of an element or a component prior to a reparent operation
  - `get_previous_name(key)` -> `Name` — Returns the previous name of an element prior to a rename operation
  - `get_previous_parent(key)` -> `RigElementKey` — Returns the previous parent of an element prior to a reparent operation
  - `get_quat_array_metadata(item, metadata_name)` -> `Array [ Quat ]` — Queries and returns the value of FQuat array metadata
  - `get_quat_metadata(item, metadata_name, default_value)` -> `Quat` — Queries and returns the value of FQuat metadata
  - `get_references(traverse = True)` -> `Array [ RigElementKey ]` — Returns all references
  - `get_rig_element_key_array_metadata(item, metadata_name)` -> `Array [ RigElementKey ]` — Queries and returns the value of FRigElementKey array metadata
  - `get_rig_element_key_metadata(item, metadata_name, default_value)` -> `RigElementKey` — Queries and returns the value of FRigElementKey metadata
  - `get_root_elements()` -> `Array [ RigElementKey ]` — Returns all root element keys
  - `get_rotator_array_metadata(item, metadata_name)` -> `Array [ Rotator ]` — Queries and returns the value of FRotator array metadata
  - `get_rotator_from_control_value(value)` -> `Rotator` [classmethod] — Returns the contained FRotator value from a a Rig Control Value
  - `get_rotator_metadata(item, metadata_name, default_value)` -> `Rotator` — Queries and returns the value of FRotator metadata
  - `get_rule_manager(create_if_needed = True)` -> `ModularRigRuleManager` — Returns a rule manager for this hierarchy Note: If the manager is not available this will return nullptr even if the bCr...
  - `get_selected_hierarchy_keys()` -> `Array [ RigHierarchyKey ]` — Returns the keys of selected elements and components
  - `get_selected_keys(type_filter = RigElementType.ALL)` -> `Array [ RigElementKey ]` — Returns the keys of selected elements InTypeFilter: The types to retrieve the selection for
  - `get_socket_states()` -> `Array [ RigSocketState ]` — Returns all of the socketsâ state
  - `get_sockets(traverse = True)` -> `Array [ RigElementKey ]` — Returns all Socket elements
  - `get_tags(item)` -> `Array [ Name ]`
  - `get_top_level_component_content(top_level_component_index)` -> `str` — Get Top Level Component Content
  - `get_top_level_component_key(top_level_component_index)` -> `RigComponentKey` — Get Top Level Component Key
  - `get_top_level_component_keys()` -> `Array [ RigComponentKey ]` — Get Top Level Component Keys
  - `get_top_level_component_name(top_level_component_index)` -> `Name` — Get Top Level Component Name
  - `get_top_level_component_type(top_level_component_index)` -> `ScriptStruct` — Get Top Level Component Type
  - `get_transform_array_metadata(item, metadata_name)` -> `Array [ Transform ]` — Queries and returns the value of FTransform array metadata
  - `get_transform_from_control_value(value)` -> `Transform` [classmethod] — Returns the contained FTransform value from a a Rig Control Value
  - `get_transform_metadata(item, metadata_name, default_value)` -> `Transform` — Queries and returns the value of FTransform metadata
  - `get_transform_no_scale_from_control_value(value)` -> `TransformNoScale` [classmethod] — Returns the contained FTransformNoScale value from a a Rig Control Value
  - `get_vector2d_from_control_value(value)` -> `Vector2D` [classmethod] — Returns the contained FVector2D value from a a Rig Control Value
  - `get_vector_array_metadata(item, metadata_name)` -> `Array [ Vector ]` — Queries and returns the value of FVector array metadata
  - `get_vector_from_control_value(value)` -> `Vector` [classmethod] — Returns the contained FVector value from a a Rig Control Value
  - `get_vector_metadata(item, metadata_name, default_value)` -> `Vector` — Queries and returns the value of FVector metadata
  - `has_tag(item, tag)` -> `bool`
  - `is_component_selected(key)` -> `bool` — Returns true if a given component is selected
  - `is_controller_available()` -> `bool` — Returns true if the hierarchy controller is currently available The controller may not be available during certain event...
  - `is_curve_value_set(key)` -> `bool` — Returns whether a curveâs value is set, given its key
  - `is_curve_value_set_by_index(element_index)` -> `bool` — Returns a curveâs value given its index
  - `is_parented_to(child, parent)` -> `bool` — Returns true if an element is parented to another element
  - `is_procedural(key)` -> `bool` — Returns true if the provided element is procedural.
  - `is_selected(key)` -> `bool` — Returns true if a given element is selected
  - `is_selected_by_index(index)` -> `bool` — Returns true if a given element is selected
  - `is_valid_index(element_index)` -> `bool` — Returns true if the provided element index is valid
  - `make_control_value_from_bool(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a bool value
  - `make_control_value_from_euler_transform(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a FEulerTransform value
  - `make_control_value_from_float(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a float value
  - `make_control_value_from_int(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a int32 value
  - `make_control_value_from_rotator(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a FRotator value
  - `make_control_value_from_transform(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a FTransform value
  - `make_control_value_from_transform_no_scale(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a FTransformNoScale value
  - `make_control_value_from_vector(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a FVector value
  - `make_control_value_from_vector2d(value)` -> `RigControlValue` [classmethod] — Creates a rig control value from a FVector2D value
  - `num()` -> `int32` — Returns the number of elements in the Hierarchy.
  - `num_components(element)` -> `int32` — Num Components
  - `num_top_level_components()` -> `int32` — Num Top Level Components
  - `remove_all_metadata(item)` -> `bool` — Removes all of the metadata under a given item
  - `remove_metadata(item, metadata_name)` -> `bool` — Removes the metadata under a given element
  - `reset()` -> `None` — Clears the whole hierarchy and removes all elements.
  - `reset_curve_values()` -> `None` — Resets all curves to 0.0
  - `reset_pose_to_initial(type_filter)` -> `None` — Resets the current pose of a filtered list of elements to the initial / ref pose.
  - `reset_to_default()` -> `None` — Resets the hierarchy to the state of its default. This refers to the hierarchy on the default object.
  - `restore_connectors_from_states(states, setup_undo_redo = False)` -> `Array [ RigElementKey ]` — Try to restore the connectors from the state structs
  - `restore_sockets_from_states(states, setup_undo_redo = False)` -> `Array [ RigElementKey ]` — Try to restore the sockets from the state structs
  - `send_auto_key_event(element, offset_in_seconds = 0.000000, asynchronous = True)` -> `None` — Sends an autokey event from the hierarchy to the world
  - `set_bool_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a bool array value
  - `set_bool_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a bool value
  - `set_connector_settings(key, settings, setup_undo = False, force = False, print_python_commands = False)` -> `None` — Sets the connector settings for a given connector element by key
  - `set_connector_settings_by_index(element_index, settings, setup_undo = False, force = False, print_python_commands = False)` -> `None` — Sets the connector settings for a given connector element by index
  - `set_control_offset_transform(key, transform, initial = False, affect_children = True, setup_undo = False, print_python_commands = False)` -> `None` — Sets the offset transform for a given control element by key
  - `set_control_offset_transform_by_index(element_index, transform, initial = False, affect_children = True, setup_undo = False, print_python_commands = False)` -> `None` — Sets the local offset transform for a given control element by index
  - `set_control_preferred_euler_angles(key, euler_angles, rotation_order, initial = False, fix_euler_flips = False)` -> `None` — Sets a controlâs preferred euler angles (local transform rotation)
  - `set_control_preferred_euler_angles_by_index(element_index, euler_angles, rotation_order, initial = False, fix_euler_flips = False)` -> `None` — Sets a controlâs preferred euler angles (local transform rotation)
  - `set_control_preferred_rotation_order(key, rotation_order)` -> `None` — Sets a controlâs preferred euler rotation order
  - `set_control_preferred_rotation_order_by_index(element_index, rotation_order)` -> `None` — Sets a controlâs preferred euler rotation order
  - `set_control_preferred_rotator(key, rotator, initial = False, fix_euler_flips = False)` -> `None` — Sets a controlâs preferred rotator (local transform rotation)
  - `set_control_preferred_rotator_by_index(element_index, rotator, initial = False, fix_euler_flips = False)` -> `None` — Sets a controlâs preferred rotator (local transform rotation)
  - `set_control_settings(key, settings, setup_undo = False, force = False, print_python_commands = False)` -> `None` — Sets the control settings for a given control element by key
  - `set_control_settings_by_index(element_index, settings, setup_undo = False, force = False, print_python_commands = False)` -> `None` — Sets the control settings for a given control element by index
  - `set_control_shape_transform(key, transform, initial = False, setup_undo = False)` -> `None` — Sets the shape transform for a given control element by key
  - `set_control_shape_transform_by_index(element_index, transform, initial = False, setup_undo = False)` -> `None` — Sets the local shape transform for a given control element by index
  - `set_control_value(key, value, value_type = RigControlValueType.CURRENT, setup_undo = False, print_python_commands = False)` -> `None` — Sets a controlâs current value given its key
  - `set_control_value_by_index(element_index, value, value_type = RigControlValueType.CURRENT, setup_undo = False, print_python_commands = False)` -> `None` — Sets a controlâs current value given its index
  - `set_control_visibility(key, visibility)` -> `None` — Sets a controlâs current visibility based on a key
  - `set_control_visibility_by_index(element_index, visibility)` -> `None` — Sets a controlâs current visibility based on a key
  - `set_curve_value(key, value, setup_undo = False)` -> `None` — Sets a curveâs value given its key
  - `set_curve_value_by_index(element_index, value, setup_undo = False)` -> `None` — Sets a curveâs value given its index
  - `set_float_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a float array value
  - `set_float_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a float value
  - `set_global_transform(key, transform, initial = False, affect_children = True, setup_undo = False, print_python_command = False)` -> `None` — Sets the global current or initial transform for a given key.
  - `set_global_transform_by_index(element_index, transform, initial = False, affect_children = True, setup_undo = False, print_python_command = False)` -> `None` — Sets the global current or initial transform for a given element index.
  - `set_int32_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a int32 array value
  - `set_int32_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a int32 value
  - `set_linear_color_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FLinearColor array value
  - `set_linear_color_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FLinearColor value
  - `set_local_transform(key, transform, initial = False, affect_children = True, setup_undo = False, print_python_commands = False)` -> `None` — Sets the local current or initial transform for a given key.
  - `set_local_transform_by_index(element_index, transform, initial = False, affect_children = True, setup_undo = False, print_python_commands = False)` -> `None` — Sets the local current or initial transform for a given element index.
  - `set_name_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FName array value
  - `set_name_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FName value
  - `set_parent_weight(child, parent, weight, initial = False, affect_children = True)` -> `bool` — Sets the weight of a parent below a multi parent element
  - `set_parent_weight_array(child, weights, initial = False, affect_children = True)` -> `bool` — Sets the all of the weights of the parents of a multi parent element
  - `set_pose(pose)` -> `None` — Sets the current / initial pose of the hierarchy
  - `set_quat_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FQuat array value
  - `set_quat_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FQuat value
  - `set_rig_element_key_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FRigElementKey array value
  - `set_rig_element_key_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FRigElementKey value
  - `set_rotator_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FRotator array value
  - `set_rotator_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FRotator value
  - `set_tag(item, tag)` -> `bool`
  - `set_transform_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FTransform array value
  - `set_transform_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FTransform value
  - `set_vector_array_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FVector array value
  - `set_vector_metadata(item, metadata_name, value)` -> `bool` — Sets the metadata to a FVector value
  - `sort_keys(keys)` -> `Array [ RigElementKey ]` — Sorts the input key list by traversing the hierarchy
  - `switch_to_default_parent(child, initial = False, affect_children = True)` -> `bool` — Switches a multi parent element to its first parent
  - `switch_to_parent(child, parent, initial = False, affect_children = True)` -> `bool` — Switches a multi parent element to a single parent. This sets the new parentâs weight to 1.0 and disables weights for ...
  - `switch_to_world_space(child, initial = False, affect_children = True)` -> `bool` — Switches a multi parent element to world space. This injects a world space reference.
  - `unset_curve_value(key, setup_undo = False)` -> `None` — Sets a curveâs value given its key
  - `unset_curve_value_by_index(element_index, setup_undo = False)` -> `None` — Sets a curveâs value given its index

**Properties** (1):
  - `modified_event`: `RigHierarchyModifiedDynamicEvent` [Read-Only] — [Read-Only] (RigHierarchyModifiedDynamicEvent)

### `unreal.RigHierarchyController`
Inherits: `Object` | Header: `RigHierarchyController.h`

Rig Hierarchy Controller

**Methods** (55):
  - `add_animation_channel(name, parent_control, settings, setup_undo = True, print_python_command = False)` -> `RigElementKey` — Adds a control to the hierarchy
  - `add_available_space(control, space, display_label = 'None', setup_undo = False, print_python_command = False)` -> `bool` — Adds a new available space to the given control
  - `add_bone(name, parent, transform, transform_in_global = True, bone_type = RigBoneType.USER, setup_undo = False, print_python_command = False)` -> `RigElementKey` — Adds a bone to the hierarchy
  - `add_channel_host(channel, host, setup_undo = False, print_python_command = False)` -> `bool` — Adds a new channel host to the animation channel note: This is just an overload of AddAvailableSpace for readability
  - `add_component(component_struct, name, element, content = '', setup_undo = False, print_python_command = False)` -> `RigComponentKey` — Adds a component to the hierarchy
  - `add_connector(name, settings = ['',ConnectorType.PRIMARY,False,False,[]], setup_undo = False, print_python_command = False)` -> `RigElementKey` — Adds a connector to the hierarchy
  - `add_control(name, parent, settings, value, setup_undo = True, print_python_command = False)` -> `RigElementKey` — Adds a control to the hierarchy
  - `add_curve(name, value = 0.000000, setup_undo = True, print_python_command = False)` -> `RigElementKey` — Adds a curve to the hierarchy
  - `add_null(name, parent, transform, transform_in_global = True, setup_undo = False, print_python_command = False)` -> `RigElementKey` — Adds a null to the hierarchy
  - `add_parent(child, parent, weight = 0.000000, maintain_global_transform = True, display_label = 'None', setup_undo = False)` -> `bool` — Adds a new parent to an element. For elements that allow only one parent the parent will be replaced (Same as ::SetParen...
  - `add_socket(name, parent, transform, transform_in_global = True, color = [1.000000,1.000000,1.000000,1.000000], description = '', setup_undo = False, print_python_command = False)` -> `RigElementKey` — Adds a socket to the hierarchy
  - `add_top_level_component(component_struct, name, content = '', setup_undo = False, print_python_command = False)` -> `RigComponentKey` — Adds a component to the hierarchy top level of the hierarchy
  - `clear_selection()` -> `bool` — Clears the selection
  - `deselect_component(key)` -> `bool` — Deselects or deselects a component in the hierarchy
  - `deselect_element(key)` -> `bool` — Deselects or deselects an element in the hierarchy
  - `deselect_hierarchy_key(key)` -> `bool` — Deselects or deselects a component or an element in the hierarchy
  - `duplicate_elements(keys, select_new_elements = True, setup_undo = False, print_python_commands = False)` -> `Array [ RigElementKey ]` — Duplicate the given elements
  - `export_selection_to_text()` -> `str` — Exports the selected items to text
  - `export_to_text(keys)` -> `str` — Exports a list of items to text
  - `generate_python_commands()` -> `Array [ str ]` — Generate Python Commands
  - `get_control_settings(key)` -> `RigControlSettings` — Returns the control settings of a given control
  - `get_hierarchy()` -> `RigHierarchy` — Returns the hierarchy currently linked to this controller
  - `import_bones(skeleton, name_space = 'None', replace_existing_bones = True, remove_obsolete_bones = True, select_bones = False, setup_undo = False, print_python_command = False)` -> `Array [ RigElementKey ]` — Imports an existing skeleton to the hierarchy
  - `import_bones_from_asset(asset_path, name_space = 'None', replace_existing_bones = True, remove_obsolete_bones = True, select_bones = False, setup_undo = False)` -> `Array [ RigElementKey ]` — Imports an existing skeleton to the hierarchy
  - `import_bones_from_skeletal_mesh(skeletal_mesh, name_space, replace_existing_bones = True, remove_obsolete_bones = True, select_bones = False, setup_undo = False, print_python_command = False)` -> `Array [ RigElementKey ]` — Imports an existing skeleton to the hierarchy, restricting the bone list to the ones that exist in the provided Skeletal...
  - `import_curves(skeleton, name_space = 'None', select_curves = False, setup_undo = False, print_python_command = False)` -> `Array [ RigElementKey ]` — Imports all curves from a skeleton to the hierarchy
  - `import_curves_from_asset(asset_path, name_space = 'None', select_curves = False, setup_undo = False)` -> `Array [ RigElementKey ]` — Imports all curves from a skeleton to the hierarchy
  - `import_curves_from_skeletal_mesh(skeletal_mesh, name_space = 'None', select_curves = False, setup_undo = False, print_python_command = False)` -> `Array [ RigElementKey ]` — Imports all curves from a skeletalmesh to the hierarchy
  - `import_from_text(content, replace_existing_elements = False, select_new_elements = True, setup_undo = False, print_python_commands = False)` -> `Array [ RigElementKey ]` — Imports the content of a text buffer to the hierarchy
  - `import_preview_skeletal_mesh(skeletal_mesh, replace_existing_bones = True, remove_obsolete_bones = True, select_bones = False, setup_undo = False)` -> `Array [ RigElementKey ]` — Imports all bones from a preview skeletal mesh. Used for rig modules and their preview skeleton
  - `import_sockets_from_skeletal_mesh(skeletal_mesh, name_space, replace_existing_sockets = True, remove_obsolete_sockets = True, select_sockets = False, setup_undo = False, print_python_command = False)` -> `Array [ RigElementKey ]` — Imports the sockets from existing skeleton to the hierarchy as nulls
  - `mirror_elements(keys, settings, select_new_elements = True, setup_undo = False, print_python_commands = False)` -> `Array [ RigElementKey ]` — Mirrors the given elements
  - `remove_all_parents(child, maintain_global_transform = True, setup_undo = False, print_python_command = False)` -> `bool` — Removes all parents from an element in the hierarchy.
  - `remove_available_space(control, space, setup_undo = False, print_python_command = False)` -> `bool` — Removes an available space from the given control
  - `remove_channel_host(channel, host, setup_undo = False, print_python_command = False)` -> `bool` — Removes an channel host from the animation channel note: This is just an overload of RemoveAvailableSpace for readabilit...
  - `remove_component(component, setup_undo = False, print_python_command = False)` -> `bool` — Removes a component from the hierarchy
  - `remove_element(element, setup_undo = False, print_python_command = False)` -> `bool` — Removes an existing element from the hierarchy
  - `remove_parent(child, parent, maintain_global_transform = True, setup_undo = False, print_python_command = False)` -> `bool` — Removes an existing parent from an element in the hierarchy. For elements that allow only one parent the element will be...
  - `rename_component(component, name, setup_undo = False, print_python_command = False, clear_selection = True)` -> `RigComponentKey` — Renames an existing component in the hierarchy
  - `rename_element(element, name, setup_undo = False, print_python_command = False, clear_selection = True)` -> `RigElementKey` — Renames an existing element in the hierarchy
  - `reorder_element(element, index, setup_undo = False, print_python_command = False)` -> `bool` — Changes the elementâs index within its default parent (or the top level)
  - `reparent_component(component_key, parent_element_key, setup_undo = False, print_python_command = False, clear_selection = True)` -> `RigComponentKey` — Reparents an existing component in the hierarchy
  - `select_component(key, select = True, clear_selection = False)` -> `bool` — Selects or deselects a component in the hierarchy
  - `select_element(key, select = True, clear_selection = False)` -> `bool` — Selects or deselects an element in the hierarchy
  - `select_hierarchy_key(key, select = True, clear_selection = False)` -> `bool` — Selects or deselects a component or an element in the hierarchy
  - `set_available_space_index(control, space, index, setup_undo = False, print_python_command = False)` -> `bool` — Reorders an available space for the given control
  - `set_available_space_label(control, space, display_label, setup_undo = False, print_python_command = False)` -> `bool` — Updates the label on an available space
  - `set_component_content(component, content, setup_undo = False, print_python_command = False)` -> `bool` — Updates the content of a component in the hierarchy
  - `set_component_selection(keys, print_python_command = False)` -> `bool` — Sets the selection based on a list of component keys
  - `set_control_settings(key, settings, setup_undo = False)` -> `bool` — Sets a controlâs settings given a control key
  - `set_display_name(control, display_name, rename_element = False, setup_undo = False, print_python_command = False)` -> `Name` — Sets the display name on a control
  - `set_hierarchy(hierarchy)` -> `None` — Sets the hierarchy currently linked to this controller
  - `set_hierarchy_selection(keys, print_python_command = False)` -> `bool` — Sets the selection based on a list of component keys
  - `set_parent(child, parent, maintain_global_transform = True, setup_undo = False, print_python_command = False)` -> `bool` — Sets a new parent to an element. For elements that allow more than one parent the parent list will be replaced.
  - `set_selection(keys, print_python_command = False)` -> `bool` — Sets the selection based on a list of element keys

### `unreal.TransformableControlHandle`
Inherits: `TransformableHandle` | Header: `ControlRigTransformableHandle.h`

UTransformableControlHandle

**Properties** (2):
  - `control_name`: `Name` [Read-Only] — [Read-Only] The ControlName of the control that this handle is pointing at. (Name)
  - `control_rig`: `ControlRig` [Read-Only] — [Read-Only] The ControlRig that this handle is pointing at. (ControlRig)

### `unreal.AimMode`
Inherits: `EnumBase` | Header: `RigUnit_AimConstraint.h`

ENUM: Aim Mode (Default: Aim At Target Transform ) # How to perform an aim Aim At Target Transforms Orient To Target Transforms

**Properties** (2):
  - `AIM_AT_TARGET`: `AimMode = Ellipsis` — Aim at Target Transform 0
  - `ORIENT_TO_TARGET`: `AimMode = Ellipsis` — Orient to Target Transform 1

### `unreal.ApplyTransformMode`
Inherits: `EnumBase` | Header: `RigUnit_ApplyFK.h`

EApply Transform Mode

**Properties** (2):
  - `ADDITIVE`: `ApplyTransformMode = Ellipsis` — Additive to existing motion 1
  - `OVERRIDE`: `ApplyTransformMode = Ellipsis` — Override existing motion 0

### `unreal.ConnectorType`
Inherits: `EnumBase` | Header: `RigHierarchyElements.h`

EConnector Type

**Properties** (2):
  - `PRIMARY`: `ConnectorType = Ellipsis` — 0
  - `SECONDARY`: `ConnectorType = Ellipsis` — Single primary connector, non-optional and always visible. When dropped on another element, this con...

### `unreal.ConstraintInterpType`
Inherits: `EnumBase` | Header: `RigUnit_TransformConstraint.h`

Options for interpolating rotations

**Properties** (2):
  - `AVERAGE`: `ConstraintInterpType = Ellipsis` — Weighted Average of Quaternions by their X,Y,Z,W values, The Shortest Route is Respected. The Order ...
  - `SHORTEST`: `ConstraintInterpType = Ellipsis` — Perform Quaternion Slerp in Sequence, Different Orders of Parents can Produce Different Results 1

### `unreal.ControlRigComponentMapDirection`
Inherits: `EnumBase` | Header: `ControlRigComponent.h`

Enum for controlling how an element should be mapped.

**Properties** (2):
  - `INPUT`: `ControlRigComponentMapDirection = Ellipsis` — 0
  - `OUTPUT`: `ControlRigComponentMapDirection = Ellipsis` — An input driving a rig element 1

### `unreal.ControlRigComponentSpace`
Inherits: `EnumBase` | Header: `ControlRigComponent.h`

Enum for controlling which space a transform is applied in.

**Properties** (5):
  - `ACTOR_SPACE`: `ControlRigComponentSpace = Ellipsis` — The space below the actorâs root transform 1
  - `COMPONENT_SPACE`: `ControlRigComponentSpace = Ellipsis` — The space defined by the Control Rig Component 2
  - `LOCAL_SPACE`: `ControlRigComponentSpace = Ellipsis` — The space defined by each elementâs parent (bone, control etc) 4
  - `RIG_SPACE`: `ControlRigComponentSpace = Ellipsis` — The space within the rig. Currently the same as Component Space.
Inside of control rig this is calle...
  - `WORLD_SPACE`: `ControlRigComponentSpace = Ellipsis` — World space transform 0

### `unreal.ControlRigCurveAlignment`
Inherits: `EnumBase` | Header: `RigUnit_FitChainToCurve.h`

EControl Rig Curve Alignment

**Properties** (2):
  - `FRONT`: `ControlRigCurveAlignment = Ellipsis` — 0
  - `STRETCHED`: `ControlRigCurveAlignment = Ellipsis` — 1

### `unreal.ControlRigFKRigExecuteMode`
Inherits: `EnumBase` | Header: `FKControlRig.h`

EControl Rig FKRig Execute Mode

**Properties** (3):
  - `ADDITIVE`: `ControlRigFKRigExecuteMode = Ellipsis` — Applies the authored pose as an additive layer 1
  - `DIRECT`: `ControlRigFKRigExecuteMode = Ellipsis` — Sets the current pose without the use of offset transforms 2
  - `REPLACE`: `ControlRigFKRigExecuteMode = Ellipsis` — Replaces the current pose 0

### `unreal.ControlRigInteractionTransformSpace`
Inherits: `EnumBase` | Header: `ControlRig.h`

EControl Rig Interaction Transform Space

**Properties** (4):
  - `EXPLICIT`: `ControlRigInteractionTransformSpace = Ellipsis` — 3
  - `LOCAL`: `ControlRigInteractionTransformSpace = Ellipsis` — 1
  - `PARENT`: `ControlRigInteractionTransformSpace = Ellipsis` — 2
  - `WORLD`: `ControlRigInteractionTransformSpace = Ellipsis` — 0

### `unreal.ControlRigInteractionType`
Inherits: `EnumBase` | Header: `RigUnitContext.h`

The type of interaction happening on a rig

**Properties** (5):
  - `ALL`: `ControlRigInteractionType = Ellipsis` — 7
  - `NONE`: `ControlRigInteractionType = Ellipsis` — 0
  - `ROTATE`: `ControlRigInteractionType = Ellipsis` — 2
  - `SCALE`: `ControlRigInteractionType = Ellipsis` — 4
  - `TRANSLATE`: `ControlRigInteractionType = Ellipsis` — 1

### `unreal.ControlRigModifyBoneMode`
Inherits: `EnumBase` | Header: `RigUnit_ModifyTransforms.h`

EControl Rig Modify Bone Mode

**Properties** (4):
  - `ADDITIVE_GLOBAL`: `ControlRigModifyBoneMode = Ellipsis` — Additive to existing global transform.
Input transform is added as a global offset in the root of th...
  - `ADDITIVE_LOCAL`: `ControlRigModifyBoneMode = Ellipsis` — Additive to existing local transform.
Input transform is added within the boneâs space. 2
  - `OVERRIDE_GLOBAL`: `ControlRigModifyBoneMode = Ellipsis` — Override existing global transform 1
  - `OVERRIDE_LOCAL`: `ControlRigModifyBoneMode = Ellipsis` — Override existing local transform 0

### `unreal.ControlRigReplayPlaybackMode`
Inherits: `EnumBase` | Header: `ControlRigReplay.h`

EControl Rig Replay Playback Mode

**Properties** (3):
  - `GROUND_TRUTH`: `ControlRigReplayPlaybackMode = Ellipsis` — 2
  - `LIVE`: `ControlRigReplayPlaybackMode = Ellipsis` — 0
  - `REPLAY_INPUTS`: `ControlRigReplayPlaybackMode = Ellipsis` — 1

### `unreal.ControlRigVectorKind`
Inherits: `EnumBase` | Header: `RigUnit_HighlevelBase.h`

EControl Rig Vector Kind

**Properties** (2):
  - `DIRECTION`: `ControlRigVectorKind = Ellipsis` — 0
  - `LOCATION`: `ControlRigVectorKind = Ellipsis` — 1

### `unreal.CRSimPointForceType`
Inherits: `EnumBase` | Header: `CRSimPointForce.h`

ECRSim Point Force Type

**Properties** (1):
  - `DIRECTION`: `CRSimPointForceType = Ellipsis` — 0

### `unreal.CRSimSoftCollisionType`
Inherits: `EnumBase` | Header: `CRSimSoftCollision.h`

ECRSim Soft Collision Type

**Properties** (3):
  - `CONE`: `CRSimSoftCollisionType = Ellipsis` — 2
  - `PLANE`: `CRSimSoftCollisionType = Ellipsis` — 0
  - `SPHERE`: `CRSimSoftCollisionType = Ellipsis` — 1

### `unreal.ElementNameDisplayMode`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

Defines how to retrieve the UI name for an element

**Properties** (4):
  - `ASSET_DEFAULT`: `ElementNameDisplayMode = Ellipsis` — Relies on the setting in the referenced asset. The setting for each asset can be changed
in the clas...
  - `AUTO`: `ElementNameDisplayMode = Ellipsis` — Shows full paths only for elements that need it 1
  - `FORCE_LONG`: `ElementNameDisplayMode = Ellipsis` — Always shows full paths 3
  - `FORCE_SHORT`: `ElementNameDisplayMode = Ellipsis` — Always shows short names
(potentially resulting in clashing labels) 2

### `unreal.MovieSceneControlRigSpaceType`
Inherits: `EnumBase` | Header: `MovieSceneControlRigSpaceChannel.h`

EMovie Scene Control Rig Space Type

**Properties** (3):
  - `CONTROL_RIG`: `MovieSceneControlRigSpaceType = Ellipsis` — 2
  - `PARENT`: `MovieSceneControlRigSpaceType = Ellipsis` — 0
  - `WORLD`: `MovieSceneControlRigSpaceType = Ellipsis` — 1

### `unreal.RigBoneType`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Bone Type

**Properties** (2):
  - `IMPORTED`: `RigBoneType = Ellipsis` — 0
  - `USER`: `RigBoneType = Ellipsis` — 1

### `unreal.RigControlAnimationType`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Control Animation Type

**Properties** (4):
  - `ANIMATION_CHANNEL`: `RigControlAnimationType = Ellipsis` — An animation channel without a 3d shape 1
  - `ANIMATION_CONTROL`: `RigControlAnimationType = Ellipsis` — A visible, animatable control. 0
  - `PROXY_CONTROL`: `RigControlAnimationType = Ellipsis` — A control to drive other controls,
not animatable in sequencer. 2
  - `VISUAL_CUE`: `RigControlAnimationType = Ellipsis` — Visual feedback only - the control is
neither animatable nor selectable. 3

### `unreal.RigControlAxis`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Control Axis

**Properties** (3):
  - `X`: `RigControlAxis = Ellipsis` — 0
  - `Y`: `RigControlAxis = Ellipsis` — 1
  - `Z`: `RigControlAxis = Ellipsis` — 2

### `unreal.RigControlTransformChannel`
Inherits: `EnumBase` | Header: `RigHierarchyElements.h`

ERig Control Transform Channel

**Properties** (9):
  - `PITCH`: `RigControlTransformChannel = Ellipsis` — 3
  - `ROLL`: `RigControlTransformChannel = Ellipsis` — 5
  - `SCALE_X`: `RigControlTransformChannel = Ellipsis` — 6
  - `SCALE_Y`: `RigControlTransformChannel = Ellipsis` — 7
  - `SCALE_Z`: `RigControlTransformChannel = Ellipsis` — 8
  - `TRANSLATION_X`: `RigControlTransformChannel = Ellipsis` — 0
  - `TRANSLATION_Y`: `RigControlTransformChannel = Ellipsis` — 1
  - `TRANSLATION_Z`: `RigControlTransformChannel = Ellipsis` — 2
  - `YAW`: `RigControlTransformChannel = Ellipsis` — 4

### `unreal.RigControlType`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Control Type

**Properties** (9):
  - `BOOL`: `RigControlType = Ellipsis` — 0
  - `EULER_TRANSFORM`: `RigControlType = Ellipsis` — 9
  - `FLOAT`: `RigControlType = Ellipsis` — 1
  - `INTEGER`: `RigControlType = Ellipsis` — 2
  - `POSITION`: `RigControlType = Ellipsis` — 4
  - `ROTATOR`: `RigControlType = Ellipsis` — 6
  - `SCALE`: `RigControlType = Ellipsis` — 5
  - `SCALE_FLOAT`: `RigControlType = Ellipsis` — 10
  - `VECTOR2D`: `RigControlType = Ellipsis` — 3

### `unreal.RigControlValueType`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Control Value Type

**Properties** (4):
  - `CURRENT`: `RigControlValueType = Ellipsis` — 1
  - `INITIAL`: `RigControlValueType = Ellipsis` — 0
  - `MAXIMUM`: `RigControlValueType = Ellipsis` — 3
  - `MINIMUM`: `RigControlValueType = Ellipsis` — 2

### `unreal.RigControlVisibility`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Control Visibility

**Properties** (2):
  - `BASED_ON_SELECTION`: `RigControlVisibility = Ellipsis` — Visibility Controlled by the selection of driven controls 1
  - `USER_DEFINED`: `RigControlVisibility = Ellipsis` — Visibility controlled by the graph 0

### `unreal.RigElementType`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

This is rig element types that we support This can be used as a mask so supported as a bitfield

**Properties** (9):
  - `ALL`: `RigElementType = Ellipsis` — 239
  - `BONE`: `RigElementType = Ellipsis` — 1
  - `CONNECTOR`: `RigElementType = Ellipsis` — 64
  - `CONTROL`: `RigElementType = Ellipsis` — 4
  - `CURVE`: `RigElementType = Ellipsis` — 8
  - `NONE`: `RigElementType = Ellipsis` — 0
  - `NULL`: `RigElementType = Ellipsis` — 2
  - `REFERENCE`: `RigElementType = Ellipsis` — 32
  - `SOCKET`: `RigElementType = Ellipsis` — 128

### `unreal.RigEvent`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Event

**Properties** (4):
  - `CLOSE_UNDO_BRACKET`: `RigEvent = Ellipsis` — Request to close an Undo bracket in the client 3
  - `NONE`: `RigEvent = Ellipsis` — Invalid event 0
  - `OPEN_UNDO_BRACKET`: `RigEvent = Ellipsis` — Request to open an Undo bracket in the client 2
  - `REQUEST_AUTO_KEY`: `RigEvent = Ellipsis` — Request to Auto-Key the Control in Sequencer 1

### `unreal.RigHierarchyNotification`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

ERig Hierarchy Notification

**Properties** (28):
  - `COMPONENT_ADDED`: `RigHierarchyNotification = Ellipsis` — 20
  - `COMPONENT_CONTENT_CHANGED`: `RigHierarchyNotification = Ellipsis` — 22
  - `COMPONENT_DESELECTED`: `RigHierarchyNotification = Ellipsis` — 24
  - `COMPONENT_REMOVED`: `RigHierarchyNotification = Ellipsis` — 21
  - `COMPONENT_RENAMED`: `RigHierarchyNotification = Ellipsis` — 25
  - `COMPONENT_REPARENTED`: `RigHierarchyNotification = Ellipsis` — 26
  - `COMPONENT_SELECTED`: `RigHierarchyNotification = Ellipsis` — 23
  - `CONNECTOR_SETTING_CHANGED`: `RigHierarchyNotification = Ellipsis` — 15
  - `CONTROL_DRIVEN_LIST_CHANGED`: `RigHierarchyNotification = Ellipsis` — 9
  - `CONTROL_SETTING_CHANGED`: `RigHierarchyNotification = Ellipsis` — 7
  - `CONTROL_SHAPE_TRANSFORM_CHANGED`: `RigHierarchyNotification = Ellipsis` — 10
  - `CONTROL_VISIBILITY_CHANGED`: `RigHierarchyNotification = Ellipsis` — 8
  - `ELEMENT_ADDED`: `RigHierarchyNotification = Ellipsis` — 0
  - `ELEMENT_DESELECTED`: `RigHierarchyNotification = Ellipsis` — 4
  - `ELEMENT_REMOVED`: `RigHierarchyNotification = Ellipsis` — 1
  - `ELEMENT_RENAMED`: `RigHierarchyNotification = Ellipsis` — 2
  - `ELEMENT_REORDERED`: `RigHierarchyNotification = Ellipsis` — 14
  - `ELEMENT_SELECTED`: `RigHierarchyNotification = Ellipsis` — 3
  - `HIERARCHY_COPIED`: `RigHierarchyNotification = Ellipsis` — 19
  - `HIERARCHY_RESET`: `RigHierarchyNotification = Ellipsis` — 6
  - `INTERACTION_BRACKET_CLOSED`: `RigHierarchyNotification = Ellipsis` — 13
  - `INTERACTION_BRACKET_OPENED`: `RigHierarchyNotification = Ellipsis` — 12
  - `PARENT_CHANGED`: `RigHierarchyNotification = Ellipsis` — 5
  - `PARENT_WEIGHTS_CHANGED`: `RigHierarchyNotification = Ellipsis` — 11
  - `SHORT_NAME_CHANGED`: `RigHierarchyNotification = Ellipsis` — 27
  - `SOCKET_COLOR_CHANGED`: `RigHierarchyNotification = Ellipsis` — 16
  - `SOCKET_DESCRIPTION_CHANGED`: `RigHierarchyNotification = Ellipsis` — 17
  - `SOCKET_DESIRED_PARENT_CHANGED`: `RigHierarchyNotification = Ellipsis` — 18

### `unreal.RigMetaDataNameSpace`
Inherits: `EnumBase` | Header: `RigUnitContext.h`

ERig Meta Data Name Space

**Properties** (4):
  - `NONE`: `RigMetaDataNameSpace = Ellipsis` — Use no namespace - store the metadata directly on the item 0
  - `PARENT`: `RigMetaDataNameSpace = Ellipsis` — Store the metadata relative to its parent model 2
  - `ROOT`: `RigMetaDataNameSpace = Ellipsis` — Store the metadata under the root module 3
  - `SELF`: `RigMetaDataNameSpace = Ellipsis` — Store the metadata for item relative to its module 1

### `unreal.RigMetadataType`
Inherits: `EnumBase` | Header: `RigHierarchyDefines.h`

The type of meta data stored on an element

**Properties** (20):
  - `BOOL`: `RigMetadataType = Ellipsis` — 0
  - `BOOL_ARRAY`: `RigMetadataType = Ellipsis` — 1
  - `FLOAT`: `RigMetadataType = Ellipsis` — 2
  - `FLOAT_ARRAY`: `RigMetadataType = Ellipsis` — 3
  - `INT32`: `RigMetadataType = Ellipsis` — 4
  - `INT32_ARRAY`: `RigMetadataType = Ellipsis` — 5
  - `LINEAR_COLOR`: `RigMetadataType = Ellipsis` — 16
  - `LINEAR_COLOR_ARRAY`: `RigMetadataType = Ellipsis` — 17
  - `NAME`: `RigMetadataType = Ellipsis` — 6
  - `NAME_ARRAY`: `RigMetadataType = Ellipsis` — 7
  - `QUAT`: `RigMetadataType = Ellipsis` — 12
  - `QUAT_ARRAY`: `RigMetadataType = Ellipsis` — 13
  - `RIG_ELEMENT_KEY`: `RigMetadataType = Ellipsis` — 18
  - `RIG_ELEMENT_KEY_ARRAY`: `RigMetadataType = Ellipsis` — 19
  - `ROTATOR`: `RigMetadataType = Ellipsis` — 10
  - `ROTATOR_ARRAY`: `RigMetadataType = Ellipsis` — 11
  - `TRANSFORM`: `RigMetadataType = Ellipsis` — 14
  - `TRANSFORM_ARRAY`: `RigMetadataType = Ellipsis` — 15
  - `VECTOR`: `RigMetadataType = Ellipsis` — 8
  - `VECTOR_ARRAY`: `RigMetadataType = Ellipsis` — 9

### `unreal.RigSpaceType`
Inherits: `EnumBase` | Header: `RigSpaceHierarchy.h`

ERig Space Type

**Properties** (4):
  - `BONE`: `RigSpaceType = Ellipsis` — Attached to a bone 1
  - `CONTROL`: `RigSpaceType = Ellipsis` — Attached to a control 2
  - `GLOBAL`: `RigSpaceType = Ellipsis` — Not attached to anything 0
  - `SPACE`: `RigSpaceType = Ellipsis` — Attached to a space 3

### `unreal.RigSwitchParentMode`
Inherits: `EnumBase` | Header: `RigUnit_DynamicHierarchy.h`

ERig Switch Parent Mode

**Properties** (3):
  - `DEFAULT_PARENT`: `RigSwitchParentMode = Ellipsis` — Switches back to the original / default parent 1
  - `PARENT_ITEM`: `RigSwitchParentMode = Ellipsis` — Switches the child to the provided parent item 2
  - `WORLD`: `RigSwitchParentMode = Ellipsis` — Switches the element to be parented to the world 0

### `unreal.RigTransformType`
Inherits: `EnumBase` | Header: `RigHierarchyElements.h`

ERig Transform Type

**Properties** (5):
  - `CURRENT_GLOBAL`: `RigTransformType = Ellipsis` — 3
  - `CURRENT_LOCAL`: `RigTransformType = Ellipsis` — 1
  - `INITIAL_GLOBAL`: `RigTransformType = Ellipsis` — 2
  - `INITIAL_LOCAL`: `RigTransformType = Ellipsis` — 0
  - `NUM_TRANSFORM_TYPES`: `RigTransformType = Ellipsis` — 4

### `unreal.TransformGetterType`
Inherits: `EnumBase` | Header: `ControlRigDefines.h`

ETransform Getter Type

**Properties** (2):
  - `CURRENT`: `TransformGetterType = Ellipsis` — 1
  - `INITIAL`: `TransformGetterType = Ellipsis` — 0

### `unreal.TransformSpaceMode`
Inherits: `EnumBase` | Header: `ControlRigDefines.h`

**Properties** (4):
  - `BASE_JOINT`: `TransformSpaceMode = Ellipsis` — Apply in base bone 3
  - `BASE_SPACE`: `TransformSpaceMode = Ellipsis` — Apply in Base space 2
  - `GLOBAL_SPACE`: `TransformSpaceMode = Ellipsis` — Apply in rig space 1
  - `LOCAL_SPACE`: `TransformSpaceMode = Ellipsis` — Apply in parent space 0

### `unreal.ControlRig_OnControlSelectedBP`
Inherits: `MulticastDelegateBase` | Header: `ControlRig.h`

To support Blueprints/scripting, we need a different delegate type (a âDynamicâ delegate) which supports looser style UFunction binding (using names).

### `unreal.ControlRigComponentDelegate`
Inherits: `MulticastDelegateBase` | Header: `ControlRigComponent.h`

Bindable event for external objects to hook into ControlRig-level execution

### `unreal.ControlRigInteractionEndedEvent`
Inherits: `MulticastDelegateBase` | Header: `ControlRig.h`

Control Rig Interaction Ended Event Delegate Signature

### `unreal.ControlRigInteractionStartedEvent`
Inherits: `MulticastDelegateBase` | Header: `ControlRig.h`

A delegate for subscribing / reacting to interaction started.

### `unreal.ControlRigInteractionUpdatedEvent`
Inherits: `MulticastDelegateBase` | Header: `ControlRig.h`

Control Rig Interaction Updated Event Delegate Signature

### `unreal.RigHierarchyModifiedDynamicEvent`
Inherits: `MulticastDelegateBase` | Header: `RigHierarchy.h`

Rig Hierarchy Modified Dynamic Event Delegate Signature
