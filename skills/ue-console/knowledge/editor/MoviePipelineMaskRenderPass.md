# UE Python API — MoviePipelineMaskRenderPass Module

**4 types** from the `MoviePipelineMaskRenderPass` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieGraphObjectIdNode`, `MoviePipelineObjectIdRenderPass`, `MoviePipelinePanoramicPass`, `MoviePipelineObjectIdPassIdType`

---

## Classes

### `unreal.MovieGraphObjectIdNode`
Inherits: `MovieGraphImagePassBaseNode` | Header: `MovieGraphObjectIdNode.h`

A node which outputs layers compatible with the Cryptomatte standard.

**Properties** (6):
  - `id_type`: `MoviePipelineObjectIdPassIdType` — [Read-Write] How objects are grouped together within the Cryptomatte. (MoviePipelineObjectIdPassIdTy...
  - `include_translucent_objects`: `bool` — [Read-Write] If true, translucent objects will be included in the ObjectId pass (but as an opaque la...
  - `override_b_include_translucent_objects`: `bool` — [Read-Write] (bool)
  - `override_id_type`: `bool` — [Read-Write] (bool)
  - `override_spatial_sample_count`: `bool` — [Read-Write] (bool)
  - `spatial_sample_count`: `int` — [Read-Write] How many sub-pixel jitter renders should we do per temporal sample? This can be used to...

### `unreal.MoviePipelineObjectIdRenderPass`
Inherits: `MoviePipelineImagePassBase` | Header: `MoviePipelineObjectIdPass.h`

Movie Pipeline Object Id Render Pass

**Properties** (2):
  - `id_type`: `MoviePipelineObjectIdPassIdType` — [Read-Write] (MoviePipelineObjectIdPassIdType)
  - `include_translucent_objects`: `bool` — [Read-Write] If true, translucent objects will be included in the ObjectId pass (but as an opaque la...

### `unreal.MoviePipelinePanoramicPass`
Inherits: `MoviePipelineImagePassBase` | Header: `MoviePipelinePanoramicPass.h`

Generates a panoramic image (potentially in stereo, stored top/bottom in the final sheet) in equirectangular projection space. Each render is a traditional 2D render and then they are blended together...

**Properties** (7):
  - `allocate_history_per_pane`: `bool` — [Read-Write] Should we store the render scene history per individual render? This can consume a grea...
  - `follow_camera_orientation`: `bool` — [Read-Write] Should the Pitch, Yaw and Roll of the camera be respected? If false, only the location ...
  - `horz_field_of_view`: `float` — [Read-Write] Advance used only. Allows you to override the Horizontal Field of View (if not zero). C...
  - `num_horizontal_steps`: `int` — [Read-Write] How many different renders should the 360* horizontal view be broken into? Higher numbe...
  - `num_vertical_steps`: `int` — [Read-Write] How many different renders should the 360* vertical view be broken into? Higher numbers...
  - `page_to_system_memory`: `bool` — [Read-Write] * If true, persistent GPU data per panoramic pane is mirrored to system memory, allowin...
  - `vert_field_of_view`: `float` — [Read-Write] Advance used only. Allows you to override the Vertical Field of View (if not zero). Can...

### `unreal.MoviePipelineObjectIdPassIdType`
Inherits: `EnumBase` | Header: `MoviePipelineObjectIdUtils.h`

EMovie Pipeline Object Id Pass Id Type

**Properties** (6):
  - `ACTOR`: `MoviePipelineObjectIdPassIdType = Ellipsis` — Grouped by Actor Name, all materials for a given actor are merged together, and all actors with that...
  - `ACTOR_WITH_HIERARCHY`: `MoviePipelineObjectIdPassIdType = Ellipsis` — Grouped by Actor Name and Folder Hierarchy. This means actors with the same name in different folder...
  - `FOLDER`: `MoviePipelineObjectIdPassIdType = Ellipsis` — Grouped by Folder Name. All actors within a given folder hierarchy in the World Outliner are merged ...
  - `FULL`: `MoviePipelineObjectIdPassIdType = Ellipsis` — As much information as the renderer can provide - unique per material per primitive in the world. 0
  - `LAYER`: `MoviePipelineObjectIdPassIdType = Ellipsis` — Grouped by Actor Layer (the first layer found in the AActor::Layers array). May not do what you expe...
  - `MATERIAL`: `MoviePipelineObjectIdPassIdType = Ellipsis` — Grouped by material name. This means different objects that use the same material will be merged. 1
