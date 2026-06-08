# UE Python API — GPULightmass Module

**6 types** from the `GPULightmass` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GPULightmassSettings`, `GPULightmassSettingsActor`, `GPULightmassSubsystem`, `GPULightmassDenoiser`, `GPULightmassDenoisingOptions`, `GPULightmassMode`

---

## Classes

### `unreal.GPULightmassSettings`
Inherits: `Object` | Header: `GPULightmassSettings.h`

GPULightmass Settings

**Properties** (20):
  - `compress_lightmaps`: `bool` — [Read-Write] Whether to compress lightmap textures.  Disabling lightmap texture compression will red...
  - `denoiser`: `GPULightmassDenoiser` — [Read-Write] (GPULightmassDenoiser)
  - `denoising_options`: `GPULightmassDenoisingOptions` — [Read-Write] If enabled, denoise the results on the CPU after rendering. On Completion denoises the ...
  - `first_bounce_ray_guiding_trial_samples`: `int` — [Read-Write] Number of samples used for First Bounce Ray Guiding, which are thrown away before sampl...
  - `gi_samples`: `int` — [Read-Write] Total number of ray paths executed per texel across all bounces.
Set this to the lowest...
  - `irradiance_cache_corner_rejection`: `float` — [Read-Write] Reject IC entries around corners to help reduce leaking and artifacts. (float)
  - `irradiance_cache_quality`: `int` — [Read-Write] Number of samples per Irradiance Cache cell. (int32)
  - `irradiance_cache_spacing`: `int` — [Read-Write] Size of each Irradiance Cache cell. Smaller sizes will be slower but more accurate. (in...
  - `lightmap_tile_pool_size`: `int` — [Read-Write] GPU Lightmass manages a pool for calculations of visible tiles. The pool size should be...
  - `mode`: `GPULightmassMode` — [Read-Write] Full Bake mode renders the full lightmap resolution for every object in the scene.
Bake...
  - `show_progress_bars`: `bool` — [Read-Write] If true, draw a green progress bar within each tile as it renders.
A red bar indicates ...
  - `stationary_light_shadow_samples`: `int` — [Read-Write] Number of samples for stationary shadows, which are calculated and stored separately fr...
  - `tile_passes_in_full_speed_mode`: `int` — [Read-Write] Baking speed multiplier when Realtime is disabled in the viewer. (int32)
  - `tile_passes_in_slow_mode`: `int` — [Read-Write] Baking speed multiplier when Realtime is enabled in the viewer.
Setting this too high c...
  - `use_first_bounce_ray_guiding`: `bool` — [Read-Write] If Irradiance Caching is enabled, First Bounce Ray Guiding will search the hemisphere o...
  - `use_irradiance_cache_backface_detection`: `bool` — [Read-Write] Further prevent leaks caused by irradiance cache cells being placed inside geometry, at...
  - `use_irradiance_caching`: `bool` — [Read-Write] Irradiance Caching should be enabled with interior scenes to achieve more physically co...
  - `visualize_irradiance_cache`: `bool` — [Read-Write] If true, visualize the Irradiance Cache cells. This can be useful for setting the IC si...
  - `volumetric_lightmap_detail_cell_size`: `int` — [Read-Write] Size of an Volumetric Lightmap voxel at the highest density (used around geometry), in ...
  - `volumetric_lightmap_quality_multiplier`: `int` — [Read-Write] (int32)

### `unreal.GPULightmassSettingsActor`
Inherits: `Info` | Header: `GPULightmassSettings.h`

GPULightmass Settings Actor

**Properties** (1):
  - `settings`: `GPULightmassSettings` — [Read-Write] (GPULightmassSettings)

### `unreal.GPULightmassSubsystem`
Inherits: `WorldSubsystem` | Header: `GPULightmassSettings.h`

GPULightmass Subsystem

**Methods** (9):
  - `end_recording_visible_tiles()` -> `None` — End Recording Visible Tiles
  - `get_percentage()` -> `int32` — Get Percentage
  - `get_settings()` -> `GPULightmassSettings` — Get Settings
  - `is_running()` -> `bool` — Is Running
  - `launch()` -> `None` — Launch
  - `save()` -> `None` — Save
  - `set_realtime(realtime)` -> `None` — Set Realtime
  - `start_recording_visible_tiles()` -> `None` — Start Recording Visible Tiles
  - `stop()` -> `None` — Stop

### `unreal.GPULightmassDenoiser`
Inherits: `EnumBase` | Header: `GPULightmassSettings.h`

EGPULightmass Denoiser

**Properties** (2):
  - `INTEL_OIDN`: `GPULightmassDenoiser = Ellipsis` — 0
  - `SIMPLE_FIREFLY_REMOVER`: `GPULightmassDenoiser = Ellipsis` — 1

### `unreal.GPULightmassDenoisingOptions`
Inherits: `EnumBase` | Header: `GPULightmassSettings.h`

EGPULightmass Denoising Options

**Properties** (3):
  - `DURING_INTERACTIVE_PREVIEW`: `GPULightmassDenoisingOptions = Ellipsis` — 2
  - `NONE`: `GPULightmassDenoisingOptions = Ellipsis` — 0
  - `ON_COMPLETION`: `GPULightmassDenoisingOptions = Ellipsis` — 1

### `unreal.GPULightmassMode`
Inherits: `EnumBase` | Header: `GPULightmassSettings.h`

EGPULightmass Mode

**Properties** (2):
  - `BAKE_WHAT_YOU_SEE`: `GPULightmassMode = Ellipsis` — 1
  - `FULL_BAKE`: `GPULightmassMode = Ellipsis` — 0
