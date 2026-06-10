# UE Python API — InterchangeFactoryNodes Module

**45 types** from the `InterchangeFactoryNodes` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangeActorFactoryNode`, `InterchangeAnimSequenceFactoryNode`, `InterchangeBaseLightFactoryNode`, `InterchangeBaseMaterialFactoryNode`, `InterchangeCommonPipelineDataFactoryNode`, `InterchangeDecalActorFactoryNode`, `InterchangeDecalMaterialFactoryNode`, `InterchangeDirectionalLightFactoryNode`, `InterchangeGeometryCacheFactoryNode`, `InterchangeHeterogeneousVolumeActorFactoryNode`, `InterchangeLevelFactoryNode`, `InterchangeLevelInstanceActorFactoryNode`, `InterchangeLevelSequenceFactoryNode`, `InterchangeLightFactoryNode`, `InterchangeMaterialExpressionFactoryNode`, `InterchangeMaterialFactoryNode`, `InterchangeMaterialFunctionCallExpressionFactoryNode`, `InterchangeMaterialFunctionFactoryNode`, `InterchangeMaterialInstanceFactoryNode`, `InterchangeMaterialReferenceFactoryNode`, ... (45 total)

---

## Classes

### `unreal.InterchangeActorFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeActorFactoryNode.h`

Interchange Actor Factory Node

**Methods** (12):
  - `get_custom_actor_class_name()` -> `str or None` — Get Custom Actor Class Name
  - `get_custom_actor_visibility()` -> `bool or None` — Get Custom Actor Visibility
  - `get_custom_component_visibility()` -> `bool or None` — Get Custom Component Visibility
  - `get_custom_global_transform()` -> `Transform or None` — Get Custom Global Transform
  - `get_custom_local_transform()` -> `Transform or None` — Get Custom Local Transform
  - `get_custom_mobility()` -> `uint8 or None` — Get Custom Mobility
  - `set_custom_actor_class_name(attribute_value)` -> `bool` — Set Custom Actor Class Name
  - `set_custom_actor_visibility(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Actor Visibility
  - `set_custom_component_visibility(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Component Visibility
  - `set_custom_global_transform(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Global Transform
  - `set_custom_local_transform(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Local Transform
  - `set_custom_mobility(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Mobility

### `unreal.InterchangeAnimSequenceFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeAnimSequenceFactoryNode.h`

Interchange Anim Sequence Factory Node

**Methods** (48):
  - `get_animated_attribute_curve_name(index)` -> `str` — Get the animated attribute curve name at the specified index.
  - `get_animated_attribute_curve_names()` -> `Array [ str ]` — Get all animated attribute curve names.
  - `get_animated_attribute_curve_names_count()` -> `int32` — Return the number of animated attribute curve names this anim sequence drives. Curves are FRichCurve of type float.
  - `get_animated_attribute_step_curve_name(index)` -> `str` — Get the animated attribute step curve name at the specified index.
  - `get_animated_attribute_step_curve_names()` -> `Array [ str ]` — Get all animated attribute step curve names.
  - `get_animated_attribute_step_curve_names_count()` -> `int32` — Return the number of animated attribute step curve names this anim sequence drives.
  - `get_animated_material_curve_suffixe(index)` -> `str` — Get the animated material curve suffix with the specified index.
  - `get_animated_material_curve_suffixes()` -> `Array [ str ]` — Get all animated material curve suffixes.
  - `get_animated_material_curve_suffixes_count()` -> `int32` — Return the number of animated material curve suffixes this anim sequence drives. Curves are FRichCurve of type float.
  - `get_custom_add_curve_metadata_to_skeleton()` -> `bool or None` — Get the custom attribute AddCurveMetadataToSkeleton. Return false if the attribute is not set. Note - If this setting is...
  - `get_custom_delete_existing_custom_attribute_curves()` -> `bool or None` — Get the custom attribute DeleteExistingCustomAttributeCurves. Return false if the attribute is not set. Note - If true, ...
  - `get_custom_delete_existing_morph_target_curves()` -> `bool or None` — Get the custom attribute DeleteExistingMorphTargetCurves. Return false if the attribute is not set. Note: If true, all p...
  - `get_custom_delete_existing_non_curve_custom_attributes()` -> `bool or None` — Get the custom attribute DeleteExistingNonCurveCustomAttributes. Return false if the attribute is not set. Note - If tru...
  - `get_custom_do_not_import_curve_with_zero()` -> `bool or None` — Get the custom attribute DoNotImportCurveWithZero. Return false if the attribute is not set. Note - If this attribute is...
  - `get_custom_import_attribute_curves()` -> `bool or None` — Get the import attribute curves state. If true, all user custom attributes on nodes are imported. Return false if the at...
  - `get_custom_import_bone_tracks()` -> `bool or None` — Get the import bone tracks state. If the attribute is true, bone tracks are imported. If the attribute is false, bone tr...
  - `get_custom_import_bone_tracks_range_start()` -> `double or None` — Get the import bone tracks start time in seconds. Return false if the attribute is not set.
  - `get_custom_import_bone_tracks_range_stop()` -> `double or None` — Get the import bone tracks end time in seconds. Return false if the attribute is not set.
  - `get_custom_import_bone_tracks_sample_rate()` -> `double or None` — Get the import bone tracks sample rate. Return false if the attribute is not set.
  - `get_custom_material_drive_parameter_on_custom_attribute()` -> `bool or None` — Get the custom attribute MaterialDriveParameterOnCustomAttribute. Return false if the attribute is not set. Note: If tru...
  - `get_custom_remove_curve_redundant_keys()` -> `bool or None` — Get the custom attribute RemoveCurveRedundantKeys. Return false if the attribute is not set.
  - `get_custom_skeleton_factory_node_uid()` -> `str or None` — Get the unique ID of the skeleton factory node. Return false if the attribute is not set.
  - `get_custom_skeleton_soft_object_path()` -> `SoftObjectPath or None` — Query the optional existing USkeleton this animation must use. If this attribute is set and the skeleton is valid, the A...
  - `get_morph_target_node_animation_payload_keys()` -> `Map [ str , InterchangeAnimationPayLoadKey ]` — Get Morph Target Node Animation Payload Keys
  - `get_scene_node_animation_payload_keys()` -> `Map [ str , InterchangeAnimationPayLoadKey ]` — Get Scene Node Animation Payload Keys
  - `initialize_anim_sequence_node(unique_id, display_label)` -> `None` — Initialize node data.
  - `remove_animated_attribute_curve_name(attribute_curve_name)` -> `bool` — Remove the specified animated attribute curve name.
  - `remove_animated_attribute_step_curve_name(attribute_step_curve_name)` -> `bool` — Remove the specified animated attribute step curve name.
  - `remove_animated_material_curve_suffixe(material_curve_suffixe)` -> `bool` — Remove the specified animated material curve suffix.
  - `set_animated_attribute_curve_name(attribute_curve_name)` -> `bool` — Add an animated attribute curve name.
  - `set_animated_attribute_step_curve_name(attribute_step_curve_name)` -> `bool` — Add an animated attribute step curve name.
  - `set_animated_material_curve_suffixe(material_curve_suffixe)` -> `bool` — Add an animated material curve suffix.
  - `set_animation_payload_keys_for_morph_target_node_uids(morph_target_animation_payload_key_uids, morph_target_animation_payload_key_types)` -> `None` — Set Animation Payload Keys for Morph Target Node Uids
  - `set_animation_payload_keys_for_scene_node_uids(scene_node_animation_payload_key_uids, scene_node_animation_payload_key_types)` -> `None` — Set Animation Payload Keys for Scene Node Uids
  - `set_custom_add_curve_metadata_to_skeleton(attribute_value)` -> `bool` — Set the custom attribute AddCurveMetadataToSkeleton. Return false if the attribute could not be set. Note - If this sett...
  - `set_custom_delete_existing_custom_attribute_curves(attribute_value)` -> `bool` — Set the custom attribute DeleteExistingCustomAttributeCurves. Return false if the attribute could not be set. Note - If ...
  - `set_custom_delete_existing_morph_target_curves(attribute_value)` -> `bool` — Set the custom attribute DeleteExistingMorphTargetCurves. Return false if the attribute could not be set. Note: If true,...
  - `set_custom_delete_existing_non_curve_custom_attributes(attribute_value)` -> `bool` — Set the custom attribute DeleteExistingNonCurveCustomAttributes. Return false if the attribute could not be set. Note - ...
  - `set_custom_do_not_import_curve_with_zero(attribute_value)` -> `bool` — Set the custom attribute DoNotImportCurveWithZero. Return false if the attribute could not be set. Note - If this attrib...
  - `set_custom_import_attribute_curves(attribute_value)` -> `bool` — Set the import attribute curves state. Return false if the attribute could not be set.
  - `set_custom_import_bone_tracks(attribute_value)` -> `bool` — Set the import bone tracks state. Pass true to import bone tracks, or false to not import bone tracks.
  - `set_custom_import_bone_tracks_range_start(attribute_value)` -> `bool` — Set the import bone tracks start time in seconds. Return false if the attribute could not be set.
  - `set_custom_import_bone_tracks_range_stop(attribute_value)` -> `bool` — Set the import bone tracks end time in seconds. Return false if the attribute could not be set.
  - `set_custom_import_bone_tracks_sample_rate(attribute_value)` -> `bool` — Set the import bone tracks sample rate. Return false if the attribute could not be set.
  - `set_custom_material_drive_parameter_on_custom_attribute(attribute_value)` -> `bool` — Set the custom attribute MaterialDriveParameterOnCustomAttribute. Return false if the attribute could not be set. Note: ...
  - `set_custom_remove_curve_redundant_keys(attribute_value)` -> `bool` — Set the custom attribute RemoveCurveRedundantKeys. Return false if the attribute could not be set.
  - `set_custom_skeleton_factory_node_uid(attribute_value)` -> `bool` — Set the unique ID of the skeleton factory node. Return false if the attribute cannot be set.
  - `set_custom_skeleton_soft_object_path(attribute_value)` -> `bool` — Set the optional existing USkeleton this animation must use. If this attribute is set and the skeleton is valid, the Ani...

### `unreal.InterchangeBaseLightFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeLightFactoryNode.h`

Interchange Base Light Factory Node

**Methods** (8):
  - `get_custom_intensity()` -> `float or None` — Get Custom Intensity
  - `get_custom_light_color()` -> `Color or None` — Get Custom Light Color
  - `get_custom_temperature()` -> `float or None` — Get Custom Temperature
  - `get_custom_use_temperature()` -> `bool or None` — Get Custom Use Temperature
  - `set_custom_intensity(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Intensity
  - `set_custom_light_color(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Light Color
  - `set_custom_temperature(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Temperature
  - `set_custom_use_temperature(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Use Temperature

### `unreal.InterchangeBaseMaterialFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeMaterialFactoryNode.h`

Interchange Base Material Factory Node

**Methods** (2):
  - `get_custom_is_material_import_enabled()` -> `bool or None` — Get Custom Is Material Import Enabled
  - `set_custom_is_material_import_enabled(attribute_value)` -> `bool` — Set Custom Is Material Import Enabled

### `unreal.InterchangeCommonPipelineDataFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeCommonPipelineDataFactoryNode.h`

This factory node is where pipelines can set global data that can be used by factories.

**Methods** (6):
  - `get_bake_meshes()` -> `bool or None` — Return the value of the Bake Meshes setting set by the pipelines.
  - `get_bake_pivot_meshes()` -> `bool or None` — Return the value of the Bake Meshes setting set by the pipelines.
  - `get_custom_global_offset_transform()` -> `Transform or None` — Return the global offset transform set by the pipelines.
  - `set_bake_meshes(attribute_value)` -> `bool` — Pipelines can set this Bake Meshes setting. Factories use this to identify whether they should apply global transforms t...
  - `set_bake_pivot_meshes(attribute_value)` -> `bool` — Pipelines can set this Bake Meshes setting. Factories use this to identify whether they should apply global transforms t...
  - `set_custom_global_offset_transform(node_container, attribute_value)` -> `bool` — Pipelines can set a global transform. Factories will use this global offset when importing assets.

### `unreal.InterchangeDecalActorFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeDecalActorFactoryNode.h`

Interchange Decal Actor Factory Node

**Methods** (6):
  - `get_custom_decal_material_path_name()` -> `str or None` — Get Custom Decal Material Path Name
  - `get_custom_decal_size()` -> `Vector or None` — Get Custom Decal Size
  - `get_custom_sort_order()` -> `int32 or None` — Get Custom Sort Order
  - `set_custom_decal_material_path_name(attribute_value)` -> `bool` — Set Custom Decal Material Path Name
  - `set_custom_decal_size(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Decal Size
  - `set_custom_sort_order(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Sort Order

### `unreal.InterchangeDecalMaterialFactoryNode`
Inherits: `InterchangeBaseMaterialFactoryNode` | Header: `InterchangeDecalMaterialFactoryNode.h`

Interchange Decal Material Factory Node

**Methods** (4):
  - `get_custom_diffuse_texture_path()` -> `str or None` — Get Custom Diffuse Texture Path
  - `get_custom_normal_texture_path()` -> `str or None` — Get Custom Normal Texture Path
  - `set_custom_diffuse_texture_path(attribute_value)` -> `bool` — Set Custom Diffuse Texture Path
  - `set_custom_normal_texture_path(attribute_value)` -> `bool` — Set Custom Normal Texture Path

### `unreal.InterchangeDirectionalLightFactoryNode`
Inherits: `InterchangeBaseLightFactoryNode` | Header: `InterchangeLightFactoryNode.h`

Interchange Directional Light Factory Node

### `unreal.InterchangeGeometryCacheFactoryNode`
Inherits: `InterchangeMeshFactoryNode` | Header: `InterchangeGeometryCacheFactoryNode.h`

Interchange Geometry Cache Factory Node

**Methods** (19):
  - `get_custom_apply_constant_topology_optimization()` -> `bool or None` — Get whether constant topology optimization is applied
  - `get_custom_end_frame()` -> `int32 or None` — Get the end frame index of the animation
  - `get_custom_flatten_tracks()` -> `bool or None` — Get whether to merge all geometries into a single mesh
  - `get_custom_motion_vectors_import()` -> `InterchangeMotionVectorsHandling or None` — Get how the motion vectors are managed
  - `get_custom_num_bits_for_u_vs()` -> `int32 or None` — Get the number of bits for compressing the UV into
  - `get_custom_optimize_index_buffers()` -> `bool or None` — Get whether to optimize the index buffers when building the geometry cache
  - `get_custom_position_precision()` -> `float or None` — Get the precision used for compressing vertex positions
  - `get_custom_start_frame()` -> `int32 or None` — Get the start frame index of the animation
  - `get_custom_store_imported_vertex_numbers()` -> `bool or None` — Get whether vertex numbers from DCC are stored in the geometry cache
  - `initialize_geometry_cache_node(unique_id, display_label, asset_class)` -> `None` — Initialize node data.
  - `set_custom_apply_constant_topology_optimization(attribute_value)` -> `bool` — Get whether constant topology optimization is applied
  - `set_custom_end_frame(attribute_value)` -> `bool` — Set the end frame index of the animation
  - `set_custom_flatten_tracks(attribute_value)` -> `bool` — Set whether to merge all geometries into a single mesh
  - `set_custom_motion_vectors_import(attribute_value)` -> `bool` — Set how the motion vectors are managed
  - `set_custom_num_bits_for_u_vs(attribute_value)` -> `bool` — Set the number of bits for compressing the UV into
  - `set_custom_optimize_index_buffers(attribute_value)` -> `bool` — Set whether to optimize the index buffers when building the geometry cache
  - `set_custom_position_precision(attribute_value)` -> `bool` — Set the precision used for compressing vertex positions
  - `set_custom_start_frame(attribute_value)` -> `bool` — Set the start frame index of the animation
  - `set_custom_store_imported_vertex_numbers(attribute_value)` -> `bool` — Set whether vertex numbers from DCC are stored in the geometry cache

### `unreal.InterchangeHeterogeneousVolumeActorFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeHeterogeneousVolumeActorFactoryNode.h`

Interchange Heterogeneous Volume Actor Factory Node

**Methods** (2):
  - `get_custom_volumetric_material_uid()` -> `str or None` — Gets the Uid of the material that should be assigned to the spawned HeterogeneousVolumeActor at its single material slot
  - `set_custom_volumetric_material_uid(material_factory_node_uid)` -> `bool` — Sets the Uid of the material that should be assigned to the spawned HeterogeneousVolumeActor at its single material slot

### `unreal.InterchangeLevelFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeLevelFactoryNode.h`

Interchange Level Factory Node

**Methods** (11):
  - `add_custom_actor_factory_node_uid(actor_factory_node_uid)` -> `bool` — Add one actor factory node unique id to this object.
  - `get_custom_actor_factory_node_uid(index)` -> `str` — This function allow to retrieve one actor factory node unique id for this object.
  - `get_custom_actor_factory_node_uid_count()` -> `int32` — This function allow to retrieve the number of track dependencies for this object.
  - `get_custom_actor_factory_node_uids()` -> `Array [ str ]` — This function allow to retrieve all actor factory node unique id for this object.
  - `get_custom_create_world_partition_level()` -> `bool or None` — If true, created world partition level.
  - `get_custom_scene_import_asset_factory_node_uid()` -> `str or None` — Get the actor factory node unique id that hold the re-import data.
  - `get_custom_should_create_level()` -> `bool or None` — Get actors bounding box.
  - `remove_custom_actor_factory_node_uid(actor_factory_node_uid)` -> `bool` — Remove one actor factory node unique id from this object.
  - `set_custom_create_world_partition_level(attribute_value)` -> `bool` — If true, created world partition level.
  - `set_custom_scene_import_asset_factory_node_uid(attribute_value)` -> `bool` — Set the actor factory node unique id that hold the re-import data.
  - `set_custom_should_create_level(attribute_value)` -> `bool` — Set actors bounding box.

### `unreal.InterchangeLevelInstanceActorFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeLevelInstanceActorFactoryNode.h`

Interchange Level Instance Actor Factory Node

**Methods** (2):
  - `get_custom_level_reference()` -> `str or None` — Get the Level this Level instance actor refer to.
  - `set_custom_level_reference(attribute_value)` -> `bool` — Set the Level this Level instance actor refer to.

### `unreal.InterchangeLevelSequenceFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeLevelSequenceFactoryNode.h`

Interchange Level Sequence Factory Node

**Methods** (7):
  - `add_custom_animation_track_uid(animation_track_uid)` -> `bool` — Add one track dependency to this object.
  - `get_custom_animation_track_uid(index)` -> `str` — This function allow to retrieve one track dependency for this object.
  - `get_custom_animation_track_uid_count()` -> `int32` — This function allow to retrieve the number of track dependencies for this object.
  - `get_custom_animation_track_uids()` -> `Array [ str ]` — This function allow to retrieve the track dependency for this object.
  - `get_custom_frame_rate()` -> `float or None` — Get the frame rate for the animations in the level sequence.
  - `remove_custom_animation_track_uid(animation_track_uid)` -> `bool` — Remove one track dependency from this object.
  - `set_custom_frame_rate(attribute_value)` -> `bool` — Set the frame rate for the animations in the level sequence.

### `unreal.InterchangeLightFactoryNode`
Inherits: `InterchangeBaseLightFactoryNode` | Header: `InterchangeLightFactoryNode.h`

Interchange Light Factory Node

**Methods** (12):
  - `get_custom_attenuation_radius()` -> `float or None` — Get Custom Attenuation Radius
  - `get_custom_ies_brightness_scale()` -> `float or None` — Get Custom IESBrightness Scale
  - `get_custom_ies_texture()` -> `str or None` — Get Custom IESTexture
  - `get_custom_intensity_units()` -> `LightUnits or None` — Get Custom Intensity Units
  - `get_custom_rotation()` -> `Rotator or None` — Get Custom Rotation
  - `get_custom_use_ies_brightness()` -> `bool or None` — Get Custom Use IESBrightness
  - `set_custom_attenuation_radius(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Attenuation Radius
  - `set_custom_ies_brightness_scale(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom IESBrightness Scale
  - `set_custom_ies_texture(attribute_value)` -> `bool` — Set Custom IESTexture
  - `set_custom_intensity_units(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Intensity Units
  - `set_custom_rotation(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Rotation
  - `set_custom_use_ies_brightness(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Use IESBrightness

### `unreal.InterchangeMaterialExpressionFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeMaterialFactoryNode.h`

Interchange Material Expression Factory Node

**Methods** (2):
  - `get_custom_expression_class_name()` -> `str or None` — Get Custom Expression Class Name
  - `set_custom_expression_class_name(attribute_value)` -> `bool` — Set Custom Expression Class Name

### `unreal.InterchangeMaterialFactoryNode`
Inherits: `InterchangeBaseMaterialFactoryNode` | Header: `InterchangeMaterialFactoryNode.h`

Interchange Material Factory Node

**Methods** (76):
  - `connect_output_to_anisotropy(expression_node_uid, output_name)` -> `bool` — Connect Output to Anisotropy
  - `connect_output_to_base_color(expression_node_uid, output_name)` -> `bool` — Connect Output to Base Color
  - `connect_output_to_clear_coat(expression_node_uid, output_name)` -> `bool` — Connect Output to Clear Coat
  - `connect_output_to_clear_coat_normal(expression_node_uid, output_name)` -> `bool` — Connect Output to Clear Coat Normal
  - `connect_output_to_clear_coat_roughness(expression_node_uid, output_name)` -> `bool` — Connect Output to Clear Coat Roughness
  - `connect_output_to_cloth(expression_node_uid, output_name)` -> `bool` — Connect Output to Cloth
  - `connect_output_to_displacement(expression_node_uid, output_name)` -> `bool` — Connect Output to Displacement
  - `connect_output_to_emissive_color(expression_node_uid, output_name)` -> `bool` — Connect Output to Emissive Color
  - `connect_output_to_fuzz_color(expression_node_uid, output_name)` -> `bool` — Connect Output to Fuzz Color
  - `connect_output_to_metallic(expression_node_uid, output_name)` -> `bool` — Connect Output to Metallic
  - `connect_output_to_normal(expression_node_uid, output_name)` -> `bool` — Connect Output to Normal
  - `connect_output_to_occlusion(expression_node_uid, output_name)` -> `bool` — Connect Output to Occlusion
  - `connect_output_to_opacity(expression_node_uid, output_name)` -> `bool` — Connect Output to Opacity
  - `connect_output_to_refraction(expression_node_uid, output_name)` -> `bool` — Connect Output to Refraction
  - `connect_output_to_roughness(expression_node_uid, output_name)` -> `bool` — Connect Output to Roughness
  - `connect_output_to_specular(expression_node_uid, output_name)` -> `bool` — Connect Output to Specular
  - `connect_output_to_subsurface(expression_node_uid, output_name)` -> `bool` — Connect Output to Subsurface
  - `connect_output_to_surface_coverage(expression_node_uid, output_name)` -> `bool` — Connect Output to Surface Coverage
  - `connect_output_to_tangent(expression_node_uid, output_name)` -> `bool` — Connect Output to Tangent
  - `connect_output_to_transmission_color(expression_node_uid, output_name)` -> `bool` — Connect Output to Transmission Color
  - `connect_to_anisotropy(expression_node_uid)` -> `bool` — Connect to Anisotropy
  - `connect_to_base_color(attribute_value)` -> `bool` — Connect to Base Color
  - `connect_to_clear_coat(attribute_value)` -> `bool` — Connect to Clear Coat
  - `connect_to_clear_coat_normal(attribute_value)` -> `bool` — Connect to Clear Coat Normal
  - `connect_to_clear_coat_roughness(attribute_value)` -> `bool` — Connect to Clear Coat Roughness
  - `connect_to_cloth(attribute_value)` -> `bool` — Connect to Cloth
  - `connect_to_displacement(attribute_value)` -> `bool` — Connect to Displacement
  - `connect_to_emissive_color(expression_node_uid)` -> `bool` — Connect to Emissive Color
  - `connect_to_fuzz_color(attribute_value)` -> `bool` — Connect to Fuzz Color
  - `connect_to_metallic(attribute_value)` -> `bool` — Connect to Metallic
  - `connect_to_normal(expression_node_uid)` -> `bool` — Connect to Normal
  - `connect_to_occlusion(attribute_value)` -> `bool` — Connect to Occlusion
  - `connect_to_opacity(attribute_value)` -> `bool` — Connect to Opacity
  - `connect_to_refraction(attribute_value)` -> `bool` — Connect to Refraction
  - `connect_to_roughness(expression_node_uid)` -> `bool` — Connect to Roughness
  - `connect_to_specular(expression_node_uid)` -> `bool` — Connect to Specular
  - `connect_to_subsurface(expression_node_uid)` -> `bool` — Connect to Subsurface
  - `connect_to_surface_coverage(expression_uid)` -> `bool` — Connect to Surface Coverage
  - `connect_to_tangent(expression_node_uid)` -> `bool` — Connect to Tangent
  - `connect_to_transmission_color(attribute_value)` -> `bool` — Connect to Transmission Color
  - `get_anisotropy_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Anisotropy Connection
  - `get_base_color_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Base Color Connection
  - `get_clear_coat_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Clear Coat Connection
  - `get_clear_coat_normal_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Clear Coat Normal Connection
  - `get_clear_coat_roughness_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Clear Coat Roughness Connection
  - `get_cloth_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Cloth Connection
  - `get_custom_blend_mode()` -> `BlendMode or None` — Get Custom Blend Mode
  - `get_custom_displacement_center()` -> `float or None` — Get Custom Displacement Center
  - `get_custom_opacity_mask_clip_value()` -> `float or None` — Get Custom Opacity Mask Clip Value
  - `get_custom_refraction_method()` -> `RefractionMode or None` — Get Custom Refraction Method
  - `get_custom_screen_space_reflections()` -> `bool or None` — Get Custom Screen Space Reflections
  - `get_custom_shading_model()` -> `MaterialShadingModel or None` — Get Custom Shading Model
  - `get_custom_translucency_lighting_mode()` -> `TranslucencyLightingMode or None` — Get Custom Translucency Lighting Mode
  - `get_custom_two_sided()` -> `bool or None` — Get Custom Two Sided
  - `get_displacement_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Displacement Connection
  - `get_emissive_color_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Emissive Color Connection
  - `get_fuzz_color_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Fuzz Color Connection
  - `get_metallic_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Metallic Connection
  - `get_normal_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Normal Connection
  - `get_occlusion_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Occlusion Connection
  - `get_opacity_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Opacity Connection
  - `get_refraction_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Refraction Connection
  - `get_roughness_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Roughness Connection
  - `get_specular_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Specular Connection
  - `get_subsurface_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Subsurface Connection
  - `get_surface_coverage_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Surface Coverage Connection
  - `get_tangent_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Tangent Connection
  - `get_transmission_color_connection()` -> `(expression_node_uid=str, output_name=str) or None` — Get Transmission Color Connection
  - `set_custom_blend_mode(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Blend Mode
  - `set_custom_displacement_center(attribute_value)` -> `bool` — Set Custom Displacement Center
  - `set_custom_opacity_mask_clip_value(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Opacity Mask Clip Value
  - `set_custom_refraction_method(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Refraction Method
  - `set_custom_screen_space_reflections(attribute_value)` -> `bool` — Set Custom Screen Space Reflections
  - `set_custom_shading_model(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Shading Model
  - `set_custom_translucency_lighting_mode(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Translucency Lighting Mode
  - `set_custom_two_sided(attribute_value, add_apply_delegate = True)` -> `bool` — Sets if this shader graph should be rendered two sided or not. Defaults to off.

### `unreal.InterchangeMaterialFunctionCallExpressionFactoryNode`
Inherits: `InterchangeMaterialExpressionFactoryNode` | Header: `InterchangeMaterialFactoryNode.h`

Interchange Material Function Call Expression Factory Node

**Methods** (2):
  - `get_custom_material_function_dependency()` -> `str or None` — Get Custom Material Function Dependency
  - `set_custom_material_function_dependency(attribute_value)` -> `bool` — Set the unique ID of the material function that the function call expression is referring to. Note that a call to AddFac...

### `unreal.InterchangeMaterialFunctionFactoryNode`
Inherits: `InterchangeBaseMaterialFactoryNode` | Header: `InterchangeMaterialFactoryNode.h`

Interchange Material Function Factory Node

**Methods** (1):
  - `get_input_connection(input_name)` -> `(expression_node_uid=str, output_name=str) or None` — Get Input Connection

### `unreal.InterchangeMaterialInstanceFactoryNode`
Inherits: `InterchangeBaseMaterialFactoryNode` | Header: `InterchangeMaterialFactoryNode.h`

Interchange Material Instance Factory Node

**Methods** (4):
  - `get_custom_instance_class_name()` -> `str or None` — Get Custom Instance Class Name
  - `get_custom_parent()` -> `str or None` — Get Custom Parent
  - `set_custom_instance_class_name(attribute_value)` -> `bool` — Set Custom Instance Class Name
  - `set_custom_parent(attribute_value)` -> `bool` — Set Custom Parent

### `unreal.InterchangeMaterialReferenceFactoryNode`
Inherits: `InterchangeBaseMaterialFactoryNode` | Header: `InterchangeMaterialFactoryNode.h`

Describes a reference to an existing (as in, not imported) material. Note that the material is referenced via the UInterchangeFactoryBaseNode::CustomReferenceObject member.

### `unreal.InterchangeMeshActorFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeMeshActorFactoryNode.h`

Interchange Mesh Actor Factory Node

**Methods** (10):
  - `get_custom_animation_asset_uid_to_play()` -> `str or None` — Get the animation asset set for this scene node to play.
  - `get_custom_geometric_transform()` -> `Transform or None` — Get the geometric offset. Any mesh attached to this scene node will be offset using this transform.
  - `get_custom_instanced_asset_factory_node_uid()` -> `str or None` — Get the resolved asset factory node.
  - `get_slot_material_dependencies()` -> `Map [ str , str ]` — Retrieve the correspondence table between slot names and assigned materials for this object.
  - `get_slot_material_dependency_uid(slot_name)` -> `str or None` — Retrieve the Material dependency for the specified slot of this object.
  - `remove_slot_material_dependency_uid(slot_name)` -> `bool` — Remove the Material dependency associated with the specified slot name from this object.
  - `set_custom_animation_asset_uid_to_play(attribute_value)` -> `bool` — Set the animation asset for this scene node to play. (This is only relevant for SkeletalMeshActors: scene nodes that are...
  - `set_custom_geometric_transform(attribute_value)` -> `bool` — Set the geometric offset. Any mesh attached to this scene node will be offset using this transform.
  - `set_custom_instanced_asset_factory_node_uid(attribute_value)` -> `bool` — Set the resolved asset factory node.
  - `set_slot_material_dependency_uid(slot_name, material_dependency_uid)` -> `bool` — Add a Material dependency to the specified slot of this object.

### `unreal.InterchangeMeshFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeMeshFactoryNode.h`

namespace Interchange

**Methods** (47):
  - `add_lod_data_unique_id(lod_data_unique_id)` -> `bool` — Add Lod Data Unique Id
  - `add_payload_key_boolean_attribute(payload_attribute_key, value)` -> `bool` — Add a boolean attribute for the payload. Returns false if the attribute does not exist or if it cannot be added.
  - `add_payload_key_double_attribute(payload_attribute_key, value)` -> `bool` — Add a double attribute for the payload. Returns false if the attribute does not exist or if it cannot be added.
  - `add_payload_key_float_attribute(payload_attribute_key, value)` -> `bool` — Add a float attribute for the payload. Returns false if the attribute does not exist or if it cannot be added.
  - `add_payload_key_int32_attribute(payload_attribute_key, value)` -> `bool` — Add an int attribute for the payload. Returns false if the attribute does not exist or if it cannot be added.
  - `add_payload_key_string_attribute(payload_attribute_key, value)` -> `bool` — Add a string attribute for the payload. Returns false if the attribute does not exist or if it cannot be added.
  - `get_custom_compute_weighted_normals()` -> `bool or None` — Query whether normals are recomputed by weighting the surface area and the corner angle of the triangle as a ratio.
  - `get_custom_import_sockets()` -> `bool or None` — Query whether the mesh factory should create sockets.
  - `get_custom_keep_sections_separate()` -> `bool or None` — Query whether sections with matching materials are kept separate and will not get combined.
  - `get_custom_lod_group()` -> `Name or None` — Query whether a custom LOD group is set for the mesh.
  - `get_custom_recompute_normals()` -> `bool or None` — Query whether normals in the imported mesh are ignored and recomputed. When normals are recomputed, the tangents are als...
  - `get_custom_recompute_tangents()` -> `bool or None` — Query whether tangents in the imported mesh are ignored and recomputed.
  - `get_custom_remove_degenerates()` -> `bool or None` — Query whether degenerate triangles are removed.
  - `get_custom_use_backwards_compatible_f16_trunc_u_vs()` -> `bool or None` — Query whether UVs are converted to 16-bit by a legacy truncation process instead of the default rounding process. This m...
  - `get_custom_use_full_precision_u_vs()` -> `bool or None` — Query whether UVs are stored at full floating point precision.
  - `get_custom_use_high_precision_tangent_basis()` -> `bool or None` — Query whether tangents are stored at 16-bit precision instead of the default 8-bit precision.
  - `get_custom_use_mikk_t_space()` -> `bool or None` — Query whether tangents are recomputed using MikkTSpace when they need to be recomputed.
  - `get_custom_vertex_color_ignore()` -> `bool or None` — Query whether the static mesh factory should ignore the vertex color. Return false if the attribute was not set.
  - `get_custom_vertex_color_override()` -> `Color or None` — Query whether the static mesh factory should override the vertex color. Return false if the attribute was not set.
  - `get_custom_vertex_color_replace()` -> `bool or None` — Query whether the static mesh factory should replace the vertex color. Return false if the attribute was not set.
  - `get_lod_data_count()` -> `int32` — Return the number of LODs this static mesh has.
  - `get_lod_data_unique_ids()` -> `Array [ str ]` — Get Lod Data Unique Ids
  - `get_payload_key_boolean_attribute(payload_attribute_key)` -> `bool or None` — Get a payload key boolean attribute from this node. Returns false if the attribute does not exist.
  - `get_payload_key_double_attribute(payload_attribute_key)` -> `double or None` — Get a payload key double attribute from this node. Returns false if the attribute does not exist.
  - `get_payload_key_float_attribute(payload_attribute_key)` -> `float or None` — Get a payload key float attribute from this node. Returns false if the attribute does not exist.
  - `get_payload_key_int32_attribute(payload_attribute_key)` -> `int32 or None` — Get a payload key int32 attribute from this node. Returns false if the attribute does not exist.
  - `get_payload_key_string_attribute(payload_attribute_key)` -> `str or None` — Get a payload key string attribute from this node. Returns false if the attribute does not exist.
  - `get_slot_material_dependencies()` -> `Map [ str , str ]` — Retrieve the correspondence table between slot names and assigned materials for this object.
  - `get_slot_material_dependency_uid(slot_name)` -> `str or None` — Retrieve the Material dependency for the specified slot of this object.
  - `remove_lod_data_unique_id(lod_data_unique_id)` -> `bool` — Remove Lod Data Unique Id
  - `remove_slot_material_dependency_uid(slot_name)` -> `bool` — Remove the Material dependency associated with the specfied slot name of this object.
  - `reset_slot_material_dependencies()` -> `bool` — Reset all the material dependencies.
  - `set_custom_compute_weighted_normals(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether normals are recomputed by weighting the surface area and the corner angle of the triangle as a ratio.
  - `set_custom_import_sockets(attribute_value)` -> `bool` — Set whether the mesh factory should create sockets.
  - `set_custom_keep_sections_separate(attribute_value)` -> `bool` — Set whether sections with matching materials are kept separate and will not get combined.
  - `set_custom_lod_group(attribute_value, add_apply_delegate = True)` -> `bool` — Set a custom LOD group for the mesh.
  - `set_custom_recompute_normals(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether normals in the imported mesh are ignored and recomputed. When normals are recomputed, the tangents are also ...
  - `set_custom_recompute_tangents(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether tangents in the imported mesh are ignored and recomputed.
  - `set_custom_remove_degenerates(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether degenerate triangles are removed.
  - `set_custom_use_backwards_compatible_f16_trunc_u_vs(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether UVs are converted to 16-bit by a legacy truncation process instead of the default rounding process. This may...
  - `set_custom_use_full_precision_u_vs(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether UVs are stored at full floating point precision.
  - `set_custom_use_high_precision_tangent_basis(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether tangents are stored at 16-bit precision instead of the default 8-bit precision.
  - `set_custom_use_mikk_t_space(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether tangents are recomputed using MikkTSpace when they need to be recomputed.
  - `set_custom_vertex_color_ignore(attribute_value)` -> `bool` — Set whether the static mesh factory should ignore the vertex color. Return false if the attribute could not be set.
  - `set_custom_vertex_color_override(attribute_value)` -> `bool` — Set whether the static mesh factory should override the vertex color. Return false if the attribute could not be set.
  - `set_custom_vertex_color_replace(attribute_value)` -> `bool` — Set whether the static mesh factory should replace the vertex color. Return false if the attribute could not be set.
  - `set_slot_material_dependency_uid(slot_name, material_dependency_uid)` -> `bool` — Add a Material dependency to the specified slot of this object.

### `unreal.InterchangePhysicalCameraFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeCameraFactoryNode.h`

Interchange Physical Camera Factory Node

**Methods** (8):
  - `get_custom_focal_length()` -> `float or None` — Get Custom Focal Length
  - `get_custom_focus_method()` -> `CameraFocusMethod or None` — Get Custom Focus Method
  - `get_custom_sensor_height()` -> `float or None` — Get Custom Sensor Height
  - `get_custom_sensor_width()` -> `float or None` — Get Custom Sensor Width
  - `set_custom_focal_length(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Focal Length
  - `set_custom_focus_method(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Focus Method
  - `set_custom_sensor_height(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Sensor Height
  - `set_custom_sensor_width(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Sensor Width

### `unreal.InterchangePhysicsAssetFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangePhysicsAssetFactoryNode.h`

Interchange Physics Asset Factory Node

**Methods** (3):
  - `get_custom_skeletal_mesh_uid()` -> `str or None` — Get the Skeletal Mesh asset UID used to create the data in the post-pipeline step.
  - `initialize_physics_asset_node(unique_id, display_label, asset_class)` -> `None` — Initialize node data. param:: UniqueID - The unique ID for this node.
  - `set_custom_skeletal_mesh_uid(attribute_value)` -> `bool` — Set the Skeletal Mesh asset UID used to create the data in the post-pipeline step.

### `unreal.InterchangePointLightFactoryNode`
Inherits: `InterchangeLightFactoryNode` | Header: `InterchangeLightFactoryNode.h`

Interchange Point Light Factory Node

**Methods** (4):
  - `get_custom_light_falloff_exponent()` -> `float or None` — Get Custom Light Falloff Exponent
  - `get_custom_use_inverse_squared_falloff()` -> `bool or None` — Get Custom Use Inverse Squared Falloff
  - `set_custom_light_falloff_exponent(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Light Falloff Exponent
  - `set_custom_use_inverse_squared_falloff(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Use Inverse Squared Falloff

### `unreal.InterchangeRectLightFactoryNode`
Inherits: `InterchangeLightFactoryNode` | Header: `InterchangeLightFactoryNode.h`

Interchange Rect Light Factory Node

**Methods** (4):
  - `get_custom_source_height()` -> `float or None` — Get Custom Source Height
  - `get_custom_source_width()` -> `float or None` — Get Custom Source Width
  - `set_custom_source_height(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Source Height
  - `set_custom_source_width(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Source Width

### `unreal.InterchangeSceneImportAssetFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeSceneImportAssetFactoryNode.h`

Interchange Scene Import Asset Factory Node

### `unreal.InterchangeSceneVariantSetsFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeSceneVariantSetsFactoryNode.h`

Interchange Scene Variant Sets Factory Node

**Methods** (5):
  - `add_custom_variant_set_uid(variant_uid)` -> `bool` — Add a unique id of a translated VariantSet for this object.
  - `get_custom_variant_set_uid(index)` -> `str` — Retrieve the UID of the VariantSet with the specified index.
  - `get_custom_variant_set_uid_count()` -> `int32` — Retrieve the number of unique IDs of all translated VariantSets for this object.
  - `get_custom_variant_set_uids()` -> `Array [ str ]` — Retrieve the unique IDs of all translated VariantSets for this object.
  - `remove_custom_variant_set_uid(variant_uid)` -> `bool` — Remove the specified unique ID of a translated VariantSet from this object.

### `unreal.InterchangeSkeletalMeshFactoryNode`
Inherits: `InterchangeMeshFactoryNode` | Header: `InterchangeSkeletalMeshFactoryNode.h`

Interchange Skeletal Mesh Factory Node

**Methods** (29):
  - `get_custom_add_curve_metadata_to_skeleton()` -> `bool or None` — Get the custom attribute AddCurveMetadataToSkeleton. Return false if the attribute is not set. Note - If this setting is...
  - `get_custom_bone_influence_limit()` -> `int32 or None` — Query the maximum number of bone influences to allow each vertex in this mesh to use. If set higher than the limit deter...
  - `get_custom_create_physics_asset()` -> `bool or None` — Query whether the skeletal mesh factory should create a physics asset. Return false if the attribute was not set.
  - `get_custom_import_content_type()` -> `InterchangeSkeletalMeshContentType or None` — Query the skeletal mesh import content type. This content type determines whether the factory imports partial or full tr...
  - `get_custom_import_morph_target()` -> `bool or None` — Query whether the skeletal mesh factory should create morph targets. Return false if the attribute was not set.
  - `get_custom_import_vertex_attributes()` -> `bool or None` — Query whether the skeletal mesh factory should import vertex attributes. Return false if the attribute was not set.
  - `get_custom_merge_morph_target_shape_with_same_name()` -> `bool or None` — Query whether the skeletal mesh factory should merge morph target shape with the same name under one morph target. Retur...
  - `get_custom_morph_threshold_position()` -> `float or None` — Query the skeletal mesh threshold value that is used to compare vertex position equality when computing morph target del...
  - `get_custom_physic_asset_soft_object_path()` -> `SoftObjectPath or None` — Query a physics asset the skeletal mesh factory should use. Return false if the attribute was not set.
  - `get_custom_skeleton_soft_object_path()` -> `SoftObjectPath or None` — Query the skeletal mesh factory skeleton UObject. Return false if the attribute was not set.
  - `get_custom_threshold_position()` -> `float or None` — Query the skeletal mesh threshold value that is used to decide whether two vertex positions are equal.
  - `get_custom_threshold_tangent_normal()` -> `float or None` — Query the skeletal mesh threshold value that is used to decide whether two normals, tangents, or bi-normals are equal.
  - `get_custom_threshold_uv()` -> `float or None` — Query the skeletal mesh threshold value that is used to decide whether two UVs are equal.
  - `get_custom_use_high_precision_skin_weights()` -> `bool or None` — Query the skeletal mesh UseHighPrecisionSkinWeights setting.
  - `initialize_skeletal_mesh_node(unique_id, display_label, asset_class)` -> `None` — Initialize node data. param:: UniqueID - The unique ID for this node.
  - `set_custom_add_curve_metadata_to_skeleton(attribute_value)` -> `bool` — Set the custom attribute AddCurveMetadataToSkeleton. Return false if the attribute could not be set. Note - If this sett...
  - `set_custom_bone_influence_limit(attribute_value, add_apply_delegate = True)` -> `bool` — Set the maximum number of bone influences to allow each vertex in this mesh to use. If set higher than the limit determi...
  - `set_custom_create_physics_asset(attribute_value)` -> `bool` — Set whether the skeletal mesh factory should create a physics asset. Return false if the attribute could not be set.
  - `set_custom_import_content_type(attribute_value)` -> `bool` — Set the skeletal mesh import content type. This content type determines whether the factory imports partial or full tran...
  - `set_custom_import_morph_target(attribute_value)` -> `bool` — Set whether the skeletal mesh factory should create morph targets. Return false if the attribute could not be set.
  - `set_custom_import_vertex_attributes(attribute_value)` -> `bool` — Set whether the skeletal mesh factory should import vertex attributes. Return false if the attribute could not be set.
  - `set_custom_merge_morph_target_shape_with_same_name(attribute_value)` -> `bool` — Set whether the skeletal mesh factory should merge morph target shape with the same name under one morph target. Return ...
  - `set_custom_morph_threshold_position(attribute_value, add_apply_delegate = True)` -> `bool` — Set the skeletal mesh threshold value that is used to compare vertex position equality when computing morph target delta...
  - `set_custom_physic_asset_soft_object_path(attribute_value)` -> `bool` — Set a physics asset the skeletal mesh factory should use. Return false if the attribute could not be set.
  - `set_custom_skeleton_soft_object_path(attribute_value)` -> `bool` — Set the skeletal mesh factory skeleton UObject. Return false if the attribute could not be set.
  - `set_custom_threshold_position(attribute_value, add_apply_delegate = True)` -> `bool` — Set the skeletal mesh threshold value that is used to decide whether two vertex positions are equal.
  - `set_custom_threshold_tangent_normal(attribute_value, add_apply_delegate = True)` -> `bool` — Set the skeletal mesh threshold value that is used to decide whether two normals, tangents, or bi-normals are equal.
  - `set_custom_threshold_uv(attribute_value, add_apply_delegate = True)` -> `bool` — Set the skeletal mesh threshold value that is used to decide whether two UVs are equal.
  - `set_custom_use_high_precision_skin_weights(attribute_value, add_apply_delegate = True)` -> `bool` — Set the skeletal mesh UseHighPrecisionSkinWeights setting.

### `unreal.InterchangeSkeletalMeshLodDataNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeSkeletalMeshLodDataNode.h`

ns UE

**Methods** (7):
  - `add_mesh_uid(mesh_name)` -> `bool` — Add a mesh geometry used to create this LOD geometry. A mesh UID can represent either a scene node or a mesh node. If it...
  - `get_custom_skeleton_uid()` -> `str or None` — Query the LOD skeletal mesh factory skeleton reference. Return false if the attribute was not set.
  - `get_mesh_uids()` -> `Array [ str ]` — Query all mesh geometry this LOD will be made from. A mesh UID can represent either a scene node or a mesh node. If it i...
  - `get_mesh_uids_count()` -> `int32` — Return the number of mesh geometries this LOD will be made from. A mesh UID can represent either a scene node or a mesh ...
  - `remove_all_meshes()` -> `bool` — Remove all mesh geometry used to create this LOD geometry. A mesh UID can represent either a scene node or a mesh node. ...
  - `remove_mesh_uid(mesh_name)` -> `bool` — Remove a mesh geometry used to create this LOD geometry. A mesh UID can represent either a scene node or a mesh node. If...
  - `set_custom_skeleton_uid(attribute_value)` -> `bool` — Set the LOD skeletal mesh factory skeleton reference. Return false if the attribute could not be set.

### `unreal.InterchangeSkeletonFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeSkeletonFactoryNode.h`

Interchange Skeleton Factory Node

**Methods** (7):
  - `get_custom_root_joint_uid()` -> `str or None` — Return false if the attribute was not set previously.
  - `get_custom_skeletal_mesh_factory_node_uid()` -> `str or None` — Get Custom Skeletal Mesh Factory Node Uid
  - `get_custom_use_time_zero_for_bind_pose()` -> `bool or None` — Query whether this skeleton should replace joint transforms with time-zero evaluation instead of bind pose.
  - `initialize_skeleton_node(unique_id, display_label, asset_class)` -> `None` — Initialize node data. param:: UniqueID - The unique ID for this node.
  - `set_custom_root_joint_uid(attribute_value)` -> `bool` — Set Custom Root Joint Uid
  - `set_custom_skeletal_mesh_factory_node_uid(attribute_value)` -> `bool` — Set Custom Skeletal Mesh Factory Node Uid
  - `set_custom_use_time_zero_for_bind_pose(attribute_value)` -> `bool` — If AttributeValue is true, force this skeleton to use time-zero evaluation instead of its bind pose.

### `unreal.InterchangeSparseVolumeTextureFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeSparseVolumeTextureFactoryNode.h`

Interchange Sparse Volume Texture Factory Node

**Methods** (22):
  - `get_custom_animation_id()` -> `str or None` — Gets the animation ID of the volume nodes that were grouped together to create this animated SparseVolumeTextureFactoryN...
  - `get_custom_attributes_a_channel_w()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesA texture, channel W (e.g. âdensity_0â...
  - `get_custom_attributes_a_channel_x()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesA texture, channel X (e.g. âdensity_0â...
  - `get_custom_attributes_a_channel_y()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesA texture, channel Y (e.g. âdensity_0â...
  - `get_custom_attributes_a_channel_z()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesA texture, channel Z (e.g. âdensity_0â...
  - `get_custom_attributes_a_format()` -> `InterchangeSparseVolumeTextureFormat or None` — Gets the data type of the AttributesA texture of the SparseVolumeTexture weâll create
  - `get_custom_attributes_b_channel_w()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesB texture, channel W (e.g. âdensity_0â...
  - `get_custom_attributes_b_channel_x()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesB texture, channel X (e.g. âdensity_0â...
  - `get_custom_attributes_b_channel_y()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesB texture, channel Y (e.g. âdensity_0â...
  - `get_custom_attributes_b_channel_z()` -> `str or None` — Gets the grid name and component index that will be assigned to the AttributesB texture, channel Z (e.g. âdensity_0â...
  - `get_custom_attributes_b_format()` -> `InterchangeSparseVolumeTextureFormat or None` — Gets the data type of the AttributesB texture of the SparseVolumeTexture weâll create
  - `set_custom_animation_id(animation_id)` -> `bool` — Sets the animation ID of the volume nodes that were grouped together to create this animated SparseVolumeTextureFactoryN...
  - `set_custom_attributes_a_channel_w(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesA texture, channel W (e.g. âdensity_0â...
  - `set_custom_attributes_a_channel_x(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesA texture, channel X (e.g. âdensity_0â...
  - `set_custom_attributes_a_channel_y(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesA texture, channel Y (e.g. âdensity_0â...
  - `set_custom_attributes_a_channel_z(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesA texture, channel Z (e.g. âdensity_0â...
  - `set_custom_attributes_a_format(format)` -> `bool` — Sets the data type of the AttributesA texture of the SparseVolumeTexture weâll create
  - `set_custom_attributes_b_channel_w(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesB texture, channel W (e.g. âdensity_0â...
  - `set_custom_attributes_b_channel_x(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesB texture, channel X (e.g. âdensity_0â...
  - `set_custom_attributes_b_channel_y(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesB texture, channel Y (e.g. âdensity_0â...
  - `set_custom_attributes_b_channel_z(grid_name_and_component_index)` -> `bool` — Sets the grid name and component index that will be assigned to the AttributesB texture, channel Z (e.g. âdensity_0â...
  - `set_custom_attributes_b_format(format)` -> `bool` — Sets the data type of the AttributesB texture of the SparseVolumeTexture weâll create

### `unreal.InterchangeSpecularProfileFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeSpecularProfileFactoryNode.h`

Interchange Specular Profile Factory Node

**Methods** (4):
  - `get_custom_format()` -> `SpecularProfileFormat or None` — Get Custom Format
  - `get_custom_texture()` -> `str or None` — Get Custom Texture
  - `set_custom_format(format)` -> `bool` — Set Custom Format
  - `set_custom_texture(texture_uid)` -> `bool` — Set Custom Texture

### `unreal.InterchangeSpotLightFactoryNode`
Inherits: `InterchangePointLightFactoryNode` | Header: `InterchangeLightFactoryNode.h`

Interchange Spot Light Factory Node

**Methods** (4):
  - `get_custom_inner_cone_angle()` -> `float or None` — Get Custom Inner Cone Angle
  - `get_custom_outer_cone_angle()` -> `float or None` — Get Custom Outer Cone Angle
  - `set_custom_inner_cone_angle(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Inner Cone Angle
  - `set_custom_outer_cone_angle(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Outer Cone Angle

### `unreal.InterchangeStandardCameraFactoryNode`
Inherits: `InterchangeActorFactoryNode` | Header: `InterchangeCameraFactoryNode.h`

Used for common non-physical camera with orthographic or perspective projection.

**Methods** (12):
  - `get_custom_aspect_ratio()` -> `float or None` — Get Custom Aspect Ratio
  - `get_custom_far_clip_plane()` -> `float or None` — Get Custom Far Clip Plane
  - `get_custom_field_of_view()` -> `float or None` — Get Custom Field Of View
  - `get_custom_near_clip_plane()` -> `float or None` — Get Custom Near Clip Plane
  - `get_custom_projection_mode()` -> `CameraProjectionMode or None` — Get Custom Projection Mode
  - `get_custom_width()` -> `float or None` — Get Custom Width
  - `set_custom_aspect_ratio(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Aspect Ratio
  - `set_custom_far_clip_plane(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Far Clip Plane
  - `set_custom_field_of_view(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Field Of View
  - `set_custom_near_clip_plane(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Near Clip Plane
  - `set_custom_projection_mode(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Projection Mode
  - `set_custom_width(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Width

### `unreal.InterchangeStaticMeshFactoryNode`
Inherits: `InterchangeMeshFactoryNode` | Header: `InterchangeStaticMeshFactoryNode.h`

namespace UE

**Methods** (35):
  - `add_socket_uid(socket_uid)` -> `bool` — Add Socket Uid
  - `add_socket_uids(socket_uids)` -> `bool` — Add Socket Uids
  - `get_custom_auto_compute_lod_screen_sizes()` -> `bool or None` — Get whether the static mesh factory should auto compute LOD Screen Sizes. Return false if the attribute was not set.
  - `get_custom_build_nanite()` -> `bool or None` — Get whether the static mesh factory should set the Nanite build setting. Return false if the attribute was not set.
  - `get_custom_build_reversed_index_buffer()` -> `bool or None` — Get whether the static mesh should build a reversed index buffer.
  - `get_custom_build_scale3d()` -> `Vector or None` — Get the local scale that is applied when building the static mesh.
  - `get_custom_distance_field_replacement_mesh()` -> `SoftObjectPath or None` — Get the static mesh asset whose distance field will be used as the distance field for the imported mesh.
  - `get_custom_distance_field_resolution_scale()` -> `float or None` — Get the scale to apply to the mesh when allocating the distance field volume texture. The default scale is 1, which assu...
  - `get_custom_dst_lightmap_index()` -> `int32 or None` — Get the index of the UV that is used to store generated lightmaps for the static mesh.
  - `get_custom_generate_distance_field_as_if_two_sided()` -> `bool or None` — Get whether to generate the distance field by treating every triangle hit as a front face. This prevents the distance fi...
  - `get_custom_generate_lightmap_u_vs()` -> `bool or None` — Get whether the static mesh should generate lightmap UVs.
  - `get_custom_max_lumen_mesh_cards()` -> `int32 or None` — Get the maximum number of Lumen mesh cards to generate for this mesh. More cards means that the surface will have better...
  - `get_custom_min_lightmap_resolution()` -> `int32 or None` — Get the amount of padding used to pack UVs for the static mesh.
  - `get_custom_src_lightmap_index()` -> `int32 or None` — Get the index of the UV that is used as the source for generating lightmaps for the static mesh.
  - `get_custom_support_face_remap()` -> `bool or None` — Get whether the static mesh is set up for use with physical material masks.
  - `get_lod_screen_size_count()` -> `int32` — Returns the number of LOD Screen Sizes the static mesh has.
  - `get_lod_screen_sizes()` -> `Array [ float ]` — Returns All the LOD Screen Sizes set for the static mesh.
  - `get_socket_uid_count()` -> `int32` — Return the number of socket UIDs this static mesh has.
  - `get_socket_uids()` -> `Array [ str ]` — Get Socket Uids
  - `initialize_static_mesh_node(unique_id, display_label, asset_class)` -> `None` — Initialize node data.
  - `remove_socket_ud(socket_uid)` -> `bool` — Remove Socket Ud
  - `set_custom_auto_compute_lod_screen_sizes(attribute_value)` -> `bool` — Set whether the static mesh factory should auto compute LOD Screen Sizes. Return false if the attribute was not set.
  - `set_custom_build_nanite(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether the static mesh factory should set the Nanite build setting. Return false if the attribute was not set.
  - `set_custom_build_reversed_index_buffer(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether the static mesh should build a reversed index buffer.
  - `set_custom_build_scale3d(attribute_value, add_apply_delegate = True)` -> `bool` — Set the local scale that is applied when building the static mesh.
  - `set_custom_distance_field_replacement_mesh(attribute_value, add_apply_delegate = True)` -> `bool` — Set the static mesh asset whose distance field will be used as the distance field for the imported mesh.
  - `set_custom_distance_field_resolution_scale(attribute_value, add_apply_delegate = True)` -> `bool` — Set the scale to apply to the mesh when allocating the distance field volume texture. The default scale is 1, which assu...
  - `set_custom_dst_lightmap_index(attribute_value, add_apply_delegate = True)` -> `bool` — Set the index of the UV that is used to store generated lightmaps for the static mesh.
  - `set_custom_generate_distance_field_as_if_two_sided(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether to generate the distance field by treating every triangle hit as a front face. This prevents the distance fi...
  - `set_custom_generate_lightmap_u_vs(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether the static mesh should generate lightmap UVs.
  - `set_custom_max_lumen_mesh_cards(attribute_value, add_apply_delegate = True)` -> `bool` — Set the maximum number of Lumen mesh cards to generate for this mesh. More cards means that the surface will have better...
  - `set_custom_min_lightmap_resolution(attribute_value, add_apply_delegate = True)` -> `bool` — Set the amount of padding used to pack UVs for the static mesh.
  - `set_custom_src_lightmap_index(attribute_value, add_apply_delegate = True)` -> `bool` — Set the index of the UV that is used as the source for generating lightmaps for the static mesh.
  - `set_custom_support_face_remap(attribute_value, add_apply_delegate = True)` -> `bool` — Set whether the static mesh is set up for use with physical material masks.
  - `set_lod_screen_sizes(lod_screen_sizes)` -> `bool` — Sets the LOD Screen Sizes for the static mesh.

### `unreal.InterchangeStaticMeshLodDataNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeStaticMeshLodDataNode.h`

namespace UE

**Methods** (31):
  - `add_box_collision_mesh_uid(mesh_name)` -> `bool` — Add Box Collision Mesh Uid
  - `add_capsule_collision_mesh_uid(mesh_name)` -> `bool` — Add Capsule Collision Mesh Uid
  - `add_convex_collision_mesh_uid(mesh_name)` -> `bool` — Add Convex Collision Mesh Uid
  - `add_mesh_uid(mesh_name)` -> `bool` — Add Mesh Uid
  - `add_sphere_collision_mesh_uid(mesh_name)` -> `bool` — Add Sphere Collision Mesh Uid
  - `get_box_collision_mesh_uids()` -> `Array [ str ]` — Get Box Collision Mesh Uids
  - `get_box_collision_mesh_uids_count()` -> `int32` — Get Box Collision Mesh Uids Count
  - `get_capsule_collision_mesh_uids()` -> `Array [ str ]` — Get Capsule Collision Mesh Uids
  - `get_capsule_collision_mesh_uids_count()` -> `int32` — Get Capsule Collision Mesh Uids Count
  - `get_convex_collision_mesh_uids()` -> `Array [ str ]` — Get Convex Collision Mesh Uids
  - `get_convex_collision_mesh_uids_count()` -> `int32` — Get Convex Collision Mesh Uids Count
  - `get_import_collision()` -> `bool or None` — Get Import Collision
  - `get_import_collision_type()` -> `InterchangeMeshCollision or None` — Get Import Collision Type
  - `get_mesh_uids()` -> `Array [ str ]` — Get Mesh Uids
  - `get_mesh_uids_count()` -> `int32` — Mesh UIDs can be either a scene node or a mesh node UID. If it is a scene node, the mesh factory bakes the geometry payl...
  - `get_one_convex_hull_per_ucx()` -> `bool or None` — Get One Convex Hull Per UCX
  - `get_sphere_collision_mesh_uids()` -> `Array [ str ]` — Get Sphere Collision Mesh Uids
  - `get_sphere_collision_mesh_uids_count()` -> `int32` — Get Sphere Collision Mesh Uids Count
  - `remove_all_box_collision_meshes()` -> `bool` — Remove All Box Collision Meshes
  - `remove_all_capsule_collision_meshes()` -> `bool` — Remove All Capsule Collision Meshes
  - `remove_all_convex_collision_meshes()` -> `bool` — Remove All Convex Collision Meshes
  - `remove_all_meshes()` -> `bool` — Remove All Meshes
  - `remove_all_sphere_collision_meshes()` -> `bool` — Remove All Sphere Collision Meshes
  - `remove_box_collision_mesh_uid(mesh_name)` -> `bool` — Remove Box Collision Mesh Uid
  - `remove_capsule_collision_mesh_uid(mesh_name)` -> `bool` — Remove Capsule Collision Mesh Uid
  - `remove_convex_collision_mesh_uid(mesh_name)` -> `bool` — Remove Convex Collision Mesh Uid
  - `remove_mesh_uid(mesh_name)` -> `bool` — Remove Mesh Uid
  - `remove_sphere_collision_mesh_uid(mesh_name)` -> `bool` — Remove Sphere Collision Mesh Uid
  - `set_import_collision(attribute_value)` -> `bool` — Set Import Collision
  - `set_import_collision_type(attribute_value)` -> `bool` — Set Import Collision Type
  - `set_one_convex_hull_per_ucx(attribute_value)` -> `bool` — Set One Convex Hull Per UCX

### `unreal.InterchangeTexture2DArrayFactoryNode`
Inherits: `InterchangeTextureFactoryNode` | Header: `InterchangeTexture2DArrayFactoryNode.h`

Interchange Texture 2DArray Factory Node

**Methods** (4):
  - `get_custom_address_x()` -> `uint8 or None` — Get Custom Address X
  - `get_custom_address_y()` -> `uint8 or None` — Get Custom Address Y
  - `get_custom_address_z()` -> `uint8 or None` — Get Custom Address Z
  - `set_custom_address_z(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Address Z

### `unreal.InterchangeTexture2DFactoryNode`
Inherits: `InterchangeTextureFactoryNode` | Header: `InterchangeTexture2DFactoryNode.h`

ns UE::Interchange

**Methods** (10):
  - `get_custom_address_x()` -> `TextureAddress or None` — Return false if the Attribute was not set previously.
  - `get_custom_address_y()` -> `TextureAddress or None` — Return false if the Attribute was not set previously.
  - `get_source_block(block_index)` -> `str or None` — Get a source block from the texture.
  - `get_source_block_by_coordinates(x, y)` -> `str or None` — Get a source block from the texture.
  - `get_source_blocks()` -> `Map [ int32 , str ]` — Get the source blocks for the texture. If the map is empty, the texture is imported as a normal texture using the payloa...
  - `set_custom_address_x(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Address X
  - `set_custom_address_y(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Address Y
  - `set_source_block(block_index, source_file)` -> `None` — Set a source block for the texture.
  - `set_source_block_by_coordinates(x, y, source_file)` -> `None` — Set a source block for the texture.
  - `set_source_blocks(source_blocks)` -> `None` — Set the source blocks for the texture. Using this suggests to the pipeline to consider this texture as a UDIM. The pipel...

### `unreal.InterchangeTextureCubeArrayFactoryNode`
Inherits: `InterchangeTextureFactoryNode` | Header: `InterchangeTextureCubeArrayFactoryNode.h`

Interchange Texture Cube Array Factory Node

### `unreal.InterchangeTextureCubeFactoryNode`
Inherits: `InterchangeTextureFactoryNode` | Header: `InterchangeTextureCubeFactoryNode.h`

Interchange Texture Cube Factory Node

### `unreal.InterchangeTextureFactoryNode`
Inherits: `InterchangeFactoryBaseNode` | Header: `InterchangeTextureFactoryNode.h`

Interchange Texture Factory Node

**Methods** (79):
  - `get_custom_adjust_brightness()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_adjust_brightness_curve()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_adjust_hue()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_adjust_max_alpha()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_adjust_min_alpha()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_adjust_rgb_curve()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_adjust_saturation()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_adjust_vibrance()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_allow_non_power_of_two()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_custom_alpha_coverage_thresholds()` -> `Vector4 or None` — Return false if the Attribute was not set previously.
  - `get_custom_chroma_key_color()` -> `Color or None` — Return false if the Attribute was not set previously.
  - `get_custom_chroma_key_threshold()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_color_space()` -> `TextureColorSpace or None` — Return false if the Attribute was not set previously.
  - `get_custom_composite_power()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_composite_texture_mode()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_compression_no_alpha()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_custom_compression_quality()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_compression_settings()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_defer_compression()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_custom_downscale()` -> `float or None` — Return false if the Attribute was not set previously.
  - `get_custom_downscale_options()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_filter()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_lod_bias()` -> `int32 or None` — Return false if the Attribute was not set previously.
  - `get_custom_lod_group()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_lossy_compression_amount()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_max_texture_size()` -> `int32 or None` — Return false if the Attribute was not set previously.
  - `get_custom_mip_gen_settings()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_mip_load_options()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_padding_color()` -> `Color or None` — Return false if the Attribute was not set previously.
  - `get_custom_power_of_two_mode()` -> `uint8 or None` — Return false if the Attribute was not set previously.
  - `get_custom_prefer_compressed_source_data()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_custom_srgb()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_custom_translated_texture_node_uid()` -> `str or None` — Get the unique ID of the translated texture node.
  - `get_custom_virtual_texture_streaming()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_customb_chroma_key_texture()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_customb_do_scale_mips_for_alpha_coverage()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_customb_flip_green_channel()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_customb_preserve_border()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `get_customb_use_legacy_gamma()` -> `bool or None` — Return false if the Attribute was not set previously.
  - `initialize_texture_node(unique_id, display_label, asset_name)` -> `None` — Initialize node data. param:: UniqueID - The unique ID for this node.
  - `set_custom_adjust_brightness(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust Brightness
  - `set_custom_adjust_brightness_curve(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust Brightness Curve
  - `set_custom_adjust_hue(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust Hue
  - `set_custom_adjust_max_alpha(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust Max Alpha
  - `set_custom_adjust_min_alpha(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust Min Alpha
  - `set_custom_adjust_rgb_curve(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust RGBCurve
  - `set_custom_adjust_saturation(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust Saturation
  - `set_custom_adjust_vibrance(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Adjust Vibrance
  - `set_custom_allow_non_power_of_two(attribute_value)` -> `bool`
  - `set_custom_alpha_coverage_thresholds(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Alpha Coverage Thresholds
  - `set_custom_chroma_key_color(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Chroma Key Color
  - `set_custom_chroma_key_threshold(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Chroma Key Threshold
  - `set_custom_color_space(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Color Space
  - `set_custom_composite_power(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Composite Power
  - `set_custom_composite_texture_mode(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Composite Texture Mode
  - `set_custom_compression_no_alpha(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Compression No Alpha
  - `set_custom_compression_quality(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Compression Quality
  - `set_custom_compression_settings(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Compression Settings
  - `set_custom_defer_compression(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Defer Compression
  - `set_custom_downscale(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Downscale
  - `set_custom_downscale_options(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Downscale Options
  - `set_custom_filter(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Filter
  - `set_custom_lod_bias(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom LODBias
  - `set_custom_lod_group(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom LODGroup
  - `set_custom_lossy_compression_amount(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Lossy Compression Amount
  - `set_custom_max_texture_size(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Max Texture Size
  - `set_custom_mip_gen_settings(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Mip Gen Settings
  - `set_custom_mip_load_options(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Mip Load Options
  - `set_custom_padding_color(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Padding Color
  - `set_custom_power_of_two_mode(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Power Of Two Mode
  - `set_custom_prefer_compressed_source_data(attribute_value)` -> `bool`
  - `set_custom_srgb(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom SRGB
  - `set_custom_translated_texture_node_uid(attribute_value)` -> `bool` — Set the unique ID of the translated texture node. This is a reference to the node that was created by the translator. It...
  - `set_custom_virtual_texture_streaming(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Virtual Texture Streaming
  - `set_customb_chroma_key_texture(attribute_value, add_apply_delegate = True)` -> `bool` — Set Customb Chroma Key Texture
  - `set_customb_do_scale_mips_for_alpha_coverage(attribute_value, add_apply_delegate = True)` -> `bool` — Set Customb Do Scale Mips for Alpha Coverage
  - `set_customb_flip_green_channel(attribute_value, add_apply_delegate = True)` -> `bool` — Set Customb Flip Green Channel
  - `set_customb_preserve_border(attribute_value, add_apply_delegate = True)` -> `bool` — Set Customb Preserve Border
  - `set_customb_use_legacy_gamma(attribute_value, add_apply_delegate = True)` -> `bool` — Set Customb Use Legacy Gamma

### `unreal.InterchangeTextureLightProfileFactoryNode`
Inherits: `InterchangeTexture2DFactoryNode` | Header: `InterchangeTextureLightProfileFactoryNode.h`

Interchange Texture Light Profile Factory Node

**Methods** (4):
  - `get_custom_brightness()` -> `float or None` — Get Custom Brightness
  - `get_custom_texture_multiplier()` -> `float or None` — Get Custom Texture Multiplier
  - `set_custom_brightness(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Brightness
  - `set_custom_texture_multiplier(attribute_value, add_apply_delegate = True)` -> `bool` — Set Custom Texture Multiplier

### `unreal.InterchangeVolumeTextureFactoryNode`
Inherits: `InterchangeTextureFactoryNode` | Header: `InterchangeVolumeTextureFactoryNode.h`

Interchange Volume Texture Factory Node

### `unreal.InterchangeSkeletalMeshContentType`
Inherits: `EnumBase` | Header: `InterchangeSkeletalMeshFactoryNode.h`

EInterchange Skeletal Mesh Content Type

**Properties** (3):
  - `ALL`: `InterchangeSkeletalMeshContentType = Ellipsis` — geometry and skin weights. 0 Imports all skeletal mesh content
  - `GEOMETRY`: `InterchangeSkeletalMeshContentType = Ellipsis` — Imports the skeletal mesh geometry only. This creates a default skeleton, or maps the geometry to th...
  - `SKINNING_WEIGHTS`: `InterchangeSkeletalMeshContentType = Ellipsis` — Imports the skeletal mesh skin weights only. No geometry, morph targets, or LODs are imported. 2
