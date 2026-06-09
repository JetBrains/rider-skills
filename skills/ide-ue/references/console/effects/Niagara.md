# UE Python API — Niagara Module

**225 types** from the `Niagara` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BasicParticleData`, `NDIStaticMeshSectionFilter`, `NiagaraCulledComponentInfo`, `NiagaraDataChannelSearchParameters`, `NiagaraDataChannelUpdateContext`, `NiagaraDataChannelVariable`, `NiagaraDataInterfaceEmitterBinding`, `NiagaraDeviceProfileStateEntry`, `NiagaraEmitterScalabilityOverride`, `NiagaraEmitterScalabilityOverrides`, `NiagaraEmitterScalabilitySettings`, `NiagaraEmitterScalabilitySettingsArray`, `NiagaraEmitterScriptProperties`, `NiagaraEventScriptProperties`, `NiagaraGlobalBudgetScaling`, `NiagaraID`, `NiagaraLinearRamp`, `NiagaraMaterialAttributeBinding`, `NiagaraMeshMaterialOverride`, `NiagaraMeshRendererMeshProperties`, ... (225 total)

---

## Classes

### `unreal.BasicParticleData`
Inherits: `StructBase` | Header: `NiagaraDataInterfaceExport.h`

Basic Particle Data

**Properties** (3):
  - `position`: `Vector` [Read-Only] — [Read-Only] (Vector)
  - `size`: `float` [Read-Only] — [Read-Only] (float)
  - `velocity`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.NDIStaticMeshSectionFilter`
Inherits: `StructBase` | Header: `NiagaraDataInterfaceStaticMesh.h`

NDIStatic Mesh Section Filter

### `unreal.NiagaraCulledComponentInfo`
Inherits: `StructBase` | Header: `NiagaraCullProxyComponent.h`

Info on a culled Niagara Component for use by itâs cull proxy.

### `unreal.NiagaraDataChannelSearchParameters`
Inherits: `StructBase` | Header: `NiagaraDataChannelPublic.h`

Parameters used when retrieving a specific set of Data Channel Data to read or write. Many Data Channel types will have multiple internal sets of data and these parameters control which the Channel sh...

**Properties** (3):
  - `location`: `Vector` — [Read-Write] In cases where there is no owning component for data being read or written to a data ch...
  - `override_location`: `bool` — [Read-Write] If true, even if an owning component is set, the data channel should use the Location v...
  - `owning_component`: `SceneComponent` — [Read-Write] In cases where there is an owning component such as an object spawning from itself etc,...

### `unreal.NiagaraDataChannelUpdateContext`
Inherits: `StructBase` | Header: `NiagaraDataChannelPublic.h`

Niagara Data Channel Update Context

**Properties** (4):
  - `first_new_data_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `last_new_data_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `new_element_count`: `int` [Read-Only] — [Read-Only] (int32)
  - `reader`: `NiagaraDataChannelReader` [Read-Only] — [Read-Only] (NiagaraDataChannelReader)

### `unreal.NiagaraDataChannelVariable`
Inherits: `NiagaraVariableBase` | Header: `NiagaraDataChannelPublic.h`

Niagara Data Channel Variable

### `unreal.NiagaraDataInterfaceEmitterBinding`
Inherits: `StructBase` | Header: `NiagaraDataInterfaceEmitterBinding.h`

Niagara Data Interface Emitter Binding

### `unreal.NiagaraDeviceProfileStateEntry`
Inherits: `StructBase` | Header: `NiagaraPlatformSet.h`

Niagara Device Profile State Entry

### `unreal.NiagaraEmitterScalabilityOverride`
Inherits: `NiagaraEmitterScalabilitySettings` | Header: `NiagaraEffectType.h`

Niagara Emitter Scalability Override

### `unreal.NiagaraEmitterScalabilityOverrides`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Container struct for an array of emitter scalability overrides. Enables details customization and data validation.

### `unreal.NiagaraEmitterScalabilitySettings`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Scalability settings for Niagara Emitters on a particular platform set.

### `unreal.NiagaraEmitterScalabilitySettingsArray`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Container struct for an array of emitter scalability settings. Enables details customization and data validation.

### `unreal.NiagaraEmitterScriptProperties`
Inherits: `StructBase` | Header: `NiagaraEmitter.h`

Niagara Emitter Script Properties

### `unreal.NiagaraEventScriptProperties`
Inherits: `NiagaraEmitterScriptProperties` | Header: `NiagaraEmitter.h`

Niagara Event Script Properties

### `unreal.NiagaraGlobalBudgetScaling`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Niagara Global Budget Scaling

### `unreal.NiagaraID`
Inherits: `StructBase` | Header: `NiagaraTypes.h`

Niagara ID

**Properties** (2):
  - `acquire_tag`: `int` — [Read-Write] A unique tag for when this ID was acquired.
Allows us to differentiate between particle...
  - `index`: `int` — [Read-Write] Index in the indirection table for this particle. Allows fast access to this particles ...

### `unreal.NiagaraLinearRamp`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Simple linear ramp to drive scaling values. TODO: Replace with Curve that can baked down for fast eval and has good inline UI widgets.

### `unreal.NiagaraMaterialAttributeBinding`
Inherits: `StructBase` | Header: `NiagaraCommon.h`

Niagara Material Attribute Binding

### `unreal.NiagaraMeshMaterialOverride`
Inherits: `StructBase` | Header: `NiagaraMeshRendererProperties.h`

Niagara Mesh Material Override

### `unreal.NiagaraMeshRendererMeshProperties`
Inherits: `NiagaraMeshRendererMeshPropertiesBase` | Header: `NiagaraMeshRendererMeshProperties.h`

Niagara Mesh Renderer Mesh Properties

### `unreal.NiagaraMeshRendererMeshPropertiesBase`
Inherits: `StructBase` | Header: `NiagaraMeshRendererMeshProperties.h`

Niagara Mesh Renderer Mesh Properties Base

**Properties** (5):
  - `mesh`: `StaticMesh` — [Read-Write] The mesh to use when rendering this slot (StaticMesh)
  - `pivot_offset`: `Vector` — [Read-Write] Offset of the mesh pivot (Vector)
  - `pivot_offset_space`: `NiagaraMeshPivotOffsetSpace` — [Read-Write] What space is the pivot offset in? (NiagaraMeshPivotOffsetSpace)
  - `rotation`: `Rotator` — [Read-Write] Rotation of the mesh (Rotator)
  - `scale`: `Vector` — [Read-Write] Scale of the mesh (Vector)

### `unreal.NiagaraModuleDependency`
Inherits: `StructBase` | Header: `NiagaraScript.h`

Niagara Module Dependency

### `unreal.NiagaraParameterBinding`
Inherits: `StructBase` | Header: `NiagaraParameterBinding.h`

Niagara Parameter Binding

### `unreal.NiagaraParameterBindingWithValue`
Inherits: `NiagaraParameterBinding` | Header: `NiagaraParameterBinding.h`

Niagara Parameter Binding with Value

### `unreal.NiagaraParameterStore`
Inherits: `StructBase` | Header: `NiagaraParameterStore.h`

Base storage class for Niagara parameter values.

**Properties** (1):
  - `parameter_offsets`: `None` — Separate out into a layout and instance class to reduce duplicated data for this?
deprecated: Proper...

### `unreal.NiagaraPerfBaselineStats`
Inherits: `StructBase` | Header: `NiagaraPerfBaseline.h`

Niagara Perf Baseline Stats

**Properties** (4):
  - `per_instance_avg_gt`: `float` — [Read-Write] Per instance average time spent on the GameThread (Âµs). (float)
  - `per_instance_avg_rt`: `float` — [Read-Write] Per instance average time spent on the RenderThread (Âµs). (float)
  - `per_instance_max_gt`: `float` — [Read-Write] Per instance max time spent on the GameThread (Âµs). (float)
  - `per_instance_max_rt`: `float` — [Read-Write] Per instance max time spent on the RenderThread (Âµs). (float)

### `unreal.NiagaraPlatformSet`
Inherits: `StructBase` | Header: `NiagaraPlatformSet.h`

Niagara Platform Set

### `unreal.NiagaraPlatformSetCVarCondition`
Inherits: `StructBase` | Header: `NiagaraPlatformSet.h`

Imposes a condition that a CVar must contain a set value or range of values for a platform set to be enabled.

### `unreal.NiagaraPlatformSetRedirect`
Inherits: `StructBase` | Header: `NiagaraPlatformSet.h`

Allows us to replace a specific device profile usage condition in all NiagaraPlatformSets. Helpful when dealing with changes to device profile structure.

### `unreal.NiagaraPosition`
Inherits: `Vector3f` | Header: `NiagaraTypes.h`

Niagara Position

### `unreal.NiagaraRendererMaterialParameters`
Inherits: `StructBase` | Header: `NiagaraRendererProperties.h`

Parameters to apply to the material, these are both constant and dynamic bindings Having any bindings set will cause a MID to be generated

### `unreal.NiagaraRendererMaterialScalarParameter`
Inherits: `StructBase` | Header: `NiagaraRendererProperties.h`

Niagara Renderer Material Scalar Parameter

### `unreal.NiagaraRendererMaterialStaticBoolParameter`
Inherits: `StructBase` | Header: `NiagaraRendererProperties.h`

Niagara Renderer Material Static Bool Parameter

### `unreal.NiagaraRendererMaterialTextureParameter`
Inherits: `StructBase` | Header: `NiagaraRendererProperties.h`

Niagara Renderer Material Texture Parameter

### `unreal.NiagaraRendererMaterialVectorParameter`
Inherits: `StructBase` | Header: `NiagaraRendererProperties.h`

Niagara Renderer Material Vector Parameter

### `unreal.NiagaraRendererReadbackParameters`
Inherits: `StructBase` | Header: `NiagaraRendererReadback.h`

Niagara Renderer Readback Parameters

**Properties** (7):
  - `apply_wpo`: `bool` — [Read-Write] When enabled material WPO will be included in the exported data (bool)
  - `export_color`: `bool` — [Read-Write] When enabled vertex colors will be exported (bool)
  - `export_materials`: `bool` — [Read-Write] When enabled we will attempt to export the materials used with each section
When disabl...
  - `export_num_tex_coords`: `int` — [Read-Write] How many vertex texture coordinates to export (int32)
  - `export_position`: `bool` — [Read-Write] When enabled vertex positions will be exported (bool)
  - `export_tangent_basis`: `bool` — [Read-Write] When enabled the vertex tangent basis will be exported (bool)
  - `view_index_to_capture`: `type` — [Read-Write] When set we capture the batches from the view index provided
When unset we capture batc...

### `unreal.NiagaraRibbonShapeCustomVertex`
Inherits: `StructBase` | Header: `NiagaraRibbonRendererProperties.h`

Niagara Ribbon Shape Custom Vertex

### `unreal.NiagaraRibbonUVSettings`
Inherits: `StructBase` | Header: `NiagaraRibbonRendererProperties.h`

Defines settings for UV behavior for a UV channel on ribbons.

### `unreal.NiagaraSimCacheCaptureParameters`
Inherits: `StructBase` | Header: `NiagaraSimCacheCapture.h`

Niagara Sim Cache Capture Parameters

**Properties** (8):
  - `append_to_sim_cache`: `bool` — [Read-Write] When enabled we will append to the existing simulation cache rather than destroying the...
  - `capture_all_frames_immediatly`: `bool` — [Read-Write] When enabled we will capture all the requested frames immediatly.
This will capture the...
  - `capture_fixed_number_of_frames`: `bool` — [Read-Write] When enabled we capture NumFrames number of frames, otherwise the capture will continue...
  - `capture_rate`: `int` — [Read-Write] Allows for reducing the frequency of captured frames in relation to the simulationâs ...
  - `immediate_capture_delta_time`: `float` — [Read-Write] The delta time in seconds to use when manually advancing the simulation.Defaults to 1 /...
  - `num_frames`: `int` — [Read-Write] The max number of frames to capture. The capture will stop when the simulation complete...
  - `timeout_frame_count`: `int` — [Read-Write] When we fail to capture a new frame after this many frames the capture will complete au...
  - `use_timeout`: `bool` — [Read-Write] When enabled the capture will time out if we reach the defined number of frames without...

### `unreal.NiagaraSimCacheCreateParameters`
Inherits: `StructBase` | Header: `NiagaraSimCache.h`

Niagara Sim Cache Create Parameters

**Properties** (12):
  - `allow_data_interface_caching`: `bool` — [Read-Write] When enabled Data Interface data will be stored in the SimCache.
This can result in a l...
  - `allow_interpolation`: `bool` — [Read-Write] When enabled we allow the cache to be generated for interpolation.
This will increase t...
  - `allow_rebasing`: `bool` — [Read-Write] When enabled allows the SimCache to be re-based.
i.e. World space emitters can be moved...
  - `allow_serialize_large_cache`: `bool` — [Read-Write] When enabled the cache will support serializing large amounts of cache data. (bool)
  - `allow_velocity_extrapolation`: `bool` — [Read-Write] When enabled we allow the cache to be generated for extrapolation.
This will force the ...
  - `attribute_capture_mode`: `NiagaraSimCacheAttributeCaptureMode` — [Read-Write] How do we want to capture attributes for the simulation cache.
The mode selected depend...
  - `explicit_capture_attributes`: `None` — [Read-Write] List of attributes to capture when the capture attribute capture mode is set to explici...
  - `include_debug_data`: `bool` — [Read-Write] When enabled additional information is stored that can be useful for debugging a simula...
  - `interpolation_exclude_attributes`: `None` — [Read-Write] List of specific Attributes to exclude interpolation for.  They must be types that are ...
  - `interpolation_include_attributes`: `None` — [Read-Write] List of specific Attributes to include when using interpolation.  They must be types th...
  - `rebase_exclude_attributes`: `None` — [Read-Write] List of Attributes to force exclude from the SimCache rebase, they should be the full p...
  - `rebase_include_attributes`: `None` — [Read-Write] List of Attributes to force include in the SimCache rebase, they should be the full pat...

### `unreal.NiagaraSimStageExecutionLoopEditorData`
Inherits: `StructBase` | Header: `NiagaraSimStageExecutionData.h`

Niagara Sim Stage Execution Loop Editor Data

### `unreal.NiagaraSpawnInfo`
Inherits: `StructBase` | Header: `NiagaraTypes.h`

Data controlling the spawning of particles

**Properties** (4):
  - `count`: `int` — [Read-Write] How many particles to spawn. (int32)
  - `interp_start_dt`: `float` — [Read-Write] The sub frame delta time at which to spawn the first particle. (float)
  - `interval_dt`: `float` — [Read-Write] The sub frame delta time between each particle. (float)
  - `spawn_group`: `int` — [Read-Write] An integer used to identify this spawn info.
Typically this is unused.
An example usage...

### `unreal.NiagaraSystemScalabilityOverride`
Inherits: `NiagaraSystemScalabilitySettings` | Header: `NiagaraEffectType.h`

Niagara System Scalability Override

### `unreal.NiagaraSystemScalabilityOverrides`
Inherits: `StructBase` | Header: `NiagaraSystem.h`

Container struct for an array of system scalability overrides. Enables details customization and data validation.

### `unreal.NiagaraSystemScalabilitySettings`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Scalability settings for Niagara Systems for a particular platform set (unless overridden).

### `unreal.NiagaraSystemScalabilitySettingsArray`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Container struct for an array of system scalability settings. Enables details customization and data validation.

### `unreal.NiagaraSystemVisibilityCullingSettings`
Inherits: `StructBase` | Header: `NiagaraEffectType.h`

Scalability settings for Niagara Systems for a particular platform set (unless overridden).

### `unreal.NiagaraTypeDefinition`
Inherits: `StructBase` | Header: `NiagaraTypes.h`

Niagara Type Definition

### `unreal.NiagaraTypeDefinitionHandle`
Inherits: `StructBase` | Header: `NiagaraTypes.h`

Niagara Type Definition Handle

### `unreal.NiagaraUObjectPropertyReaderRemap`
Inherits: `StructBase` | Header: `NiagaraDataInterfaceUObjectPropertyReader.h`

Niagara UObject Property Reader Remap

### `unreal.NiagaraUserParameterBinding`
Inherits: `StructBase` | Header: `NiagaraCommon.h`

Niagara User Parameter Binding

### `unreal.NiagaraVariable`
Inherits: `NiagaraVariableBase` | Header: `NiagaraTypes.h`

Niagara Variable

### `unreal.NiagaraVariableAttributeBinding`
Inherits: `StructBase` | Header: `NiagaraCommon.h`

Niagara Variable Attribute Binding

### `unreal.NiagaraVariableBase`
Inherits: `StructBase` | Header: `NiagaraTypes.h`

Niagara Variable Base

**Properties** (1):
  - `type_def`: `NiagaraTypeDefinition` — [Read-Write]
deprecated: Property âTypeDefâ is deprecated. (NiagaraTypeDefinition)

### `unreal.NiagaraVariant`
Inherits: `StructBase` | Header: `NiagaraVariant.h`

Niagara Variant

### `unreal.VersionedNiagaraEmitterData`
Inherits: `StructBase` | Header: `NiagaraEmitter.h`

Struct containing all of the data that can be different between different emitter versions.

**Properties** (10):
  - `allocation_mode`: `ParticleAllocationMode` — [Read-Write] The emitter needs to allocate memory for the particles each tick.
To prevent reallocati...
  - `determinism`: `bool` — [Read-Write] Toggles whether to globally make the random number generator be deterministic or non-de...
  - `fixed_bounds`: `Box` — [Read-Write] The fixed bounding box value. CalculateBoundsMode is the condition whether the fixed bo...
  - `interpolated_spawn_mode`: `NiagaraInterpolatedSpawnMode` — [Read-Write] This defines if newly spawned particles run only the spawn script on the first frame or...
  - `interpolated_spawning`: `bool` — [Read-Write]
deprecated: Property âbInterpolatedSpawningâ is deprecated. (bool)
  - `local_space`: `bool` — [Read-Write] Toggles whether or not the particles within this emitter are relative to the emitter or...
  - `max_gpu_particles_spawn_per_frame`: `int` — [Read-Write] An override on the max number of GPU particles we expect to spawn in a single frame. A ...
  - `random_seed`: `int` — [Read-Write] An emitter-based seed for the deterministic random number generator. (int32)
  - `requires_persistent_i_ds`: `bool` — [Read-Write] Creates a stable Identifier (Particles.ID) which does not vary from frame to frame. Thi...
  - `sim_target`: `NiagaraSimTarget` — [Read-Write] (NiagaraSimTarget)

### `unreal.AsyncNiagaraCaptureSimCache`
Inherits: `CancellableAsyncAction` | Header: `NiagaraSimCacheFunctionLibrary.h`

Async Niagara Capture Sim Cache

**Properties** (1):
  - `capture_complete`: `OnCaptureComplete` — [Read-Write] (OnCaptureComplete)

### `unreal.MovieSceneNiagaraBoolParameterTrack`
Inherits: `MovieSceneNiagaraParameterTrack` | Header: `MovieSceneNiagaraBoolParameterTrack.h`

A track for animating boolean niagara parameters.

### `unreal.MovieSceneNiagaraColorParameterTrack`
Inherits: `MovieSceneNiagaraParameterTrack` | Header: `MovieSceneNiagaraColorParameterTrack.h`

A track for animating color niagara parameters.

### `unreal.MovieSceneNiagaraFloatParameterTrack`
Inherits: `MovieSceneNiagaraParameterTrack` | Header: `MovieSceneNiagaraFloatParameterTrack.h`

A track for animating float niagara parameters.

### `unreal.MovieSceneNiagaraIntegerParameterTrack`
Inherits: `MovieSceneNiagaraParameterTrack` | Header: `MovieSceneNiagaraIntegerParameterTrack.h`

A track for animating integer niagara parameters.

### `unreal.MovieSceneNiagaraParameterTrack`
Inherits: `MovieSceneNiagaraTrack` | Header: `MovieSceneNiagaraParameterTrack.h`

A base class for tracks that animate niagara parameters.

### `unreal.MovieSceneNiagaraSystemSpawnSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneNiagaraSystemSpawnSection.h`

Movie Scene Niagara System Spawn Section

### `unreal.MovieSceneNiagaraSystemTrack`
Inherits: `MovieSceneNiagaraTrack` | Header: `MovieSceneNiagaraSystemTrack.h`

Movie Scene Niagara System Track

### `unreal.MovieSceneNiagaraTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneNiagaraTrack.h`

Movie Scene Niagara Track

### `unreal.MovieSceneNiagaraVectorParameterTrack`
Inherits: `MovieSceneNiagaraParameterTrack` | Header: `MovieSceneNiagaraVectorParameterTrack.h`

A track for animating float niagara parameters.

### `unreal.NiagaraActor`
Inherits: `Actor` | Header: `NiagaraActor.h`

Niagara Actor

**Methods** (2):
  - `get_destroy_on_system_finish()` -> `bool` — Returns true if the system will destroy on finish
  - `set_destroy_on_system_finish(should_destroy_on_system_finish)` -> `None` — Set true for this actor to self-destruct when the Niagara system finishes, false otherwise

**Properties** (1):
  - `niagara_component`: `NiagaraComponent` [Read-Only] — [Read-Only] Pointer to System component (NiagaraComponent)

### `unreal.NiagaraBaselineController`
Inherits: `Object` | Header: `NiagaraPerfBaseline.h`

Base class for baseline controllers. These can are responsible for spawning and manipulating the FX needed for the baseline perf tests.

**Methods** (5):
  - `get_system()` -> `NiagaraSystem` — Returns the System for this baseline. Will synchronously load the system if needed.
  - `on_begin_test()` -> `None` — Called from the stats system when we begin gathering stats for the given System asset.
  - `on_end_test(stats)` -> `None` — Called from the stats system on completion of the test with the final stats for the given system asset.
  - `on_owner_tick(delta_time)` -> `None` — Called when the owning actor is ticked.
  - `on_tick_test()` -> `bool` — Returns whether the baseline test is complete.

**Properties** (3):
  - `effect_type`: `NiagaraEffectType` [Read-Only] — [Read-Only] The effect type this controller is in use by. (NiagaraEffectType)
  - `owner`: `NiagaraPerfBaselineActor` [Read-Only] — [Read-Only] The owning actor for this baseline controller. (NiagaraPerfBaselineActor)
  - `test_duration`: `float` — [Read-Write] Duration to gather performance stats for the given system. (float)

### `unreal.NiagaraBaselineController_Basic`
Inherits: `NiagaraBaselineController` | Header: `NiagaraPerfBaseline.h`

Simple controller that will just spawn the given system N times. If any instance completes, it will spawn a new one to replace it. Can handle simple burst or looping systems.

### `unreal.NiagaraComponent`
Inherits: `FXSystemComponent` | Header: `NiagaraComponent.h`

UNiagaraComponent is the primitive component for a Niagara System. see: ANiagaraActor see: UNiagaraSystem

**Methods** (75):
  - `advance_simulation(tick_count, tick_delta_seconds)` -> `None` — Advances this systemâs simulation by the specified number of ticks and delta time.
  - `advance_simulation_by_time(simulate_time, tick_delta_seconds)` -> `None` — Advances this systemâs simulation by the specified time in seconds and delta time. Advancement is done in whole ticks ...
  - `clear_emitter_fixed_bounds(emitter_name)` -> `None` — Clear any previously set fixed bounds for the emitter instance.
  - `clear_sim_cache(reset_system = False)` -> `None` — Clear any active simulation cache. When clearing a simulation cache that has been running you may wish to reset or conti...
  - `clear_system_fixed_bounds()` -> `None` — Clear any previously set fixed bounds for the system instance.
  - `get_age_update_mode()` -> `NiagaraAgeUpdateMode` — Get Age Update Mode
  - `get_asset()` -> `NiagaraSystem` — Get Asset
  - `get_custom_time_dilation()` -> `float` — Get Custom Time Dilation
  - `get_data_interface(name)` -> `NiagaraDataInterface` — Get Data Interface
  - `get_desired_age()` -> `float` — Gets the desired age of the System instance. This is only relevant when using the DesiredAge age update mode.
  - `get_emitter_fixed_bounds(emitter_name)` -> `Box` — Gets the fixed bounds for an emitter instance. This will return the user set fixed bounds if set, or the emitters fixed ...
  - `get_force_solo()` -> `bool` — Get Force Solo
  - `get_lock_desired_age_delta_time_to_seek_delta()` -> `bool`
  - `get_max_sim_time()` -> `float` — Get the maximum CPU time in seconds we will simulate to the desired age, when we go beyond this limit ticks will be proc...
  - `get_occlusion_query_mode()` -> `NiagaraOcclusionQueryMode` — Get Occlusion Query Mode
  - `get_preview_lod_distance()` -> `float` — Get Preview LODDistance
  - `get_preview_lod_distance_enabled()` -> `bool` — Get Preview LODDistance Enabled
  - `get_random_seed_offset()` -> `int32` — Get Random Seed Offset
  - `get_seek_delta()` -> `float`
  - `get_sim_cache()` -> `NiagaraSimCache` — Get the active simulation cache, will return null if we do not have an active one.
  - `get_system_fixed_bounds()` -> `Box` — Gets the fixed bounds for the system instance. This will return the user set fixed bounds if set, or the systems fixed b...
  - `get_tick_behavior()` -> `NiagaraTickBehavior` — Get Tick Behavior
  - `init_for_performance_baseline()` -> `None` — Initializes this component for capturing a performance baseline. This will do things such as disabling distance culling ...
  - `is_paused()` -> `bool` — Is Paused
  - `reinitialize_system()` -> `None` — Called on when an external object wishes to force this System to reinitialize itself from the System data.
  - `reset_system()` -> `None` — Resets the System to itâs initial pre-simulated state.
  - `seek_to_desired_age(desired_age)` -> `None`
  - `set_age_update_mode(age_update_mode)` -> `None` — Sets the age update mode for the System instance.
  - `set_asset(asset, reset_existing_override_parameters = True)` -> `None` — Switch which asset the component is using. This requires Niagara to wait for concurrent execution and the override param...
  - `set_auto_destroy(auto_destroy)` -> `None` — Set Auto Destroy
  - `set_can_render_while_seeking(can_render_while_seeking)` -> `None` — Sets whether or not the system can render while seeking.
  - `set_custom_time_dilation(dilation = 1.000000)` -> `None` — Sets the custom time dilation value for the component. Note: This is only available on components that are in solo mode ...
  - `set_desired_age(desired_age)` -> `None` — Sets the desired age of the System instance. This is only relevant when using the DesiredAge age update mode.
  - `set_emitter_fixed_bounds(emitter_name, local_bounds)` -> `None` — Sets the fixed bounds for an emitter instance, this overrides all other bounds. The box is expected to be in local space...
  - `set_force_solo(force_solo)` -> `None` — Set Force Solo
  - `set_gpu_compute_debug(enable_debug)` -> `None` — Set Gpu Compute Debug
  - `set_lock_desired_age_delta_time_to_seek_delta(lock)` -> `None`
  - `set_max_sim_time(max_time)` -> `None` — Sets the maximum CPU time in seconds we will simulate to the desired age, when we go beyond this limit ticks will be pro...
  - `set_niagara_variable_actor(variable_name, actor)` -> `None` — Set Niagara Variable Actor
  - `set_niagara_variable_bool(variable_name, value)` -> `None` — Set Niagara Variable Bool
  - `set_niagara_variable_float(variable_name, value)` -> `None` — Set Niagara Variable Float
  - `set_niagara_variable_int(variable_name, value)` -> `None` — Set Niagara Variable Int
  - `set_niagara_variable_linear_color(variable_name, value)` -> `None` — Set Niagara Variable Linear Color
  - `set_niagara_variable_matrix(variable_name, value)` -> `None` — Set Niagara Variable Matrix
  - `set_niagara_variable_object(variable_name, object)` -> `None` — Set Niagara Variable Object
  - `set_niagara_variable_position(variable_name, value)` -> `None` — Set Niagara Variable Position
  - `set_niagara_variable_quat(variable_name, value)` -> `None` — Set Niagara Variable Quat
  - `set_niagara_variable_vec2(variable_name, value)` -> `None` — Set Niagara Variable Vec 2
  - `set_niagara_variable_vec3(variable_name, value)` -> `None` — Set Niagara Variable Vec 3
  - `set_niagara_variable_vec4(variable_name, value)` -> `None` — Set Niagara Variable Vec 4
  - `set_occlusion_query_mode(mode)` -> `None` — Set Occlusion Query Mode
  - `set_paused(paused)` -> `None` — Set Paused
  - `set_preview_lod_distance(enable_preview_lod_distance, preview_lod_distance, preview_max_distance)` -> `None` — Set Preview LODDistance
  - `set_random_seed_offset(new_random_seed_offset)` -> `None` — Set Random Seed Offset
  - `set_rendering_enabled(rendering_enabled)` -> `None` — Sets whether or not rendering is enabled for this component.
  - `set_seek_delta(seek_delta)` -> `None`
  - `set_sim_cache(sim_cache, reset_system = False)` -> `None` — Sets the simulation cache to use for the component. A null SimCache parameter will clear the active simulation cache. Wh...
  - `set_system_fixed_bounds(local_bounds)` -> `None` — Sets the fixed bounds for the system instance, this overrides all other bounds. The box is expected to be in local space...
  - `set_tick_behavior(new_tick_behavior)` -> `None` — Set Tick Behavior
  - `set_variable_actor(variable_name, actor)` -> `None` — Set Variable Actor
  - `set_variable_bool(variable_name, value)` -> `None` — Sets a Niagara bool parameter by name, overriding locally if necessary.
  - `set_variable_float(variable_name, value)` -> `None` — Sets a Niagara float parameter by name, overriding locally if necessary.
  - `set_variable_int(variable_name, value)` -> `None` — Sets a Niagara int parameter by name, overriding locally if necessary.
  - `set_variable_linear_color(variable_name, value)` -> `None` — Sets a Niagara FLinearColor parameter by name, overriding locally if necessary.
  - `set_variable_material(variable_name, object)` -> `None` — Set Variable Material
  - `set_variable_matrix(variable_name, value)` -> `None` — Sets a Niagara matrix parameter by name, overriding locally if necessary.
  - `set_variable_object(variable_name, object)` -> `None` — Set Variable Object
  - `set_variable_position(variable_name, value)` -> `None` — Sets a Niagara Position parameter by name, overriding locally if necessary.
  - `set_variable_quat(variable_name, value)` -> `None` — Sets a Niagara quaternion parameter by name, overriding locally if necessary.
  - `set_variable_static_mesh(variable_name, value)` -> `None` — Set Variable Static Mesh
  - `set_variable_texture(variable_name, texture)` -> `None` — Set Variable Texture
  - `set_variable_texture_render_target(variable_name, texture_render_target)` -> `None` — Set Variable Texture Render Target
  - `set_variable_vec2(variable_name, value)` -> `None` — Sets a Niagara Vector2 parameter by name, overriding locally if necessary.
  - `set_variable_vec3(variable_name, value)` -> `None` — Sets a Niagara Vector3 parameter by name, overriding locally if necessary.
  - `set_variable_vec4(variable_name, value)` -> `None` — Sets a Niagara Vector4 parameter by name, overriding locally if necessary.

**Properties** (10):
  - `allow_scalability`: `bool` — [Read-Write] Controls whether we allow scalability culling for this component. If enabled, this comp...
  - `auto_attach_location_rule`: `AttachmentRule` — [Read-Write] Options for how we handle our location when we attach to the AutoAttachParent, if bAuto...
  - `auto_attach_parent`: `SceneComponent` [Read-Only] — [Read-Only] Component we automatically attach to when activated, if bAutoManageAttachment is true.
I...
  - `auto_attach_rotation_rule`: `AttachmentRule` — [Read-Write] Options for how we handle our rotation when we attach to the AutoAttachParent, if bAuto...
  - `auto_attach_scale_rule`: `AttachmentRule` — [Read-Write] Options for how we handle our scale when we attach to the AutoAttachParent, if bAutoMan...
  - `auto_attach_socket_name`: `Name` — [Read-Write] Socket we automatically attach to on the AutoAttachParent, if bAutoManageAttachment is ...
  - `auto_attach_weld_simulated_bodies`: `bool` — [Read-Write] Option for how we handle bWeldSimulatedBodies when we attach to the AutoAttachParent, i...
  - `auto_manage_attachment`: `bool` [Read-Only] — [Read-Only] True if we should automatically attach to AutoAttachParent when activated, and detach fr...
  - `occlusion_query_mode`: `NiagaraOcclusionQueryMode` [Read-Only] — [Read-Only] (NiagaraOcclusionQueryMode)
  - `on_system_finished`: `OnNiagaraSystemFinished` — [Read-Write] Called when the particle system is done (OnNiagaraSystemFinished)

### `unreal.NiagaraComponentRendererProperties`
Inherits: `NiagaraRendererProperties` | Header: `NiagaraComponentRendererProperties.h`

Niagara Component Renderer Properties

### `unreal.NiagaraCullProxyComponent`
Inherits: `NiagaraComponent` | Header: `NiagaraCullProxyComponent.h`

A specialization of UNiagaraComponent that can act as a proxy for many other NiagaraComponents that have been culled by scalability.

### `unreal.NiagaraDataChannel`
Inherits: `Object` | Header: `NiagaraDataChannel.h`

Niagara Data Channel

**Properties** (1):
  - `variables`: `None` — [Read-Write]
deprecated: Property âVariablesâ is deprecated. (Array[NiagaraVariable])

### `unreal.NiagaraDataChannelAsset`
Inherits: `Object` | Header: `NiagaraDataChannelPublic.h`

Niagara Data Channels are a system for communication between Niagara Systems and with game code/Blueprint.

### `unreal.NiagaraDataChannelHandler`
Inherits: `Object` | Header: `NiagaraDataChannelHandler.h`

Niagara Data Channel Handler

**Methods** (4):
  - `get_data_channel_reader()` -> `NiagaraDataChannelReader` — Get Data Channel Reader
  - `get_data_channel_writer()` -> `NiagaraDataChannelWriter` — Get Data Channel Writer
  - `subscribe_to_data_channel_updates(update_delegate, search_params)` -> `int32` — The provided delegate will be called whenever new entries are added to the relevant data channel. This means the delegat...
  - `unsubscribe_from_data_channel_updates(unsubscribe_token)` -> `None` — Unsubscribe from Data Channel Updates

### `unreal.NiagaraDataChannelHandler_Global`
Inherits: `NiagaraDataChannelHandler` | Header: `NiagaraDataChannel_Global.h`

Basic DataChannel handler that makes all data visible globally.

### `unreal.NiagaraDataChannelHandler_Islands`
Inherits: `NiagaraDataChannelHandler` | Header: `NiagaraDataChannel_Islands.h`

Niagara Data Channel Handler Islands

### `unreal.NiagaraDataChannelLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraDataChannel.h`

A C++ and Blueprint accessible library of utility functions for accessing Niagara DataChannel

**Methods** (5):
  - `get_data_channel_element_count(world_context_object, channel, search_params, read_previous_frame = True)` -> `int32` [classmethod] — Returns the number of readable elements in the given data channel
  - `read_from_niagara_data_channel(world_context_object, channel, search_params, read_previous_frame)` -> `NiagaraDataChannelReader` [classmethod] — Initializes and returns the Niagara Data Channel reader for the given data channel.
  - `subscribe_to_niagara_data_channel(world_context_object, channel, search_params, update_delegate)` -> `int32` [classmethod] — Subscribes to a single data channel and calls a delegate every times new data is written to the data channel.
  - `unsubscribe_from_niagara_data_channel(world_context_object, channel, unsubscribe_token)` -> `None` [classmethod] — Removes a prior registration from a data channel
  - `write_to_niagara_data_channel(world_context_object, channel, search_params, count, visible_to_game, visible_to_cpu, visible_to_gpu, debug_source)` -> `NiagaraDataChannelWriter` [classmethod] — Initializes and returns the Niagara Data Channel writer to write N elements to the given data channel.

### `unreal.NiagaraDataChannelReader`
Inherits: `Object` | Header: `NiagaraDataChannelAccessor.h`

Initial simple API for reading and writing data in a data channel from game code / BP. Likely to be replaced in the near future with a custom BP node and a helper struct.

**Methods** (14):
  - `init_access(search_params, read_prev_frame_data)` -> `bool` — Call before each access to the data channel to grab the correct data to read.
  - `num()` -> `int32` — Num
  - `read_bool(var_name, index)` -> `bool or None` — Read Bool
  - `read_enum(var_name, is_valid=bool)` — Read Enum
  - `read_float(var_name, is_valid=bool)` — Read Float
  - `read_id(var_name, is_valid=bool)` — Read ID
  - `read_int(var_name, is_valid=bool)` — Read Int
  - `read_linear_color(var_name, is_valid=bool)` — Read Linear Color
  - `read_position(var_name, is_valid=bool)` — Read Position
  - `read_quat(var_name, is_valid=bool)` — Read Quat
  - `read_spawn_info(var_name, is_valid=bool)` — Read Spawn Info
  - `read_vector(var_name, is_valid=bool)` — Read Vector
  - `read_vector2d(var_name, is_valid=bool)` — Read Vector 2D
  - `read_vector4(var_name, is_valid=bool)` — Read Vector 4

### `unreal.NiagaraDataChannelWriter`
Inherits: `Object` | Header: `NiagaraDataChannelAccessor.h`

Niagara Data Channel Writer

**Methods** (14):
  - `init_write(search_params, count, visible_to_game=True, visible_to_cpu=True, visible_to_gpu=True, debug_source)` -> `bool` — Call before each batch of writes to allocate the data weâll be writing to.
  - `num()` -> `int32` — Num
  - `write_bool(var_name, index, data)` -> `None` — Write Bool
  - `write_enum(var_name, index, data)` -> `None` — Write Enum
  - `write_float(var_name, index, data)` -> `None` — Write Float
  - `write_id(var_name, index, data)` -> `None` — Write ID
  - `write_int(var_name, index, data)` -> `None` — Write Int
  - `write_linear_color(var_name, index, data)` -> `None` — Write Linear Color
  - `write_position(var_name, index, data)` -> `None` — Write Position
  - `write_quat(var_name, index, data)` -> `None` — Write Quat
  - `write_spawn_info(var_name, index, data)` -> `None` — Write Spawn Info
  - `write_vector(var_name, index, data)` -> `None` — Write Vector
  - `write_vector2d(var_name, index, data)` -> `None` — Write Vector 2D
  - `write_vector4(var_name, index, data)` -> `None` — Write Vector 4

### `unreal.NiagaraDataInterface`
Inherits: `NiagaraDataInterfaceBase` | Header: `NiagaraDataInterface.h`

Base class for all Niagara data interfaces.

### `unreal.NiagaraDataInterfaceArray`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceArray.h`

Niagara Data Interface Array

**Properties** (2):
  - `gpu_sync_mode`: `NiagaraGpuSyncMode` [Read-Only] — [Read-Only] How to do we want to synchronize modifications to the array data. (NiagaraGpuSyncMode)
  - `max_elements`: `int` [Read-Only] — [Read-Only] When greater than 0 sets the maximum number of elements the array can hold, only relevan...

### `unreal.NiagaraDataInterfaceArrayBool`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayInt.h`

Niagara Data Interface Array Bool

**Properties** (1):
  - `bool_data`: `None` — [Read-Write] (Array[bool])

### `unreal.NiagaraDataInterfaceArrayColor`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Color

**Properties** (1):
  - `color_data`: `None` — [Read-Write] (Array[LinearColor])

### `unreal.NiagaraDataInterfaceArrayFloat`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Float

**Properties** (1):
  - `float_data`: `None` — [Read-Write] (Array[float])

### `unreal.NiagaraDataInterfaceArrayFloat2`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Float 2

**Properties** (1):
  - `float_data`: `None` — [Read-Write] (Array[Vector2D])

### `unreal.NiagaraDataInterfaceArrayFloat3`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Float 3

**Properties** (1):
  - `float_data`: `None` — [Read-Write] (Array[Vector])

### `unreal.NiagaraDataInterfaceArrayFloat4`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Float 4

**Properties** (1):
  - `float_data`: `None` — [Read-Write] (Array[Vector4])

### `unreal.NiagaraDataInterfaceArrayFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraDataInterfaceArrayFunctionLibrary.h`

C++ and Blueprint library for accessing array types

**Methods** (44):
  - `get_niagara_array_bool(niagara_system, override_name)` -> `Array [ bool ]` [classmethod] — Gets a copy of Niagara Bool Data.
  - `get_niagara_array_bool_value(niagara_system, override_name, index)` -> `bool` [classmethod] — Gets a single value within a Niagara Array Bool.
  - `get_niagara_array_color(niagara_system, override_name)` -> `Array [ LinearColor ]` [classmethod] — Gets a copy of Niagara FLinearColor Data.
  - `get_niagara_array_color_value(niagara_system, override_name, index)` -> `LinearColor` [classmethod] — Gets a single value within a Niagara Array FLinearColor.
  - `get_niagara_array_float(niagara_system, override_name)` -> `Array [ float ]` [classmethod] — Gets a copy of Niagara Float Data.
  - `get_niagara_array_float_value(niagara_system, override_name, index)` -> `float` [classmethod] — Gets a single value within a Niagara Array Float.
  - `get_niagara_array_int32(niagara_system, override_name)` -> `Array [ int32 ]` [classmethod] — Gets a copy of Niagara Int32 Data.
  - `get_niagara_array_int32_value(niagara_system, override_name, index)` -> `int32` [classmethod] — Gets a single value within a Niagara Array Int32.
  - `get_niagara_array_matrix(niagara_system, override_name, apply_lwc_rebase = True)` -> `Array [ Matrix ]` [classmethod] — Gets a copy of Niagara FMatrix Data.
  - `get_niagara_array_matrix_value(niagara_system, override_name, index, apply_lwc_rebase = True)` -> `Matrix` [classmethod] — Gets a single value within a Niagara Array FMatrix.
  - `get_niagara_array_position(niagara_system, override_name)` -> `Array [ Vector ]` [classmethod] — Gets a copy of Niagara Position Data.
  - `get_niagara_array_position_value(niagara_system, override_name, index)` -> `Vector` [classmethod] — Gets a single value within a Niagara Array Position.
  - `get_niagara_array_quat(niagara_system, override_name)` -> `Array [ Quat ]` [classmethod] — Gets a copy of Niagara FQuat Data.
  - `get_niagara_array_quat_value(niagara_system, override_name, index)` -> `Quat` [classmethod] — Gets a single value within a Niagara Array FQuat.
  - `get_niagara_array_u_int8(niagara_system, override_name)` -> `Array [ int32 ]` [classmethod] — Gets a copy of Niagara UInt8 Data.
  - `get_niagara_array_u_int8_value(niagara_system, override_name, index)` -> `int32` [classmethod] — Gets a single value within a Niagara Array UInt8.
  - `get_niagara_array_vector(niagara_system, override_name)` -> `Array [ Vector ]` [classmethod] — Gets a copy of Niagara FVector Data.
  - `get_niagara_array_vector2d(niagara_system, override_name)` -> `Array [ Vector2D ]` [classmethod] — Gets a copy of Niagara FVector2D Data.
  - `get_niagara_array_vector2d_value(niagara_system, override_name, index)` -> `Vector2D` [classmethod] — Gets a single value within a Niagara Array FVector2D.
  - `get_niagara_array_vector4(niagara_system, override_name)` -> `Array [ Vector4 ]` [classmethod] — Gets a copy of Niagara FVector4 Data.
  - `get_niagara_array_vector4_value(niagara_system, override_name, index)` -> `Vector4` [classmethod] — Gets a single value within a Niagara Array FVector4.
  - `get_niagara_array_vector_value(niagara_system, override_name, index)` -> `Vector` [classmethod] — Gets a single value within a Niagara Array FVector.
  - `set_niagara_array_bool(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array Bool Data.
  - `set_niagara_array_bool_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array Bool.
  - `set_niagara_array_color(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array FLinearColor Data.
  - `set_niagara_array_color_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array FLinearColor.
  - `set_niagara_array_float(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array Float Data.
  - `set_niagara_array_float_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array Float.
  - `set_niagara_array_int32(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array Int32 Data.
  - `set_niagara_array_int32_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array Int32.
  - `set_niagara_array_matrix(niagara_system, override_name, array_data, apply_lwc_rebase = True)` -> `None` [classmethod] — Sets Niagara Array FMatrix Data.
  - `set_niagara_array_matrix_value(niagara_system, override_name, index, value, size_to_fit, apply_lwc_rebase = True)` -> `None` [classmethod] — Sets a single value within a Niagara Array FMatrix.
  - `set_niagara_array_position(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array FVector Data.
  - `set_niagara_array_position_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Set Niagara Array Position Value
  - `set_niagara_array_quat(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array FQuat Data.
  - `set_niagara_array_quat_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array FQuat.
  - `set_niagara_array_u_int8(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array UInt8 Data.
  - `set_niagara_array_u_int8_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array UInt8.
  - `set_niagara_array_vector(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array FVector Data.
  - `set_niagara_array_vector2d(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array FVector2D Data.
  - `set_niagara_array_vector2d_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array FVector2D.
  - `set_niagara_array_vector4(niagara_system, override_name, array_data)` -> `None` [classmethod] — Sets Niagara Array FVector4 Data.
  - `set_niagara_array_vector4_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array FVector4.
  - `set_niagara_array_vector_value(niagara_system, override_name, index, value, size_to_fit)` -> `None` [classmethod] — Sets a single value within a Niagara Array FVector.

### `unreal.NiagaraDataInterfaceArrayInt32`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayInt.h`

Niagara Data Interface Array Int 32

**Properties** (1):
  - `int_data`: `None` — [Read-Write] (Array[int32])

### `unreal.NiagaraDataInterfaceArrayMatrix`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Matrix

**Properties** (1):
  - `matrix_data`: `None` — [Read-Write] (Array[Matrix])

### `unreal.NiagaraDataInterfaceArrayMesh`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayMesh.h`

Niagara Data Interface Array Mesh

**Methods** (2):
  - `set_niagara_array_mesh(niagara_component, override_name, array_data)` -> `None` [classmethod] — INiagaraRenderableMeshArrayInterface Interface End
  - `set_niagara_array_mesh_sm(niagara_component, override_name, array_data)` -> `None` [classmethod] — Set Niagara Array Mesh SM

### `unreal.NiagaraDataInterfaceArrayNiagaraID`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayNiagaraID.h`

Niagara Data Interface Array Niagara ID

**Properties** (1):
  - `int_data`: `None` — [Read-Write] (Array[NiagaraID])

### `unreal.NiagaraDataInterfaceArrayPosition`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Position

**Properties** (1):
  - `position_data`: `None` — [Read-Write] (Array[NiagaraPosition])

### `unreal.NiagaraDataInterfaceArrayQuat`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayFloat.h`

Niagara Data Interface Array Quat

**Properties** (1):
  - `quat_data`: `None` — [Read-Write] (Array[Quat])

### `unreal.NiagaraDataInterfaceArrayUInt8`
Inherits: `NiagaraDataInterfaceArray` | Header: `NiagaraDataInterfaceArrayInt.h`

Niagara Data Interface Array UInt 8

**Properties** (1):
  - `int_data`: `None` — [Read-Write] (Array[int32])

### `unreal.NiagaraDataInterfaceAudioPlayerSettings`
Inherits: `Object` | Header: `NiagaraDataInterfaceAudioPlayer.h`

Niagara Data Interface Audio Player Settings

**Properties** (4):
  - `attenuation_settings`: `SoundAttenuationSettings` — [Read-Write] (SoundAttenuationSettings)
  - `concurrency`: `SoundConcurrency` — [Read-Write] (SoundConcurrency)
  - `override_attenuation_settings`: `bool` — [Read-Write] (bool)
  - `override_concurrency`: `bool` — [Read-Write] (bool)

### `unreal.NiagaraDataInterfaceCurve`
Inherits: `NiagaraDataInterfaceCurveBase` | Header: `NiagaraDataInterfaceCurve.h`

Data Interface allowing sampling of float curves.

### `unreal.NiagaraDataInterfaceCurveBase`
Inherits: `NiagaraDataInterface` | Header: `NiagaraDataInterfaceCurveBase.h`

Base class for curve data interfaces which facilitates handling the curve data in a standardized way.

### `unreal.NiagaraDataInterfaceGrid2D`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceRW.h`

Niagara Data Interface Grid 2D

### `unreal.NiagaraDataInterfaceGrid2DCollection`
Inherits: `NiagaraDataInterfaceGrid2D` | Header: `NiagaraDataInterfaceGrid2DCollection.h`

Niagara Data Interface Grid 2DCollection

**Methods** (4):
  - `fill_raw_texture2d(component, dest)` -> `(tiles_x=int32, tiles_y=int32) or None` — Fill Raw Texture 2D deprecated: This function has been replaced by object user variables on the emitter to specify rende...
  - `fill_texture2d(component, dest, attribute_index)` -> `bool` — Fills a texture render target 2d with the current data from the simulation #todo(dmp): this will eventually go away when...
  - `get_raw_texture_size(size_y=int32)` — Get Raw Texture Size deprecated: This function has been replaced by object user variables on the emitter to specify rend...
  - `get_texture_size(size_y=int32)` — Get Texture Size

### `unreal.NiagaraDataInterfaceGrid2DCollectionReader`
Inherits: `NiagaraDataInterfaceGrid2DCollection` | Header: `NiagaraDataInterfaceGrid2DCollectionReader.h`

Niagara Data Interface Grid 2DCollection Reader

### `unreal.NiagaraDataInterfaceGrid3D`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceRW.h`

Niagara Data Interface Grid 3D

### `unreal.NiagaraDataInterfaceGrid3DCollection`
Inherits: `NiagaraDataInterfaceGrid3D` | Header: `NiagaraDataInterfaceGrid3DCollection.h`

Niagara Data Interface Grid 3DCollection

**Methods** (4):
  - `fill_raw_volume_texture(component, dest)` -> `(tiles_x=int32, tiles_y=int32, tile_z=int32) or None` — Fill Raw Volume Texture deprecated: This function has been replaced by object user variables on the emitter to specify r...
  - `fill_volume_texture(component, dest, attribute_index)` -> `bool` — Fills a texture render target 2d with the current data from the simulation #todo(dmp): this will eventually go away when...
  - `get_raw_texture_size(size_y=int32, size_z=int32)` — Get Raw Texture Size
  - `get_texture_size(size_y=int32, size_z=int32)` — Get Texture Size

### `unreal.NiagaraDataInterfaceGrid3DCollectionReader`
Inherits: `NiagaraDataInterfaceGrid3DCollection` | Header: `NiagaraDataInterfaceGrid3DCollectionReader.h`

Niagara Data Interface Grid 3DCollection Reader

### `unreal.NiagaraDataInterfaceIntRenderTarget2D`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceIntRenderTarget2D.h`

Niagara Data Interface Int Render Target 2D

### `unreal.NiagaraDataInterfaceRenderTarget2D`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceRenderTarget2D.h`

Niagara Data Interface Render Target 2D

### `unreal.NiagaraDataInterfaceRenderTarget2DArray`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceRenderTarget2DArray.h`

Niagara Data Interface Render Target 2DArray

### `unreal.NiagaraDataInterfaceRenderTargetCube`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceRenderTargetCube.h`

Niagara Data Interface Render Target Cube

### `unreal.NiagaraDataInterfaceRenderTargetVolume`
Inherits: `NiagaraDataInterfaceRWBase` | Header: `NiagaraDataInterfaceRenderTargetVolume.h`

Niagara Data Interface Render Target Volume

### `unreal.NiagaraDataInterfaceRWBase`
Inherits: `NiagaraDataInterface` | Header: `NiagaraDataInterfaceRW.h`

Niagara Data Interface RWBase

### `unreal.NiagaraDataInterfaceSceneCapture2D`
Inherits: `NiagaraDataInterface` | Header: `NiagaraDataInterfaceSceneCapture2D.h`

Data Interface which can control or read from a scene capture component.

**Methods** (1):
  - `set_scene_capture2d_managed_show_only_actors(niagara_system, parameter_name, show_only_actors)` -> `None` [classmethod] — Allows you to set the show only actors when Niagara manages the component. If Niagara does not manage the component use ...

### `unreal.NiagaraDataInterfaceSkeletalMesh`
Inherits: `NiagaraDataInterface` | Header: `NiagaraDataInterfaceSkeletalMesh.h`

Data Interface allowing sampling of skeletal meshes.

### `unreal.NiagaraDataInterfaceStaticMesh`
Inherits: `NiagaraDataInterface` | Header: `NiagaraDataInterfaceStaticMesh.h`

Data Interface allowing sampling of static meshes.

**Methods** (1):
  - `set_niagara_static_mesh_di_instance_index(niagara_system, user_parameter_name, new_instance_index)` -> `None` [classmethod] — Set Niagara Static Mesh DIInstance Index

### `unreal.NiagaraDataInterfaceUObjectPropertyReader`
Inherits: `NiagaraDataInterface` | Header: `NiagaraDataInterfaceUObjectPropertyReader.h`

Data interface to read properties from UObjects. Rather than having BP tick functions that push data into Niagara this data interface will instead pull them.

**Methods** (1):
  - `set_u_object_reader_property_remap(niagara_component, user_parameter_name, graph_name, remap_name)` -> `None` [classmethod] — Remaps a property reader, where the

### `unreal.NiagaraDataInterfaceVector2DCurve`
Inherits: `NiagaraDataInterfaceCurveBase` | Header: `NiagaraDataInterfaceVector2DCurve.h`

Data Interface allowing sampling of vector curves.

### `unreal.NiagaraDataInterfaceVector4Curve`
Inherits: `NiagaraDataInterfaceCurveBase` | Header: `NiagaraDataInterfaceVector4Curve.h`

Data Interface allowing sampling of vector curves.

### `unreal.NiagaraDataInterfaceVectorCurve`
Inherits: `NiagaraDataInterfaceCurveBase` | Header: `NiagaraDataInterfaceVectorCurve.h`

Data Interface allowing sampling of vector curves.

### `unreal.NiagaraDIRigidMeshCollisionFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraDataInterfaceRigidMeshCollisionQuery.h`

C++ and Blueprint library for accessing array types

**Methods** (1):
  - `set_source_actors(niagara_system, override_name, source_actors)` -> `None` [classmethod] — Set Source Actors

### `unreal.NiagaraEditorDataBase`
Inherits: `Object` | Header: `NiagaraEditorDataBase.h`

A base class for editor only data which supports post loading from the runtime owner object.

### `unreal.NiagaraEditorParametersAdapterBase`
Inherits: `Object` | Header: `NiagaraEditorDataBase.h`

A base class for editor only data which owns UNiagaraScriptVariables and supports synchronizing them with definitions.

### `unreal.NiagaraEffectType`
Inherits: `Object` | Header: `NiagaraEffectType.h`

Contains settings and working data shared among many Niagara systems that share some commonality of type, for example ImpactFX vs EnvironmentalFX. Main usage of effect types is to control scalability ...

### `unreal.NiagaraEmitter`
Inherits: `Object` | Header: `NiagaraEmitter.h`

Niagara Emitters are particle spawners that can be reused for different effects by putting them into Niagara systems. Emitters render their particles using different renderers, such as Sprite Renderer...

**Properties** (30):
  - `allocation_mode`: `ParticleAllocationMode` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âA...
  - `attributes_to_preserve`: `None` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âA...
  - `determinism`: `bool` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âb...
  - `editor_data`: `NiagaraEditorDataBase` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âE...
  - `editor_parameters`: `NiagaraEditorParametersAdapterBase` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âE...
  - `emitter_spawn_script_props`: `NiagaraEmitterScriptProperties` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âE...
  - `emitter_update_script_props`: `NiagaraEmitterScriptProperties` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âE...
  - `event_handler_script_props`: `None` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âE...
  - `gpu_compute_script`: `NiagaraScript` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âG...
  - `graph_source`: `NiagaraScriptSourceBase` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âG...
  - `interpolated_spawning`: `bool` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âb...
  - `local_space`: `bool` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âb...
  - `max_gpu_particles_spawn_per_frame`: `int` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âM...
  - `parent`: `NiagaraEmitter` — [Read-Write]
deprecated: Property âParentâ is deprecated. (NiagaraEmitter)
  - `parent_at_last_merge`: `NiagaraEmitter` — [Read-Write]
deprecated: Property âParentAtLastMergeâ is deprecated. (NiagaraEmitter)
  - `parent_scratch_pad_scripts`: `None` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âP...
  - `platforms`: `NiagaraPlatformSet` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âP...
  - `pre_allocation_count`: `int` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âP...
  - `random_seed`: `int` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âR...
  - `renderer_bindings`: `NiagaraParameterStore` — [Read-Write]
deprecated: Property âRendererBindingsâ is deprecated. (NiagaraParameterStore)
  - `renderer_properties`: `None` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âR...
  - `requires_persistent_i_ds`: `bool` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âb...
  - `scalability_overrides`: `NiagaraEmitterScalabilityOverrides` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âS...
  - `scratch_pad_scripts`: `None` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âS...
  - `shared_event_generator_ids`: `None` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âS...
  - `sim_target`: `NiagaraSimTarget` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âS...
  - `simulation_stages`: `None` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âS...
  - `spawn_script_props`: `NiagaraEmitterScriptProperties` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âS...
  - `template_specification`: `NiagaraScriptTemplateSpecification` — [Read-Write]
deprecated: Property âTemplateSpecificationâ is deprecated. (NiagaraScriptTemplateS...
  - `update_script_props`: `NiagaraEmitterScriptProperties` — [Read-Write] Use property in struct returned from GetEmitterData() instead
deprecated: Property âU...

### `unreal.NiagaraFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraFunctionLibrary.h`

A C++ and Blueprint accessible library of utility functions for accessing Niagara simulations All positions & orientations are returned in Unreal reference frame & units, assuming the Leap device is l...

**Methods** (19):
  - `acquire_niagara_gpu_ray_traced_collision_group(world_context_object)` -> `int32` [classmethod] — Returns a free collision group for use in HWRT collision group filtering. Returns -1 on failure.
  - `get_niagara_parameter_collection(world_context_object, collection)` -> `NiagaraParameterCollectionInstance` [classmethod]
  - `override_system_user_variable_skeletal_mesh_component(niagara_system, override_name, skeletal_mesh_component)` -> `None` [classmethod] — Sets a Niagara StaticMesh parameter by name, overriding locally if necessary.
  - `override_system_user_variable_static_mesh(niagara_system, override_name, static_mesh)` -> `None` [classmethod] — Override System User Variable Static Mesh
  - `override_system_user_variable_static_mesh_component(niagara_system, override_name, static_mesh_component)` -> `None` [classmethod] — Sets a Niagara StaticMesh parameter by name, overriding locally if necessary.
  - `release_niagara_gpu_ray_traced_collision_group(world_context_object, collision_group)` -> `None` [classmethod] — Releases a collision group back to the system for use by ohers.
  - `set_actor_niagara_gpu_ray_traced_collision_group(world_context_object, actor, collision_group)` -> `None` [classmethod] — Sets the Niagara GPU ray traced collision group for all primitive components on the given actor.
  - `set_component_niagara_gpu_ray_traced_collision_group(world_context_object, primitive, collision_group)` -> `None` [classmethod] — Sets the Niagara GPU ray traced collision group for the give primitive component.
  - `set_scene_capture2d_data_interface_managed_mode(niagara_system, di_name, managed_capture_source, managed_texture_size, managed_texture_format, managed_projection_type, managed_fov_angle, managed_ortho_width, managed_capture_every_frame, managed_capture_on_movement, show_only_actors)` -> `None` [classmethod] — Sets managed mode parameters for the Scene capture 2D data interface, this is destructive as it modifies the data interf...
  - `set_skeletal_mesh_data_interface_filtered_bones(niagara_system, override_name, filtered_bones)` -> `None` [classmethod] — Sets the Filtered Bones to use on the skeletal mesh data interface, this is destructive as it modifies the data interfac...
  - `set_skeletal_mesh_data_interface_filtered_sockets(niagara_system, override_name, filtered_sockets)` -> `None` [classmethod] — Sets the Filtered Sockets to use on the skeletal mesh data interface, this is destructive as it modifies the data interf...
  - `set_skeletal_mesh_data_interface_sampling_regions(niagara_system, override_name, sampling_regions)` -> `None` [classmethod] — Sets the SamplingRegion to use on the skeletal mesh data interface, this is destructive as it modifies the data interfac...
  - `set_texture2d_array_object(niagara_system, override_name, texture)` -> `None` [classmethod] — Overrides the 2D Array Texture for a Niagara 2D Array Texture Data Interface User Parameter.
  - `set_texture_object(niagara_system, override_name, texture)` -> `None` [classmethod] — Overrides the Texture Object for a Niagara Texture Data Interface User Parameter.
  - `set_volume_texture_object(niagara_system, override_name, texture)` -> `None` [classmethod] — Overrides the Volume Texture for a Niagara Volume Texture Data Interface User Parameter.
  - `spawn_system_at_location(world_context_object, system_template, location, rotation = [0.000000,0.000000,0.000000], scale = [1.000000,1.000000,1.000000], auto_destroy = True, auto_activate = True, pooling_method = NCPoolMethod.NONE, pre_cull_check = True)` -> `NiagaraComponent` [classmethod] — Spawns a Niagara System at the specified world location/rotation
  - `spawn_system_at_location_with_params(spawn_params)` -> `NiagaraComponent` [classmethod] — Spawn System at Location with Params
  - `spawn_system_attached(system_template, attach_to_component, attach_point_name, location, rotation, location_type, auto_destroy, auto_activate = True, pooling_method = NCPoolMethod.NONE, pre_cull_check = True)` -> `NiagaraComponent` [classmethod] — Spawn System Attached
  - `spawn_system_attached_with_params(spawn_params)` -> `NiagaraComponent` [classmethod] — Spawn System Attached with Params

### `unreal.NiagaraLensEffectBase`
Inherits: `NiagaraActor` | Header: `NiagaraLensEffectBase.h`

Niagara equivalent of AEmitterCameraLensEffectBase. This class is supported by APlayerCameraManager (via ICameraLensEffectInterface) as a camera lens effect.

**Methods** (2):
  - `get_particle_components()` -> `Array [ FXSystemComponent ]` — Get Particle Components
  - `get_primary_particle_component()` -> `FXSystemComponent` — Get Primary Particle Component

### `unreal.NiagaraLightRendererProperties`
Inherits: `NiagaraRendererProperties` | Header: `NiagaraLightRendererProperties.h`

Niagara Light Renderer Properties

**Properties** (1):
  - `inverse_exposure_blend`: `float` [Read-Only] — [Read-Only] Blend Factor used to blend between Intensity and Intensity/Exposure.
This is useful for ...

### `unreal.NiagaraMeshRendererProperties`
Inherits: `NiagaraRendererProperties` | Header: `NiagaraMeshRendererProperties.h`

Niagara Mesh Renderer Properties

### `unreal.NiagaraParameterCollection`
Inherits: `Object` | Header: `NiagaraParameterCollection.h`

Asset containing a collection of global parameters usable by Niagara. Similar to Material parameter collections, any number of Niagara assets may reference attributes from this parameter collection an...

### `unreal.NiagaraParameterCollectionInstance`
Inherits: `Object` | Header: `NiagaraParameterCollection.h`

Can be used to override selected parameters from a Niagara parameter collection with another value. The values in the parameter collection instance can be set from Blueprint or C++, same as the regula...

**Methods** (16):
  - `get_bool_parameter(variable_name)` -> `bool` — Accessors from Blueprint. For now just exposing common types but ideally we can expose any somehow in future.
  - `get_color_parameter(variable_name)` -> `LinearColor` — Get Color Parameter
  - `get_float_parameter(variable_name)` -> `float` — Get Float Parameter
  - `get_int_parameter(variable_name)` -> `int32` — Get Int Parameter
  - `get_quat_parameter(variable_name)` -> `Quat` — Get Quat Parameter
  - `get_vector2d_parameter(variable_name)` -> `Vector2D` — Get Vector 2DParameter
  - `get_vector4_parameter(variable_name)` -> `Vector4` — Get Vector 4Parameter
  - `get_vector_parameter(variable_name)` -> `Vector` — Get Vector Parameter
  - `set_bool_parameter(variable_name, value)` -> `None` — Set Bool Parameter
  - `set_color_parameter(variable_name, value)` -> `None` — Set Color Parameter
  - `set_float_parameter(variable_name, value)` -> `None` — Set Float Parameter
  - `set_int_parameter(variable_name, value)` -> `None` — Set Int Parameter
  - `set_quat_parameter(variable_name, value)` -> `None` — Set Quat Parameter
  - `set_vector2d_parameter(variable_name, value)` -> `None` — Set Vector 2DParameter
  - `set_vector4_parameter(variable_name, value)` -> `None` — TODO[mg]: add position setter for LWC
  - `set_vector_parameter(variable_name, value)` -> `None` — Set Vector Parameter

### `unreal.NiagaraParticleCallbackHandler`
Inherits: `Interface` | Header: `NiagaraDataInterfaceExport.h`

Niagara Particle Callback Handler

**Methods** (1):
  - `receive_particle_data(data, niagara_system, simulation_position_offset)` -> `None` — This function is called once per tick with the gathered particle data. It will not be called if there is no particle dat...

### `unreal.NiagaraPerfBaselineActor`
Inherits: `Actor` | Header: `NiagaraPerfBaseline.h`

Actor that controls how the baseline system behaves and also controls stats gathering for.

### `unreal.NiagaraPreviewAxis`
Inherits: `Object` | Header: `NiagaraPreviewGrid.h`

Base class for all preview axis types. NiagaraPreviewGrid uses these to control how many systems to spawn in each axis and how each system varies on that axis. C++ Examples are show below. You can als...

**Methods** (2):
  - `apply_to_preview(preview_component, preview_index, is_x_axis)` -> `str` — Applies this axis for the preview at PreviewIndex on this axis.
  - `num()` -> `int32` — Returns the number of previews for this axis.

### `unreal.NiagaraPreviewAxis_InterpParamBase`
Inherits: `NiagaraPreviewAxis` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Axis Interp Param Base

### `unreal.NiagaraPreviewAxis_InterpParamFloat`
Inherits: `NiagaraPreviewAxis_InterpParamBase` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Axis Interp Param Float

### `unreal.NiagaraPreviewAxis_InterpParamInt32`
Inherits: `NiagaraPreviewAxis_InterpParamBase` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Axis Interp Param Int 32

### `unreal.NiagaraPreviewAxis_InterpParamLinearColor`
Inherits: `NiagaraPreviewAxis_InterpParamBase` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Axis Interp Param Linear Color

### `unreal.NiagaraPreviewAxis_InterpParamVector`
Inherits: `NiagaraPreviewAxis_InterpParamBase` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Axis Interp Param Vector

### `unreal.NiagaraPreviewAxis_InterpParamVector2D`
Inherits: `NiagaraPreviewAxis_InterpParamBase` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Axis Interp Param Vector 2D

### `unreal.NiagaraPreviewAxis_InterpParamVector4`
Inherits: `NiagaraPreviewAxis_InterpParamBase` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Axis Interp Param Vector 4

### `unreal.NiagaraPreviewBase`
Inherits: `Actor` | Header: `NiagaraPreviewGrid.h`

Base actor for preview actors used in UNiagaraPreviewAxis.

**Methods** (2):
  - `set_label_text(x_axis_text, y_axis_text)` -> `None` — Set Label Text
  - `set_system(system)` -> `None` — AActor Interface End

### `unreal.NiagaraPreviewGrid`
Inherits: `Actor` | Header: `NiagaraPreviewGrid.h`

Niagara Preview Grid

**Methods** (4):
  - `activate_previews(reset)` -> `None` — AActor Interface End
  - `deactivate_previews()` -> `None` — Deactivate Previews
  - `get_previews()` -> `Array [ NiagaraComponent ]` — Get Previews
  - `set_paused(paused)` -> `None` — Set Paused

### `unreal.NiagaraRendererProperties`
Inherits: `NiagaraMergeable` | Header: `NiagaraRendererProperties.h`

Emitter properties base class Each EmitterRenderer derives from this with its own class, and returns it in GetProperties; a copy of those specific properties is stored on UNiagaraEmitter (on the Syste...

### `unreal.NiagaraRibbonRendererProperties`
Inherits: `NiagaraRendererProperties` | Header: `NiagaraRibbonRendererProperties.h`

Niagara Ribbon Renderer Properties

### `unreal.NiagaraScript`
Inherits: `NiagaraScriptBase` | Header: `NiagaraScript.h`

Scripts are function graphs that define the runtime execution for a Niagara system (similar to a Blueprint).

**Properties** (19):
  - `category`: `Text` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âCa...
  - `collapsed_view_format`: `Text` — [Read-Write] Deprecated, use LibraryVisibility instead.
deprecated: Property âCollapsedViewFormatâ...
  - `conversion_utility`: `Class` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âCo...
  - `deprecated`: `bool` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âbD...
  - `deprecation_message`: `Text` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âDe...
  - `deprecation_recommendation`: `NiagaraScript` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âDe...
  - `description`: `Text` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âDe...
  - `experimental`: `bool` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âbE...
  - `experimental_message`: `Text` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âEx...
  - `expose_to_library`: `bool` — [Read-Write] Deprecated, use LibraryVisibility instead.
deprecated: Property âbExposeToLibraryâ ...
  - `keywords`: `Text` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âKe...
  - `library_visibility`: `NiagaraScriptLibraryVisibility` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âLi...
  - `module_usage_bitmask`: `int` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âMo...
  - `note_message`: `Text` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âNo...
  - `numeric_output_type_selection_mode`: `NiagaraNumericOutputTypeSelectionMode` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âNu...
  - `provided_dependencies`: `None` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âPr...
  - `required_dependencies`: `None` — [Read-Write] Use property in struct returned from GetScriptData() instead
deprecated: Property âRe...
  - `script_meta_data`: `None` — [Read-Write] Deprecated, use LibraryVisibility instead.
deprecated: Property âScriptMetaDataâ is...
  - `source`: `NiagaraScriptSourceBase` — [Read-Write] âSourceâ data/graphs for this script
deprecated: Property âSourceâ is deprecate...

### `unreal.NiagaraScriptSourceBase`
Inherits: `Object` | Header: `NiagaraScriptSourceBase.h`

Runtime data for a Niagara system

### `unreal.NiagaraSettings`
Inherits: `DeveloperSettings` | Header: `NiagaraSettings.h`

Niagara Settings

**Properties** (2):
  - `limit_delta_time`: `bool` — [Read-Write] Whether to limit the max tick delta time or not. (bool)
  - `max_delta_time_per_tick`: `float` — [Read-Write] Limits the delta time per tick for emitters to prevent simulation spikes due to frame l...

### `unreal.NiagaraSignificanceHandler`
Inherits: `Object` | Header: `NiagaraEffectType.h`

Base class for significance handlers. These allow Niagaraâs scalability system to determine the relative significance of different FX in the scene. Some basic ones are provided but projects are free...

### `unreal.NiagaraSimCache`
Inherits: `Object` | Header: `NiagaraSimCache.h`

Recording of multiple frames of simulation data from a running Niagara system. Can be used to play back the captured recording or to inspect the captured data for debug purposes. Depending on the capt...

**Methods** (20):
  - `get_attribute_capture_mode()` -> `NiagaraSimCacheAttributeCaptureMode` — How were the attributes captured for this sim cache.
  - `get_emitter_name(emitter_index)` -> `Name` — Get the emitter name at the provided index.
  - `get_emitter_names()` -> `Array [ Name ]` — Returns a list of emitters we have captured in the SimCache.
  - `get_num_emitters()` -> `int32` — Get number of emitters stored inside the cache.
  - `get_num_frames()` -> `int32` — Get number of frames stored in the cache.
  - `get_start_seconds()` -> `float` — Get the time the simulation was at when recorded.
  - `is_cache_valid()` -> `bool` — A valid cache is one that contains at least 1 frames worth of data.
  - `is_empty()` -> `bool` — An empty cache contains no frame data and can not be used
  - `read_color_attribute(attribute_name = 'Color', emitter_name = 'None', frame_index = 0)` -> `Array [ LinearColor ]` — Reads Niagara Color attributes by name from the cache frame and appends them into the OutValues array. EmitterName - If ...
  - `read_data_interface_as(requested_type, attribute_name, frame_index = 0)` -> `Object` — Reads data interface data from the cache as the requested type. This method will return nullptr if the attribute does no...
  - `read_float_attribute(attribute_name, emitter_name, frame_index = 0)` -> `Array [ float ]` — Reads Niagara float attributes by name from the cache frame and appends them into the OutValues array. EmitterName - If ...
  - `read_id_attribute(attribute_name, emitter_name, frame_index = 0)` -> `Array [ NiagaraID ]` — Reads Niagara ID attributes by name from the cache frame and appends them into the OutValues array. EmitterName - If lef...
  - `read_int_attribute(attribute_name, emitter_name, frame_index = 0)` -> `Array [ int32 ]` — Reads Niagara int attributes by name from the cache frame and appends them into the OutValues array. EmitterName - If le...
  - `read_position_attribute(attribute_name = 'Position', emitter_name = 'None', local_space_to_world = True, frame_index = 0)` -> `Array [ Vector ]` — Reads Niagara Position attributes by name from the cache frame and appends them into the OutValues array. Local space em...
  - `read_position_attribute_with_rebase(transform, attribute_name = 'Position', emitter_name = 'None', frame_index = 0)` -> `Array [ Vector ]` — Reads Niagara Position attributes by name from the cache frame and appends them into the OutValues array. All attributes...
  - `read_quat_attribute(attribute_name = 'MeshOrientation', emitter_name = 'None', local_space_to_world = True, frame_index = 0)` -> `Array [ Quat ]` — Reads Niagara Quaternion attributes by name from the cache frame and appends them into the OutValues array. Local space ...
  - `read_quat_attribute_with_rebase(quat, attribute_name = 'MeshOrientation', emitter_name = 'None', frame_index = 0)` -> `Array [ Quat ]` — Reads Niagara Quaternion attributes by name from the cache frame and appends them into the OutValues array. Only attribu...
  - `read_vector2_attribute(attribute_name, emitter_name, frame_index = 0)` -> `Array [ Vector2D ]` — Reads Niagara Vec2 attributes by name from the cache frame and appends them into the OutValues array. EmitterName - If l...
  - `read_vector4_attribute(attribute_name, emitter_name, frame_index = 0)` -> `Array [ Vector4 ]` — Reads Niagara Vec4 attributes by name from the cache frame and appends them into the OutValues array. EmitterName - If l...
  - `read_vector_attribute(attribute_name, emitter_name, frame_index = 0)` -> `Array [ Vector ]` — Reads Niagara Vec3 attributes by name from the cache frame and appends them into the OutValues array. EmitterName - If l...

### `unreal.NiagaraSimCacheFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraSimCacheFunctionLibrary.h`

Niagara Sim Cache Function Library

**Methods** (2):
  - `capture_niagara_sim_cache_immediate(sim_cache, create_parameters, niagara_component, advance_simulation = False, advance_delta_time = 0.016660)` -> `NiagaraSimCache or None` [classmethod] — Captures the simulations current frame data into the SimCache. This happens immediately so you may need to be careful wi...
  - `create_niagara_sim_cache(world_context_object)` -> `NiagaraSimCache` [classmethod] — Captures the simulation cache object that can be captured into using the various API calls.

### `unreal.NiagaraSimulationStageBase`
Inherits: `NiagaraMergeable` | Header: `NiagaraSimulationStageBase.h`

A base class for niagara simulation stages. This class should be derived to add stage specific information.

### `unreal.NiagaraSpriteRendererProperties`
Inherits: `NiagaraRendererProperties` | Header: `NiagaraSpriteRendererProperties.h`

Niagara Sprite Renderer Properties

**Properties** (1):
  - `use_material_cutout_texture`: `bool` [Read-Only] — [Read-Only] Use the cutout texture from the material opacity mask, or if none exist, from the materi...

### `unreal.NiagaraSystem`
Inherits: `FXSystemAsset` | Header: `NiagaraSystem.h`

A Niagara System contains multiple Niagara Emitters to create various effects. Niagara Systems can be placed in the world, unlike Emitters, and expose User Parameters to configure an effect at runtime...

**Methods** (1):
  - `create_system_conversion_context()` -> `NiagaraSystemConversionContext` — Niagara System and Emitter Helpers

**Properties** (7):
  - `cast_shadow`: `bool` [Read-Only] — [Read-Only] When enabled this is the default value set on the component.
Controls whether the primit...
  - `custom_depth_stencil_value`: `int` [Read-Only] — [Read-Only] When enabled this is the default value set on the component.
Optionally write this 0-255...
  - `custom_depth_stencil_write_mask`: `RendererStencilMask` [Read-Only] — [Read-Only] When enabled this is the default value set on the component.
Mask used for stencil buffe...
  - `receives_decals`: `bool` [Read-Only] — [Read-Only] When enabled this is the default value set on the component.
Whether the primitive recei...
  - `render_custom_depth`: `bool` [Read-Only] — [Read-Only] When enabled this is the default value set on the component.
This primitive has bRenderC...
  - `translucency_sort_distance_offset`: `float` [Read-Only] — [Read-Only] When enabled this is the default value set on the component.
Modifies the sort distance ...
  - `translucency_sort_priority`: `int` [Read-Only] — [Read-Only] When enabled this is the default value set on the component.
Adjusts the translucent obj...

### `unreal.NiagaraValidationRule`
Inherits: `Object` | Header: `NiagaraValidationRule.h`

Base class for system validation logic. These allow Niagara systems to be inspected for content validation either at save time or from a commandlet.

### `unreal.NiagaraValidationRuleSet`
Inherits: `Object` | Header: `NiagaraValidationRuleSet.h`

A set of reusable validation rules to check Niagara System assets. Once a number of rules are added to the rule set, it can be used either in effect types or configured as a global rule set in the Nia...

### `unreal.NCPoolMethod`
Inherits: `EnumBase` | Header: `NiagaraComponentPoolMethodEnum.h`

ENCPool Method

**Properties** (3):
  - `AUTO_RELEASE`: `NCPoolMethod = Ellipsis` — The component is allocated from the pool and will be automatically released back to it.
User need no...
  - `MANUAL_RELEASE`: `NCPoolMethod = Ellipsis` — NC is allocated from the pool but will NOT be automatically released back to it. User has ownership ...
  - `NONE`: `NCPoolMethod = Ellipsis` — The component will be created fresh and not allocated from the pool. 0

### `unreal.NDICollisionQuery_AsyncGpuTraceProvider`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

ENDICollision Query Async Gpu Trace Provider

**Properties** (4):
  - `DEFAULT`: `NDICollisionQuery_AsyncGpuTraceProvider = Ellipsis` — 0
  - `GSDF`: `NDICollisionQuery_AsyncGpuTraceProvider = Ellipsis` — 2
  - `HWRT`: `NDICollisionQuery_AsyncGpuTraceProvider = Ellipsis` — 1
  - `NONE`: `NDICollisionQuery_AsyncGpuTraceProvider = Ellipsis` — 3

### `unreal.NDIObjectPropertyReaderSourceMode`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceUObjectPropertyReader.h`

ENDIObject Property Reader Source Mode

**Properties** (5):
  - `ATTACH_PARENT`: `NDIObjectPropertyReaderSourceMode = Ellipsis` — Source object is the attach parent, i.e. the owner component. 3
  - `ATTACH_PARENT_ACTOR`: `NDIObjectPropertyReaderSourceMode = Ellipsis` — Source object is found use the attached parent actor, i.e. the owner components actor. 1
  - `BINDING`: `NDIObjectPropertyReaderSourceMode = Ellipsis` — Source object is found in the order of object binding, source actor. 0
  - `BINDING_THEN_ATTACH_PARENT`: `NDIObjectPropertyReaderSourceMode = Ellipsis` — Source object is found in the order of object binding, source actor, then attached parent. 4
  - `BINDING_THEN_ATTACH_PARENT_ACTOR`: `NDIObjectPropertyReaderSourceMode = Ellipsis` — Source object is found in the order of object binding, source actor, then attached parent actor. 2

### `unreal.NDISceneCapture2DOffsetMode`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceSceneCapture2D.h`

ENDIScene Capture 2DOffset Mode

**Properties** (4):
  - `ABSOLUTE_WORLD`: `NDISceneCapture2DOffsetMode = Ellipsis` — The offset is applied directly, i.e. not added to the existing valud 3
  - `DISABLED`: `NDISceneCapture2DOffsetMode = Ellipsis` — The offset is disabled and will not be applied. 0
  - `RELATIVE_LOCAL`: `NDISceneCapture2DOffsetMode = Ellipsis` — The offset is in the component local space. 1
  - `RELATIVE_WORLD`: `NDISceneCapture2DOffsetMode = Ellipsis` — The offset is in world space, i.e. added to the exising value directly. 2

### `unreal.NDISceneCapture2DSourceMode`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceSceneCapture2D.h`

ENDIScene Capture 2DSource Mode

**Properties** (4):
  - `ATTACH_PARENT_ONLY`: `NDISceneCapture2DSourceMode = Ellipsis` — Only look at the attach parent to find the scene capture component. 2
  - `MANAGED`: `NDISceneCapture2DSourceMode = Ellipsis` — Managed mode, we will not search for any and instead create one internally. 3
  - `USER_PARAMETER_ONLY`: `NDISceneCapture2DSourceMode = Ellipsis` — Only check the user parameter to find the scene capture component. 1
  - `USER_PARAMETER_THEN_ATTACH_PARENT`: `NDISceneCapture2DSourceMode = Ellipsis` — Check the user parameter then the attach parent to find the scene capture component. 0

### `unreal.NDISkeletalMesh_SkinningMode`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceSkeletalMesh.h`

ENDISkeletal Mesh Skinning Mode

**Properties** (3):
  - `NONE`: `NDISkeletalMesh_SkinningMode = Ellipsis` — No skinning, use for reference pose only.
- Bone and socket sampling will be calculated on demand.
-...
  - `PRE_SKIN`: `NDISkeletalMesh_SkinningMode = Ellipsis` — Pre-skin the whole mesh, can be more optimal when reading a lot of triangle or vertex data.
- Bone a...
  - `SKIN_ON_THE_FLY`: `NDISkeletalMesh_SkinningMode = Ellipsis` — Skin as required, use for bone or socket sampling or when reading a subset of triangles or vertices....

### `unreal.NDISkeletalMesh_SourceMode`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceSkeletalMesh.h`

ENDISkeletal Mesh Source Mode

**Properties** (4):
  - `ATTACH_PARENT`: `NDISkeletalMesh_SourceMode = Ellipsis` — Only use the parent actor or component the system is attached to. 2
  - `DEFAULT`: `NDISkeletalMesh_SourceMode = Ellipsis` — Default behavior.
- Use âSourceâ when specified (either set explicitly or via blueprint with Set...
  - `DEFAULT_MESH_ONLY`: `NDISkeletalMesh_SourceMode = Ellipsis` — Only use the âDefault Meshâ specified. 3
  - `SOURCE`: `NDISkeletalMesh_SourceMode = Ellipsis` — Only use âSourceâ (either set explicitly or via blueprint with Set Niagara Skeletal Mesh Compone...

### `unreal.NDISkelMesh_AdjacencyTriangleIndexFormat`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

This enum must match the order in NiagaraDataInterfaceSkeletalMesh.ush

**Properties** (2):
  - `FULL`: `NDISkelMesh_AdjacencyTriangleIndexFormat = Ellipsis` — 32 bits per entry. Allow for the full int32 range of triangles (2 billion). 0
  - `HALF`: `NDISkelMesh_AdjacencyTriangleIndexFormat = Ellipsis` — 16 bits per entry. Allow for half (int16) range of triangles (64k). 1

### `unreal.NDISkelMesh_GpuMaxInfluences`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

This enum must match the order in NiagaraDataInterfaceSkeletalMesh.ush

**Properties** (3):
  - `ALLOW_MAX4`: `NDISkelMesh_GpuMaxInfluences = Ellipsis` — Allow up to 4 bones to be sampled. 0
  - `ALLOW_MAX8`: `NDISkelMesh_GpuMaxInfluences = Ellipsis` — Allow up to 8 bones to be sampled. 1
  - `UNLIMITED`: `NDISkelMesh_GpuMaxInfluences = Ellipsis` — Allow an unlimited amount of bones to be sampled. 2

### `unreal.NDISkelMesh_GpuUniformSamplingFormat`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

This enum must match the order in NiagaraDataInterfaceSkeletalMesh.ush

**Properties** (3):
  - `FULL`: `NDISkelMesh_GpuUniformSamplingFormat = Ellipsis` — 64 bits per entry. Allow for the full int32 range of triangles (2 billion). 0
  - `LIMITED_23_9`: `NDISkelMesh_GpuUniformSamplingFormat = Ellipsis` — 32 bits per entry. Allow for ~8.4 millions triangles and 9 bits of probability precision. 2
  - `LIMITED_24_8`: `NDISkelMesh_GpuUniformSamplingFormat = Ellipsis` — 32 bits per entry. Allow for ~16.7 million triangles and 8 bits of probability precision. 1

### `unreal.NDIStaticMesh_SourceMode`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceStaticMesh.h`

ENDIStatic Mesh Source Mode

**Properties** (5):
  - `ATTACH_PARENT`: `NDIStaticMesh_SourceMode = Ellipsis` — Only use the parent actor or component the system is attached to. 2
  - `DEFAULT`: `NDIStaticMesh_SourceMode = Ellipsis` — Default behavior follows the order of.
- Use âSourceâ when specified (either set explicitly or v...
  - `DEFAULT_MESH_ONLY`: `NDIStaticMesh_SourceMode = Ellipsis` — Only use the âDefault Meshâ specified. 3
  - `MESH_PARAMETER_BINDING`: `NDIStaticMesh_SourceMode = Ellipsis` — Only use the mesh parameter binding. 4
  - `SOURCE`: `NDIStaticMesh_SourceMode = Ellipsis` — Only use âSourceâ (either set explicitly or via blueprint with Set Niagara Static Mesh Component...

### `unreal.NiagaraAgeUpdateMode`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

Defines modes for updating the componentâs age.

**Properties** (3):
  - `DESIRED_AGE`: `NiagaraAgeUpdateMode = Ellipsis` — Update the age by seeking to the DesiredAge. To prevent major perf loss, we clamp to MaxClampTime 1
  - `DESIRED_AGE_NO_SEEK`: `NiagaraAgeUpdateMode = Ellipsis` — Update the age by tracking changes to the desired age, but when the desired age goes backwards in ti...
  - `TICK_DELTA_TIME`: `NiagaraAgeUpdateMode = Ellipsis` — Update the age using the delta time supplied to the component tick function. 0

### `unreal.NiagaraCompilationMode`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

ENiagara Compilation Mode

**Properties** (2):
  - `ASYNC_TASKS`: `NiagaraCompilationMode = Ellipsis` — 1
  - `ORIGINAL`: `NiagaraCompilationMode = Ellipsis` — 0

### `unreal.NiagaraCompileErrorSeverity`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

ENiagara Compile Error Severity

**Properties** (4):
  - `ERROR`: `NiagaraCompileErrorSeverity = Ellipsis` — 3
  - `IGNORE`: `NiagaraCompileErrorSeverity = Ellipsis` — 0
  - `LOG_ONLY`: `NiagaraCompileErrorSeverity = Ellipsis` — 1
  - `WARNING`: `NiagaraCompileErrorSeverity = Ellipsis` — 2

### `unreal.NiagaraCullProxyMode`
Inherits: `EnumBase` | Header: `NiagaraEffectType.h`

Controls how cull proxies should be handled for a system.

**Properties** (2):
  - `INSTANCED_RENDERED`: `NiagaraCullProxyMode = Ellipsis` — A single simulation is used but rendered in place of all culled systems. This saves on simulation co...
  - `NONE`: `NiagaraCullProxyMode = Ellipsis` — No cull proxy replaces culled systems. 0

### `unreal.NiagaraCullReaction`
Inherits: `EnumBase` | Header: `NiagaraEffectType.h`

Controls what action is taken by a Niagara system that fails itâs cull checks.

**Properties** (5):
  - `DEACTIVATE`: `NiagaraCullReaction = Ellipsis` — The system instance will be deactivated. Particles will be allowed to die naturally. It will not be ...
  - `DEACTIVATE_IMMEDIATE`: `NiagaraCullReaction = Ellipsis` — The system instance will be deactivated and particles killed immediately. It will not be reactivated...
  - `DEACTIVATE_IMMEDIATE_RESUME`: `NiagaraCullReaction = Ellipsis` — The system instance will be deactivated and particles killed immediately. Will reactivate when it pa...
  - `DEACTIVATE_RESUME`: `NiagaraCullReaction = Ellipsis` — The system instance will be deactivated. Particles will be allowed to die naturally. Will reactivate...
  - `PAUSE_RESUME`: `NiagaraCullReaction = Ellipsis` — The system instance will be paused, maintaining itâs current state, but will resume ticking when i...

### `unreal.NiagaraCVarConditionResponse`
Inherits: `EnumBase` | Header: `NiagaraPlatformSet.h`

ENiagara CVar Condition Response

**Properties** (3):
  - `DISABLE`: `NiagaraCVarConditionResponse = Ellipsis` — 2
  - `ENABLE`: `NiagaraCVarConditionResponse = Ellipsis` — 1
  - `NONE`: `NiagaraCVarConditionResponse = Ellipsis` — 0

### `unreal.NiagaraDataInterfaceEmitterBindingMode`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceEmitterBinding.h`

ENiagara Data Interface Emitter Binding Mode

**Properties** (2):
  - `OTHER`: `NiagaraDataInterfaceEmitterBindingMode = Ellipsis` — Attempt to bind to an emitter using itâs name. 1
  - `SELF`: `NiagaraDataInterfaceEmitterBindingMode = Ellipsis` — Attempt to bind to the emitter the data interface is used with, this may not be possible in all situ...

### `unreal.NiagaraDefaultGpuTranslucentLatency`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

ENiagara Default Gpu Translucent Latency

**Properties** (2):
  - `IMMEDIATE`: `NiagaraDefaultGpuTranslucentLatency = Ellipsis` — Gpu simulations will always read this frames data for translucent materials. 0
  - `LATENT`: `NiagaraDefaultGpuTranslucentLatency = Ellipsis` — Gpu simulations will read the previous frames data if the simulation has to run in PostRenderOpaque....

### `unreal.NiagaraDefaultRendererMotionVectorSetting`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

How to handle how Niagara rendered effects should generate motion vectors by default (can still be overridden on a case-by-case basis)

**Properties** (2):
  - `APPROXIMATE`: `NiagaraDefaultRendererMotionVectorSetting = Ellipsis` — Approximates the motion vectors from current velocity.
Saves memory and performance, but can result ...
  - `PRECISE`: `NiagaraDefaultRendererMotionVectorSetting = Ellipsis` — Motion vectors generated are precise (ideal for motion blur and temporal anti-aliasing).
Requires re...

### `unreal.NiagaraDefaultRendererPixelCoverageMode`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

ENiagara Default Renderer Pixel Coverage Mode

**Properties** (2):
  - `DISABLED`: `NiagaraDefaultRendererPixelCoverageMode = Ellipsis` — When renderer is set to automatic mode pixel coverage is disabled. 1
  - `ENABLED`: `NiagaraDefaultRendererPixelCoverageMode = Ellipsis` — When renderer is set to automatic mode pixel coverage is enabled. 0

### `unreal.NiagaraDefaultSortPrecision`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

ENiagara Default Sort Precision

**Properties** (2):
  - `HIGH`: `NiagaraDefaultSortPrecision = Ellipsis` — High precision sorting, float (fp32) precision, slower but may fix sorting artifacts. 1
  - `LOW`: `NiagaraDefaultSortPrecision = Ellipsis` — Low precision sorting, half float (fp16) precision, faster and adequate for most cases. 0

### `unreal.NiagaraDeviceProfileRedirectMode`
Inherits: `EnumBase` | Header: `NiagaraPlatformSet.h`

ENiagara Device Profile Redirect Mode

**Properties** (2):
  - `C_VAR`: `NiagaraDeviceProfileRedirectMode = Ellipsis` — Replace Device Profile Reference with a CVar Condition. 0
  - `DEVICE_PROFILE`: `NiagaraDeviceProfileRedirectMode = Ellipsis` — Replace Device Profile Reference with a different Device Profile. 1

### `unreal.NiagaraEmitterCalculateBoundMode`
Inherits: `EnumBase` | Header: `NiagaraEmitter.h`

ENiagara Emitter Calculate Bound Mode

**Properties** (3):
  - `DYNAMIC`: `NiagaraEmitterCalculateBoundMode = Ellipsis` — Bounds are calculated per frame (Only available for CPU emitters). 0
  - `FIXED`: `NiagaraEmitterCalculateBoundMode = Ellipsis` — Bounds are set from the emitterâs fixed bounds. 1
  - `PROGRAMMABLE`: `NiagaraEmitterCalculateBoundMode = Ellipsis` — Bounds will be set from the script using the Emitter Properties Data Interface, or blueprint.  If no...

### `unreal.NiagaraEmitterDefaultSummaryState`
Inherits: `EnumBase` | Header: `NiagaraScript.h`

ENiagara Emitter Default Summary State

**Properties** (2):
  - `DEFAULT`: `NiagaraEmitterDefaultSummaryState = Ellipsis` — The emitter will be added in default, full view by default. 0
  - `SUMMARY`: `NiagaraEmitterDefaultSummaryState = Ellipsis` — The emitter will be added in summary state by default. 1

### `unreal.NiagaraGpuBufferFormat`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

Niagara supported buffer formats on the GPU.

**Properties** (3):
  - `FLOAT`: `NiagaraGpuBufferFormat = Ellipsis` — 32-bit per channel floating point, range [-3.402823 x 10^38, 3.402823 x 10^38] 0
  - `HALF_FLOAT`: `NiagaraGpuBufferFormat = Ellipsis` — 16-bit per channel floating point, range [-65504, 65504] 1
  - `UNSIGNED_NORMALIZED_BYTE`: `NiagaraGpuBufferFormat = Ellipsis` — 8-bit per channel fixed point, range [0, 1]. 2

### `unreal.NiagaraGpuSyncMode`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

ENiagara Gpu Sync Mode

**Properties** (4):
  - `NONE`: `NiagaraGpuSyncMode = Ellipsis` — Data will not be automatically pushed and could diverge between Cpu & Gpu. 0
  - `SYNC_BOTH`: `NiagaraGpuSyncMode = Ellipsis` — Gpu will continuously push back to the Cpu and Cpu modifications will be pushed to the Gpu. 3
  - `SYNC_CPU_TO_GPU`: `NiagaraGpuSyncMode = Ellipsis` — Cpu modifications will be pushed to the Gpu. 1
  - `SYNC_GPU_TO_CPU`: `NiagaraGpuSyncMode = Ellipsis` — Gpu will continuously push back to the Cpu, this will incur a performance penalty. 2

### `unreal.NiagaraInterpolatedSpawnMode`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

ENiagara Interpolated Spawn Mode

**Properties** (3):
  - `INTERPOLATION`: `NiagaraInterpolatedSpawnMode = Ellipsis` — This mode runs both the spawn and update script and performs a partial update at spawn time. This ad...
  - `NO_INTERPOLATION`: `NiagaraInterpolatedSpawnMode = Ellipsis` — This mode does no interpolation and skips the update script on the first frame for newly spawned par...
  - `RUN_UPDATE_SCRIPT`: `NiagaraInterpolatedSpawnMode = Ellipsis` — This mode runs both the spawn and update script, but without any value interpolation for particles. ...

### `unreal.NiagaraLwcTileUpdateMode`
Inherits: `EnumBase` | Header: `NiagaraSystem.h`

ENiagara Lwc Tile Update Mode

**Properties** (3):
  - `REBASE`: `NiagaraLwcTileUpdateMode = Ellipsis` — When a simulation moves greater or equal to the number of tiles specified in fx.LWCTileRecache we wi...
  - `REBASE_OR_RESET_SIMULATION`: `NiagaraLwcTileUpdateMode = Ellipsis` — This option is similar to Rebase with the exception that when we cross fx.LWCTileForceReset number o...
  - `RESET_SIMULATION`: `NiagaraLwcTileUpdateMode = Ellipsis` — When a simulation moves greater or equal to the number of tiles specified in fx.LWCTileRecache the s...

### `unreal.NiagaraMeshFacingMode`
Inherits: `EnumBase` | Header: `NiagaraMeshRendererProperties.h`

This enum decides how a mesh particle will orient its âfacingâ axis relative to camera. Must keep these in sync with NiagaraMeshVertexFactory.ush

**Properties** (4):
  - `CAMERA_PLANE`: `NiagaraMeshFacingMode = Ellipsis` — Has the mesh local-space X-axis point towards the closest point on the camera view plane. 3
  - `CAMERA_POSITION`: `NiagaraMeshFacingMode = Ellipsis` — Has the mesh local-space X-axis point towards the cameraâs position. 2
  - `DEFAULT`: `NiagaraMeshFacingMode = Ellipsis` — Ignores the camera altogether. The mesh aligns its local-space X-axis with the particlesâ local-sp...
  - `VELOCITY`: `NiagaraMeshFacingMode = Ellipsis` — The mesh aligns itâs local-space X-axis with the particleâs Particles.Velocity vector. 1

### `unreal.NiagaraMeshLockedAxisSpace`
Inherits: `EnumBase` | Header: `NiagaraMeshRendererProperties.h`

ENiagara Mesh Locked Axis Space

**Properties** (3):
  - `LOCAL`: `NiagaraMeshLockedAxisSpace = Ellipsis` — The locked axis is in the emitterâs local space 2
  - `SIMULATION`: `NiagaraMeshLockedAxisSpace = Ellipsis` — The locked axis is in the emitterâs local space if the emitter is marked as local-space, or in wor...
  - `WORLD`: `NiagaraMeshLockedAxisSpace = Ellipsis` — The locked axis is in world space 1

### `unreal.NiagaraMeshLODMode`
Inherits: `EnumBase` | Header: `NiagaraMeshRendererMeshProperties.h`

ENiagara Mesh LODMode

**Properties** (5):
  - `BY_COMPONENT_BOUNDS`: `NiagaraMeshLODMode = Ellipsis` — The LOD level is calculated based on screen space size of the component bounds.
All particles will b...
  - `COMPONENT_ORIGIN`: `NiagaraMeshLODMode = Ellipsis` — The LOD level will be calculated like we have a single particle at the component origin, i.e. it sho...
  - `LOD_BIAS`: `NiagaraMeshLODMode = Ellipsis` — Takes the highest available LOD for the platform + LOD bias to render all mesh particles
If the LOD ...
  - `LOD_LEVEL`: `NiagaraMeshLODMode = Ellipsis` — Uses the provided LOD level to render all mesh particles.
If the LOD is not streamed in or available...
  - `PER_PARTICLE`: `NiagaraMeshLODMode = Ellipsis` — The LOD level is calcuated per particle using the particle position and mesh sphere bounds.
This inv...

### `unreal.NiagaraMeshPivotOffsetSpace`
Inherits: `EnumBase` | Header: `NiagaraMeshRendererMeshProperties.h`

ENiagara Mesh Pivot Offset Space

**Properties** (4):
  - `LOCAL`: `NiagaraMeshPivotOffsetSpace = Ellipsis` — The pivot offset is in the emitterâs local space 3
  - `MESH`: `NiagaraMeshPivotOffsetSpace = Ellipsis` — The pivot offset is in the meshâs local space (default) 0
  - `SIMULATION`: `NiagaraMeshPivotOffsetSpace = Ellipsis` — The pivot offset is in the emitterâs local space if the emitter is marked as local-space, or in wo...
  - `WORLD`: `NiagaraMeshPivotOffsetSpace = Ellipsis` — The pivot offset is in world space 2

### `unreal.NiagaraMipMapGeneration`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

ENiagara Mip Map Generation

**Properties** (3):
  - `DISABLED`: `NiagaraMipMapGeneration = Ellipsis` — Mips will not be created or automatically generated. 0
  - `POST_SIMULATE`: `NiagaraMipMapGeneration = Ellipsis` — Mips will be generated after all stages have been run if the interface was written to. 2
  - `POST_STAGE`: `NiagaraMipMapGeneration = Ellipsis` — Mips will be generated after each stage where the interfaces is written to. 1

### `unreal.NiagaraModuleDependencyScriptConstraint`
Inherits: `EnumBase` | Header: `NiagaraScript.h`

ENiagara Module Dependency Script Constraint

**Properties** (2):
  - `ALL_SCRIPTS`: `NiagaraModuleDependencyScriptConstraint = Ellipsis` — The module providing the dependency can be in any script as long as it satisfies the dependency type...
  - `SAME_SCRIPT`: `NiagaraModuleDependencyScriptConstraint = Ellipsis` — The module providing the dependency must be in the same script e.g. if the module requiring the depe...

### `unreal.NiagaraModuleDependencyType`
Inherits: `EnumBase` | Header: `NiagaraScript.h`

ENiagara Module Dependency Type

**Properties** (2):
  - `POST_DEPENDENCY`: `NiagaraModuleDependencyType = Ellipsis` — The dependency belongs after the module. 1
  - `PRE_DEPENDENCY`: `NiagaraModuleDependencyType = Ellipsis` — The dependency belongs before the module. 0

### `unreal.NiagaraNumericOutputTypeSelectionMode`
Inherits: `EnumBase` | Header: `NiagaraTypes.h`

Defines different modes for selecting the output numeric type of a function or operation based on the types of the inputs.

**Properties** (4):
  - `CUSTOM`: `NiagaraNumericOutputTypeSelectionMode = Ellipsis` — Selects the type based on custom logic from the node. 4
  - `LARGEST`: `NiagaraNumericOutputTypeSelectionMode = Ellipsis` — Select the largest of the numeric inputs. 1
  - `SCALAR`: `NiagaraNumericOutputTypeSelectionMode = Ellipsis` — Selects the base scalar type for this numeric inputs. 3
  - `SMALLEST`: `NiagaraNumericOutputTypeSelectionMode = Ellipsis` — Select the smallest of the numeric inputs. 2

### `unreal.NiagaraOcclusionQueryMode`
Inherits: `EnumBase` | Header: `NiagaraComponent.h`

ENiagara Occlusion Query Mode

**Properties** (3):
  - `ALWAYS_DISABLED`: `NiagaraOcclusionQueryMode = Ellipsis` — Occlusion queries will always be disabled for Niagara. 2
  - `ALWAYS_ENABLED`: `NiagaraOcclusionQueryMode = Ellipsis` — Occlusion queries will always be enabled for Niagara. 1
  - `DEFAULT`: `NiagaraOcclusionQueryMode = Ellipsis` — Allow Niagara to determine if we allow occlusion queries to be enabled or not. 0

### `unreal.NiagaraPreviewGridResetMode`
Inherits: `EnumBase` | Header: `NiagaraPreviewGrid.h`

ENiagara Preview Grid Reset Mode

**Properties** (3):
  - `ALL`: `NiagaraPreviewGridResetMode = Ellipsis` — Resets each preview as it completes. 2
  - `INDIVIDUAL`: `NiagaraPreviewGridResetMode = Ellipsis` — Never resets the previews. 1
  - `NEVER`: `NiagaraPreviewGridResetMode = Ellipsis` — 0

### `unreal.NiagaraRendererGpuTranslucentLatency`
Inherits: `EnumBase` | Header: `NiagaraRendererProperties.h`

ENiagara Renderer Gpu Translucent Latency

**Properties** (3):
  - `IMMEDIATE`: `NiagaraRendererGpuTranslucentLatency = Ellipsis` — Gpu simulations will always read this frames data for translucent materials. 1
  - `LATENT`: `NiagaraRendererGpuTranslucentLatency = Ellipsis` — Gpu simulations will read the previous frames data if the simulation has to run in PostRenderOpaque....
  - `PROJECT_DEFAULT`: `NiagaraRendererGpuTranslucentLatency = Ellipsis` — Uses the project default value. 0

### `unreal.NiagaraRendererMotionVectorSetting`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

How a given Niagara renderer should handle motion vector generation.

**Properties** (4):
  - `APPROXIMATE`: `NiagaraRendererMotionVectorSetting = Ellipsis` — Force motion vectors to be approximate for this renderer (higher performance, lower particle memory ...
  - `AUTO_DETECT`: `NiagaraRendererMotionVectorSetting = Ellipsis` — Determines the best method to employ when generating motion vectors (accurate vs. approximate) based...
  - `DISABLE`: `NiagaraRendererMotionVectorSetting = Ellipsis` — Do not generate motion vectors (i.e. render the object as though it is stationary). 3
  - `PRECISE`: `NiagaraRendererMotionVectorSetting = Ellipsis` — Force motion vectors to be precise for this renderer. 1

### `unreal.NiagaraRendererPixelCoverageMode`
Inherits: `EnumBase` | Header: `NiagaraSpriteRendererProperties.h`

ENiagara Renderer Pixel Coverage Mode

**Properties** (6):
  - `AUTOMATIC`: `NiagaraRendererPixelCoverageMode = Ellipsis` — Automatically determine if we want pixel coverage enabled or disabled, based on project setting and ...
  - `DISABLED`: `NiagaraRendererPixelCoverageMode = Ellipsis` — Disable pixel coverage. 1
  - `ENABLED`: `NiagaraRendererPixelCoverageMode = Ellipsis` — Enable pixel coverage with no color adjustment based on coverage. 2
  - `ENABLED_A`: `NiagaraRendererPixelCoverageMode = Ellipsis` — Enable pixel coverage and adjust the Alpha channel only according to coverage. 5
  - `ENABLED_RGB`: `NiagaraRendererPixelCoverageMode = Ellipsis` — Enable pixel coverage and adjust the RGB channels according to coverage. 4
  - `ENABLED_RGBA`: `NiagaraRendererPixelCoverageMode = Ellipsis` — Enable pixel coverage and adjust the RGBA channels according to coverage. 3

### `unreal.NiagaraRendererSortPrecision`
Inherits: `EnumBase` | Header: `NiagaraRendererProperties.h`

ENiagara Renderer Sort Precision

**Properties** (3):
  - `DEFAULT`: `NiagaraRendererSortPrecision = Ellipsis` — Uses the project settings value. 0
  - `HIGH`: `NiagaraRendererSortPrecision = Ellipsis` — High precision sorting, float (fp32) precision, slower but may fix sorting artifacts. 2
  - `LOW`: `NiagaraRendererSortPrecision = Ellipsis` — Low precision sorting, half float (fp16) precision, faster and adequate for most cases. 1

### `unreal.NiagaraRendererSourceDataMode`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

This enum decides how a renderer will attempt to process the incoming data from the stack.

**Properties** (2):
  - `EMITTER`: `NiagaraRendererSourceDataMode = Ellipsis` — The renderer will draw only one element per Emitter. It can only pull in data from Emitter/User/or S...
  - `PARTICLES`: `NiagaraRendererSourceDataMode = Ellipsis` — The renderer will draw particle data, but can potentially pull in data from the Emitter/User/or Syst...

### `unreal.NiagaraRibbonDrawDirection`
Inherits: `EnumBase` | Header: `NiagaraRibbonRendererProperties.h`

This enum decides in which order the ribbon segments will be rendered

**Properties** (2):
  - `BACK_TO_FRONT`: `NiagaraRibbonDrawDirection = Ellipsis` — 1
  - `FRONT_TO_BACK`: `NiagaraRibbonDrawDirection = Ellipsis` — 0

### `unreal.NiagaraRibbonFacingMode`
Inherits: `EnumBase` | Header: `NiagaraRibbonRendererProperties.h`

ENiagara Ribbon Facing Mode

**Properties** (3):
  - `CUSTOM`: `NiagaraRibbonFacingMode = Ellipsis` — Use Particles.RibbonFacing as the facing vector. 1
  - `CUSTOM_SIDE_VECTOR`: `NiagaraRibbonFacingMode = Ellipsis` — Use Particles.RibbonFacing as the side vector, and calculate the facing vector from that.
Using ribb...
  - `SCREEN`: `NiagaraRibbonFacingMode = Ellipsis` — Have the ribbon face the screen. 0

### `unreal.NiagaraRibbonShapeMode`
Inherits: `EnumBase` | Header: `NiagaraRibbonRendererProperties.h`

ENiagara Ribbon Shape Mode

**Properties** (4):
  - `CUSTOM`: `NiagaraRibbonShapeMode = Ellipsis` — Custom shape, defined by cross section. 3
  - `MULTI_PLANE`: `NiagaraRibbonShapeMode = Ellipsis` — Multiple Planes evenly rotated around the axis to 180 degrees. 1
  - `PLANE`: `NiagaraRibbonShapeMode = Ellipsis` — Default shape, flat plane facing the camera. 0
  - `TUBE`: `NiagaraRibbonShapeMode = Ellipsis` — 3D Tube shape, from triangular to cylindrical depending on vertex count. 2

### `unreal.NiagaraRibbonTessellationMode`
Inherits: `EnumBase` | Header: `NiagaraRibbonRendererProperties.h`

ENiagara Ribbon Tessellation Mode

**Properties** (3):
  - `AUTOMATIC`: `NiagaraRibbonTessellationMode = Ellipsis` — Default tessellation parameters. 0
  - `CUSTOM`: `NiagaraRibbonTessellationMode = Ellipsis` — Custom tessellation parameters. 1
  - `DISABLED`: `NiagaraRibbonTessellationMode = Ellipsis` — Disable tessellation entirely. 2

### `unreal.NiagaraRibbonUVDistributionMode`
Inherits: `EnumBase` | Header: `NiagaraRibbonRendererProperties.h`

Specifies options for distributing UV values across ribbon segments.

**Properties** (4):
  - `SCALED_UNIFORMLY`: `NiagaraRibbonUVDistributionMode = Ellipsis` — Ribbon UVs will stretch the length of the ribbon, without repeating, but distributed by segment, so ...
  - `SCALED_USING_RIBBON_SEGMENT_LENGTH`: `NiagaraRibbonUVDistributionMode = Ellipsis` — Ribbon UVs will stretch the length of the ribbon, without repeating, but account for segment length ...
  - `TILED_FROM_START_OVER_RIBBON_LENGTH`: `NiagaraRibbonUVDistributionMode = Ellipsis` — Dependent on Particle Attribute RibbonUVDistance 3 Ribbon UVs will be tiled along the length of the ...
  - `TILED_OVER_RIBBON_LENGTH`: `NiagaraRibbonUVDistributionMode = Ellipsis` — Ribbon UVs will be tiled along the length of the ribbon evenly, based on TilingLength setting. 2

### `unreal.NiagaraRibbonUVEdgeMode`
Inherits: `EnumBase` | Header: `NiagaraRibbonRendererProperties.h`

Specifies options for handling UVs at the leading and trailing edges of ribbons.

**Properties** (2):
  - `LOCKED`: `NiagaraRibbonUVEdgeMode = Ellipsis` — The UV value at the edge will be locked to 0 at the leading edge, or locked to 1 at the
Trailing edg...
  - `SMOOTH_TRANSITION`: `NiagaraRibbonUVEdgeMode = Ellipsis` — The UV value at the edge will smoothly transition across the segment using normalized age.
This will...

### `unreal.NiagaraScalabilityUpdateFrequency`
Inherits: `EnumBase` | Header: `NiagaraEffectType.h`

Controls how often should we update scalability states for these effects.

**Properties** (5):
  - `CONTINUOUS`: `NiagaraScalabilityUpdateFrequency = Ellipsis` — Scalability will be checked every frame. 4
  - `HIGH`: `NiagaraScalabilityUpdateFrequency = Ellipsis` — Scalability will be checked every 0.25s (default for fx.NiagaraScalabilityUpdateTime_High). 3
  - `LOW`: `NiagaraScalabilityUpdateFrequency = Ellipsis` — Scalability will be checked every 1.0s (default for fx.NiagaraScalabilityUpdateTime_Low). 1
  - `MEDIUM`: `NiagaraScalabilityUpdateFrequency = Ellipsis` — Scalability will be checked every 0.5s (default for fx.NiagaraScalabilityUpdateTime_Medium). 2
  - `SPAWN_ONLY`: `NiagaraScalabilityUpdateFrequency = Ellipsis` — Scalability will be checked only on spawn. 0

### `unreal.NiagaraScriptLibraryVisibility`
Inherits: `EnumBase` | Header: `NiagaraScript.h`

ENiagara Script Library Visibility

**Properties** (3):
  - `HIDDEN`: `NiagaraScriptLibraryVisibility = Ellipsis` — The script is never visible to the user. This is useful to âsoft deprecateâ assets that should n...
  - `LIBRARY`: `NiagaraScriptLibraryVisibility = Ellipsis` — The script is exposed to the asset library and always visible to the user. 2
  - `UNEXPOSED`: `NiagaraScriptLibraryVisibility = Ellipsis` — The script is not visible by default to the user, but can be made visible by disabling the âLibrar...

### `unreal.NiagaraScriptTemplateSpecification`
Inherits: `EnumBase` | Header: `NiagaraScript.h`

ENiagara Script Template Specification

**Properties** (3):
  - `BEHAVIOR`: `NiagaraScriptTemplateSpecification = Ellipsis` — 2
  - `NONE`: `NiagaraScriptTemplateSpecification = Ellipsis` — 0
  - `TEMPLATE`: `NiagaraScriptTemplateSpecification = Ellipsis` — 1

### `unreal.NiagaraSimCacheAttributeCaptureMode`
Inherits: `EnumBase` | Header: `NiagaraSimCache.h`

ENiagara Sim Cache Attribute Capture Mode

**Properties** (3):
  - `ALL`: `NiagaraSimCacheAttributeCaptureMode = Ellipsis` — Captures all attributes available.
This kind of cache will be useful for restarting a simulation fro...
  - `EXPLICIT_ATTRIBUTES`: `NiagaraSimCacheAttributeCaptureMode = Ellipsis` — Captures only attributes that match the âExplicitCaptureAttributesâ list provided by the user.
T...
  - `RENDERING_ONLY`: `NiagaraSimCacheAttributeCaptureMode = Ellipsis` — Captures attributes that are required to render the system only.
This kind of cache is useful for re...

### `unreal.NiagaraSimTarget`
Inherits: `EnumBase` | Header: `NiagaraCommon.h`

ENiagara Sim Target

**Properties** (2):
  - `CPU_SIM`: `NiagaraSimTarget = Ellipsis` — 0
  - `GPU_COMPUTE_SIM`: `NiagaraSimTarget = Ellipsis` — 1

### `unreal.NiagaraSortMode`
Inherits: `EnumBase` | Header: `NiagaraGPUSortInfo.h`

ENiagara Sort Mode

**Properties** (5):
  - `CUSTOM_ASCENDING`: `NiagaraSortMode = Ellipsis` — Sort according to particles CustomSortingBinding (defaults to Particles.NormalizedAge).
Lower values...
  - `CUSTOM_DECENDING`: `NiagaraSortMode = Ellipsis` — Sort according to particles CustomSortingBinding (defaults to Particles.NormalizedAge).
Higher value...
  - `NONE`: `NiagaraSortMode = Ellipsis` — Perform no additional sorting prior to rendering. 0
  - `VIEW_DEPTH`: `NiagaraSortMode = Ellipsis` — Sort by depth to the cameraâs near plane. 1
  - `VIEW_DISTANCE`: `NiagaraSortMode = Ellipsis` — Sort by distance to the cameraâs origin. 2

### `unreal.NiagaraSpriteAlignment`
Inherits: `EnumBase` | Header: `NiagaraSpriteRendererProperties.h`

This enum decides how a sprite particle will orient its âupâ axis. Must keep these in sync with NiagaraSpriteVertexFactory.ush

**Properties** (4):
  - `AUTOMATIC`: `NiagaraSpriteAlignment = Ellipsis` — Automatically select between Unaligned & CustomAlignment depending on if SpriteAlignment Binding is ...
  - `CUSTOM_ALIGNMENT`: `NiagaraSpriteAlignment = Ellipsis` — Imagine the particle texture having an arrow pointing up, this mode makes the arrow point towards th...
  - `UNALIGNED`: `NiagaraSpriteAlignment = Ellipsis` — Only Particles.SpriteRotation and FacingMode impact the alignment of the particle. 0
  - `VELOCITY_ALIGNED`: `NiagaraSpriteAlignment = Ellipsis` — Imagine the particle texture having an arrow pointing up, this mode makes the arrow point in the dir...

### `unreal.NiagaraSpriteFacingMode`
Inherits: `EnumBase` | Header: `NiagaraSpriteRendererProperties.h`

This enum decides how a sprite particle will orient its âfacingâ axis. Must keep these in sync with NiagaraSpriteVertexFactory.ush

**Properties** (6):
  - `AUTOMATIC`: `NiagaraSpriteFacingMode = Ellipsis` — Automatically select between FaceCamera & CustomFacingVector depending on if SpriteFacing binding is...
  - `CUSTOM_FACING_VECTOR`: `NiagaraSpriteFacingMode = Ellipsis` — The sprite billboard faces toward the âParticles.SpriteFacingâ vector attribute. If the âParti...
  - `FACE_CAMERA`: `NiagaraSpriteFacingMode = Ellipsis` — The sprite billboard origin is always âlooking atâ the camera origin, trying to keep its up axis...
  - `FACE_CAMERA_DISTANCE_BLEND`: `NiagaraSpriteFacingMode = Ellipsis` — Blends between FaceCamera and FaceCameraPosition. 4
  - `FACE_CAMERA_PLANE`: `NiagaraSpriteFacingMode = Ellipsis` — The sprite billboard plane is completely parallel to the camera plane. Particle always looks âflat...
  - `FACE_CAMERA_POSITION`: `NiagaraSpriteFacingMode = Ellipsis` — Faces the camera position, but is not dependent on the camera rotation.  This method produces more s...

### `unreal.NiagaraStripScriptByteCodeOption`
Inherits: `EnumBase` | Header: `NiagaraSettings.h`

ENiagara Strip Script Byte Code Option

**Properties** (3):
  - `DEFAULT`: `NiagaraStripScriptByteCodeOption = Ellipsis` — 0
  - `STRIP_EXPERIMENTAL`: `NiagaraStripScriptByteCodeOption = Ellipsis` — 2
  - `STRIP_ORIGINAL`: `NiagaraStripScriptByteCodeOption = Ellipsis` — 1

### `unreal.NiagaraSystemSpawnSectionEndBehavior`
Inherits: `EnumBase` | Header: `MovieSceneNiagaraSystemSpawnSection.h`

Defines options for system life cycle for the time after the section.

**Properties** (3):
  - `DEACTIVATE`: `NiagaraSystemSpawnSectionEndBehavior = Ellipsis` — / When the section ends the systemâs component is deactivated which will kill all existing particl...
  - `NONE`: `NiagaraSystemSpawnSectionEndBehavior = Ellipsis` — / Does nothing when the section ends and allows the system to continue to run as normal. 2
  - `SET_SYSTEM_INACTIVE`: `NiagaraSystemSpawnSectionEndBehavior = Ellipsis` — / When the section ends the system is set to inactive which stops spawning but lets existing particl...

### `unreal.NiagaraSystemSpawnSectionEvaluateBehavior`
Inherits: `EnumBase` | Header: `MovieSceneNiagaraSystemSpawnSection.h`

Defines options for system life cycle for when the section is evaluating from the 2nd frame until the last frame of the section.

**Properties** (2):
  - `ACTIVATE_IF_INACTIVE`: `NiagaraSystemSpawnSectionEvaluateBehavior = Ellipsis` — The systemâs component will be activated on any frame where it is inactive.  This is useful for co...
  - `NONE`: `NiagaraSystemSpawnSectionEvaluateBehavior = Ellipsis` — There sill be no changes to the system life cycle while the section is evaluating. 1

### `unreal.NiagaraSystemSpawnSectionStartBehavior`
Inherits: `EnumBase` | Header: `MovieSceneNiagaraSystemSpawnSection.h`

Defines options for system life cycle for before the section is evaluating up to the first frame the section evaluates.

**Properties** (1):
  - `ACTIVATE`: `NiagaraSystemSpawnSectionStartBehavior = Ellipsis` — When the time before the section evaluates the particle systemâs component will be deactivated and...

### `unreal.NiagaraTickBehavior`
Inherits: `EnumBase` | Header: `NiagaraTickBehaviorEnum.h`

Niagara ticking behaviour

**Properties** (4):
  - `FORCE_TICK_FIRST`: `NiagaraTickBehavior = Ellipsis` — Niagara will tick in the first tick group (default is TG_PrePhysics). 2
  - `FORCE_TICK_LAST`: `NiagaraTickBehavior = Ellipsis` — Niagara will tick in the last tick group (default is TG_LastDemotable). 3
  - `USE_COMPONENT_TICK_GROUP`: `NiagaraTickBehavior = Ellipsis` — Niagara will ignore prereqs (attachments / data interface dependencies) and use the tick group set o...
  - `USE_PREREQS`: `NiagaraTickBehavior = Ellipsis` — Niagara will tick after all prereqs have ticked for attachements / data interfaces, this is the safe...

### `unreal.NiagaraVariantMode`
Inherits: `EnumBase` | Header: `NiagaraVariant.h`

ENiagara Variant Mode

**Properties** (4):
  - `BYTES`: `NiagaraVariantMode = Ellipsis` — 3
  - `DATA_INTERFACE`: `NiagaraVariantMode = Ellipsis` — 2
  - `NONE`: `NiagaraVariantMode = Ellipsis` — 0
  - `OBJECT`: `NiagaraVariantMode = Ellipsis` — 1

### `unreal.NiagartaDataChannelReadResult`
Inherits: `EnumBase` | Header: `NiagaraDataChannel.h`

ENiagarta Data Channel Read Result

**Properties** (2):
  - `FAILURE`: `NiagartaDataChannelReadResult = Ellipsis` — 1
  - `SUCCESS`: `NiagartaDataChannelReadResult = Ellipsis` — 0

### `unreal.ParticleAllocationMode`
Inherits: `EnumBase` | Header: `NiagaraEmitter.h`

EParticle Allocation Mode

**Properties** (3):
  - `AUTOMATIC_ESTIMATE`: `ParticleAllocationMode = Ellipsis` — This mode tries to estimate the max particle count at runtime by using previous simulations as refer...
  - `FIXED_COUNT`: `ParticleAllocationMode = Ellipsis` — This mode defines an upper limit on the number of particles that will be simulated.  Useful for reje...
  - `MANUAL_ESTIMATE`: `ParticleAllocationMode = Ellipsis` — This mode is useful if the particle count can vary wildly at runtime (e.g. due to user parameters) a...

### `unreal.ScriptExecutionMode`
Inherits: `EnumBase` | Header: `NiagaraEmitter.h`

EScript Execution Mode

**Properties** (2):
  - `EVERY_PARTICLE`: `ScriptExecutionMode = Ellipsis` — The event script is run on every existing particle in the emitter. 0
  - `SPAWNED_PARTICLES`: `ScriptExecutionMode = Ellipsis` — The event script is run only on the particles that were spawned in response to the current event in ...

### `unreal.SetResolutionMethod`
Inherits: `EnumBase` | Header: `NiagaraDataInterfaceRW.h`

ESet Resolution Method

**Properties** (3):
  - `CELL_SIZE`: `SetResolutionMethod = Ellipsis` — 2
  - `INDEPENDENT`: `SetResolutionMethod = Ellipsis` — 0
  - `MAX_AXIS`: `SetResolutionMethod = Ellipsis` — 1

### `unreal.AsyncNiagaraCaptureSimCache_OnCaptureComplete`
Inherits: `MulticastDelegateBase` | Header: `NiagaraSimCacheFunctionLibrary.h`

On Capture Complete Delegate Signature

### `unreal.OnNewNiagaraDataChannelPublish`
Inherits: `DelegateBase` | Header: `NiagaraDataChannelPublic.h`

On New Niagara Data Channel Publish Delegate Signature

### `unreal.OnNiagaraSystemFinished`
Inherits: `MulticastDelegateBase` | Header: `NiagaraComponent.h`

Called when the particle system is done
