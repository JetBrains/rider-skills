# UE Python API — InterchangeNodes Module

**52 types** from the `InterchangeNodes` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangeAnimationPayLoadKey`, `InterchangeMeshPayLoadKey`, `InterchangeAnimationTrackBaseNode`, `InterchangeAnimationTrackNode`, `InterchangeAnimationTrackSetInstanceNode`, `InterchangeAnimationTrackSetNode`, `InterchangeBaseLightNode`, `InterchangeDecalMaterialNode`, `InterchangeDecalNode`, `InterchangeDirectionalLightNode`, `InterchangeFunctionCallShaderNode`, `InterchangeGeometryCacheNode`, `InterchangeLightNode`, `InterchangeMaterialInstanceNode`, `InterchangeMaterialReferenceNode`, `InterchangeMeshNode`, `InterchangePhysicalCameraNode`, `InterchangePointLightNode`, `InterchangeRectLightNode`, `InterchangeSceneNode`, ... (52 total)

---

## Classes

### `unreal.InterchangeAnimationPayLoadKey`
Inherits: `StructBase` | Header: `InterchangeAnimationTrackSetNode.h`

Interchange Animation Pay Load Key

**Properties** (2):
  - `type`: `InterchangeAnimationPayLoadType` — [Read-Write] (InterchangeAnimationPayLoadType)
  - `unique_id`: `str` — [Read-Write] (str)

### `unreal.InterchangeMeshPayLoadKey`
Inherits: `StructBase` | Header: `InterchangeMeshNode.h`

Interchange Mesh Pay Load Key

**Properties** (3):
  - `frame_number`: `int` — [Read-Write] (int32)
  - `type`: `InterchangeMeshPayLoadType` — [Read-Write] (InterchangeMeshPayLoadType)
  - `unique_id`: `str` — [Read-Write] (str)

### `unreal.InterchangeAnimationTrackBaseNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeAnimationTrackSetNode.h`

Abstract class providing the minimal services required for an animation track node.

**Methods** (2):
  - `get_custom_completion_mode()` -> `int32 or None` — Get how the actorâs animated property behaves once this animation is complete. The output value will be clamped to the...
  - `set_custom_completion_mode(attribute_value)` -> `bool` — Set how the actorâs animated property should behave once its animation completes.

### `unreal.InterchangeAnimationTrackNode`
Inherits: `InterchangeAnimationTrackBaseNode` | Header: `InterchangeAnimationTrackSetNode.h`

Class to represent an animation on the property of a camera, light, or scene node The list of supported properties is enumerated in EInterchangeAnimatedProperty.

**Methods** (8):
  - `get_custom_actor_dependency_uid()` -> `str or None` — Get the actor dependency to this object.
  - `get_custom_animation_payload_key()` -> `InterchangeAnimationPayLoadKey or None` — Get the payload key needed to retrieve the animation for this track.
  - `get_custom_frame_count()` -> `int32 or None` — Get the number of frames for the animation of this track.
  - `get_custom_property_track()` -> `InterchangePropertyTracks or None` — Get the property animated by this track.
  - `set_custom_actor_dependency_uid(dependency_uid)` -> `bool` — Set the actor dependency to this object.
  - `set_custom_animation_payload_key(unique_id, type)` -> `bool` — Set the payload key needed to retrieve the animation for this track.
  - `set_custom_frame_count(attribute_value)` -> `bool` — Set the number of frames for the animation of this track.
  - `set_custom_property_track(property_track)` -> `bool` — Set the property animated by this track.

### `unreal.InterchangeAnimationTrackSetInstanceNode`
Inherits: `InterchangeAnimationTrackBaseNode` | Header: `InterchangeAnimationTrackSetNode.h`

Class to represent an animation that instances another animation track set node.

**Methods** (8):
  - `get_custom_duration()` -> `int32 or None` — Get the level sequence instance duration in number of frames.
  - `get_custom_start_frame()` -> `int32 or None` — Get the frame where the level sequence instance starts.
  - `get_custom_time_scale()` -> `float or None` — Get the time scale used for the level sequence instance.
  - `get_custom_track_set_dependency_uid()` -> `str or None` — Get the unique id of the level sequence this instance references.
  - `set_custom_duration(attribute_value)` -> `bool` — Set the level sequence instance duration in number of frames.
  - `set_custom_start_frame(attribute_value)` -> `bool` — Set the frame where the level sequence instance starts.
  - `set_custom_time_scale(attribute_value)` -> `bool` — Set the time scale used for the level sequence instance.
  - `set_custom_track_set_dependency_uid(attribute_value)` -> `bool` — Set the unique id of the level sequence this instance references.

### `unreal.InterchangeAnimationTrackSetNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeAnimationTrackSetNode.h`

Class to represent a set of animation track nodes that share the same frame rate.

**Methods** (7):
  - `add_custom_animation_track_uid(animation_track_uid)` -> `bool` — Add one track dependency to this object.
  - `get_custom_animation_track_uid(index)` -> `str` — Retrieve one track dependency for this object.
  - `get_custom_animation_track_uid_count()` -> `int32` — Retrieve the number of track dependencies for this object.
  - `get_custom_animation_track_uids()` -> `Array [ str ]` — Retrieve the track dependency for this object.
  - `get_custom_frame_rate()` -> `float or None` — Get the frame rate for the animations in the level sequence.
  - `remove_custom_animation_track_uid(animation_track_uid)` -> `bool` — Remove one track dependency from this object.
  - `set_custom_frame_rate(attribute_value)` -> `bool` — Set the frame rate for the animations in the level sequence.

### `unreal.InterchangeBaseLightNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeLightNode.h`

Interchange Base Light Node

**Methods** (8):
  - `get_custom_intensity()` -> `float or None` — Get Custom Intensity
  - `get_custom_light_color()` -> `LinearColor or None` — Get Custom Light Color
  - `get_custom_temperature()` -> `float or None` — Get Custom Temperature
  - `get_custom_use_temperature()` -> `bool or None` — Get Custom Use Temperature
  - `set_custom_intensity(attribute_value)` -> `bool` — Set Custom Intensity
  - `set_custom_light_color(attribute_value)` -> `bool` — Set Custom Light Color
  - `set_custom_temperature(attribute_value)` -> `bool` — Set Custom Temperature
  - `set_custom_use_temperature(attribute_value)` -> `bool` — Set Custom Use Temperature

### `unreal.InterchangeDecalMaterialNode`
Inherits: `InterchangeShaderNode` | Header: `InterchangeDecalMaterialNode.h`

Interchange Decal Material Node

### `unreal.InterchangeDecalNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeDecalNode.h`

Interchange Decal Node

**Methods** (6):
  - `get_custom_decal_material_path_name()` -> `str or None` — Get Custom Decal Material Path Name
  - `get_custom_decal_size()` -> `Vector or None` — Get Custom Decal Size
  - `get_custom_sort_order()` -> `int32 or None` — Get Custom Sort Order
  - `set_custom_decal_material_path_name(attribute_value)` -> `bool` — Set Custom Decal Material Path Name
  - `set_custom_decal_size(attribute_value)` -> `bool` — Set Custom Decal Size
  - `set_custom_sort_order(attribute_value)` -> `bool` — Set Custom Sort Order

### `unreal.InterchangeDirectionalLightNode`
Inherits: `InterchangeBaseLightNode` | Header: `InterchangeLightNode.h`

Interchange Directional Light Node

### `unreal.InterchangeFunctionCallShaderNode`
Inherits: `InterchangeShaderNode` | Header: `InterchangeShaderGraphNode.h`

A function call shader node has a named set of inputs and outputs which corresponds to the inputs and outputs of the shader function it instances.

**Methods** (2):
  - `get_custom_material_function()` -> `str or None` — Get Custom Material Function
  - `set_custom_material_function(attribute_value)` -> `bool` — Set the unique id of the material function referenced by the function call expression.

### `unreal.InterchangeGeometryCacheNode`
Inherits: `InterchangeMeshNode` | Header: `InterchangeMeshNode.h`

Interchange Geometry Cache Node

**Methods** (8):
  - `get_custom_end_frame()` -> `int32 or None` — Query the end frame of the animated mesh. Return false if the attribute was not set.
  - `get_custom_frame_rate()` -> `double or None` — Query the frame rate of the animated mesh. Return false if the attribute was not set.
  - `get_custom_has_constant_topology()` -> `bool or None` — Query whether this animated mesh has constant topoplogy. Return false if the attribute was not set.
  - `get_custom_start_frame()` -> `int32 or None` — Query the start frame of the animated mesh. Return false if the attribute was not set.
  - `set_custom_end_frame(attribute_value)` -> `bool` — Set the end frame of the animated mesh. Return false if the attribute could not be set.
  - `set_custom_frame_rate(attribute_value)` -> `bool` — Set the frame rate of the animated mesh. Return false if the attribute could not be set.
  - `set_custom_has_constant_topology(attribute_value)` -> `bool` — Set the constant topology attribute of this animated mesh. Return false if the attribute could not be set.
  - `set_custom_start_frame(attribute_value)` -> `bool` — Set the start frame of the animated mesh. Return false if the attribute could not be set.

### `unreal.InterchangeLightNode`
Inherits: `InterchangeBaseLightNode` | Header: `InterchangeLightNode.h`

Interchange Light Node

**Methods** (12):
  - `get_custom_attenuation_radius()` -> `float or None` — Get Custom Attenuation Radius
  - `get_custom_ies_brightness_scale()` -> `float or None` — Get Custom IESBrightness Scale
  - `get_custom_ies_texture()` -> `str or None` — Get Custom IESTexture
  - `get_custom_intensity_units()` -> `InterchangeLightUnits or None` — Get Custom Intensity Units
  - `get_custom_rotation()` -> `Rotator or None` — Get Custom Rotation
  - `get_custom_use_ies_brightness()` -> `bool or None` — Get Custom Use IESBrightness
  - `set_custom_attenuation_radius(attribute_value)` -> `bool` — Set Custom Attenuation Radius
  - `set_custom_ies_brightness_scale(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom IESBrightness Scale
  - `set_custom_ies_texture(attribute_value)` -> `bool` — Set Custom IESTexture
  - `set_custom_intensity_units(attribute_value)` -> `bool` — Set Custom Intensity Units
  - `set_custom_rotation(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Rotation
  - `set_custom_use_ies_brightness(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Use IESBrightness

### `unreal.InterchangeMaterialInstanceNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeMaterialInstanceNode.h`

Interchange Material Instance Node

**Methods** (10):
  - `add_scalar_parameter_value(parameter_name, attribute_value)` -> `bool` — Add Scalar Parameter Value
  - `add_static_switch_parameter_value(parameter_name, attribute_value)` -> `bool` — Add Static Switch Parameter Value
  - `add_texture_parameter_value(parameter_name, attribute_value)` -> `bool` — Add Texture Parameter Value
  - `add_vector_parameter_value(parameter_name, attribute_value)` -> `bool` — Add Vector Parameter Value
  - `get_custom_parent()` -> `str or None` — Get Custom Parent
  - `get_scalar_parameter_value(parameter_name)` -> `float or None` — Get Scalar Parameter Value
  - `get_static_switch_parameter_value(parameter_name)` -> `bool or None` — Get Static Switch Parameter Value
  - `get_texture_parameter_value(parameter_name)` -> `str or None` — Get Texture Parameter Value
  - `get_vector_parameter_value(parameter_name)` -> `LinearColor or None` — Get Vector Parameter Value
  - `set_custom_parent(attribute_value)` -> `bool` — Set Custom Parent

### `unreal.InterchangeMaterialReferenceNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeMaterialReferenceNode.h`

Describes a reference to an existing (as in, not imported) material.

**Methods** (2):
  - `get_custom_content_path()` -> `str or None` — Gets the content path of the target material (e.g. â/Game/MyFolder/Red.Redâ)
  - `set_custom_content_path(attribute_value)` -> `bool` — Sets the content path of the target material (e.g. â/Game/MyFolder/Red.Redâ)

### `unreal.InterchangeMeshNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeMeshNode.h`

Interchange Mesh Node

**Methods** (46):
  - `get_custom_bounding_box()` -> `Box or None` — Query the bounding box of this mesh. Return false if the attribute was not set.
  - `get_custom_collision_type()` -> `InterchangeMeshCollision or None` — Get the type of collision shapes we should generate from this mesh. Note: This is a separate mechanism from the FBX-styl...
  - `get_custom_has_smooth_group()` -> `bool or None` — Query whether this mesh has smoothing groups. Return false if the attribute was not set.
  - `get_custom_has_vertex_binormal()` -> `bool or None` — Query whether this mesh has vertex bi-normals. Return false if the attribute was not set.
  - `get_custom_has_vertex_color()` -> `bool or None` — Query whether this mesh has vertex colors. Return false if the attribute was not set.
  - `get_custom_has_vertex_normal()` -> `bool or None` — Query whether this mesh has vertex normals. Return false if the attribute was not set.
  - `get_custom_has_vertex_tangent()` -> `bool or None` — Query whether this mesh has vertex tangents. Return false if the attribute was not set.
  - `get_custom_polygon_count()` -> `int32 or None` — Query the polygon count of this mesh. Return false if the attribute was not set.
  - `get_custom_uv_count()` -> `int32 or None` — Query the UV count of this mesh. Return false if the attribute was not set.
  - `get_custom_vertex_count()` -> `int32 or None` — Query the vertex count of this mesh. Return false if the attribute was not set.
  - `get_morph_target_dependecies_count()` -> `int32` — Retrieve the number of morph target dependencies for this object.
  - `get_morph_target_dependencies()` -> `Array [ str ]` — Retrieve all morph target dependencies for this object.
  - `get_morph_target_dependency(index)` -> `str` — Retrieve the specified morph target dependency for this object.
  - `get_morph_target_name()` -> `str or None` — Get the morph target name. Return true if we successfully retrieved the MorphTargetName attribute.
  - `get_scene_instance_uid(index)` -> `str` — Retrieve the asset instance this scene node refers to.
  - `get_scene_instance_uids()` -> `Array [ str ]` — Retrieve the asset instances this scene node refers to.
  - `get_scene_instance_uids_count()` -> `int32` — Retrieve the number of scene nodes instancing this mesh.
  - `get_skeleton_dependecies_count()` -> `int32` — Retrieve the number of skeleton dependencies for this object.
  - `get_skeleton_dependencies()` -> `Array [ str ]` — Retrieve the skeleton dependency for this object.
  - `get_skeleton_dependency(index)` -> `str` — Retrieve the specified skeleton dependency for this object.
  - `get_slot_material_dependencies()` -> `Map [ str , str ]` — Retrieve the correspondence table between slot names and assigned materials for this object.
  - `get_slot_material_dependency_uid(slot_name)` -> `str or None` — Retrieve the specified Material dependency for a given slot of this object.
  - `is_morph_target()` -> `bool` — Return true if this node represents a morph target.
  - `is_skinned_mesh()` -> `bool` — Return true if this node represents a skinned mesh.
  - `remove_morph_target_dependency_uid(dependency_uid)` -> `bool` — Remove the specified morph target dependency from this object.
  - `remove_scene_instance_uid(dependency_uid)` -> `bool` — Remove the specified asset instance this scene node refers to.
  - `remove_skeleton_dependency_uid(dependency_uid)` -> `bool` — Remove the specified skeleton dependency from this object.
  - `remove_slot_material_dependency_uid(slot_name)` -> `bool` — Remove the Material dependency associated with the given slot name from this object.
  - `set_custom_bounding_box(attribute_value)` -> `bool` — Set the bounding box of this mesh. Return false if the attribute could not be set.
  - `set_custom_collision_type(attribute_value)` -> `bool` — Set the type of collision shapes we should generate from this mesh
  - `set_custom_has_smooth_group(attribute_value)` -> `bool` — Set the smoothing group attribute of this mesh. Return false if the attribute could not be set.
  - `set_custom_has_vertex_binormal(attribute_value)` -> `bool` — Set the vertex bi-normal attribute of this mesh. Return false if the attribute could not be set.
  - `set_custom_has_vertex_color(attribute_value)` -> `bool` — Set the vertex color attribute of this mesh. Return false if the attribute could not be set.
  - `set_custom_has_vertex_normal(attribute_value)` -> `bool` — Set the vertex normal attribute of this mesh. Return false if the attribute could not be set.
  - `set_custom_has_vertex_tangent(attribute_value)` -> `bool` — Set the vertex tangent attribute of this mesh. Return false if the attribute could not be set.
  - `set_custom_polygon_count(attribute_value)` -> `bool` — Set the polygon count of this mesh. Return false if the attribute could not be set.
  - `set_custom_uv_count(attribute_value)` -> `bool` — Set the UV count attribute of this mesh. Return false if the attribute could not be set.
  - `set_custom_vertex_count(attribute_value)` -> `bool` — Set the vertex count of this mesh. Return false if the attribute could not be set.
  - `set_morph_target(is_morph_target)` -> `bool` — Set the IsMorphTarget attribute to determine whether this node represents a morph target.
  - `set_morph_target_dependency_uid(dependency_uid)` -> `bool` — Add the specified morph target dependency to this object.
  - `set_morph_target_name(morph_target_name)` -> `bool` — Set the MorphTargetName attribute to determine the name of the morph target.
  - `set_pay_load_key(pay_load_key, pay_load_type)` -> `None` — Set Pay Load Key
  - `set_scene_instance_uid(dependency_uid)` -> `bool` — Add the specified asset instance this scene node refers to.
  - `set_skeleton_dependency_uid(dependency_uid)` -> `bool` — Add the specified skeleton dependency to this object.
  - `set_skinned_mesh(is_skinned_mesh)` -> `bool` — Set the IsSkinnedMesh attribute to determine whether this node represents a skinned mesh.
  - `set_slot_material_dependency_uid(slot_name, material_dependency_uid)` -> `bool` — Add the specified Material dependency to a specific slot name of this object.

### `unreal.InterchangePhysicalCameraNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeCameraNode.h`

Interchange Physical Camera Node

**Methods** (8):
  - `get_custom_enable_depth_of_field()` -> `bool or None` — Get Custom Enable Depth Of Field
  - `get_custom_focal_length()` -> `float or None` — Get Custom Focal Length
  - `get_custom_sensor_height()` -> `float or None` — Get Custom Sensor Height
  - `get_custom_sensor_width()` -> `float or None` — Get Custom Sensor Width
  - `set_custom_enable_depth_of_field(attribute_value)` -> `bool` — Set Custom Enable Depth Of Field
  - `set_custom_focal_length(attribute_value)` -> `bool` — Set Custom Focal Length
  - `set_custom_sensor_height(attribute_value)` -> `bool` — Set Custom Sensor Height
  - `set_custom_sensor_width(attribute_value)` -> `bool` — Set Custom Sensor Width

### `unreal.InterchangePointLightNode`
Inherits: `InterchangeLightNode` | Header: `InterchangeLightNode.h`

Interchange Point Light Node

**Methods** (4):
  - `get_custom_light_falloff_exponent()` -> `float or None` — Get Custom Light Falloff Exponent
  - `get_custom_use_inverse_squared_falloff()` -> `bool or None` — Get Custom Use Inverse Squared Falloff
  - `set_custom_light_falloff_exponent(attribute_value)` -> `bool` — Set Custom Light Falloff Exponent
  - `set_custom_use_inverse_squared_falloff(attribute_value)` -> `bool` — Set Custom Use Inverse Squared Falloff

### `unreal.InterchangeRectLightNode`
Inherits: `InterchangeLightNode` | Header: `InterchangeLightNode.h`

Interchange Rect Light Node

**Methods** (4):
  - `get_custom_source_height()` -> `float or None` — Get Custom Source Height
  - `get_custom_source_width()` -> `float or None` — Get Custom Source Width
  - `set_custom_source_height(attribute_value)` -> `bool` — Set Custom Source Height
  - `set_custom_source_width(attribute_value)` -> `bool` — Set Custom Source Width

### `unreal.InterchangeSceneNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeSceneNode.h`

The scene node represents a transform node in the scene. Scene nodes can have user-defined attributes. Use UInterchangeUserDefinedAttributesAPI to get and set user-defined attribute data.

**Methods** (39):
  - `add_specialized_type(specialized_type)` -> `bool` — Add Specialized Type
  - `get_animation_curve_type_for_curve_name(curve_name)` -> `InterchangeAnimationPayLoadType or None` — Gets the Animation Curve Type for the given CurveName.
  - `get_custom_actor_visibility()` -> `bool or None` — Gets whether actors spawned from this node should be visible
  - `get_custom_animation_asset_uid_to_play()` -> `str or None` — Get the Animation Asset To Play by this Scene Node.
  - `get_custom_asset_instance_uid()` -> `str or None` — Get which asset, if any, a scene node is instantiating. Return false if the Attribute was not set previously.
  - `get_custom_bind_pose_global_transform(base_node_container, global_offset_transform, force_recache = False)` -> `Transform or None` — Get the global transform of the bind pose scene node. This value is computed from the local transforms of all parent bin...
  - `get_custom_bind_pose_local_transform()` -> `Transform or None` — Get the local transform of the bind pose scene node.
  - `get_custom_component_visibility()` -> `bool or None` — Gets whether components spawned from this node should be visible
  - `get_custom_geometric_transform()` -> `Transform or None` — Get the geometric offset. Any mesh attached to this scene node will be offset using this transform.
  - `get_custom_global_transform(base_node_container, global_offset_transform, force_recache = False)` -> `Transform or None` — Get the default scene node global transform. This value is computed from the local transforms of all parent scene nodes.
  - `get_custom_has_bind_pose()` -> `bool or None` — Gets if the joint has BindPose (if the setter was used, otherwise returns with false and T0 evaluation presumes bHasBind...
  - `get_custom_local_transform()` -> `Transform or None` — Get the default scene node local transform. The default transform is the local transform of the node (no bind pose, no t...
  - `get_custom_pivot_node_transform()` -> `Transform or None` — Get the node pivot geometric offset.
  - `get_custom_time_zero_global_transform(base_node_container, global_offset_transform, force_recache = False)` -> `Transform or None` — Get the global transform of the time-zero scene node. This value is computed from the local transforms of all parent tim...
  - `get_custom_time_zero_local_transform()` -> `Transform or None` — Get the local transform of the time-zero scene node.
  - `get_global_bind_pose_reference_for_mesh_uid(mesh_uid)` -> `Matrix or None` — Get the Global Bind Pose Reference for given MeshUID.
  - `get_morph_target_curve_weights()` -> `Map [ str , float ]` — Get MorphTargets and their weights.
  - `get_slot_material_dependencies()` -> `Map [ str , str ]` — Retrieve the correspondence table between slot names and assigned materials for this object.
  - `get_slot_material_dependency_uid(slot_name)` -> `str or None` — Retrieve the Material dependency for a given slot of this object.
  - `get_specialized_type(index)` -> `str` — Get Specialized Type
  - `get_specialized_type_count()` -> `int32` — Get the specialized type this scene node represents (for example, Joint or LODGroup).
  - `get_specialized_types()` -> `Array [ str ]` — Get Specialized Types
  - `is_specialized_type_contains(specialized_type)` -> `bool` — Is Specialized Type Contains
  - `remove_slot_material_dependency_uid(slot_name)` -> `bool` — Remove the Material dependency associated with the given slot name from this object.
  - `remove_specialized_type(specialized_type)` -> `bool` — Remove Specialized Type
  - `set_animation_curve_type_for_curve_name(curve_name, animation_curve_type)` -> `bool` — Sets the Animation Curve Type for the given CurveName (StepCurve or Curve). (Mostly used for tracking Custom Attributesâ...
  - `set_custom_actor_visibility(is_visible)` -> `bool` — Sets whether actors spawned from this node should be visible
  - `set_custom_animation_asset_uid_to_play(attribute_value)` -> `bool` — Set the Animation Asset To Play by this Scene Node. Only relevant for SkeletalMeshActors (that is, SceneNodes that are i...
  - `set_custom_asset_instance_uid(attribute_value)` -> `bool` — Add an asset for this scene node to instantiate.
  - `set_custom_bind_pose_local_transform(base_node_container, attribute_value, reset_cache = True)` -> `bool` — Set the local transform of the bind pose scene node.
  - `set_custom_component_visibility(is_visible)` -> `bool` — Sets whether components spawned from this node should be visible
  - `set_custom_geometric_transform(attribute_value)` -> `bool` — Set the geometric offset. Any mesh attached to this scene node will be offset using this transform.
  - `set_custom_has_bind_pose(has_bind_pose)` -> `bool` — Sets if Joint has Bind Pose. Automatic T0 usage will be configured in case if the Skeleton contanis at least 1 Joint wit...
  - `set_custom_local_transform(base_node_container, attribute_value, reset_cache = True)` -> `bool` — Set the default scene node local transform. The default transform is the local transform of the node (no bind pose, no t...
  - `set_custom_pivot_node_transform(attribute_value)` -> `bool` — Set the node pivot geometric offset.
  - `set_custom_time_zero_local_transform(base_node_container, attribute_value, reset_cache = True)` -> `bool` — Set the local transform of the time-zero scene node.
  - `set_global_bind_pose_reference_for_mesh_ui_ds(global_bind_pose_reference_for_mesh_ui_ds)` -> `None` — Set the Global Bind Pose Referenced for MeshUIDs.
  - `set_morph_target_curve_weight(morph_target_name, weight)` -> `bool` — Set MorphTarget with given weight.
  - `set_slot_material_dependency_uid(slot_name, material_dependency_uid)` -> `bool` — Add the specified Material dependency to a specific slot name of this object.

### `unreal.InterchangeSceneVariantSetsNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeVariantSetNode.h`

Class to represent a set of VariantSet nodes

**Methods** (5):
  - `add_custom_variant_set_uid(variant_uid)` -> `bool` — Add the specified VariantSetâs unique id to this object.
  - `get_custom_variant_set_uid(index)` -> `str` — Retrieve the specified VariantSetâs unique id for this object.
  - `get_custom_variant_set_uid_count()` -> `int32` — Retrieve the number of VariantSets for this object.
  - `get_custom_variant_set_uids()` -> `Array [ str ]` — Retrieve all the VariantSetsâ unique ids for this object.
  - `remove_custom_variant_set_uid(variant_uid)` -> `bool` — Remove the specified VariantSetâs unique id from this object.

### `unreal.InterchangeShaderGraphNode`
Inherits: `InterchangeShaderNode` | Header: `InterchangeShaderGraphNode.h`

A shader graph has its own set of inputs on which shader nodes can be connected to.

**Methods** (14):
  - `get_custom_blend_mode()` -> `int32 or None` — Set the Blend Mode using EBlendMode to avoid a dependency on the Engine.
  - `get_custom_displacement_center_mode()` -> `float or None` — Set the center of the displacement
  - `get_custom_is_a_shader_function()` -> `bool or None` — Get Custom Is AShader Function
  - `get_custom_opacity_mask_clip_value()` -> `float or None` — Get Custom Opacity Mask Clip Value
  - `get_custom_screen_space_reflections()` -> `bool or None` — Get Custom Screen Space Reflections
  - `get_custom_two_sided()` -> `bool or None` — Get Custom Two Sided
  - `get_custom_two_sided_transmission()` -> `bool or None` — Forces two-sided even for Transmission materials.
  - `set_custom_blend_mode(attribute_value)` -> `bool` — Set Custom Blend Mode
  - `set_custom_displacement_center_mode(attribute_value)` -> `bool` — Set Custom Displacement Center Mode
  - `set_custom_is_a_shader_function(attribute_value)` -> `bool` — Set whether this shader graph should be considered as a material (false), or a material function (true).
  - `set_custom_opacity_mask_clip_value(attribute_value, add_apply_delegate = True)` -> `bool` — The shader is transparent if its alpha value is lower than the clip value, or opaque if it is higher.
  - `set_custom_screen_space_reflections(attribute_value)` -> `bool` — Set Custom Screen Space Reflections
  - `set_custom_two_sided(attribute_value)` -> `bool` — Set if this shader graph should be rendered two-sided or not. Defaults to off.
  - `set_custom_two_sided_transmission(attribute_value)` -> `bool` — Set Custom Two Sided Transmission

### `unreal.InterchangeShaderNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeShaderGraphNode.h`

A shader node is a named set of inputs and outputs. It can be connected to other shader nodes and finally to a shader graph input.

**Methods** (5):
  - `add_float_input(input_name, attribute_value, is_a_parameter = False)` -> `bool` — Set the Float Attribute on the Shader Node. If bIsAParameter is set to true, it would be treated as a ScalarParameter wh...
  - `add_linear_color_input(input_name, attribute_value, is_a_parameter = False)` -> `bool` — Set the Linear Color Attribute on the Shader Node. If bIsAParameter is set to true, it would be treated as a VectorParam...
  - `add_string_input(input_name, attribute_value, is_a_parameter = False)` -> `bool` — Set the String Attribute on the Shader Node. If bIsAParameter is set to true, it would be treated as a overridable Textu...
  - `get_custom_shader_type()` -> `str or None` — Get Custom Shader Type
  - `set_custom_shader_type(attribute_value)` -> `bool` — Sets which type of shader this nodes represents. Can be arbitrary or one of the predefined shader types. The material pi...

### `unreal.InterchangeShaderPortsAPI`
Inherits: `Object` | Header: `InterchangeShaderGraphNode.h`

The Shader Ports API manages a set of inputs and outputs attributes. This API can be used over any InterchangeBaseNode that wants to support shader ports as attributes.

**Methods** (13):
  - `connect_default_ouput_to_input(interchange_node, input_name, expression_uid)` -> `bool` [classmethod] — Adds an input connection attribute.
  - `connect_ouput_to_input_by_index(interchange_node, input_name, expression_uid, output_index)` -> `bool` [classmethod] — Adds an input connection attribute.
  - `connect_ouput_to_input_by_name(interchange_node, input_name, expression_uid, output_name)` -> `bool` [classmethod] — Adds an input connection attribute.
  - `gather_inputs(interchange_node)` -> `Array [ str ]` [classmethod] — Retrieves the names of all the inputs for a given node.
  - `get_input_connection(interchange_node, input_name)` -> `(out_expression_uid=str, output_name=str) or None` [classmethod] — Retrieves the node unique id and the output name connected to a given input, if any.
  - `has_input(interchange_node, input_name)` -> `bool` [classmethod] — Checks whether a particular input exists on a given node.
  - `has_parameter(interchange_node, input_name)` -> `bool` [classmethod] — Checks whether a particular input exists as a parameter on a given node.
  - `is_a_parameter(attribute_key)` -> `bool` [classmethod] — Returns true if the attribute key is an input that represents parameters (ends with â:Parameterâ).
  - `is_an_input(attribute_key)` -> `bool` [classmethod] — Returns true if the attribute key is associated with an input (starts with âInputs:â).
  - `make_input_connection_key(input_name)` -> `str` [classmethod] — Makes an attribute key to represent a node being connected to an input (that is, Inputs:InputName:Connect).
  - `make_input_name(input_key)` -> `str` [classmethod] — From an attribute key associated with an input (that is, Inputs:InputName:Value), retrieves the input name.
  - `make_input_parameter_key(input_name)` -> `str` [classmethod] — Makes an attribute key to represent a parameter being given to an input (that is, Inputs:InputName:Parameter). This is m...
  - `make_input_value_key(input_name)` -> `str` [classmethod] — Makes an attribute key to represent a value being given to an input (that is, Inputs:InputName:Value).

### `unreal.InterchangeSkeletalAnimationTrackNode`
Inherits: `InterchangeAnimationTrackBaseNode` | Header: `InterchangeAnimationTrackSetNode.h`

Class to hold onto the relationships between a set of animation tracks and the bones, morph targets of a skeleton.

**Methods** (17):
  - `get_custom_animation_sample_rate()` -> `double or None` — Get the animation sample rate. Return false if the attribute is not set.
  - `get_custom_animation_start_time()` -> `double or None` — Get the animation start time. Return false if the attribute is not set.
  - `get_custom_animation_stop_time()` -> `double or None` — Get the animation stop time. Return false if the attribute is not set.
  - `get_custom_skeleton_node_uid()` -> `str or None` — Get the unique ID of the skeleton factory node. Return false if the attribute is not set.
  - `get_custom_source_timeline_animation_start_time()` -> `double or None` — Get the source timeline animation start time. Return false if the attribute is not set. Note: This represent the DCC set...
  - `get_custom_source_timeline_animation_stop_time()` -> `double or None` — Get the source timeline animation stop time. Return false if the attribute is not set. Note: This represent the DCC setu...
  - `get_morph_target_node_animation_payload_keys()` — Get Morph Target Node Animation Payload Keys
  - `get_scene_node_animation_payload_keys()` — Get Scene Node Animation Payload Keys
  - `is_node_animated_with_baked_curve(scene_node_uid)` -> `bool` — Is Node Animated with Baked Curve
  - `set_animation_payload_key_for_morph_target_node_uid(morph_target_node_uid, unique_id, type)` -> `bool` — Set Animation Payload Key for Morph Target Node Uid
  - `set_animation_payload_key_for_scene_node_uid(scene_node_uid, unique_id, type)` -> `bool` — Set Animation Payload Key for Scene Node Uid
  - `set_custom_animation_sample_rate(sample_rate)` -> `bool` — Set the animation sample rate. Return false if the attribute could not be set.
  - `set_custom_animation_start_time(start_time)` -> `bool` — Set the animation start time. Return false if the attribute could not be set.
  - `set_custom_animation_stop_time(stop_time)` -> `bool` — Set the animation stop time. Return false if the attribute could not be set.
  - `set_custom_skeleton_node_uid(attribute_value)` -> `bool` — Set the unique ID of the skeleton factory node. Return false if the attribute could not be set.
  - `set_custom_source_timeline_animation_start_time(start_time)` -> `bool` — Set the source timeline animation start time. Return false if the attribute could not be set. Note: This represent the D...
  - `set_custom_source_timeline_animation_stop_time(stop_time)` -> `bool` — Set the source timeline animation stop time. Return false if the attribute could not be set. Note: This represent the DC...

### `unreal.InterchangeSpecularProfileNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeSpecularProfileNode.h`

Interchange Specular Profile Node

**Methods** (4):
  - `get_custom_format()` -> `uint8 or None` — Get Custom Format
  - `get_custom_texture()` -> `str or None` — Get Custom Texture
  - `set_custom_format(format)` -> `bool` — Set/Get the format based on ESpecularProfileFormat
  - `set_custom_texture(texture_uid)` -> `bool` — Set Custom Texture

### `unreal.InterchangeSpotLightNode`
Inherits: `InterchangePointLightNode` | Header: `InterchangeLightNode.h`

Interchange Spot Light Node

**Methods** (4):
  - `get_custom_inner_cone_angle()` -> `float or None` — Get Custom Inner Cone Angle
  - `get_custom_outer_cone_angle()` -> `float or None` — Get Custom Outer Cone Angle
  - `set_custom_inner_cone_angle(attribute_value)` -> `bool` — Set Custom Inner Cone Angle
  - `set_custom_outer_cone_angle(attribute_value)` -> `bool` — Set Custom Outer Cone Angle

### `unreal.InterchangeStandardCameraNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeCameraNode.h`

Primarily used for Ortho Camera

**Methods** (12):
  - `get_custom_aspect_ratio()` -> `float or None` — Get Custom Aspect Ratio
  - `get_custom_far_clip_plane()` -> `float or None` — Get Custom Far Clip Plane
  - `get_custom_field_of_view()` -> `float or None` — Field of View in Degrees.
  - `get_custom_near_clip_plane()` -> `float or None` — Get Custom Near Clip Plane
  - `get_custom_projection_mode()` -> `InterchangeCameraProjectionType or None` — Get Custom Projection Mode
  - `get_custom_width()` -> `float or None` — Get Custom Width
  - `set_custom_aspect_ratio(attribute_value)` -> `bool` — Set Custom Aspect Ratio
  - `set_custom_far_clip_plane(attribute_value)` -> `bool` — Set Custom Far Clip Plane
  - `set_custom_field_of_view(attribute_value)` -> `bool` — Field of View in Degrees.
  - `set_custom_near_clip_plane(attribute_value)` -> `bool` — Set Custom Near Clip Plane
  - `set_custom_projection_mode(attribute_value)` -> `bool` — Set Custom Projection Mode
  - `set_custom_width(attribute_value)` -> `bool` — Set Custom Width

### `unreal.InterchangeTexture2DArrayNode`
Inherits: `InterchangeTextureNode` | Header: `InterchangeTexture2DArrayNode.h`

Interchange Texture 2DArray Node

### `unreal.InterchangeTexture2DNode`
Inherits: `InterchangeTextureNode` | Header: `InterchangeTexture2DNode.h`

ns UE::Interchange

**Methods** (5):
  - `get_custom_wrap_u()` -> `InterchangeTextureWrapMode or None` — Get Custom Wrap U
  - `get_custom_wrap_v()` -> `InterchangeTextureWrapMode or None` — Get Custom Wrap V
  - `get_source_blocks()` -> `Map [ int32 , str ]` — Get the source blocks for the texture. If the map is empty, the texture is imported as a normal texture using the payloa...
  - `set_custom_wrap_u(attribute_value)` -> `bool` — Set Custom Wrap U
  - `set_custom_wrap_v(attribute_value)` -> `bool` — Set Custom Wrap V

### `unreal.InterchangeTextureBlurNode`
Inherits: `InterchangeTexture2DNode` | Header: `InterchangeTextureBlurNode.h`

Interchange Texture Blur Node

### `unreal.InterchangeTextureCubeArrayNode`
Inherits: `InterchangeTextureNode` | Header: `InterchangeTextureCubeArrayNode.h`

Interchange Texture Cube Array Node

### `unreal.InterchangeTextureCubeNode`
Inherits: `InterchangeTextureNode` | Header: `InterchangeTextureCubeNode.h`

Interchange Texture Cube Node

### `unreal.InterchangeTextureLightProfileNode`
Inherits: `InterchangeTextureNode` | Header: `InterchangeTextureLightProfileNode.h`

Interchange Texture Light Profile Node

### `unreal.InterchangeTextureNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeTextureNode.h`

Interchange Texture Node

**Methods** (9):
  - `get_custom_color_space()` -> `InterchangeTextureColorSpace or None` — Get Custom Color Space
  - `get_custom_filter()` -> `InterchangeTextureFilterMode or None` — Get Custom Filter
  - `get_custom_srgb()` -> `bool or None` — Get Custom SRGB
  - `get_customb_flip_green_channel()` -> `bool or None` — Get Customb Flip Green Channel
  - `set_custom_color_space(attribute_value)` -> `bool` — Set Custom Color Space
  - `set_custom_filter(attribute_value)` -> `bool` — Set Custom Filter
  - `set_custom_srgb(attribute_value)` -> `bool` — Set Custom SRGB
  - `set_customb_flip_green_channel(attribute_value)` -> `bool` — Set Customb Flip Green Channel
  - `set_pay_load_key(payload_key)` -> `None` — Set Pay Load Key

### `unreal.InterchangeTransformAnimationTrackNode`
Inherits: `InterchangeAnimationTrackNode` | Header: `InterchangeAnimationTrackSetNode.h`

Class to represent an animation on the transform of a camera, light, or scene node.

**Methods** (2):
  - `get_custom_used_channels()` -> `int32 or None` — Get which channels of this animation should be used. This is a bitmask. See SetCustomUsedChannels for description of bit...
  - `set_custom_used_channels(attribute_value)` -> `bool` — Set which channels of this animation should be used. This is a bitwise mask. Bits are interpreted as follow:

### `unreal.InterchangeVariantSetNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeVariantSetNode.h`

Class to represent a set of variants.

**Methods** (9):
  - `add_custom_dependency_uid(dependency_uid)` -> `bool` — Add the specified translated nodeâs unique ID to this VariantSet.
  - `get_custom_dependency_uid(index)` -> `str` — Retrieve the specified translated nodeâs unique ID for this VariantSet.
  - `get_custom_dependency_uid_count()` -> `int32` — Retrieve the number of translated nodeâs unique IDs for this VariantSet.
  - `get_custom_dependency_uids()` -> `Array [ str ]` — Retrieve all the translated nodeâs unique IDs for this VariantSet.
  - `get_custom_display_text()` -> `str or None` — Retrieve the text that is displayed in the UI for this VariantSet.
  - `get_custom_variants_payload_key()` -> `str or None` — Get the payload key needed to retrieve the variants for this VariantSet.
  - `remove_custom_dependency_uid(dependency_uid)` -> `bool` — Remove the specified translated nodeâs unique ID from this VariantSet.
  - `set_custom_display_text(attribute_value)` -> `bool` — Set the text to be displayed in the UI for this VariantSet.
  - `set_custom_variants_payload_key(payload_key)` -> `bool` — Set the payload key needed to retrieve the variants for this VariantSet.

### `unreal.InterchangeVolumeGridNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeVolumeNode.h`

Represents a single grid (essentially a 3d texture) within a volumetric file

**Methods** (12):
  - `get_custom_element_type()` -> `VolumeGridElementType or None` — Gets the datatype of the value of each voxel in the grid
  - `get_custom_grid_active_aabb_max()` -> `IntVector or None` — Gets the max X, Y and Z of the gridâs active axis-aligned bounding box.
  - `get_custom_grid_active_aabb_min()` -> `IntVector or None` — Gets the min X, Y and Z of the gridâs active axis-aligned bounding box.
  - `get_custom_grid_active_dimensions()` -> `IntVector or None` — Gets the size of the grid, in voxels.
  - `get_custom_grid_transform()` -> `Transform or None` — Gets the grid transform contained in the volume file
  - `get_custom_num_components()` -> `int32 or None` — Gets the number of components of each voxel of the grid (e.g. 3 components for a vector grid)
  - `set_custom_element_type(attribute_value)` -> `bool` — Sets the datatype of the value of each voxel in the grid
  - `set_custom_grid_active_aabb_max(attribute_value)` -> `bool` — Sets the max X, Y and Z of the gridâs active axis-aligned bounding box.
  - `set_custom_grid_active_aabb_min(attribute_value)` -> `bool` — Sets the min X, Y and Z of the gridâs active axis-aligned bounding box.
  - `set_custom_grid_active_dimensions(attribute_value)` -> `bool` — Sets the size of the grid, in voxels.
  - `set_custom_grid_transform(attribute_value)` -> `bool` — Sets the grid transform contained in the volume file
  - `set_custom_num_components(num_components)` -> `bool` — Sets the number of components of each voxel of the grid (e.g. 3 components for a vector grid)

### `unreal.InterchangeVolumeNode`
Inherits: `InterchangeBaseNode` | Header: `InterchangeVolumeNode.h`

Represents a file that contains volume data in the form of (potentially multiple) grids, which are represented as UInterchangeVolumeGridNode dependencies

**Methods** (13):
  - `add_custom_frame_index_in_animation(index)` -> `bool` — Adds a frame index for which this volume is displayed within the animation that it belongs to, if any
  - `add_custom_grid_dependency(dependency_uid)` -> `bool` — Sets the Node ID of an UInterchangeVolumeGridNode dependency
  - `get_custom_animation_id()` -> `str or None` — Gets an identifier that is shared by all volume nodes that correspond to the same animation (i.e. every volume node with...
  - `get_custom_file_name()` -> `str or None` — Gets the filename of the file with volume data (e.g. âC:/MyFolder/File.vdbâ). This is stored on the translated node ...
  - `get_custom_frame_index_in_animation(index_index)` -> `int32` — Gets one of the frame indices for which this volume is displayed within the animation that it belongs to, if any
  - `get_custom_frame_indices_in_animation()` -> `Array [ int32 ]` — Get the frame indices for which this volume is displayed within the animation that it belongs to, if any (e.g. if this h...
  - `get_custom_grid_dependecies()` -> `Array [ str ]` — Gets the Node IDs of UInterchangeVolumeGridNodes declared as dependencies by this volume node
  - `get_custom_grid_dependecies_count()` -> `int32` — Gets the number of UInterchangeVolumeGridNodes declared as dependencies by this volume node (in other words, returns the...
  - `get_custom_grid_dependency(index)` -> `str` — Gets the Node ID of an UInterchangeVolumeGridNode dependency
  - `remove_custom_frame_index_in_animation(index)` -> `bool` — Removes a frame index for which this volume is displayed within the animation that it belongs to, if any
  - `remove_custom_grid_dependency(dependency_uid)` -> `bool` — Removes the Node ID of an UInterchangeVolumeGridNode dependency
  - `set_custom_animation_id(attribute_value)` -> `bool` — Sets an identifier that is shared by all volume nodes that correspond to the same animation (i.e. every volume node with...
  - `set_custom_file_name(attribute_value)` -> `bool` — Sets the filename of the file with volume data (e.g. âC:/MyFolder/File.vdbâ). This is stored on the translated node ...

### `unreal.InterchangeVolumeTextureNode`
Inherits: `InterchangeTextureNode` | Header: `InterchangeVolumeTextureNode.h`

Interchange Volume Texture Node

### `unreal.InterchangeAnimatedProperty`
Inherits: `EnumBase` | Header: `InterchangeAnimationTrackSetNode.h`

Enumeration specifying which properties of a camera, light or scene node can be animated besides transform.

**Properties** (2):
  - `NONE`: `InterchangeAnimatedProperty = Ellipsis` — The associated animation track will be ignored. 0
  - `VISIBILITY`: `InterchangeAnimatedProperty = Ellipsis` — The associated animation track is applied to the visibility property of the actor. 1

### `unreal.InterchangeAnimationPayLoadType`
Inherits: `EnumBase` | Header: `InterchangeAnimationTrackSetNode.h`

EInterchange Animation Pay Load Type

**Properties** (6):
  - `BAKED`: `InterchangeAnimationPayLoadType = Ellipsis` — 4
  - `CURVE`: `InterchangeAnimationPayLoadType = Ellipsis` — 1
  - `MORPHTARGETCURVE`: `InterchangeAnimationPayLoadType = Ellipsis` — 2
  - `MORPHTARGETCURVEWEIGHTINSTANCE`: `InterchangeAnimationPayLoadType = Ellipsis` — 5
  - `NONE`: `InterchangeAnimationPayLoadType = Ellipsis` — 0
  - `STEPCURVE`: `InterchangeAnimationPayLoadType = Ellipsis` — Handles/generates the same properties as the CURVE variation, but the way it is acquired might be di...

### `unreal.InterchangeCameraProjectionType`
Inherits: `EnumBase` | Header: `InterchangeCameraNode.h`

EInterchange Camera Projection Type

**Properties** (2):
  - `ORTHOGRAPHIC`: `InterchangeCameraProjectionType = Ellipsis` — 1
  - `PERSPECTIVE`: `InterchangeCameraProjectionType = Ellipsis` — 0

### `unreal.InterchangeLightUnits`
Inherits: `EnumBase` | Header: `InterchangeLightNode.h`

This enum is used as a placeholder for ELightUnits. Because InterchangeWorker is not compiled against Engine, the LightFactoryNode is not affected.

**Properties** (4):
  - `CANDELAS`: `InterchangeLightUnits = Ellipsis` — 1
  - `EV`: `InterchangeLightUnits = Ellipsis` — 3
  - `LUMENS`: `InterchangeLightUnits = Ellipsis` — 2
  - `UNITLESS`: `InterchangeLightUnits = Ellipsis` — 0

### `unreal.InterchangeMeshCollision`
Inherits: `EnumBase` | Header: `InterchangeMeshDefinitions.h`

EInterchange Mesh Collision

**Properties** (9):
  - `BOX`: `InterchangeMeshCollision = Ellipsis` — Generates a new box collision mesh encompassing the static mesh 0
  - `CAPSULE`: `InterchangeMeshCollision = Ellipsis` — Generates a new capsule collision mesh encompassing the static mesh 2
  - `CONVEX10DOP_X`: `InterchangeMeshCollision = Ellipsis` — Generates a new axis-aligned box collision mesh with the 4 X-axis aligned edges beveled (10 total si...
  - `CONVEX10DOP_Y`: `InterchangeMeshCollision = Ellipsis` — Generates a new axis-aligned box collision mesh with the 4 Y-axis aligned edges beveled (10 total si...
  - `CONVEX10DOP_Z`: `InterchangeMeshCollision = Ellipsis` — Generates a new axis-aligned box collision mesh with the 4 Z-axis aligned edges beveled (10 total si...
  - `CONVEX18DOP`: `InterchangeMeshCollision = Ellipsis` — Generates a new axis-aligned box collision mesh with all edges beveled (18 total sides) encompassing...
  - `CONVEX26DOP`: `InterchangeMeshCollision = Ellipsis` — Generates a new axis-aligned box collision mesh with all edges and corners beveled (26 total sides) ...
  - `NONE`: `InterchangeMeshCollision = Ellipsis` — Generates no collisions, but continue to import custom collisions if the file has ones 255
  - `SPHERE`: `InterchangeMeshCollision = Ellipsis` — Generates a new sphere collision mesh encompassing the static mesh 1

### `unreal.InterchangeMeshPayLoadType`
Inherits: `EnumBase` | Header: `InterchangeMeshNode.h`

ns UE

**Properties** (5):
  - `ANIMATED`: `InterchangeMeshPayLoadType = Ellipsis` — 4
  - `MORPHTARGET`: `InterchangeMeshPayLoadType = Ellipsis` — 3
  - `NONE`: `InterchangeMeshPayLoadType = Ellipsis` — 0
  - `SKELETAL`: `InterchangeMeshPayLoadType = Ellipsis` — 2
  - `STATIC`: `InterchangeMeshPayLoadType = Ellipsis` — 1

### `unreal.InterchangeMotionVectorsHandling`
Inherits: `EnumBase` | Header: `InterchangeMeshDefinitions.h`

EInterchange Motion Vectors Handling

**Properties** (3):
  - `CALCULATE_MOTION_VECTORS_DURING_IMPORT`: `InterchangeMotionVectorsHandling = Ellipsis` — Force calculation of motion vectors during import. This will increase file size as the motion vector...
  - `IMPORT_VELOCITIES_AS_MOTION_VECTORS`: `InterchangeMotionVectorsHandling = Ellipsis` — Imports the velocities and converts them to motion vectors. This will increase file size as the moti...
  - `NO_MOTION_VECTORS`: `InterchangeMotionVectorsHandling = Ellipsis` — No motion vectors will be present in the geometry cache. 0

### `unreal.InterchangePropertyTracks`
Inherits: `EnumBase` | Header: `InterchangeAnimationDefinitions.h`

EInterchange Property Tracks

**Properties** (319):
  - `ACTOR_HIDDEN_IN_GAME`: `InterchangePropertyTracks = Ellipsis` — 38
  - `AFFECT_DISTANCE_FIELD_LIGHTING`: `InterchangePropertyTracks = Ellipsis` — Common Properties 0
  - `AFFECT_DYNAMIC_INDIRECT_LIGHTING`: `InterchangePropertyTracks = Ellipsis` — 1
  - `AFFECT_INDIRECT_LIGHTING_WHILE_HIDDEN`: `InterchangePropertyTracks = Ellipsis` — 2
  - `AUTO_ACTIVATE`: `InterchangePropertyTracks = Ellipsis` — 3
  - `BODY_INSTANCEB_ENABLE_GRAVITY`: `InterchangePropertyTracks = Ellipsis` — 5
  - `BODY_INSTANCEB_NOTIFY_RIGID_BODY_COLLISION`: `InterchangePropertyTracks = Ellipsis` — 6
  - `BODY_INSTANCEB_SIMULATE_PHYSICS`: `InterchangePropertyTracks = Ellipsis` — 7
  - `BODY_INSTANCEB_UPDATE_KINEMATIC_FROM_SIMULATION`: `InterchangePropertyTracks = Ellipsis` — 8
  - `BODY_INSTANCEB_USE_CCD`: `InterchangePropertyTracks = Ellipsis` — 9
  - `BODY_INSTANCE_ANGULAR_DAMPING`: `InterchangePropertyTracks = Ellipsis` — 4
  - `BODY_INSTANCE_LINEAR_DAMPING`: `InterchangePropertyTracks = Ellipsis` — 10
  - `BODY_INSTANCE_MASS_SCALE`: `InterchangePropertyTracks = Ellipsis` — 11
  - `BOUNDS_SCALE`: `InterchangePropertyTracks = Ellipsis` — 12
  - `CAMERA_ASPECT_RATIO`: `InterchangePropertyTracks = Ellipsis` — Camera Properties 112
  - `CAMERA_ASPECT_RATIO_AXIS_CONSTRAINT`: `InterchangePropertyTracks = Ellipsis` — 113
  - `CAMERA_AUTO_CALCULATE_ORTHO_PLANES`: `InterchangePropertyTracks = Ellipsis` — 114
  - `CAMERA_AUTO_PLANE_SHIFT`: `InterchangePropertyTracks = Ellipsis` — 115
  - `CAMERA_CONSTRAIN_ASPECT_RATIO`: `InterchangePropertyTracks = Ellipsis` — 116
  - `CAMERA_CURRENT_APERTURE`: `InterchangePropertyTracks = Ellipsis` — 117
  - `CAMERA_CURRENT_FOCAL_LENGTH`: `InterchangePropertyTracks = Ellipsis` — 118
  - `CAMERA_CUSTOM_NEAR_CLIPPING_PLANE`: `InterchangePropertyTracks = Ellipsis` — 119
  - `CAMERA_FIELD_OF_VIEW`: `InterchangePropertyTracks = Ellipsis` — 120
  - `CAMERA_FILMBACK_SENSOR_ASPECT_RATIO`: `InterchangePropertyTracks = Ellipsis` — 121
  - `CAMERA_FILMBACK_SENSOR_HEIGHT`: `InterchangePropertyTracks = Ellipsis` — 122
  - `CAMERA_FILMBACK_SENSOR_WIDTH`: `InterchangePropertyTracks = Ellipsis` — 123
  - `CAMERA_FOCUS_SETTINGS_FOCUS_OFFSET`: `InterchangePropertyTracks = Ellipsis` — 124
  - `CAMERA_FOCUS_SETTINGS_MANUAL_FOCUS_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 125
  - `CAMERA_FOCUS_SETTINGS_TRACKING_FOCUS_SETTINGS_RELATIVE_OFFSET`: `InterchangePropertyTracks = Ellipsis` — 126
  - `CAMERA_ORTHO_FAR_CLIP_PLANE`: `InterchangePropertyTracks = Ellipsis` — 127
  - `CAMERA_ORTHO_NEAR_CLIP_PLANE`: `InterchangePropertyTracks = Ellipsis` — 128
  - `CAMERA_ORTHO_WIDTH`: `InterchangePropertyTracks = Ellipsis` — 129
  - `CAMERA_OVERRIDE_ASPECT_RATIO_AXIS_CONSTRAINT`: `InterchangePropertyTracks = Ellipsis` — 130
  - `CAMERA_POST_PROCESS_BLEND_WEIGHT`: `InterchangePropertyTracks = Ellipsis` — 131
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_CUBEMAP_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 132
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_CUBEMAP_TINT`: `InterchangePropertyTracks = Ellipsis` — 133
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_BIAS`: `InterchangePropertyTracks = Ellipsis` — 134
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_FADE_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 135
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_FADE_RADIUS`: `InterchangePropertyTracks = Ellipsis` — 136
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 137
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_MIP_BLEND`: `InterchangePropertyTracks = Ellipsis` — 138
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_MIP_SCALE`: `InterchangePropertyTracks = Ellipsis` — 139
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_MIP_THRESHOLD`: `InterchangePropertyTracks = Ellipsis` — 140
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_POWER`: `InterchangePropertyTracks = Ellipsis` — 141
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_QUALITY`: `InterchangePropertyTracks = Ellipsis` — 142
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_RADIUS`: `InterchangePropertyTracks = Ellipsis` — 143
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_STATIC_FRACTION`: `InterchangePropertyTracks = Ellipsis` — 144
  - `CAMERA_POST_PROCESS_SETTINGS_AMBIENT_OCCLUSION_TEMPORAL_BLEND_WEIGHT`: `InterchangePropertyTracks = Ellipsis` — 145
  - `CAMERA_POST_PROCESS_SETTINGS_AUTO_EXPOSURE_BIAS`: `InterchangePropertyTracks = Ellipsis` — 146
  - `CAMERA_POST_PROCESS_SETTINGS_AUTO_EXPOSURE_HIGH_PERCENT`: `InterchangePropertyTracks = Ellipsis` — 147
  - `CAMERA_POST_PROCESS_SETTINGS_AUTO_EXPOSURE_LOW_PERCENT`: `InterchangePropertyTracks = Ellipsis` — 148
  - `CAMERA_POST_PROCESS_SETTINGS_AUTO_EXPOSURE_MAX_BRIGHTNESS`: `InterchangePropertyTracks = Ellipsis` — 149
  - `CAMERA_POST_PROCESS_SETTINGS_AUTO_EXPOSURE_MIN_BRIGHTNESS`: `InterchangePropertyTracks = Ellipsis` — 150
  - `CAMERA_POST_PROCESS_SETTINGS_AUTO_EXPOSURE_SPEED_DOWN`: `InterchangePropertyTracks = Ellipsis` — 151
  - `CAMERA_POST_PROCESS_SETTINGS_AUTO_EXPOSURE_SPEED_UP`: `InterchangePropertyTracks = Ellipsis` — 152
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM1_SIZE`: `InterchangePropertyTracks = Ellipsis` — 153
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM1_TINT`: `InterchangePropertyTracks = Ellipsis` — 154
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM2_SIZE`: `InterchangePropertyTracks = Ellipsis` — 155
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM2_TINT`: `InterchangePropertyTracks = Ellipsis` — 156
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM3_SIZE`: `InterchangePropertyTracks = Ellipsis` — 157
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM3_TINT`: `InterchangePropertyTracks = Ellipsis` — 158
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM4_SIZE`: `InterchangePropertyTracks = Ellipsis` — 159
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM4_TINT`: `InterchangePropertyTracks = Ellipsis` — 160
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM5_SIZE`: `InterchangePropertyTracks = Ellipsis` — 161
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM5_TINT`: `InterchangePropertyTracks = Ellipsis` — 162
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM6_SIZE`: `InterchangePropertyTracks = Ellipsis` — 163
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM6_TINT`: `InterchangePropertyTracks = Ellipsis` — 164
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_CONVOLUTION_BUFFER_SCALE`: `InterchangePropertyTracks = Ellipsis` — 165
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_CONVOLUTION_CENTER_UV`: `InterchangePropertyTracks = Ellipsis` — 166
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_CONVOLUTION_PRE_FILTER_MAX`: `InterchangePropertyTracks = Ellipsis` — 167
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_CONVOLUTION_PRE_FILTER_MIN`: `InterchangePropertyTracks = Ellipsis` — 168
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_CONVOLUTION_PRE_FILTER_MULT`: `InterchangePropertyTracks = Ellipsis` — 169
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_CONVOLUTION_SCATTER_DISPERSION`: `InterchangePropertyTracks = Ellipsis` — 170
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_CONVOLUTION_SIZE`: `InterchangePropertyTracks = Ellipsis` — 171
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_DIRT_MASK_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 172
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_DIRT_MASK_TINT`: `InterchangePropertyTracks = Ellipsis` — 173
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 174
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_SIZE_SCALE`: `InterchangePropertyTracks = Ellipsis` — 175
  - `CAMERA_POST_PROCESS_SETTINGS_BLOOM_THRESHOLD`: `InterchangePropertyTracks = Ellipsis` — 176
  - `CAMERA_POST_PROCESS_SETTINGS_BLUE_CORRECTION`: `InterchangePropertyTracks = Ellipsis` — 177
  - `CAMERA_POST_PROCESS_SETTINGS_CHROMATIC_ABERRATION_START_OFFSET`: `InterchangePropertyTracks = Ellipsis` — 178
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_CONTRAST`: `InterchangePropertyTracks = Ellipsis` — 179
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_CONTRAST_HIGHLIGHTS`: `InterchangePropertyTracks = Ellipsis` — 180
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_CONTRAST_MIDTONES`: `InterchangePropertyTracks = Ellipsis` — 181
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_CONTRAST_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 182
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_CORRECTION_HIGHLIGHTS_MAX`: `InterchangePropertyTracks = Ellipsis` — 183
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_CORRECTION_HIGHLIGHTS_MIN`: `InterchangePropertyTracks = Ellipsis` — 184
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_CORRECTION_SHADOWS_MAX`: `InterchangePropertyTracks = Ellipsis` — 185
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAIN`: `InterchangePropertyTracks = Ellipsis` — 186
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAIN_HIGHLIGHTS`: `InterchangePropertyTracks = Ellipsis` — 187
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAIN_MIDTONES`: `InterchangePropertyTracks = Ellipsis` — 188
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAIN_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 189
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAMMA`: `InterchangePropertyTracks = Ellipsis` — 190
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAMMA_HIGHLIGHTS`: `InterchangePropertyTracks = Ellipsis` — 191
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAMMA_MIDTONES`: `InterchangePropertyTracks = Ellipsis` — 192
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GAMMA_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 193
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_GRADING_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 194
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_OFFSET`: `InterchangePropertyTracks = Ellipsis` — 195
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_OFFSET_HIGHLIGHTS`: `InterchangePropertyTracks = Ellipsis` — 196
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_OFFSET_MIDTONES`: `InterchangePropertyTracks = Ellipsis` — 197
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_OFFSET_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 198
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_SATURATION`: `InterchangePropertyTracks = Ellipsis` — 199
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_SATURATION_HIGHLIGHTS`: `InterchangePropertyTracks = Ellipsis` — 200
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_SATURATION_MIDTONES`: `InterchangePropertyTracks = Ellipsis` — 201
  - `CAMERA_POST_PROCESS_SETTINGS_COLOR_SATURATION_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 202
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_BLADE_COUNT`: `InterchangePropertyTracks = Ellipsis` — 203
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_DEPTH_BLUR_AMOUNT`: `InterchangePropertyTracks = Ellipsis` — 204
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_DEPTH_BLUR_RADIUS`: `InterchangePropertyTracks = Ellipsis` — 205
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_FAR_BLUR_SIZE`: `InterchangePropertyTracks = Ellipsis` — 206
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_FAR_TRANSITION_REGION`: `InterchangePropertyTracks = Ellipsis` — 207
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_FOCAL_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 208
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_FOCAL_REGION`: `InterchangePropertyTracks = Ellipsis` — 209
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_FSTOP`: `InterchangePropertyTracks = Ellipsis` — 210
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_MIN_FSTOP`: `InterchangePropertyTracks = Ellipsis` — 211
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_NEAR_BLUR_SIZE`: `InterchangePropertyTracks = Ellipsis` — 212
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_NEAR_TRANSITION_REGION`: `InterchangePropertyTracks = Ellipsis` — 213
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_OCCLUSION`: `InterchangePropertyTracks = Ellipsis` — 214
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_SCALE`: `InterchangePropertyTracks = Ellipsis` — 215
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_SKY_FOCUS_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 216
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_USE_HAIR_DEPTH`: `InterchangePropertyTracks = Ellipsis` — 217
  - `CAMERA_POST_PROCESS_SETTINGS_DEPTH_OF_FIELD_VIGNETTE_SIZE`: `InterchangePropertyTracks = Ellipsis` — 218
  - `CAMERA_POST_PROCESS_SETTINGS_DYNAMIC_GLOBAL_ILLUMINATION_METHOD`: `InterchangePropertyTracks = Ellipsis` — 219
  - `CAMERA_POST_PROCESS_SETTINGS_EXPAND_GAMUT`: `InterchangePropertyTracks = Ellipsis` — 220
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_BLACK_CLIP`: `InterchangePropertyTracks = Ellipsis` — 221
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_HIGHLIGHTS_MAX`: `InterchangePropertyTracks = Ellipsis` — 222
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_HIGHLIGHTS_MIN`: `InterchangePropertyTracks = Ellipsis` — 223
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 224
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_INTENSITY_HIGHLIGHTS`: `InterchangePropertyTracks = Ellipsis` — 225
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_INTENSITY_MIDTONES`: `InterchangePropertyTracks = Ellipsis` — 226
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_INTENSITY_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 227
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_SHADOWS_MAX`: `InterchangePropertyTracks = Ellipsis` — 228
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_GRAIN_TEXEL_SIZE`: `InterchangePropertyTracks = Ellipsis` — 229
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_SHOULDER`: `InterchangePropertyTracks = Ellipsis` — 230
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_SLOPE`: `InterchangePropertyTracks = Ellipsis` — 231
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_TOE`: `InterchangePropertyTracks = Ellipsis` — 232
  - `CAMERA_POST_PROCESS_SETTINGS_FILM_WHITE_CLIP`: `InterchangePropertyTracks = Ellipsis` — 233
  - `CAMERA_POST_PROCESS_SETTINGS_HISTOGRAM_LOG_MAX`: `InterchangePropertyTracks = Ellipsis` — 234
  - `CAMERA_POST_PROCESS_SETTINGS_HISTOGRAM_LOG_MIN`: `InterchangePropertyTracks = Ellipsis` — 235
  - `CAMERA_POST_PROCESS_SETTINGS_INDIRECT_LIGHTING_COLOR`: `InterchangePropertyTracks = Ellipsis` — 236
  - `CAMERA_POST_PROCESS_SETTINGS_INDIRECT_LIGHTING_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 237
  - `CAMERA_POST_PROCESS_SETTINGS_LENS_FLARE_BOKEH_SIZE`: `InterchangePropertyTracks = Ellipsis` — 238
  - `CAMERA_POST_PROCESS_SETTINGS_LENS_FLARE_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 239
  - `CAMERA_POST_PROCESS_SETTINGS_LENS_FLARE_THRESHOLD`: `InterchangePropertyTracks = Ellipsis` — 240
  - `CAMERA_POST_PROCESS_SETTINGS_LENS_FLARE_TINT`: `InterchangePropertyTracks = Ellipsis` — 241
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_BLURRED_LUMINANCE_BLEND`: `InterchangePropertyTracks = Ellipsis` — 242
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_BLURRED_LUMINANCE_KERNEL_SIZE_PERCENT`: `InterchangePropertyTracks = Ellipsis` — 243
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_DETAIL_STRENGTH`: `InterchangePropertyTracks = Ellipsis` — 244
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_HIGHLIGHT_CONTRAST_SCALE`: `InterchangePropertyTracks = Ellipsis` — 245
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_HIGHLIGHT_THRESHOLD`: `InterchangePropertyTracks = Ellipsis` — 246
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_MIDDLE_GREY_BIAS`: `InterchangePropertyTracks = Ellipsis` — 247
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_SHADOW_CONTRAST_SCALE`: `InterchangePropertyTracks = Ellipsis` — 248
  - `CAMERA_POST_PROCESS_SETTINGS_LOCAL_EXPOSURE_SHADOW_THRESHOLD`: `InterchangePropertyTracks = Ellipsis` — 249
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_DIFFUSE_COLOR_BOOST`: `InterchangePropertyTracks = Ellipsis` — 250
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_FINAL_GATHER_LIGHTING_UPDATE_SPEED`: `InterchangePropertyTracks = Ellipsis` — 251
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_FINAL_GATHER_QUALITY`: `InterchangePropertyTracks = Ellipsis` — 252
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_FINAL_GATHER_SCREEN_TRACES`: `InterchangePropertyTracks = Ellipsis` — 253
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_FRONT_LAYER_TRANSLUCENCY_REFLECTIONS`: `InterchangePropertyTracks = Ellipsis` — 254
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_FULL_SKYLIGHT_LEAKING_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 255
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_MAX_REFLECTION_BOUNCES`: `InterchangePropertyTracks = Ellipsis` — 256
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_MAX_REFRACTION_BOUNCES`: `InterchangePropertyTracks = Ellipsis` — 257
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_MAX_ROUGHNESS_TO_TRACE_REFLECTIONS`: `InterchangePropertyTracks = Ellipsis` — 258
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_MAX_TRACE_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 259
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_RAY_LIGHTING_MODE`: `InterchangePropertyTracks = Ellipsis` — 260
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_REFLECTIONS_SCREEN_TRACES`: `InterchangePropertyTracks = Ellipsis` — 262
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_REFLECTION_QUALITY`: `InterchangePropertyTracks = Ellipsis` — 261
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_SCENE_DETAIL`: `InterchangePropertyTracks = Ellipsis` — 263
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_SCENE_LIGHTING_QUALITY`: `InterchangePropertyTracks = Ellipsis` — 264
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_SCENE_LIGHTING_UPDATE_SPEED`: `InterchangePropertyTracks = Ellipsis` — 265
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_SCENE_VIEW_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 266
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_SKYLIGHT_LEAKING`: `InterchangePropertyTracks = Ellipsis` — 267
  - `CAMERA_POST_PROCESS_SETTINGS_LUMEN_SKYLIGHT_LEAKING_TINT`: `InterchangePropertyTracks = Ellipsis` — 268
  - `CAMERA_POST_PROCESS_SETTINGS_MOTION_BLUR_AMOUNT`: `InterchangePropertyTracks = Ellipsis` — 269
  - `CAMERA_POST_PROCESS_SETTINGS_MOTION_BLUR_MAX`: `InterchangePropertyTracks = Ellipsis` — 270
  - `CAMERA_POST_PROCESS_SETTINGS_MOTION_BLUR_PER_OBJECT_SIZE`: `InterchangePropertyTracks = Ellipsis` — 271
  - `CAMERA_POST_PROCESS_SETTINGS_PATH_TRACING_MAX_BOUNCES`: `InterchangePropertyTracks = Ellipsis` — 272
  - `CAMERA_POST_PROCESS_SETTINGS_PATH_TRACING_MAX_PATH_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 273
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_AO`: `InterchangePropertyTracks = Ellipsis` — 274
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_AO_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 275
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_AO_RADIUS`: `InterchangePropertyTracks = Ellipsis` — 276
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_AO_SAMPLES_PER_PIXEL`: `InterchangePropertyTracks = Ellipsis` — 277
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_TRANSLUCENCY_MAX_ROUGHNESS`: `InterchangePropertyTracks = Ellipsis` — 278
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_TRANSLUCENCY_REFRACTION`: `InterchangePropertyTracks = Ellipsis` — 279
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_TRANSLUCENCY_REFRACTION_RAYS`: `InterchangePropertyTracks = Ellipsis` — 280
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_TRANSLUCENCY_SAMPLES_PER_PIXEL`: `InterchangePropertyTracks = Ellipsis` — 281
  - `CAMERA_POST_PROCESS_SETTINGS_RAY_TRACING_TRANSLUCENCY_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 282
  - `CAMERA_POST_PROCESS_SETTINGS_REFLECTION_METHOD`: `InterchangePropertyTracks = Ellipsis` — 283
  - `CAMERA_POST_PROCESS_SETTINGS_SCENE_COLOR_TINT`: `InterchangePropertyTracks = Ellipsis` — 284
  - `CAMERA_POST_PROCESS_SETTINGS_SCENE_FRINGE_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 285
  - `CAMERA_POST_PROCESS_SETTINGS_SCREEN_SPACE_REFLECTION_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 286
  - `CAMERA_POST_PROCESS_SETTINGS_SCREEN_SPACE_REFLECTION_MAX_ROUGHNESS`: `InterchangePropertyTracks = Ellipsis` — 287
  - `CAMERA_POST_PROCESS_SETTINGS_SCREEN_SPACE_REFLECTION_QUALITY`: `InterchangePropertyTracks = Ellipsis` — 288
  - `CAMERA_POST_PROCESS_SETTINGS_SHARPEN`: `InterchangePropertyTracks = Ellipsis` — 289
  - `CAMERA_POST_PROCESS_SETTINGS_TEMPERATURE_TYPE`: `InterchangePropertyTracks = Ellipsis` — 290
  - `CAMERA_POST_PROCESS_SETTINGS_TONE_CURVE_AMOUNT`: `InterchangePropertyTracks = Ellipsis` — 291
  - `CAMERA_POST_PROCESS_SETTINGS_TRANSLUCENCY_TYPE`: `InterchangePropertyTracks = Ellipsis` — 292
  - `CAMERA_POST_PROCESS_SETTINGS_VIGNETTE_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 293
  - `CAMERA_POST_PROCESS_SETTINGS_WHITE_TEMP`: `InterchangePropertyTracks = Ellipsis` — 294
  - `CAMERA_POST_PROCESS_SETTINGS_WHITE_TINT`: `InterchangePropertyTracks = Ellipsis` — 295
  - `CAMERA_PROJECTION_MODE`: `InterchangePropertyTracks = Ellipsis` — 296
  - `CAMERA_UPDATE_ORTHO_PLANES`: `InterchangePropertyTracks = Ellipsis` — 297
  - `CAMERA_USE_CAMERA_HEIGHT_AS_VIEW_TARGET`: `InterchangePropertyTracks = Ellipsis` — 298
  - `CAMERA_USE_FIELD_OF_VIEW_FOR_LOD`: `InterchangePropertyTracks = Ellipsis` — 299
  - `CAST_CONTACT_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 13
  - `CAST_HIDDEN_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 14
  - `CAST_INSET_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 15
  - `CAST_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 16
  - `CUSTOM_DEPTH_STENCIL_VALUE`: `InterchangePropertyTracks = Ellipsis` — 17
  - `CUSTOM_DEPTH_STENCIL_WRITE_MASK`: `InterchangePropertyTracks = Ellipsis` — 18
  - `DEFAULT_UP_VECTOR`: `InterchangePropertyTracks = Ellipsis` — 19
  - `DRAW_DEBUG`: `InterchangePropertyTracks = Ellipsis` — 20
  - `EMISSIVE_LIGHT_SOURCE`: `InterchangePropertyTracks = Ellipsis` — 21
  - `EXCLUDE_FROM_LIGHT_ATTACHMENT_GROUP`: `InterchangePropertyTracks = Ellipsis` — 22
  - `HETEROGENEOUS_VOLUME_FRAME`: `InterchangePropertyTracks = Ellipsis` — Heterogeneous Volume Component Properties 318
  - `HIDDEN_IN_GAME`: `InterchangePropertyTracks = Ellipsis` — 23
  - `HIDDEN_IN_SCENE_CAPTURE`: `InterchangePropertyTracks = Ellipsis` — This visibility property is set on the Component 24
  - `HOLDOUT`: `InterchangePropertyTracks = Ellipsis` — 25
  - `LIGHTMASS_SETTINGS_LIGHT_SOURCE_ANGLE`: `InterchangePropertyTracks = Ellipsis` — 80
  - `LIGHT_AFFECT_GLOBAL_ILLUMINATION`: `InterchangePropertyTracks = Ellipsis` — Light Properties 39
  - `LIGHT_AFFECT_REFLECTION`: `InterchangePropertyTracks = Ellipsis` — 40
  - `LIGHT_AFFECT_TRANSLUCENT_LIGHTING`: `InterchangePropertyTracks = Ellipsis` — 41
  - `LIGHT_ATMOSPHERE_SUN_DISK_COLOR_SCALE`: `InterchangePropertyTracks = Ellipsis` — 42
  - `LIGHT_ATMOSPHERE_SUN_LIGHT`: `InterchangePropertyTracks = Ellipsis` — 43
  - `LIGHT_ATMOSPHERE_SUN_LIGHT_INDEX`: `InterchangePropertyTracks = Ellipsis` — 44
  - `LIGHT_ATTACHMENTS_AS_GROUP`: `InterchangePropertyTracks = Ellipsis` — 26
  - `LIGHT_ATTENUATION_RADIUS`: `InterchangePropertyTracks = Ellipsis` — 45
  - `LIGHT_BARN_DOOR_ANGLE`: `InterchangePropertyTracks = Ellipsis` — 46
  - `LIGHT_BARN_DOOR_LENGTH`: `InterchangePropertyTracks = Ellipsis` — 47
  - `LIGHT_BLOOM_MAX_BRIGHTNESS`: `InterchangePropertyTracks = Ellipsis` — 48
  - `LIGHT_BLOOM_SCALE`: `InterchangePropertyTracks = Ellipsis` — 49
  - `LIGHT_BLOOM_THRESHOLD`: `InterchangePropertyTracks = Ellipsis` — 50
  - `LIGHT_BLOOM_TINT`: `InterchangePropertyTracks = Ellipsis` — 51
  - `LIGHT_CASCADE_DISTRIBUTION_EXPONENT`: `InterchangePropertyTracks = Ellipsis` — 52
  - `LIGHT_CASCADE_TRANSITION_FRACTION`: `InterchangePropertyTracks = Ellipsis` — 53
  - `LIGHT_CAST_DEEP_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 54
  - `LIGHT_CAST_SHADOWS`: `InterchangePropertyTracks = Ellipsis` — 55
  - `LIGHT_CAST_VOLUMETRIC_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 56
  - `LIGHT_CLOUD_AMBIENT_OCCLUSION_STRENGTH`: `InterchangePropertyTracks = Ellipsis` — 57
  - `LIGHT_CLOUD_SCATTERED_LUMINANCE_SCALE`: `InterchangePropertyTracks = Ellipsis` — 58
  - `LIGHT_CLOUD_SHADOW_ON_ATMOSPHERE_STRENGTH`: `InterchangePropertyTracks = Ellipsis` — 59
  - `LIGHT_CLOUD_SHADOW_ON_SURFACE_STRENGTH`: `InterchangePropertyTracks = Ellipsis` — 60
  - `LIGHT_CLOUD_SHADOW_STRENGTH`: `InterchangePropertyTracks = Ellipsis` — 61
  - `LIGHT_COLOR`: `InterchangePropertyTracks = Ellipsis` — 62
  - `LIGHT_DIFFUSE_SCALE`: `InterchangePropertyTracks = Ellipsis` — 105
  - `LIGHT_DYNAMIC_SHADOW_CASCADES`: `InterchangePropertyTracks = Ellipsis` — 63
  - `LIGHT_DYNAMIC_SHADOW_DISTANCE_MOVABLE_LIGHT`: `InterchangePropertyTracks = Ellipsis` — 64
  - `LIGHT_DYNAMIC_SHADOW_DISTANCE_STATIONARY_LIGHT`: `InterchangePropertyTracks = Ellipsis` — 65
  - `LIGHT_ENABLE_LIGHT_SHAFT_BLOOM`: `InterchangePropertyTracks = Ellipsis` — 66
  - `LIGHT_ENABLE_LIGHT_SHAFT_OCCLUSION`: `InterchangePropertyTracks = Ellipsis` — 67
  - `LIGHT_FALLOFF_EXPONENT`: `InterchangePropertyTracks = Ellipsis` — 68
  - `LIGHT_FORCE_CACHED_SHADOWS_FOR_MOVABLE_PRIMITIVES`: `InterchangePropertyTracks = Ellipsis` — 69
  - `LIGHT_FORWARD_SHADING_PRIORITY`: `InterchangePropertyTracks = Ellipsis` — 70
  - `LIGHT_FUNCTION_FADE_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 71
  - `LIGHT_FUNCTION_SCALE`: `InterchangePropertyTracks = Ellipsis` — 72
  - `LIGHT_IES_BRIGHTNESS_SCALE`: `InterchangePropertyTracks = Ellipsis` — 73
  - `LIGHT_INDIRECT_LIGHTING_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 74
  - `LIGHT_INNER_CONE_ANGLE`: `InterchangePropertyTracks = Ellipsis` — 75
  - `LIGHT_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 76
  - `LIGHT_INTENSITY_UNITS`: `InterchangePropertyTracks = Ellipsis` — 77
  - `LIGHT_INVERSE_EXPOSURE_BLEND`: `InterchangePropertyTracks = Ellipsis` — 78
  - `LIGHT_LOWER_HEMISPHERE_COLOR`: `InterchangePropertyTracks = Ellipsis` — 79
  - `LIGHT_MIN_OCCLUSION`: `InterchangePropertyTracks = Ellipsis` — 81
  - `LIGHT_MODULATED_SHADOW_COLOR`: `InterchangePropertyTracks = Ellipsis` — 82
  - `LIGHT_OCCLUSION_DEPTH_RANGE`: `InterchangePropertyTracks = Ellipsis` — 83
  - `LIGHT_OCCLUSION_EXPONENT`: `InterchangePropertyTracks = Ellipsis` — 84
  - `LIGHT_OCCLUSION_MASK_DARKNESS`: `InterchangePropertyTracks = Ellipsis` — 85
  - `LIGHT_OCCLUSION_TINT`: `InterchangePropertyTracks = Ellipsis` — 86
  - `LIGHT_OUTER_CONE_ANGLE`: `InterchangePropertyTracks = Ellipsis` — 87
  - `LIGHT_SAMPLES_PER_PIXEL`: `InterchangePropertyTracks = Ellipsis` — 88
  - `LIGHT_SHADOW_AMOUNT`: `InterchangePropertyTracks = Ellipsis` — 89
  - `LIGHT_SHADOW_BIAS`: `InterchangePropertyTracks = Ellipsis` — 90
  - `LIGHT_SHADOW_CASCADE_BIAS_DISTRIBUTION`: `InterchangePropertyTracks = Ellipsis` — 91
  - `LIGHT_SHADOW_DISTANCE_FADEOUT_FRACTION`: `InterchangePropertyTracks = Ellipsis` — 92
  - `LIGHT_SHADOW_SLOPE_BIAS`: `InterchangePropertyTracks = Ellipsis` — 93
  - `LIGHT_SHADOW_SOURCE_ANGLE_FACTOR`: `InterchangePropertyTracks = Ellipsis` — 94
  - `LIGHT_SHAFT_OVERRIDE_DIRECTION`: `InterchangePropertyTracks = Ellipsis` — 95
  - `LIGHT_SOFT_SOURCE_RADIUS`: `InterchangePropertyTracks = Ellipsis` — 96
  - `LIGHT_SOURCE_ANGLE`: `InterchangePropertyTracks = Ellipsis` — 97
  - `LIGHT_SOURCE_CUBEMAP_ANGLE`: `InterchangePropertyTracks = Ellipsis` — 98
  - `LIGHT_SOURCE_HEIGHT`: `InterchangePropertyTracks = Ellipsis` — 99
  - `LIGHT_SOURCE_LENGTH`: `InterchangePropertyTracks = Ellipsis` — 100
  - `LIGHT_SOURCE_RADIUS`: `InterchangePropertyTracks = Ellipsis` — 101
  - `LIGHT_SOURCE_SOFT_ANGLE`: `InterchangePropertyTracks = Ellipsis` — 102
  - `LIGHT_SOURCE_WIDTH`: `InterchangePropertyTracks = Ellipsis` — 103
  - `LIGHT_SPECULAR_SCALE`: `InterchangePropertyTracks = Ellipsis` — 104
  - `LIGHT_TEMPERATURE`: `InterchangePropertyTracks = Ellipsis` — 106
  - `LIGHT_TRANSMISSION`: `InterchangePropertyTracks = Ellipsis` — 107
  - `LIGHT_USE_IES_BRIGHTNESS`: `InterchangePropertyTracks = Ellipsis` — 108
  - `LIGHT_USE_INVERSE_SQUARED_FALLOFF`: `InterchangePropertyTracks = Ellipsis` — 109
  - `LIGHT_USE_TEMPERATURE`: `InterchangePropertyTracks = Ellipsis` — 110
  - `LIGHT_VOLUMETRIC_SCATTERING_INTENSITY`: `InterchangePropertyTracks = Ellipsis` — 111
  - `MESH_OVERLAY_MATERIAL_MAX_DRAW_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — Common Mesh Properties 300
  - `MOBILITY`: `InterchangePropertyTracks = Ellipsis` — 27
  - `ONLY_OWNER_SEE`: `InterchangePropertyTracks = Ellipsis` — 28
  - `OWNER_NO_SEE`: `InterchangePropertyTracks = Ellipsis` — 29
  - `RECEIVES_DECALS`: `InterchangePropertyTracks = Ellipsis` — 30
  - `RENDER_CUSTOM_DEPTH`: `InterchangePropertyTracks = Ellipsis` — 31
  - `RENDER_IN_DEPTH_PASS`: `InterchangePropertyTracks = Ellipsis` — 32
  - `RENDER_IN_MAIN_PASS`: `InterchangePropertyTracks = Ellipsis` — 33
  - `SINGLE_SAMPLE_SHADOW_FROM_STATIONARY_LIGHTS`: `InterchangePropertyTracks = Ellipsis` — 34
  - `SKELETAL_MESH`: `InterchangePropertyTracks = Ellipsis` — Skeletal Mesh Properties 306
  - `SKELETAL_MESH_ALLOW_CLOTH_ACTORS`: `InterchangePropertyTracks = Ellipsis` — 307
  - `SKELETAL_MESH_ANIMATION_MODE`: `InterchangePropertyTracks = Ellipsis` — 308
  - `SKELETAL_MESH_CLOTH_BLEND_WEIGHT`: `InterchangePropertyTracks = Ellipsis` — 309
  - `SKELETAL_MESH_CLOTH_MAX_DISTANCE_SCALE`: `InterchangePropertyTracks = Ellipsis` — 310
  - `SKINNED_MESH_CAPSULE_INDIRECT_SHADOW_MIN_VISIBILITY`: `InterchangePropertyTracks = Ellipsis` — Skinned Mesh Properties 301
  - `SKINNED_MESH_CAST_CAPSULE_DIRECT_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 302
  - `SKINNED_MESH_CAST_CAPSULE_INDIRECT_SHADOW`: `InterchangePropertyTracks = Ellipsis` — 303
  - `SKINNED_MESH_RENDER_STATIC`: `InterchangePropertyTracks = Ellipsis` — 304
  - `SKINNED_MESH_VISIBILITY_BASED_ANIM_TICK_OPTION`: `InterchangePropertyTracks = Ellipsis` — 305
  - `STATIC_MESH`: `InterchangePropertyTracks = Ellipsis` — 317
  - `STATIC_MESH_DISTANCE_FIELD_SELF_SHADOW_BIAS`: `InterchangePropertyTracks = Ellipsis` — Static Mesh Properties 311
  - `STATIC_MESH_EVALUATE_WORLD_POSITION_OFFSET`: `InterchangePropertyTracks = Ellipsis` — 312
  - `STATIC_MESH_EVALUATE_WORLD_POSITION_OFFSET_IN_RAY_TRACING`: `InterchangePropertyTracks = Ellipsis` — 313
  - `STATIC_MESH_FORCED_LOD_MODEL`: `InterchangePropertyTracks = Ellipsis` — 314
  - `STATIC_MESH_REVERSE_CULLING`: `InterchangePropertyTracks = Ellipsis` — 315
  - `STATIC_MESH_WORLD_POSITION_OFFSET_DISABLE_DISTANCE`: `InterchangePropertyTracks = Ellipsis` — 316
  - `TRANSLUCENCY_SORT_DISTANCE_OFFSET`: `InterchangePropertyTracks = Ellipsis` — 35
  - `VISIBLE_IN_RAY_TRACING`: `InterchangePropertyTracks = Ellipsis` — 36
  - `VISIBLE_IN_SCENE_CAPTURE_ONLY`: `InterchangePropertyTracks = Ellipsis` — 37

### `unreal.InterchangeTextureColorSpace`
Inherits: `EnumBase` | Header: `InterchangeTextureNode.h`

EInterchange Texture Color Space

**Properties** (15):
  - `TCS_ACESAP0`: `InterchangeTextureColorSpace = Ellipsis` — ACES AP0 wide gamut primaries, with D60 white point. 3
  - `TCS_ACESAP1`: `InterchangeTextureColorSpace = Ellipsis` — ACES AP1 / ACEScg wide gamut primaries, with D60 white point. 4
  - `TCS_ALEXA_WIDE_GAMUT`: `InterchangeTextureColorSpace = Ellipsis` — Alexa Wide Gamut primaries, with D65 white point. 10
  - `TCS_CANON_CINEMA_GAMUT`: `InterchangeTextureColorSpace = Ellipsis` — Canon Cinema Gamut primaries, with D65 white point. 11
  - `TCS_CUSTOM`: `InterchangeTextureColorSpace = Ellipsis` — User defined color space and white point. 99
  - `TCS_GO_PRO_PROTUNE_NATIVE`: `InterchangeTextureColorSpace = Ellipsis` — GoPro Protune Native primaries, with D65 white point. 12
  - `TCS_NONE`: `InterchangeTextureColorSpace = Ellipsis` — No explicit color space definition. 0
  - `TCS_P3D65`: `InterchangeTextureColorSpace = Ellipsis` — P3 (Display) primaries, with D65 white point. 6
  - `TCS_P3DCI`: `InterchangeTextureColorSpace = Ellipsis` — P3 (Theater) primaries, with DCI Calibration white point. 5
  - `TCS_PANASONIC_V_GAMUT`: `InterchangeTextureColorSpace = Ellipsis` — Panasonic V-Gamut primaries, with D65 white point. 13
  - `TCS_REC2020`: `InterchangeTextureColorSpace = Ellipsis` — Rec2020 (BT.2020) primaries with D65 white point. 2
  - `TCS_RED_WIDE_GAMUT`: `InterchangeTextureColorSpace = Ellipsis` — RED Wide Gamut primaries, with D65 white point. 7
  - `TCS_SONY_S_GAMUT3`: `InterchangeTextureColorSpace = Ellipsis` — Sony S-Gamut/S-Gamut3 primaries, with D65 white point. 8
  - `TCS_SONY_S_GAMUT3_CINE`: `InterchangeTextureColorSpace = Ellipsis` — Sony S-Gamut3 Cine primaries, with D65 white point. 9
  - `TCS_S_RGB`: `InterchangeTextureColorSpace = Ellipsis` — sRGB / Rec709 (BT.709) color primaries, with D65 white point. 1

### `unreal.InterchangeTextureFilterMode`
Inherits: `EnumBase` | Header: `InterchangeTextureNode.h`

EInterchange Texture Filter Mode

**Properties** (4):
  - `BILINEAR`: `InterchangeTextureFilterMode = Ellipsis` — 1
  - `DEFAULT`: `InterchangeTextureFilterMode = Ellipsis` — Use setting from the Texture Group. 3
  - `NEAREST`: `InterchangeTextureFilterMode = Ellipsis` — 0
  - `TRILINEAR`: `InterchangeTextureFilterMode = Ellipsis` — 2

### `unreal.InterchangeTextureWrapMode`
Inherits: `EnumBase` | Header: `InterchangeTextureNode.h`

ns UE

**Properties** (3):
  - `CLAMP`: `InterchangeTextureWrapMode = Ellipsis` — 1
  - `MIRROR`: `InterchangeTextureWrapMode = Ellipsis` — 2
  - `WRAP`: `InterchangeTextureWrapMode = Ellipsis` — 0

### `unreal.VolumeGridElementType`
Inherits: `EnumBase` | Header: `InterchangeVolumeNode.h`

EVolume Grid Element Type

**Properties** (4):
  - `DOUBLE`: `VolumeGridElementType = Ellipsis` — 3
  - `FLOAT`: `VolumeGridElementType = Ellipsis` — 2
  - `HALF`: `VolumeGridElementType = Ellipsis` — 1
  - `UNKNOWN`: `VolumeGridElementType = Ellipsis` — 0
