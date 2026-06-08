# UE Python API — CascadeToNiagaraConverter Module

**23 types** from the `CascadeToNiagaraConverter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CreateScriptContextArgs`, `EmitterDynamicParameterBP`, `GenericConverterMessage`, `LocationBoneSocketInfoBP`, `NiagaraAddEventGeneratorOptions`, `NiagaraEventHandlerAddAction`, `NiagaraScriptVersion`, `OrbitOptionsBP`, `ParticleBurstBlueprint`, `RichCurveKeyBP`, `StackEntryID`, `ConvertCascadeToNiagaraResults`, `FXConverterUtilitiesLibrary`, `NiagaraEmitterConversionContext`, `NiagaraScriptConversionContext`, `NiagaraScriptConversionContextInput`, `NiagaraSystemConversionContext`, `DistributionType`, `DistributionValueType`, `NiagaraEventHandlerAddMode`, ... (23 total)

---

## Classes

### `unreal.CreateScriptContextArgs`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Create Script Context Args

**Methods** (1):
  - `create_script_context()` -> `NiagaraScriptConversionContext` — Niagara Script and Script Input Helpers

**Properties** (2):
  - `script_asset`: `AssetData` [Read-Only] — [Read-Only] (AssetData)
  - `script_version`: `NiagaraScriptVersion` [Read-Only] — [Read-Only] (NiagaraScriptVersion)

### `unreal.EmitterDynamicParameterBP`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

BlueprintType wrapper around FEmitterDynamicParameter to allow managing in blueprint/python logic.

**Properties** (5):
  - `param_name`: `Name` [Read-Only] — [Read-Write] The parameter name - from the material DynamicParameter expression. READ-ONLY (Name)
  - `scale_velocity_by_param_value`: `bool` — [Read-Write] If true, scale the velocity value selected in ValueMethod by the evaluated ParamValue. ...
  - `spawn_time_only`: `bool` — [Read-Write] If true, only set the value at spawn time of the particle, otherwise update each frame....
  - `use_emitter_time`: `bool` — [Read-Write] If true, use the EmitterTime to retrieve the value, otherwise use Particle RelativeTime...
  - `value_method`: `EmitterDynamicParameterValue` — [Read-Write] Where to get the parameter value from. (EmitterDynamicParameterValue)

### `unreal.GenericConverterMessage`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Logging Framework

### `unreal.LocationBoneSocketInfoBP`
Inherits: `LocationBoneSocketInfo` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Location Bone Socket Info BP

### `unreal.NiagaraAddEventGeneratorOptions`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Niagara Add Event Generator Options

**Properties** (2):
  - `event_generator_script_asset_data`: `AssetData` — [Read-Write] AssetData pointing to the UNiagaraScript that generates the event. (AssetData)
  - `source_emitter_name`: `Name` — [Read-Write] The name to lookup the emitter which has the event generator. (Name)

### `unreal.NiagaraEventHandlerAddAction`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Niagara Event Handler Add Action

**Properties** (8):
  - `add_event_generator_options`: `NiagaraAddEventGeneratorOptions` — [Read-Write] (NiagaraAddEventGeneratorOptions)
  - `execution_mode`: `ScriptExecutionMode` — [Read-Write] Controls which particles have the event script run on them. (ScriptExecutionMode)
  - `max_events_per_frame`: `int` — [Read-Write] Controls how many events are consumed by this event handler. If there are more events g...
  - `min_spawn_number`: `int` — [Read-Write] The minimum spawn number when random spawn is used. Spawn Number is used as the maximum...
  - `mode`: `NiagaraEventHandlerAddMode` — [Read-Write] (NiagaraEventHandlerAddMode)
  - `random_spawn_number`: `bool` — [Read-Write] Whether using a random spawn number. (bool)
  - `source_event_name`: `Name` — [Read-Write] The name of the event generated. This will be âCollisionâ for collision events and ...
  - `spawn_number`: `int` — [Read-Write] Controls whether or not particles are spawned as a result of handling the event. Only v...

### `unreal.NiagaraScriptVersion`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Niagara Script Version

**Properties** (2):
  - `major_version`: `int` [Read-Only] — [Read-Only] (int32)
  - `minor_version`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.OrbitOptionsBP`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

BlueprintType wrapper around FOrbitOptions to allow managing in blueprint/python logic.

### `unreal.ParticleBurstBlueprint`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

BlueprintType wrapper around FParticleBurst to allow managing in blueprint/python logic.

**Properties** (3):
  - `count`: `int` — [Read-Write] The number of particles to burst (int32)
  - `count_low`: `int` — [Read-Write] If >= 0, use as a range [CountLow..Count] (int32)
  - `time`: `float` — emitter lifetime) (float) [Read-Write] The time at which to burst them (0..1

### `unreal.RichCurveKeyBP`
Inherits: `RichCurveKey` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Rich Curve Key BP

### `unreal.StackEntryID`
Inherits: `StructBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Stack Entry ID

### `unreal.ConvertCascadeToNiagaraResults`
Inherits: `Object` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Wrapper class for passing results back from the ConvertCascadeToNiagara python script.

**Properties** (2):
  - `cancelled_by_python_error`: `bool` — [Read-Write] Whether the converter process was cancelled due to an unrecoverable error in the python...
  - `cancelled_by_user`: `bool` — [Read-Write] Whether the converter process was cancelled by the user. (bool)

### `unreal.FXConverterUtilitiesLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

A C++ and Blueprint accessible library for converting fx type assets (Cascade and Niagara)

**Methods** (115):
  - `create_asset_data(path)` -> `AssetData` [classmethod] — Create Asset Data
  - `create_component_renderer_properties()` -> `NiagaraComponentRendererProperties` [classmethod] — Create Component Renderer Properties
  - `create_float_curve_di(keys)` -> `NiagaraDataInterfaceCurve` [classmethod] — Create Float Curve DI
  - `create_light_renderer_properties()` -> `NiagaraLightRendererProperties` [classmethod] — Create Light Renderer Properties
  - `create_mesh_renderer_properties()` -> `NiagaraMeshRendererProperties` [classmethod] — Create Mesh Renderer Properties
  - `create_ribbon_renderer_properties()` -> `NiagaraRibbonRendererProperties` [classmethod] — Create Ribbon Renderer Properties
  - `create_script_context(args)` -> `NiagaraScriptConversionContext` [classmethod] — Niagara Script and Script Input Helpers
  - `create_script_input_bool(value)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Bool
  - `create_script_input_di(value)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input DI
  - `create_script_input_dynamic(value, input_type)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Dynamic
  - `create_script_input_enum(user_defined_enum_asset_path, user_defined_enum_value_name_string)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Enum
  - `create_script_input_float(value)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Float
  - `create_script_input_int(value)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Int
  - `create_script_input_linked_parameter(parameter_name_string, input_type)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Linked Parameter
  - `create_script_input_linked_parameter_ex(parameter_name_string, base_input)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Linked Parameter Ex
  - `create_script_input_struct(value)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Struct
  - `create_script_input_vec2(value)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Vec 2
  - `create_script_input_vector(value)` -> `NiagaraScriptConversionContextInput` [classmethod] — Create Script Input Vector
  - `create_skeletal_mesh_data_interface()` -> `NiagaraDataInterfaceSkeletalMesh` [classmethod] — Niagara DI Helpers
  - `create_system_conversion_context(system)` -> `NiagaraSystemConversionContext` [classmethod] — Niagara System and Emitter Helpers
  - `create_vec2_curve_di(x_keys, y_keys)` -> `NiagaraDataInterfaceVector2DCurve` [classmethod] — Create Vec 2Curve DI
  - `create_vec3_curve_di(x_keys, y_keys, z_keys)` -> `NiagaraDataInterfaceVectorCurve` [classmethod] — Create Vec 3Curve DI
  - `create_vec4_curve_di(x_keys, y_keys, z_keys, w_keys)` -> `NiagaraDataInterfaceVector4Curve` [classmethod] — Create Vec 4Curve DI
  - `get_cascade_emitter_lod_level(emitter, idx)` -> `ParticleLODLevel` [classmethod] — Get Cascade Emitter Lod Level
  - `get_cascade_emitter_name(emitter)` -> `Name` [classmethod] — Get Cascade Emitter Name
  - `get_cascade_emitter_render_mode(emitter)` -> `int32` [classmethod] — Get Cascade Emitter Render Mode
  - `get_cascade_system_emitters(system)` -> `Array [ ParticleEmitter ]` [classmethod] — Cascade Emitter and ParticleLodLevel Getters
  - `get_distribution_locked_axes(distribution)` -> `Array [ DistributionVectorLockFlags ]` [classmethod] — Get Distribution Locked Axes
  - `get_distribution_min_max_values(out_min_value=Vector, out_max_value=Vector)` [classmethod] — Cascade Distribution Getters
  - `get_distribution_type(out_cascade_distribution_value_type=DistributionValueType)` [classmethod] — Get Distribution Type
  - `get_float_distribution_const_curve_values(distribution)` -> `InterpCurveFloat` [classmethod] — Get Float Distribution Const Curve Values
  - `get_float_distribution_const_values(distribution)` -> `float` [classmethod] — Get Float Distribution Const Values
  - `get_float_distribution_parameter_values(out_min_input=float, out_max_input=float, out_min_output=float, out_max_output=float)` [classmethod] — Get Float Distribution Parameter Values
  - `get_float_distribution_uniform_curve_values(distribution)` -> `InterpCurveVector2D` [classmethod] — Get Float Distribution Uniform Curve Values
  - `get_float_distribution_uniform_values(out_max=float)` [classmethod] — Get Float Distribution Uniform Values
  - `get_lod_level_is_enabled(lod_level)` -> `bool` [classmethod] — Get Lod Level Is Enabled
  - `get_lod_level_modules(lod_level)` -> `Array [ ParticleModule ]` [classmethod] — Get Lod Level Modules
  - `get_lod_level_required_module(lod_level)` -> `ParticleModuleRequired` [classmethod] — Get Lod Level Required Module
  - `get_lod_level_spawn_module(lod_level)` -> `ParticleModuleSpawn` [classmethod] — Get Lod Level Spawn Module
  - `get_lod_level_type_data_module(lod_level)` -> `ParticleModuleTypeDataBase` [classmethod] — Get Lod Level Type Data Module
  - `get_long_package_path(long_package_name)` -> `str` [classmethod] — Generic Utilities
  - `get_particle_module_acceleration_drag_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Acceleration Drag Props
  - `get_particle_module_acceleration_drag_scale_over_life_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Acceleration Drag Scale Over Life Props
  - `get_particle_module_acceleration_over_lifetime_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Acceleration Over Lifetime Props
  - `get_particle_module_acceleration_props(out_apply_owner_scale=bool)` [classmethod] — Get Particle Module Acceleration Props
  - `get_particle_module_attractor_line_props(out_end_point=Vector, out_range=Distribution, out_strength=Distribution)` [classmethod] — Get Particle Module Attractor Line Props
  - `get_particle_module_attractor_particle_props(out_range=Distribution, out_strength_by_distance=bool, out_strength=Distribution, out_affect_base_velocity=bool, out_selection_method=AttractorParticleSelectionMethod, out_renew_source=bool, out_inherit_source_velocity=bool)` [classmethod] — Get Particle Module Attractor Particle Props
  - `get_particle_module_attractor_point_props(out_range=Distribution, out_strength=Distribution, bout_strength_by_distance=bool, out_affects_base_velocity=bool, out_override_velocity=bool, out_use_world_space_position=bool, out_positive_x=bool, out_positive_y=bool, out_positive_z=bool, out_negative_x=bool, out_negative_y=bool, out_negative_z=bool)` [classmethod] — Get Particle Module Attractor Point Props
  - `get_particle_module_beam_noise_props(particle_module)` -> `None` [classmethod] — Get Particle Module Beam Noise Props
  - `get_particle_module_beam_source_props(out_source_absolute=bool)` [classmethod] — Get Particle Module Beam Source Props
  - `get_particle_module_beam_target_props(out_target_absolute=bool)` [classmethod] — Get Particle Module Beam Target Props
  - `get_particle_module_camera_offset_props(out_spawn_time_only=bool, out_update_method=ParticleCameraOffsetUpdateMethod)` [classmethod] — Get Particle Module Camera Offset Props
  - `get_particle_module_collision_props()` [classmethod] — Get Particle Module Collision Props
  - `get_particle_module_color_over_life_props(out_alpha_over_life=Distribution, out_clamp_alpha=bool)` [classmethod] — Get Particle Module Color Over Life Props
  - `get_particle_module_color_props(out_start_alpha=Distribution, out_clamp_alpha=bool)` [classmethod] — Get Particle Module Color Props
  - `get_particle_module_color_scale_over_life_props(out_alpha_scale_over_life=Distribution, out_emitter_time=bool)` [classmethod] — Get Particle Module Color Scale Over Life Props
  - `get_particle_module_constant_acceleration_props(particle_module)` -> `Vector` [classmethod] — Get Particle Module Constant Acceleration Props
  - `get_particle_module_is_enabled(module)` -> `bool` [classmethod] — Get Particle Module Is Enabled
  - `get_particle_module_kill_box_props(out_upper_right_corner=Distribution, out_world_space_coords=bool, out_kill_inside=bool, out_axis_aligned_and_fixed_size=bool)` [classmethod] — Get Particle Module Kill Box Props
  - `get_particle_module_lifetime_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Lifetime Props
  - `get_particle_module_light_props(out_affects_translucency=bool, out_preview_light_radius=bool, out_spawn_fraction=float, out_color_scale_over_life=Distribution, out_brightness_over_life=Distribution, out_radius_scale=Distribution, out_light_exponent=Distribution, out_lighting_channels=LightingChannels, out_volumetric_scattering_intensity=float, out_high_quality_lights=bool, out_shadow_casting_lights=bool)` [classmethod] — Get Particle Module Light Props
  - `get_particle_module_location_bone_socket_props()` [classmethod] — Get Particle Module Location Bone Socket Props
  - `get_particle_module_location_direct_props(out_location_offset=Distribution, out_scale_factor=Distribution)` [classmethod] — Get Particle Module Location Direct Props
  - `get_particle_module_location_primitive_cylinder_props(out_start_radius=Distribution, out_start_height=Distribution, out_height_axis=CylinderHeightAxis, out_positive_x=bool, out_positive_y=bool, out_positive_z=bool, out_negative_x=bool, out_negative_y=bool, out_negative_z=bool, out_surface_only=bool, out_velocity=bool, out_velocity_scale=Distribution, out_start_location=Distribution)` [classmethod] — Get Particle Module Location Primitive Cylinder Props
  - `get_particle_module_location_primitive_sphere_props(out_positive_x=bool, out_positive_y=bool, out_positive_z=bool, out_negative_x=bool, out_negative_y=bool, out_negative_z=bool, out_surface_only=bool, out_velocity=bool, out_velocity_scale=Distribution, out_start_location=Distribution)` [classmethod] — Get Particle Module Location Primitive Sphere Props
  - `get_particle_module_location_props(out_distribute_over_n_points=float, out_distribute_threshold=float)` [classmethod] — Get Particle Module Location Props
  - `get_particle_module_location_skel_vert_surface_props()` [classmethod] — Get Particle Module Location Skel Vert Surface Props
  - `get_particle_module_location_world_offset_props(out_distribute_over_n_points=float, out_distribute_threshold=float)` [classmethod] — Get Particle Module Location World Offset Props
  - `get_particle_module_mesh_material_props(particle_module)` -> `Array [ MaterialInterface ]` [classmethod] — Get Particle Module Mesh Material Props
  - `get_particle_module_mesh_rotation_props(out_inherit_parent_rotation=bool)` [classmethod] — Get Particle Module Mesh Rotation Props
  - `get_particle_module_mesh_rotation_rate_multiply_life_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Mesh Rotation Rate Multiply Life Props
  - `get_particle_module_mesh_rotation_rate_over_life_props(out_scale_rot_rate=bool)` [classmethod] — Get Particle Module Mesh Rotation Rate Over Life Props
  - `get_particle_module_mesh_rotation_rate_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Mesh Rotation Rate Props
  - `get_particle_module_orbit_props(out_offset_amount=Distribution, out_offset_options=OrbitOptionsBP, out_rotation_amount=Distribution, out_rotation_options=OrbitOptionsBP, out_rotation_rate_amount=Distribution, out_rotation_rate_options=OrbitOptionsBP)` [classmethod] — Get Particle Module Orbit Props
  - `get_particle_module_orientation_axis_lock_props(particle_module)` -> `ParticleAxisLock` [classmethod] — Get Particle Module Orientation Axis Lock Props
  - `get_particle_module_parameter_dynamic_props()` [classmethod] — Get Particle Module Parameter Dynamic Props
  - `get_particle_module_pivot_offset_props(particle_module)` -> `Vector2D` [classmethod] — Get Particle Module Pivot Offset Props
  - `get_particle_module_required_per_emitter_props(out_emitter_rotation=Rotator, out_use_local_space=bool, out_kill_on_deactivate=bool, out_kill_on_completed=bool, out_use_legacy_emitter_time=bool, out_emitter_duration_use_range=bool, out_emitter_duration=float, out_emitter_duration_low=float, o_ut_emitter_delay_use_range=bool, out_delay_first_loop_only=bool, out_emitter_delay=float, out_emitter_delay_low=float, out_duration_recalc_each_loop=bool, out_emitter_loops=int32)` [classmethod] — Get Particle Module Required Per Emitter Props
  - `get_particle_module_required_per_module_props(out_random_image_time=float, out_random_image_changes=int32, out_override_system_macro_uv=bool, out_macro_uv_position=Vector, out_macro_uv_radius=float)` [classmethod] — Get Particle Module Required Per Module Props
  - `get_particle_module_required_per_renderer_props(out_screen_alignment=ParticleScreenAlignment, out_sub_images_horizontal=int32, out_sub_images_vertical=int32, out_sort_mode=ParticleSortMode, out_interpolation_method=ParticleSubUVInterpMethod, out_remove_hmd_roll=uint8, out_min_facing_camera_blend_distance=float, out_max_facing_camera_blend_distance=float, out_cutout_texture=Texture2D, out_bounding_mode=SubUVBoundingVertexCount, out_opacity_source_mode=OpacitySourceMode, out_emitter_normals_mode=EmitterNormalsMode, out_alpha_threshold=float)` [classmethod] — Get Particle Module Required Per Renderer Props
  - `get_particle_module_rotation_over_lifetime_props(out_scale=bool)` [classmethod] — Get Particle Module Rotation Over Lifetime Props
  - `get_particle_module_rotation_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Rotation Props
  - `get_particle_module_rotation_rate_multiply_life_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Rotation Rate Multiply Life Props
  - `get_particle_module_rotation_rate_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Rotation Rate Props
  - `get_particle_module_size_multiply_life_props(out_multiply_x=bool, out_multiply_y=bool, out_multiply_z=bool)` [classmethod] — Get Particle Module Size Multiply Life Props
  - `get_particle_module_size_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Size Props
  - `get_particle_module_size_scale_by_speed_props(out_max_scale=Vector2D)` [classmethod] — Get Particle Module Size Scale by Speed Props
  - `get_particle_module_size_scale_props(particle_module)` -> `Distribution` [classmethod] — Get Particle Module Size Scale Props
  - `get_particle_module_spawn_per_unit_props(out_movement_tolerance=float, out_spawn_per_unit=Distribution, out_max_frame_distance=float, out_ignore_spawn_rate_when_moving=bool, out_ignore_movement_along_x=bool, out_ignore_movement_along_y=bool, out_ignore_movement_along_z=bool, out_process_spawn_rate=bool, out_process_burst_list=bool)` [classmethod] — Get Particle Module Spawn Per Unit Props
  - `get_particle_module_spawn_props()` [classmethod] — Get Particle Module Spawn Props
  - `get_particle_module_sub_uv_movie_props(out_frame_rate=Distribution, out_starting_frame=int32)` [classmethod] — Get Particle Module Sub UVMovie Props
  - `get_particle_module_sub_uv_props(out_sub_image_index=Distribution, out_use_real_time=bool)` [classmethod] — Get Particle Module Sub UVProps
  - `get_particle_module_trail_source_props()` [classmethod] — Get Particle Module Trail Source Props
  - `get_particle_module_type_data_beam2_props(particle_module)` -> `None` [classmethod] — Get Particle Module Type Data Beam 2Props
  - `get_particle_module_type_data_gpu_props(particle_module)` -> `None` [classmethod] — Get Particle Module Type Data Gpu Props
  - `get_particle_module_type_data_mesh_props(out_lod_size_scale=float, out_use_static_mesh_lo_ds=bool, out_cast_shadows=bool, out_do_collisions=bool, out_mesh_alignment=MeshScreenAlignment, out_override_material=bool, out_override_default_motion_blur_settings=bool, out_enable_motion_blur=bool, out_roll_pitch_yaw_range=Distribution, out_axis_lock_option=ParticleAxisLock, out_camera_facing=bool, out_camera_facing_up_axis_option=MeshCameraFacingUpAxis, out_camera_facing_option=MeshCameraFacingOptions, out_apply_particle_rotation_as_spin=bool, out_facing_camera_direction_rather_than_position=bool, out_collisions_consider_particle_size=bool)` [classmethod] — Get Particle Module Type Data Mesh Props
  - `get_particle_module_type_data_ribbon_class()` [classmethod] — Get Particle Module Type Data Ribbon Class
  - `get_particle_module_type_data_ribbon_props(out_sheets_per_trail=int32, out_max_trail_count=int32, out_max_particle_in_trail_count=int32, out_dead_trails_on_deactivate=bool, out_clip_source_segment=bool, out_enable_previous_tangent_recalculation=bool, out_tangent_recalculation_every_frame=bool, out_spawn_initial_particle=bool, out_render_axis=TrailsRenderAxisOption, out_tangent_spawning_scalar=float, out_render_geometry=bool, out_render_spawn_points=bool, out_render_tangents=bool, out_render_tessellation=bool, out_tiling_distance=float, out_distance_tessellation_step_size=float, out_enable_tangent_diff_interp_scale=bool, out_tangent_tessellation_scalar=float)` [classmethod] — Get Particle Module Type Data Ribbon Props
  - `get_particle_module_vector_field_local_props(particle_module, out_relative_rotation=Rotator, out_relative_scale3d=Vector, out_intensity=float, out_tightness=float, out_ignore_component_transform=bool, out_tile_x=bool, out_tile_y=bool, out_tile_z=bool, out_use_fix_dt=bool)` [classmethod] — Get Particle Module Vector Field Local Props
  - `get_particle_module_vector_field_rotation_rate_props(particle_module)` -> `Vector` [classmethod] — Get Particle Module Vector Field Rotation Rate Props
  - `get_particle_module_velocity_cone_props(out_velocity_distribution=Distribution, out_direction=Vector, out_world_space=bool, out_apply_owner_scale=bool)` [classmethod] — Get Particle Module Velocity Cone Props
  - `get_particle_module_velocity_inherit_parent_props(out_in_world_space=bool, out_apply_owner_scale=bool)` [classmethod] — Get Particle Module Velocity Inherit Parent Props
  - `get_particle_module_velocity_over_lifetime_props(out_absolute=bool, out_in_world_space=bool, out_apply_owner_scale=bool)` [classmethod] — Get Particle Module Velocity Over Lifetime Props
  - `get_particle_module_velocity_props(out_start_velocity_radial=Distribution, out_in_world_space=bool, out_apply_owner_scale=bool)` [classmethod] — Get Particle Module Velocity Props
  - `get_vector_distribution_const_curve_values(distribution)` -> `InterpCurveVector` [classmethod] — Get Vector Distribution Const Curve Values
  - `get_vector_distribution_const_values(distribution)` -> `Vector` [classmethod] — Get Vector Distribution Const Values
  - `get_vector_distribution_parameter_values(out_min_input=Vector, out_max_input=Vector, out_min_output=Vector, out_max_output=Vector)` [classmethod] — Get Vector Distribution Parameter Values
  - `get_vector_distribution_uniform_curve_values(distribution)` -> `InterpCurveTwoVectors` [classmethod] — Get Vector Distribution Uniform Curve Values
  - `get_vector_distribution_uniform_values(out_max=Vector)` [classmethod] — Get Vector Distribution Uniform Values
  - `get_warmup_time(system)` -> `float` [classmethod] — Get Warmup Time
  - `keys_from_interp_curve_float(curve)` -> `Array [ RichCurveKeyBP ]` [classmethod] — Cascade curve helpers
  - `keys_from_interp_curve_two_vectors(curve, component_idx)` -> `Array [ RichCurveKeyBP ]` [classmethod] — Keys from Interp Curve Two Vectors
  - `keys_from_interp_curve_vector(curve, component_idx)` -> `Array [ RichCurveKeyBP ]` [classmethod] — Keys from Interp Curve Vector
  - `keys_from_interp_curve_vector2d(curve, component_idx)` -> `Array [ RichCurveKeyBP ]` [classmethod] — Keys from Interp Curve Vector 2D
  - `set_mesh_renderer_material_overrides_from_cascade(mesh_renderer_props, mesh_materials)` -> `None` [classmethod] — Set Mesh Renderer Material Overrides from Cascade

### `unreal.NiagaraEmitterConversionContext`
Inherits: `Object` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Wrapper for modifying a UNiagaraEmitter by adding Scripts and Renderers through UNiagaraScriptConversionContexts and UNiagaraRendererProperties, respectively.

**Methods** (21):
  - `add_event_handler(event_script_properties_bp)` -> `None` — Add Event Handler
  - `add_module_event_script(script_name_string, script_conversion_context, event_script_props)` -> `None` — Add Module Event Script
  - `add_module_script(script_name_string, script_conversion_context, module_script_execution_category)` -> `None` — Add Module Script
  - `add_renderer(renderer_name_string, new_renderer_properties)` -> `None` — Add a renderer to this emitter conversion context through renderer properties.
  - `cleanup()` -> `None` — Cleanup
  - `finalize()` -> `None` — Apply all pending UNiagaraScriptConversionContexts and UNiagaraRendererProperties to this UNiagaraEmitterContext by crea...
  - `find_module_script(script_name_string)` -> `NiagaraScriptConversionContext` — Find Module Script
  - `find_or_add_module_event_script(script_name_string, create_script_context_args, event_script_props)` -> `NiagaraScriptConversionContext` — Find a module script conversion context or add a module script conversion context to this emitter conversion context for...
  - `find_or_add_module_script(script_name_string, create_script_context_args, module_script_execution_category)` -> `NiagaraScriptConversionContext` — Find or add a script conversion context to this emitter conversion context. If a script conversion context is not found ...
  - `find_renderer(renderer_name_string)` -> `NiagaraRendererProperties` — Find an added renderer properties by name string.
  - `get_all_renderers()` -> `Array [ NiagaraRendererProperties ]` — Get All Renderers
  - `get_emitter()` -> `NiagaraEmitter` — Get Emitter
  - `get_enabled()` -> `bool` — Get Enabled
  - `log(message, severity, is_verbose = False)` -> `None` — Log a message to the niagara message log for the emitter.
  - `remove_module_scripts_for_assets(scripts_to_remove)` -> `None` — Remove Module Scripts for Assets
  - `set_detail_bit_mask(bit_mask)` -> `None` — Set Detail Bit Mask
  - `set_enabled(enabled)` -> `None` — Set Enabled
  - `set_local_space(local_space)` -> `None` — Set Local Space
  - `set_parameter_directly(parameter_name_string, parameter_input, set_parameter_execution_category)` -> `None` — Add a set parameter module to the emitter handled by this emitter conversion context.
  - `set_renderer_binding(renderer_properties, binding_name, variable_to_bind_name, source_data_mode)` -> `None` — Set Renderer Binding
  - `set_sim_target(target)` -> `None` — Set Sim Target

### `unreal.NiagaraScriptConversionContext`
Inherits: `Object` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Wrapper for programmatically adding scripts to a UNiagaraEmitter through a UNiagaraEmitterConversionContext.

**Methods** (4):
  - `get_module_enabled()` -> `bool` — Get Module Enabled
  - `log(message, severity, is_verbose = False)` -> `None` — Log a message to the stack and the niagara message log for the module associated with this script.
  - `set_module_enabled(module_enabled)` -> `None` — Set Module Enabled
  - `set_parameter(parameter_name, parameter_input, has_edit_condition = False, edit_condition_value = False)` -> `bool` — Set a parameter on the Script this Script Conversion Context holds.

### `unreal.NiagaraScriptConversionContextInput`
Inherits: `Object` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Wrapper for setting the value on a parameter of a UNiagaraScript, applied through a UNiagaraScriptConversionContext.

**Properties** (1):
  - `input_type`: `NiagaraScriptInputType` [Read-Only] — [Read-Only] (NiagaraScriptInputType)

### `unreal.NiagaraSystemConversionContext`
Inherits: `Object` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Wrapper for modifying a UNiagaraSystem by adding Emitters through UNiagaraEmitterConversionContexts.

**Methods** (5):
  - `add_empty_emitter(new_emitter_name_string)` -> `NiagaraEmitterConversionContext` — Add an empty emitter to the system and return an emitter conversion context.
  - `cleanup()` -> `None` — Cleanup
  - `finalize()` -> `None` — Apply all pending UNiagaraScriptConversionContexts and UNiagaraRendererProperties to the owned UNiagaraEmitterContexts b...
  - `set_warmup_tick_delta(warmup_tick_delta)` -> `None` — Set Warmup Tick Delta
  - `set_warmup_time(warmup_time)` -> `None` — Set Warmup Time

### `unreal.DistributionType`
Inherits: `EnumBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

EDistribution Type

**Properties** (6):
  - `CONST`: `DistributionType = Ellipsis` — 0
  - `CONST_CURVE`: `DistributionType = Ellipsis` — 1
  - `NONE`: `DistributionType = Ellipsis` — 5
  - `PARAMETER`: `DistributionType = Ellipsis` — 4
  - `UNIFORM`: `DistributionType = Ellipsis` — 2
  - `UNIFORM_CURVE`: `DistributionType = Ellipsis` — 3

### `unreal.DistributionValueType`
Inherits: `EnumBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

EDistribution Value Type

**Properties** (3):
  - `FLOAT`: `DistributionValueType = Ellipsis` — 0
  - `NONE`: `DistributionValueType = Ellipsis` — 2
  - `VECTOR`: `DistributionValueType = Ellipsis` — 1

### `unreal.NiagaraEventHandlerAddMode`
Inherits: `EnumBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

ENiagara Event Handler Add Mode

**Properties** (3):
  - `ADD_EVENT`: `NiagaraEventHandlerAddMode = Ellipsis` — 0
  - `ADD_EVENT_AND_EVENT_GENERATOR`: `NiagaraEventHandlerAddMode = Ellipsis` — 1
  - `NONE`: `NiagaraEventHandlerAddMode = Ellipsis` — 2

### `unreal.NiagaraScriptInputType`
Inherits: `EnumBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

ENiagara Script Input Type

**Properties** (13):
  - `BOOL`: `NiagaraScriptInputType = Ellipsis` — 10
  - `DATA_INTERFACE`: `NiagaraScriptInputType = Ellipsis` — 9
  - `ENUM`: `NiagaraScriptInputType = Ellipsis` — 8
  - `FLOAT`: `NiagaraScriptInputType = Ellipsis` — 1
  - `INT`: `NiagaraScriptInputType = Ellipsis` — 0
  - `LINEAR_COLOR`: `NiagaraScriptInputType = Ellipsis` — 5
  - `NONE`: `NiagaraScriptInputType = Ellipsis` — 12
  - `POSITION`: `NiagaraScriptInputType = Ellipsis` — 11
  - `QUATERNION`: `NiagaraScriptInputType = Ellipsis` — 6
  - `STRUCT`: `NiagaraScriptInputType = Ellipsis` — 7
  - `VEC2`: `NiagaraScriptInputType = Ellipsis` — 2
  - `VEC3`: `NiagaraScriptInputType = Ellipsis` — 3
  - `VEC4`: `NiagaraScriptInputType = Ellipsis` — 4

### `unreal.ScriptExecutionCategory`
Inherits: `EnumBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

Enums

**Properties** (5):
  - `EMITTER_SPAWN`: `ScriptExecutionCategory = Ellipsis` — 0
  - `EMITTER_UPDATE`: `ScriptExecutionCategory = Ellipsis` — 1
  - `NONE`: `ScriptExecutionCategory = Ellipsis` — 5
  - `PARTICLE_SPAWN`: `ScriptExecutionCategory = Ellipsis` — 2
  - `PARTICLE_UPDATE`: `ScriptExecutionCategory = Ellipsis` — 3

### `unreal.NiagaraEmitterConversionContext_OnPasteScript`
Inherits: `DelegateBase` | Header: `NiagaraStackGraphUtilitiesAdapterLibrary.h`

On Paste Script Delegate Signature
