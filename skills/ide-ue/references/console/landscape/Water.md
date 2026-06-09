# UE Python API — Water Module

**63 types** from the `Water` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BuoyancyData`, `GerstnerWave`, `GerstnerWaveOctave`, `ShallowWaterSimulationGrid`, `SphericalPontoon`, `UnderwaterPostProcessSettings`, `WaterBodyHeightmapSettings`, `WaterBodyStaticMeshSettings`, `WaterBodyWeightmapSettings`, `WaterBrushEffectBlurring`, `WaterBrushEffectCurlNoise`, `WaterBrushEffectCurves`, `WaterBrushEffectDisplacement`, `WaterBrushEffects`, `WaterBrushEffectSmoothBlending`, `WaterBrushEffectTerracing`, `WaterCurveSettings`, `WaterFalloffSettings`, `WaterSplineCurveDefaults`, `BakedShallowWaterSimulationComponent`, ... (63 total)

---

## Classes

### `unreal.BuoyancyData`
Inherits: `StructBase` | Header: `BuoyancyTypes.h`

Buoyancy Data

**Properties** (2):
  - `center_pontoons_on_com`: `bool` [Read-Only] — [Read-Only] If true, center pontoons around center of mass when using relative locations
(not used w...
  - `pontoons`: `None` [Read-Only] — [Read-Only] (Array[SphericalPontoon])

### `unreal.GerstnerWave`
Inherits: `StructBase` | Header: `GerstnerWaterWaves.h`

Raw wave parameters for one gerstner wave

**Properties** (4):
  - `amplitude`: `float` — [Read-Write] (float)
  - `direction`: `Vector` — [Read-Write] (Vector)
  - `steepness`: `float` — [Read-Write] (float)
  - `wave_length`: `float` — [Read-Write] (float)

### `unreal.GerstnerWaveOctave`
Inherits: `StructBase` | Header: `GerstnerWaterWaves.h`

Gerstner Wave Octave

**Properties** (5):
  - `amplitude_scale`: `float` — [Read-Write] (float)
  - `main_direction`: `float` — [Read-Write] (float)
  - `num_waves`: `int` — [Read-Write] (int32)
  - `spread_angle`: `float` — [Read-Write] (float)
  - `uniform_spread`: `bool` — [Read-Write] (bool)

### `unreal.ShallowWaterSimulationGrid`
Inherits: `StructBase` | Header: `BakedShallowWaterSimulationComponent.h`

Shallow Water Simulation Grid

### `unreal.SphericalPontoon`
Inherits: `StructBase` | Header: `BuoyancyTypes.h`

Spherical Pontoon

**Properties** (18):
  - `center_location`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `center_socket`: `Name` [Read-Only] — [Read-Only] The socket to center this pontoon on. Also used as the name of the pontoon for effects (...
  - `current_water_body_component`: `WaterBodyComponent` [Read-Only] — [Read-Only] (WaterBodyComponent)
  - `fx_enabled`: `bool` [Read-Only] — [Read-Only] Should this pontoon be considered as a candidate location for visual/audio effects upon ...
  - `immersion_depth`: `float` [Read-Only] — [Read-Only] (float)
  - `is_in_water`: `bool` [Read-Only] — [Read-Only] (bool)
  - `local_force`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `offset`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `radius`: `float` [Read-Only] — [Read-Only] The radius of the pontoon (float)
  - `relative_location`: `Vector` [Read-Only] — [Read-Only] Relative Location of pontoon WRT parent actor. Overridden by Center Socket. (Vector)
  - `socket_rotation`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `water_body_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `water_depth`: `float` [Read-Only] — [Read-Only] (float)
  - `water_height`: `float` [Read-Only] — [Read-Only] (float)
  - `water_plane_location`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `water_plane_normal`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `water_surface_position`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `water_velocity`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.UnderwaterPostProcessSettings`
Inherits: `StructBase` | Header: `WaterBodyComponent.h`

Underwater Post Process Settings

**Properties** (5):
  - `blend_radius`: `float` — [Read-Write] World space radius around the volume that is used for blending (only if not unbound). (...
  - `blend_weight`: `float` — no effect, 1:full effect (float) [Read-Write] 0
  - `enabled`: `bool` — [Read-Write] (bool)
  - `post_process_settings`: `PostProcessSettings` — note : use UnderwaterPostProcessMaterial for setting the actual post process material. (PostProcessS...
  - `priority`: `float` — [Read-Write] (float)

### `unreal.WaterBodyHeightmapSettings`
Inherits: `StructBase` | Header: `WaterBodyHeightmapSettings.h`

Water Body Heightmap Settings

**Properties** (3):
  - `blend_mode`: `WaterBrushBlendType` — [Read-Write] (WaterBrushBlendType)
  - `effects`: `WaterBrushEffects` — [Read-Write] (WaterBrushEffects)
  - `falloff_settings`: `WaterFalloffSettings` — [Read-Write] (WaterFalloffSettings)

### `unreal.WaterBodyStaticMeshSettings`
Inherits: `StructBase` | Header: `WaterBodyStaticMeshSettings.h`

Water Body Static Mesh Settings

### `unreal.WaterBodyWeightmapSettings`
Inherits: `StructBase` | Header: `WaterBodyWeightmapSettings.h`

Water Body Weightmap Settings

**Properties** (7):
  - `edge_offset`: `float` — [Read-Write] (float)
  - `falloff_width`: `float` — [Read-Write] (float)
  - `final_opacity`: `float` — [Read-Write] (float)
  - `midpoint`: `float` — [Read-Write] (float)
  - `modulation_texture`: `Texture2D` — [Read-Write] (Texture2D)
  - `texture_influence`: `float` — [Read-Write] (float)
  - `texture_tiling`: `float` — [Read-Write] (float)

### `unreal.WaterBrushEffectBlurring`
Inherits: `StructBase` | Header: `WaterBrushEffects.h`

Water Brush Effect Blurring

**Properties** (2):
  - `blur_shape`: `bool` — [Read-Write] (bool)
  - `radius`: `int` — [Read-Write] (int32)

### `unreal.WaterBrushEffectCurlNoise`
Inherits: `StructBase` | Header: `WaterBrushEffects.h`

Water Brush Effect Curl Noise

**Properties** (4):
  - `curl1_amount`: `float` — [Read-Write] (float)
  - `curl1_tiling`: `float` — [Read-Write] (float)
  - `curl2_amount`: `float` — [Read-Write] (float)
  - `curl2_tiling`: `float` — [Read-Write] (float)

### `unreal.WaterBrushEffectCurves`
Inherits: `StructBase` | Header: `WaterBrushEffects.h`

Water Brush Effect Curves

**Properties** (5):
  - `channel_depth`: `float` — [Read-Write] (float)
  - `channel_edge_offset`: `float` — [Read-Write] (float)
  - `curve_ramp_width`: `float` — [Read-Write] (float)
  - `elevation_curve_asset`: `CurveFloat` — [Read-Write] (CurveFloat)
  - `use_curve_channel`: `bool` — [Read-Write] (bool)

### `unreal.WaterBrushEffectDisplacement`
Inherits: `StructBase` | Header: `WaterBrushEffects.h`

Water Brush Effect Displacement

**Properties** (6):
  - `channel`: `LinearColor` — [Read-Write] (LinearColor)
  - `displacement_height`: `float` — [Read-Write] (float)
  - `displacement_tiling`: `float` — [Read-Write] (float)
  - `midpoint`: `float` — [Read-Write] (float)
  - `texture`: `Texture2D` — [Read-Write] (Texture2D)
  - `weightmap_influence`: `float` — [Read-Write] (float)

### `unreal.WaterBrushEffects`
Inherits: `StructBase` | Header: `WaterBrushEffects.h`

Water Brush Effects

**Properties** (5):
  - `blurring`: `WaterBrushEffectBlurring` — [Read-Write] (WaterBrushEffectBlurring)
  - `curl_noise`: `WaterBrushEffectCurlNoise` — [Read-Write] (WaterBrushEffectCurlNoise)
  - `displacement`: `WaterBrushEffectDisplacement` — [Read-Write] (WaterBrushEffectDisplacement)
  - `smooth_blending`: `WaterBrushEffectSmoothBlending` — [Read-Write] (WaterBrushEffectSmoothBlending)
  - `terracing`: `WaterBrushEffectTerracing` — [Read-Write] (WaterBrushEffectTerracing)

### `unreal.WaterBrushEffectSmoothBlending`
Inherits: `StructBase` | Header: `WaterBrushEffects.h`

Water Brush Effect Smooth Blending

**Properties** (2):
  - `inner_smooth_distance`: `float` — [Read-Write] (float)
  - `outer_smooth_distance`: `float` — [Read-Write] (float)

### `unreal.WaterBrushEffectTerracing`
Inherits: `StructBase` | Header: `WaterBrushEffects.h`

Water Brush Effect Terracing

**Properties** (5):
  - `mask_length`: `float` — [Read-Write] (float)
  - `mask_start_offset`: `float` — [Read-Write] (float)
  - `terrace_alpha`: `float` — [Read-Write] (float)
  - `terrace_smoothness`: `float` — [Read-Write] (float)
  - `terrace_spacing`: `float` — [Read-Write] (float)

### `unreal.WaterCurveSettings`
Inherits: `StructBase` | Header: `WaterCurveSettings.h`

Water Curve Settings

**Properties** (5):
  - `channel_depth`: `float` — [Read-Write] (float)
  - `channel_edge_offset`: `float` — [Read-Write] (float)
  - `curve_ramp_width`: `float` — [Read-Write] (float)
  - `elevation_curve_asset`: `CurveFloat` — [Read-Write] (CurveFloat)
  - `use_curve_channel`: `bool` — [Read-Write] (bool)

### `unreal.WaterFalloffSettings`
Inherits: `StructBase` | Header: `WaterFalloffSettings.h`

Water Falloff Settings

**Properties** (5):
  - `edge_offset`: `float` — [Read-Write] (float)
  - `falloff_angle`: `float` — [Read-Write] (float)
  - `falloff_mode`: `WaterBrushFalloffMode` — [Read-Write] (WaterBrushFalloffMode)
  - `falloff_width`: `float` — [Read-Write] (float)
  - `z_offset`: `float` — [Read-Write] (float)

### `unreal.WaterSplineCurveDefaults`
Inherits: `StructBase` | Header: `WaterSplineMetadata.h`

Water Spline Curve Defaults

### `unreal.BakedShallowWaterSimulationComponent`
Inherits: `PrimitiveComponent` | Header: `BakedShallowWaterSimulationComponent.h`

Baked Shallow Water Simulation Component

### `unreal.BuoyancyComponent`
Inherits: `ActorComponent` | Header: `BuoyancyComponent.h`

Buoyancy Component

**Methods** (6):
  - `get_current_water_body_components()` -> `Array [ WaterBodyComponent ]` — Get Current Water Body Components
  - `get_last_water_surface_info(out_water_plane_normal=Vector, out_water_surface_position=Vector, out_water_depth=float, out_water_body_idx=int32, out_water_velocity=Vector)` — Get Last Water Surface Info
  - `is_in_water_body()` -> `bool` — Is in Water Body
  - `is_overlapping_water_body()` -> `bool` — Is Overlapping Water Body
  - `on_pontoon_entered_water(pontoon)` -> `None` — On Pontoon Entered Water
  - `on_pontoon_exited_water(pontoon)` -> `None` — On Pontoon Exited Water

**Properties** (4):
  - `buoyancy_data`: `BuoyancyData` [Read-Only] — [Read-Only] (BuoyancyData)
  - `on_entered_water_delegate`: `OnPontoonEnteredWater` — [Read-Write] (OnPontoonEnteredWater)
  - `on_exited_water_delegate`: `OnPontoonExitedWater` — [Read-Write] (OnPontoonExitedWater)
  - `pontoons`: `None` — [Read-Write]
deprecated: Use BuoyancyData.Pontoons instead. (Array[SphericalPontoon])

### `unreal.BuoyancyManager`
Inherits: `Actor` | Header: `BuoyancyManager.h`

Buoyancy Manager

### `unreal.GerstnerWaterWaveGeneratorBase`
Inherits: `Object` | Header: `GerstnerWaterWaves.h`

Base class for the gerstner water wave generation. This can be overridden by either C++ classes or Blueprint classes. Simply implement GenerateGerstnerWaves (or GenerateGerstnerWaves_Implementation in...

**Methods** (1):
  - `generate_gerstner_waves()` -> `Array [ GerstnerWave ]` — Generate Gerstner Waves

### `unreal.GerstnerWaterWaveGeneratorSimple`
Inherits: `GerstnerWaterWaveGeneratorBase` | Header: `GerstnerWaterWaves.h`

Default implementation of a gerstner wave generator using a simple custom range based set of parameters to generate waves.

**Properties** (14):
  - `amplitude_falloff`: `float` — [Read-Write] (float)
  - `direction_angular_spread_deg`: `float` — [Read-Write] (float)
  - `large_wave_steepness`: `float` — [Read-Write] (float)
  - `max_amplitude`: `float` — [Read-Write] (float)
  - `max_wavelength`: `float` — [Read-Write] (float)
  - `min_amplitude`: `float` — [Read-Write] (float)
  - `min_wavelength`: `float` — [Read-Write] (float)
  - `num_waves`: `int` — [Read-Write] (int32)
  - `randomness`: `float` — [Read-Write] (float)
  - `seed`: `int` — [Read-Write] (int32)
  - `small_wave_steepness`: `float` — [Read-Write] (float)
  - `steepness_falloff`: `float` — [Read-Write] (float)
  - `wavelength_falloff`: `float` — [Read-Write] (float)
  - `wind_angle_deg`: `float` — [Read-Write] (float)

### `unreal.GerstnerWaterWaveGeneratorSpectrum`
Inherits: `GerstnerWaterWaveGeneratorBase` | Header: `GerstnerWaterWaves.h`

Default implementation of a gerstner wave generator using known wave spectra from oceanology. Edited using octaves, where each octave is a set of waves with 2x longer wave length than the previous oct...

### `unreal.GerstnerWaterWaves`
Inherits: `WaterWaves` | Header: `GerstnerWaterWaves.h`

Waves implementation based off Gerstner waves. They provide a decent look, are relatively cheap to evaluate and have the advantage of being only dependent on the time variable, which makes them perfec...

**Properties** (3):
  - `gerstner_wave_generator`: `GerstnerWaterWaveGeneratorBase` [Read-Only] — [Read-Only] (GerstnerWaterWaveGeneratorBase)
  - `gerstner_waves`: `None` [Read-Only] — [Read-Only] (Array[GerstnerWave])
  - `max_wave_height`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.LakeCollisionComponent`
Inherits: `PrimitiveComponent` | Header: `LakeCollisionComponent.h`

Lake Collision Component

### `unreal.NiagaraWaterFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraWaterFunctionLibrary.h`

Niagara Water Function Library

**Methods** (2):
  - `set_water_body(niagara_system, override_name, water_body)` -> `None` [classmethod] — Set Water Body deprecated: Use SetWaterBodyComponent instead
  - `set_water_body_component(niagara_system, override_name, water_body_component)` -> `None` [classmethod] — Sets the water body component on the Niagra water data interface on a Niagara particle system

### `unreal.OceanBoxCollisionComponent`
Inherits: `BoxComponent` | Header: `OceanCollisionComponent.h`

Ocean Box Collision Component

### `unreal.OceanCollisionComponent`
Inherits: `PrimitiveComponent` | Header: `OceanCollisionComponent.h`

Ocean Collision Component

### `unreal.WaterBody`
Inherits: `Actor` | Header: `WaterBodyActor.h`

Base class for all water body actors.

**Methods** (14):
  - `get_audio_intensity_at_spline_input_key(key)` -> `float` — Get Audio Intensity at Spline Input Key deprecated: Function âGetAudioIntensityAtSplineInputKeyâ is deprecated.
  - `get_exclusion_volumes()` -> `Array [ WaterBodyExclusionVolume ]` — Get Exclusion Volumes deprecated: Function âGetExclusionVolumesâ is deprecated.
  - `get_islands()` -> `Array [ WaterBodyIsland ]` — Get Islands deprecated: Function âGetIslandsâ is deprecated.
  - `get_river_to_lake_transition_material_instance()` -> `MaterialInstanceDynamic` — Get River to Lake Transition Material Instance deprecated: Function âGetRiverToLakeTransitionMaterialInstanceâ is de...
  - `get_river_to_ocean_transition_material_instance()` -> `MaterialInstanceDynamic` — Get River to Ocean Transition Material Instance deprecated: Function âGetRiverToOceanTransitionMaterialInstanceâ is ...
  - `get_water_body_component()` -> `WaterBodyComponent` — Returns the water body component
  - `get_water_body_type()` -> `WaterBodyType` — Returns the type of body
  - `get_water_material_instance()` -> `MaterialInstanceDynamic` — Get Water Material Instance deprecated: Function âGetWaterMaterialInstanceâ is deprecated.
  - `get_water_spline()` -> `WaterSplineComponent` — Returns water spline component
  - `get_water_velocity_at_spline_input_key(key)` -> `float` — Get Water Velocity at Spline Input Key deprecated: Function âGetWaterVelocityAtSplineInputKeyâ is deprecated.
  - `get_water_velocity_vector_at_spline_input_key(key)` -> `Vector` — Get Water Velocity Vector at Spline Input Key deprecated: Function âGetWaterVelocityVectorAtSplineInputKeyâ is depre...
  - `on_water_body_changed(shape_or_position_changed, weightmap_settings_changed = False)` -> `None` — On Water Body Changed deprecated: Function âOnWaterBodyChangedâ is deprecated.
  - `set_water_material(material)` -> `None` — Set Water Material deprecated: Function âSetWaterMaterialâ is deprecated.
  - `set_water_waves(water_waves)` -> `None` — Set Water Waves

**Properties** (4):
  - `spline_comp`: `WaterSplineComponent` [Read-Only] — [Read-Only] The spline data attached to this water type. (WaterSplineComponent)
  - `water_body_component`: `WaterBodyComponent` [Read-Only] — [Read-Only] (WaterBodyComponent)
  - `water_body_index`: `int` [Read-Only] — [Read-Only] Unique Id for accessing (wave, â¦ ) data in GPU buffers (int32)
  - `water_waves`: `WaterWavesBase` [Read-Only] — [Read-Only] (WaterWavesBase)

### `unreal.WaterBodyComponent`
Inherits: `PrimitiveComponent` | Header: `WaterBodyComponent.h`

Water Body Component

**Methods** (32):
  - `get_audio_intensity_at_spline_input_key(key)` -> `float` — Get Audio Intensity at Spline Input Key
  - `get_collision_components(only_enabled_components = True)` -> `Array [ PrimitiveComponent ]` — Returns bodyâs collision components
  - `get_exclusion_volumes()` -> `Array [ WaterBodyExclusionVolume ]` — Gets the exclusion volume that influence this water body
  - `get_islands()` -> `Array [ WaterBodyIsland ]` — Gets the islands that influence this water body
  - `get_max_wave_height()` -> `float` — Returns the max height that this water bodyâs waves can hit. Can be called regardless of whether the water body suppor...
  - `get_river_to_lake_transition_material()` -> `MaterialInterface` — Returns river to lake transition water material
  - `get_river_to_lake_transition_material_instance()` -> `MaterialInstanceDynamic` — Returns River to lake transition material instance (For internal use. Please use AWaterBodyRiver instead.)
  - `get_river_to_ocean_transition_material()` -> `MaterialInterface` — Returns river to ocean transition water material
  - `get_river_to_ocean_transition_material_instance()` -> `MaterialInstanceDynamic` — Returns River to ocean transition material instance (For internal use. Please use AWaterBodyRiver instead.)
  - `get_standard_renderable_components()` -> `Array [ PrimitiveComponent ]` — Retrieves the list of primitive components that this water body uses when not being rendered by the water mesh (e.g. the...
  - `get_underwater_post_process_material_instance()` -> `MaterialInstanceDynamic` — Returns under water post process MID
  - `get_water_body_actor()` -> `WaterBody` — Returns the WaterBodyActor who owns this component
  - `get_water_info_material_instance()` -> `MaterialInstanceDynamic` — Returns water info MID
  - `get_water_lod_material_instance()` -> `MaterialInstanceDynamic` — Get Water LODMaterial Instance
  - `get_water_material()` -> `MaterialInterface` — Returns water material
  - `get_water_material_instance()` -> `MaterialInstanceDynamic` — Returns water MID
  - `get_water_spline()` -> `WaterSplineComponent` — Returns water spline component
  - `get_water_static_mesh_material_instance()` -> `MaterialInstanceDynamic` — Returns water static mesh MID
  - `get_water_surface_info_at_location(location, out_water_surface_normal=Vector, out_water_velocity=Vector, out_water_depth=float)` — Get Water Surface Info at Location
  - `get_water_velocity_at_spline_input_key(key)` -> `float`
  - `get_water_velocity_vector_at_spline_input_key(key)` -> `Vector` — Get Water Velocity Vector at Spline Input Key
  - `get_water_waves()` -> `WaterWavesBase` — Get Water Waves
  - `on_water_body_changed(shape_or_position_changed, weightmap_settings_changed = False, user_triggered_changed = False)` -> `None` — On Water Body Changed
  - `set_audio_intensity_at_spline_input_key(key, audio_intensity)` -> `None` — Set Audio Intensity at Spline Input Key
  - `set_underwater_post_process_material(material)` -> `None` — Sets under water post process material
  - `set_water_and_under_water_post_process_material(water_material, under_water_post_process_material)` -> `None` — Set Water and Under Water Post Process Material
  - `set_water_body_static_mesh_enabled(enabled)` -> `None` — Set Water Body Static Mesh Enabled
  - `set_water_info_material(material)` -> `None` — Sets the material used to draw the Water Info Texture for this water body
  - `set_water_material(material)` -> `None` — Sets water material
  - `set_water_static_mesh_material(material)` -> `None` — Sets water static mesh material
  - `set_water_velocity_at_spline_input_key(key, velocity)` -> `None` — Set Water Velocity at Spline Input Key
  - `set_water_zone_override(water_zone_override)` -> `None` — Override the default behavior of water bodies finding their water zone based on bounds and set a specific water zone to ...

**Properties** (19):
  - `affects_landscape`: `bool` — [Read-Write] If enabled, landscape will be deformed based on this water body placed on top of it and...
  - `always_generate_water_mesh_tiles`: `bool` [Read-Only] — [Read-Only] When this is set to true, the water mesh will always generate tiles for this water body....
  - `collision_height_offset`: `float` — [Read-Write] The distance above the surface of the water where collision checks should still occur. ...
  - `curve_settings`: `WaterCurveSettings` — [Read-Write] (WaterCurveSettings)
  - `layer_weightmap_settings`: `None` — [Read-Write] (Map[Name,WaterBodyWeightmapSettings])
  - `overlap_material_priority`: `int` [Read-Only] — [Read-Only] Higher number is higher priority. If two water bodies overlap and they donât have a tr...
  - `shape_dilation`: `float` — [Read-Write] (float)
  - `target_wave_mask_depth`: `float` — [Read-Write] Water depth at which waves start being attenuated. (float)
  - `underwater_post_process_material`: `MaterialInterface` [Read-Only] — [Read-Only] Post process material to apply when the camera goes underwater (only available when bGen...
  - `underwater_post_process_settings`: `UnderwaterPostProcessSettings` — [Read-Write] Post process settings to apply when the camera goes underwater (only available when col...
  - `water_body_index`: `int` [Read-Only] — [Read-Only] Unique Id for accessing (wave, â¦ ) data in GPU buffers (int32)
  - `water_heightmap_settings`: `WaterBodyHeightmapSettings` — [Read-Write] (WaterBodyHeightmapSettings)
  - `water_hlod_material`: `MaterialInterface` [Read-Only] — [Read-Only] (MaterialInterface)
  - `water_info_material`: `MaterialInterface` [Read-Only] — [Read-Only] (MaterialInterface)
  - `water_material`: `MaterialInterface` [Read-Only] — [Read-Only] (MaterialInterface)
  - `water_mesh_override`: `StaticMesh` — [Read-Write] (StaticMesh)
  - `water_nav_area_class`: `Class` — [Read-Write] The navigation area class that will be generated on nav mesh (type(Class))
  - `water_static_mesh_material`: `MaterialInterface` [Read-Only] — [Read-Only] (MaterialInterface)
  - `water_zone_override`: `WaterZone` [Read-Only] — [Read-Only] (WaterZone)

### `unreal.WaterBodyCustom`
Inherits: `WaterBody` | Header: `WaterBodyCustomActor.h`

Water Body Custom

### `unreal.WaterBodyCustomComponent`
Inherits: `WaterBodyComponent` | Header: `WaterBodyCustomComponent.h`

Water Body Custom Component

### `unreal.WaterBodyExclusionVolume`
Inherits: `PhysicsVolume` | Header: `WaterBodyExclusionVolume.h`

WaterBodyExclusionVolume allows players not enter surface swimming when touching a water volume

**Properties** (2):
  - `water_bodies`: `None` [Read-Only] — [Read-Only] List of water bodies that will be added or removed from the exclusion volume based on th...
  - `water_body_to_ignore`: `WaterBody` — [Read-Write]
deprecated: Property âWaterBodyToIgnoreâ is deprecated. (WaterBody)

### `unreal.WaterBodyInfoMeshComponent`
Inherits: `WaterBodyMeshComponent` | Header: `WaterBodyInfoMeshComponent.h`

WaterBodyMeshComponent used to render the water body into the water info texture. Utilizes a custom scene proxy to allow hiding the mesh outside of all other passes besides the water info passes.

### `unreal.WaterBodyIsland`
Inherits: `Actor` | Header: `WaterBodyIslandActor.h`

Water Body Island

**Methods** (1):
  - `get_water_spline()` -> `WaterSplineComponent` — ~End AActor Interface

**Properties** (4):
  - `spline_comp`: `WaterSplineComponent` [Read-Only] — [Read-Only] The spline data attached to this water type. (WaterSplineComponent)
  - `water_curve_settings`: `WaterCurveSettings` — [Read-Write] (WaterCurveSettings)
  - `water_heightmap_settings`: `WaterBodyHeightmapSettings` — [Read-Write] (WaterBodyHeightmapSettings)
  - `water_weightmap_settings`: `None` — [Read-Write] (Map[Name,WaterBodyWeightmapSettings])

### `unreal.WaterBodyLake`
Inherits: `WaterBody` | Header: `WaterBodyLakeActor.h`

Water Body Lake

### `unreal.WaterBodyLakeComponent`
Inherits: `WaterBodyComponent` | Header: `WaterBodyLakeComponent.h`

Water Body Lake Component

### `unreal.WaterBodyMeshComponent`
Inherits: `StaticMeshComponent` | Header: `WaterBodyMeshComponent.h`

Base class for meshes used to render water bodies without relying on the water zone/water mesh.

### `unreal.WaterBodyOcean`
Inherits: `WaterBody` | Header: `WaterBodyOceanActor.h`

Water Body Ocean

### `unreal.WaterBodyOceanComponent`
Inherits: `WaterBodyComponent` | Header: `WaterBodyOceanComponent.h`

Water Body Ocean Component

**Properties** (2):
  - `collision_extents`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `ocean_extents`: `Vector2D` [Read-Only] — [Read-Only] The extent of the ocean, centered around water zone to which the ocean belongs. (Vector2...

### `unreal.WaterBodyRiver`
Inherits: `WaterBody` | Header: `WaterBodyRiverActor.h`

Water Body River

### `unreal.WaterBodyRiverComponent`
Inherits: `WaterBodyComponent` | Header: `WaterBodyRiverComponent.h`

Water Body River Component

**Methods** (7):
  - `get_river_depth_at_spline_input_key(key)` -> `float` — Get River Depth at Spline Input Key
  - `get_river_width_at_spline_input_key(key)` -> `float` — Get River Width at Spline Input Key
  - `set_lake_and_ocean_transition_materials(lake_transition, ocean_transition)` -> `None` — Set Lake and Ocean Transition Materials
  - `set_lake_transition_material(mat)` -> `None` — Set Lake Transition Material
  - `set_ocean_transition_material(mat)` -> `None` — Set Ocean Transition Material
  - `set_river_depth_at_spline_input_key(key, depth)` -> `None` — Set River Depth at Spline Input Key
  - `set_river_width_at_spline_input_key(key, width)` -> `None` — Set River Width at Spline Input Key

**Properties** (2):
  - `lake_transition_material`: `MaterialInterface` [Read-Only] — [Read-Only] Material used when a river is overlapping a lake. (MaterialInterface)
  - `ocean_transition_material`: `MaterialInterface` [Read-Only] — [Read-Only] This is the material used when a river is overlapping the ocean. (MaterialInterface)

### `unreal.WaterBodyStaticMeshComponent`
Inherits: `WaterBodyMeshComponent` | Header: `WaterBodyStaticMeshComponent.h`

WaterBodyMeshComponent used to when rendering water statically without relying on the dynamic tessellation of the water zone/water mesh.

### `unreal.WaterMeshComponent`
Inherits: `MeshComponent` | Header: `WaterMeshComponent.h`

Water Mesh Component responsible for generating and rendering a continuous water mesh on top of all the existing water body actors in the world The component contains a quadtree which defines where th...

**Methods** (1):
  - `is_enabled()` -> `bool` — Is Enabled

### `unreal.WaterSplineComponent`
Inherits: `SplineComponent` | Header: `WaterSplineComponent.h`

Water Spline Component

**Methods** (1):
  - `k2_synchronize_and_broadcast_data_change()` -> `None`

### `unreal.WaterSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `WaterSubsystem.h`

This is the API used to get information about water at runtime

**Methods** (14):
  - `get_camera_underwater_depth()` -> `float` — Get Camera Underwater Depth
  - `get_ocean_base_height()` -> `float` — Returns the base height of the ocean. This should correspond to its world Z position
  - `get_ocean_flood_height()` -> `float` — Returns the relative flood height
  - `get_ocean_total_height()` -> `float` — Returns the total height of the ocean. This should correspond to the base height plus any additional height, like flood ...
  - `get_shallow_water_max_dynamic_forces()` -> `int32` [classmethod] — Get Shallow Water Max Dynamic Forces
  - `get_shallow_water_max_impulse_forces()` -> `int32` [classmethod] — Get Shallow Water Max Impulse Forces
  - `get_shallow_water_simulation_render_target_size()` -> `int32` [classmethod] — Get Shallow Water Simulation Render Target Size
  - `get_smoothed_world_time_seconds()` -> `float` — Get Smoothed World Time Seconds
  - `get_water_time_seconds()` -> `float` — Get Water Time Seconds
  - `is_shallow_water_simulation_enabled()` -> `bool` — Is Shallow Water Simulation Enabled
  - `is_underwater_post_process_enabled()` -> `bool` — Is Underwater Post Process Enabled
  - `is_water_rendering_enabled()` -> `bool` — Is Water Rendering Enabled
  - `print_to_water_log(message, warning)` -> `None` — Print to Water Log
  - `set_ocean_flood_height(flood_height)` -> `None` — Set Ocean Flood Height

**Properties** (2):
  - `on_camera_underwater_state_changed`: `OnCameraUnderwaterStateChanged` — [Read-Write] (OnCameraUnderwaterStateChanged)
  - `on_water_scalability_changed`: `OnWaterScalabilityChanged` — [Read-Write] (OnWaterScalabilityChanged)

### `unreal.WaterTerrainComponent`
Inherits: `ActorComponent` | Header: `WaterTerrainComponent.h`

Water Terrain Component can be attached to any actor with primitive components to allow them to render into a Water Info Texture as the terrain.

### `unreal.WaterWaves`
Inherits: `WaterWavesBase` | Header: `WaterWaves.h`

Water Waves

### `unreal.WaterWavesBase`
Inherits: `Object` | Header: `WaterWaves.h`

Water Waves Base

### `unreal.WaterZone`
Inherits: `Actor` | Header: `WaterZoneActor.h`

Water Zone

**Methods** (2):
  - `get_water_zone_index()` -> `int32` — Get Water Zone Index
  - `set_far_mesh_material(far_material)` -> `None` — Set Far Mesh Material

**Properties** (7):
  - `on_water_info_texture_array_created`: `OnWaterInfoTextureArrayCreated` — [Read-Write] (OnWaterInfoTextureArrayCreated)
  - `render_target_resolution`: `IntPoint` [Read-Only] — [Read-Only] (IntPoint)
  - `water_info_texture`: `TextureRenderTarget2D` — [Read-Write]
deprecated: Use WaterInfoTextureArray instead. (TextureRenderTarget2D)
  - `water_info_texture_array`: `TextureRenderTarget2DArray` [Read-Only] — [Read-Only] (TextureRenderTarget2DArray)
  - `water_info_texture_array_num_slices`: `int` [Read-Only] — [Read-Only] (int32)
  - `water_mesh`: `WaterMeshComponent` [Read-Only] — [Read-Only] The water mesh component (WaterMeshComponent)
  - `zone_extent`: `Vector2D` — [Read-Write] The maximum size in local space of the water zone. (Vector2D)

### `unreal.WaterBodyType`
Inherits: `EnumBase` | Header: `WaterBodyTypes.h`

EWater Body Type

**Properties** (4):
  - `LAKE`: `WaterBodyType = Ellipsis` — Lakes defined by a close loop spline around the shore with water in the middle 1
  - `OCEAN`: `WaterBodyType = Ellipsis` — Ocean defined by a shoreline spline and rendered out to a far distance 2
  - `RIVER`: `WaterBodyType = Ellipsis` — Rivers defined by a spline down the middle 0
  - `TRANSITION`: `WaterBodyType = Ellipsis` — A custom water body that can be used for gameplay reasons.  Uses a spline down the middle to encode ...

### `unreal.WaterBrushBlendType`
Inherits: `EnumBase` | Header: `WaterBodyHeightmapSettings.h`

The blend mode changes how the brush material is applied to the terrain.

**Properties** (4):
  - `ADDITIVE`: `WaterBrushBlendType = Ellipsis` — Performs an additive blend, using a flat Z=0 terrain as the input. Useful when you want to preserve ...
  - `ALPHA_BLEND`: `WaterBrushBlendType = Ellipsis` — Alpha Blend will affect the heightmap both upwards and downwards. 0
  - `MAX`: `WaterBrushBlendType = Ellipsis` — Limits the brush to only raising the terrain. 2
  - `MIN`: `WaterBrushBlendType = Ellipsis` — Limits the brush to only lowering the terrain. 1

### `unreal.WaterBrushFalloffMode`
Inherits: `EnumBase` | Header: `WaterFalloffSettings.h`

EWater Brush Falloff Mode

**Properties** (2):
  - `ANGLE`: `WaterBrushFalloffMode = Ellipsis` — 0
  - `WIDTH`: `WaterBrushFalloffMode = Ellipsis` — 1

### `unreal.WaterExclusionMode`
Inherits: `EnumBase` | Header: `WaterBodyExclusionVolume.h`

EWater Exclusion Mode

**Properties** (2):
  - `ADD_WATER_BODIES_LIST_TO_EXCLUSION`: `WaterExclusionMode = Ellipsis` — Adds all water bodies specified in the WaterBodies list to the exclusion volume.
If none are specifi...
  - `REMOVE_WATER_BODIES_LIST_FROM_EXCLUSION`: `WaterExclusionMode = Ellipsis` — Removes all water bodies specified in the WaterBodies list from the exclusion volume.
If none are sp...

### `unreal.WaveSpectrumType`
Inherits: `EnumBase` | Header: `GerstnerWaterWaves.h`

EWave Spectrum Type

**Properties** (3):
  - `JONSWAP`: `WaveSpectrumType = Ellipsis` — 2
  - `PHILLIPS`: `WaveSpectrumType = Ellipsis` — 0
  - `PIERSON_MOSKOWITZ`: `WaveSpectrumType = Ellipsis` — 1

### `unreal.OnCameraUnderwaterStateChanged`
Inherits: `MulticastDelegateBase` | Header: `WaterSubsystem.h`

On Camera Underwater State Changed Delegate Signature

### `unreal.OnPontoonEnteredWater`
Inherits: `MulticastDelegateBase` | Header: `BuoyancyComponent.h`

On Pontoon Entered Water Delegate Signature

### `unreal.OnPontoonExitedWater`
Inherits: `MulticastDelegateBase` | Header: `BuoyancyComponent.h`

On Pontoon Exited Water Delegate Signature

### `unreal.OnWaterInfoTextureArrayCreated`
Inherits: `MulticastDelegateBase` | Header: `WaterZoneActor.h`

On Water Info Texture Array Created Delegate Signature

### `unreal.OnWaterInfoTextureCreated`
Inherits: `MulticastDelegateBase` | Header: `WaterZoneActor.h`

On Water Info Texture Created Delegate Signature

### `unreal.OnWaterScalabilityChanged`
Inherits: `MulticastDelegateBase` | Header: `WaterSubsystem.h`

On Water Scalability Changed Delegate Signature
