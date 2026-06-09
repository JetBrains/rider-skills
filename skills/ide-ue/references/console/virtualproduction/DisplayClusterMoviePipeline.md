# UE Python API — DisplayClusterMoviePipeline Module

**8 types** from the `DisplayClusterMoviePipeline` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DisplayClusterMoviePipelineConfiguration`, `DisplayClusterMoviePipelineSettings`, `DisplayClusterMoviePipelineViewportPass_DetailLighting`, `DisplayClusterMoviePipelineViewportPass_LightingOnly`, `DisplayClusterMoviePipelineViewportPass_PathTracer`, `DisplayClusterMoviePipelineViewportPass_ReflectionsOnly`, `DisplayClusterMoviePipelineViewportPass_Unlit`, `DisplayClusterMoviePipelineViewportPassBase`

---

## Classes

### `unreal.DisplayClusterMoviePipelineConfiguration`
Inherits: `StructBase` | Header: `DisplayClusterMoviePipelineSettings.h`

Display Cluster Movie Pipeline Configuration

**Properties** (4):
  - `allowed_viewport_names_list`: `None` — [Read-Write] Render only viewports from this list. (Array[str])
  - `dc_root_actor`: `DisplayClusterRootActor` — [Read-Write] Reference to Display Cluster Root Actor
If not set, the first available in the scene wi...
  - `render_all_viewports`: `bool` — [Read-Write] Render all viewports (bool)
  - `use_viewport_resolutions`: `bool` — [Read-Write] Render with nDisplay viewport resolutions. (bool)

### `unreal.DisplayClusterMoviePipelineSettings`
Inherits: `MoviePipelineSetting` | Header: `DisplayClusterMoviePipelineSettings.h`

nDisplay settings for MoviePipeline

**Properties** (1):
  - `configuration`: `DisplayClusterMoviePipelineConfiguration` — [Read-Write] Reference to Display Cluster Root Actor
If not set, the first available in the scene wi...

### `unreal.DisplayClusterMoviePipelineViewportPass_DetailLighting`
Inherits: `DisplayClusterMoviePipelineViewportPassBase` | Header: `DisplayClusterMoviePipelineViewportPass.h`

nDisplay viewport render pass (DetailLightingOnly)

### `unreal.DisplayClusterMoviePipelineViewportPass_LightingOnly`
Inherits: `DisplayClusterMoviePipelineViewportPassBase` | Header: `DisplayClusterMoviePipelineViewportPass.h`

nDisplay viewport render pass (LightingOnly)

### `unreal.DisplayClusterMoviePipelineViewportPass_PathTracer`
Inherits: `DisplayClusterMoviePipelineViewportPassBase` | Header: `DisplayClusterMoviePipelineViewportPass.h`

nDisplay viewport render pass (PathTracer)

**Properties** (1):
  - `reference_motion_blur`: `bool` — [Read-Write] When enabled, the path tracer will blend all spatial and temporal samples prior to the ...

### `unreal.DisplayClusterMoviePipelineViewportPass_ReflectionsOnly`
Inherits: `DisplayClusterMoviePipelineViewportPassBase` | Header: `DisplayClusterMoviePipelineViewportPass.h`

nDisplay viewport render pass (ReflectionsOnly)

### `unreal.DisplayClusterMoviePipelineViewportPass_Unlit`
Inherits: `DisplayClusterMoviePipelineViewportPassBase` | Header: `DisplayClusterMoviePipelineViewportPass.h`

nDisplay viewport render pass (Unlit)

### `unreal.DisplayClusterMoviePipelineViewportPassBase`
Inherits: `MoviePipelineDeferredPassBase` | Header: `DisplayClusterMoviePipelineViewportPass.h`

nDisplay viewport render pass (Lit)

**Properties** (1):
  - `enabled_warp_blend`: `bool` — [Read-Write] Allow warp blend for this pass (bool)
