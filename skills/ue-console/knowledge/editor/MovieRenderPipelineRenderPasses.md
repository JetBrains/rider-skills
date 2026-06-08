# UE Python API — MovieRenderPipelineRenderPasses Module

**26 types** from the `MovieRenderPipelineRenderPasses` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MoviePipelinePostProcessPass`, `MovieGraphDeferredPanoramicNode`, `MovieGraphDeferredRenderPassNode`, `MovieGraphImagePassBaseNode`, `MovieGraphImageSequenceOutputNode`, `MovieGraphImageSequenceOutputNode_BMP`, `MovieGraphImageSequenceOutputNode_EXR`, `MovieGraphImageSequenceOutputNode_JPG`, `MovieGraphImageSequenceOutputNode_MultiLayerEXR`, `MovieGraphImageSequenceOutputNode_PNG`, `MovieGraphPathTracerRenderPassNode`, `MoviePipelineDeferredPass_DetailLighting`, `MoviePipelineDeferredPass_LightingOnly`, `MoviePipelineDeferredPass_PathTracer`, `MoviePipelineDeferredPass_ReflectionsOnly`, `MoviePipelineDeferredPass_Unlit`, `MoviePipelineDeferredPassBase`, `MoviePipelineImagePassBase`, `MoviePipelineImageSequenceOutput_BMP`, `MoviePipelineImageSequenceOutput_EXR`, ... (26 total)

---

## Classes

### `unreal.MoviePipelinePostProcessPass`
Inherits: `StructBase` | Header: `MoviePipelineDeferredPasses.h`

Movie Pipeline Post Process Pass

**Properties** (4):
  - `enabled`: `bool` — [Read-Write] Additional passes add a significant amount of render time. May produce multiple output ...
  - `high_precision_output`: `bool` — [Read-Write] Request output to be 32-bit, usually for data exports. Note that scene color precision ...
  - `material`: `MaterialInterface` — [Read-Write] Material should be set to Post Process domain, and Blendable Location = After Tonemappi...
  - `name`: `str` — [Read-Write] An optional name which which will identify this material in the file name. For MRQ, the...

### `unreal.MovieGraphDeferredPanoramicNode`
Inherits: `MovieGraphImagePassBaseNode` | Header: `MovieGraphDeferredPanoramicPassNode.h`

Movie Graph Deferred Panoramic Node

**Properties** (22):
  - `allocate_history_per_pane`: `bool` — [Read-Write] (bool)
  - `allow_ocio`: `bool` — [Read-Write] Allow the output file OpenColorIO transform to be used on this render. (bool)
  - `anti_aliasing_method`: `AntiAliasingMethod` — [Read-Write] Which anti-aliasing method should this render use. If this is set to None, then Movie R...
  - `disable_tone_curve`: `bool` — [Read-Write] If true, the tone curve will be disabled for this render pass. This will result in valu...
  - `follow_camera_orientation`: `bool` — [Read-Write] Should the Pitch, Yaw and Roll of the camera be respected? If false, only the location ...
  - `num_horizontal_steps`: `int` — [Read-Write] (int32)
  - `num_vertical_steps`: `int` — [Read-Write] (int32)
  - `override_anti_aliasing_method`: `bool` — [Read-Write] (bool)
  - `override_b_allocate_history_per_pane`: `bool` — [Read-Write] (bool)
  - `override_b_allow_ocio`: `bool` — [Read-Write] (bool)
  - `override_b_disable_tone_curve`: `bool` — [Read-Write] (bool)
  - `override_b_follow_camera_orientation`: `bool` — [Read-Write] (bool)
  - `override_b_page_to_system_memory`: `bool` — [Read-Write] (bool)
  - `override_b_write_all_samples`: `bool` — [Read-Write] (bool)
  - `override_num_horizontal_steps`: `bool` — [Read-Write] (bool)
  - `override_num_vertical_steps`: `bool` — [Read-Write] (bool)
  - `override_spatial_sample_count`: `bool` — [Read-Write] (bool)
  - `override_view_mode_index`: `bool` — [Read-Write] (bool)
  - `page_to_system_memory`: `bool` — [Read-Write] (bool)
  - `spatial_sample_count`: `int` — [Read-Write] How many sub-pixel jitter renders should we do per temporal sample? This can be used to...
  - `view_mode_index`: `ViewModeIndex` — [Read-Write] The view mode index that will be applied to renders. These mirror the View Modes you fi...
  - `write_all_samples`: `bool` — [Read-Write] Debug Feature. Can use this to write out each individual Temporal and Spatial sample re...

### `unreal.MovieGraphDeferredRenderPassNode`
Inherits: `MovieGraphImagePassBaseNode` | Header: `MovieGraphDeferredPassNode.h`

A render node which uses the Deferred Renderer.

**Properties** (24):
  - `additional_post_process_materials`: `None` — [Read-Write] An array of additional post-processing materials to run after the frame is rendered. Us...
  - `allocate_history_per_tile`: `bool` — [Read-Write] If enabled, a FSceneViewStateInterface is allocated for each tile in the high resolutio...
  - `allow_ocio`: `bool` — [Read-Write] Allow the output file OpenColorIO transform to be used on this render. (bool)
  - `anti_aliasing_method`: `AntiAliasingMethod` — [Read-Write] Which anti-aliasing method should this render use. If this is set to None, then Movie R...
  - `disable_tone_curve`: `bool` — [Read-Write] If true, the tone curve will be disabled for this render pass. This will result in valu...
  - `enable_high_resolution_tiling`: `bool` — [Read-Write] If true, the render will be done using a âtiledâ render, which can overcome size li...
  - `overlap_percentage`: `float` — [Read-Write] Rendering effects such as Depth of Field may produce different results near the edge of...
  - `override_additional_post_process_materials`: `bool` — [Read-Write] (bool)
  - `override_anti_aliasing_method`: `bool` — [Read-Write] (bool)
  - `override_b_allocate_history_per_tile`: `bool` — [Read-Write] (bool)
  - `override_b_allow_ocio`: `bool` — [Read-Write] (bool)
  - `override_b_disable_tone_curve`: `bool` — [Read-Write] (bool)
  - `override_b_enable_high_resolution_tiling`: `bool` — [Read-Write] (bool)
  - `override_b_page_to_system_memory`: `bool` — [Read-Write] (bool)
  - `override_b_write_all_samples`: `bool` — [Read-Write] (bool)
  - `override_overlap_percentage`: `bool` — [Read-Write] (bool)
  - `override_spatial_sample_count`: `bool` — [Read-Write] (bool)
  - `override_tile_count`: `bool` — [Read-Write] (bool)
  - `override_view_mode_index`: `bool` — [Read-Write] (bool)
  - `page_to_system_memory`: `bool` — When enabled, after each tile is rendered, MRQ will download the per-tile image history back to syst...
  - `spatial_sample_count`: `int` — [Read-Write] How many sub-pixel jitter renders should we do per temporal sample? This can be used to...
  - `tile_count`: `int` — [Read-Write] If bEnableHighResolutionTiling is enabled, what is the tile count that the screen shoul...
  - `view_mode_index`: `ViewModeIndex` — [Read-Write] The view mode index that will be applied to renders. These mirror the View Modes you fi...
  - `write_all_samples`: `bool` — [Read-Write] Debug Feature. Can use this to write out each individual Temporal and Spatial sample re...

### `unreal.MovieGraphImagePassBaseNode`
Inherits: `MovieGraphRenderPassNode` | Header: `MovieGraphImagePassBaseNode.h`

The UMovieGraphImagePassBaseNode is an abstract base-class for render nodes that wish to create renders of the 3d scene. You are not required to inherit from this node (can inherit from UMovieGraphRen...

**Properties** (2):
  - `override_show_flags`: `bool` — Sinceindividualshow flags are overridden instead of the entire ShowFlags property, manually set to
o...
  - `show_flags`: `MovieGraphShowFlags` [Read-Only] — [Read-Only] The show flags that should be active during a render for this node. (MovieGraphShowFlags...

### `unreal.MovieGraphImageSequenceOutputNode`
Inherits: `MovieGraphFileOutputNode` | Header: `MovieGraphImageSequenceOutputNode.h`

The UMovieGraphImageSequenceOutputNode node is the base class for all image sequence outputs, such as a series of jpeg, png, bmp, or .exr images. Create an instance of the appropriate class (such as U...

**Properties** (4):
  - `ocio_configuration`: `OpenColorIODisplayConfiguration` — [Read-Write] OCIO configuration/transform settings. Note: There are differences from the previous im...
  - `ocio_context`: `None` — [Read-Write] OCIO context of key-value string pairs, typically used to apply shot-specific looks (su...
  - `override_ocio_configuration`: `bool` — [Read-Write] ~UMovieGraphFileOutputNode Interface (bool)
  - `override_ocio_context`: `bool` — [Read-Write] (bool)

### `unreal.MovieGraphImageSequenceOutputNode_BMP`
Inherits: `MovieGraphImageSequenceOutputNode` | Header: `MovieGraphImageSequenceOutputNode.h`

Save the images generated by the Movie Graph Pipeline as an lossless 8 bit bmp format. This can be useful in rare occasions (bmp files are uncompressed but larger). sRGB is applied. No metadata is sup...

### `unreal.MovieGraphImageSequenceOutputNode_EXR`
Inherits: `MovieGraphImageSequenceOutputNode` | Header: `MovieGraphImageSequenceOutputNode.h`

Image sequence output node that can write single-layer EXR files.

**Properties** (2):
  - `compression`: `EXRCompressionFormat` — [Read-Write] Which compression method should the resulting EXR file be compressed with. (EXRCompress...
  - `override_compression`: `bool` — [Read-Write] (bool)

### `unreal.MovieGraphImageSequenceOutputNode_JPG`
Inherits: `MovieGraphImageSequenceOutputNode` | Header: `MovieGraphImageSequenceOutputNode.h`

Save the images generated by the Movie Graph Pipeline as an 8 bit jpg format. JPEG image files are lossy, but a good balance between compression speed and final filesize. sRGB is applied. No metadata ...

### `unreal.MovieGraphImageSequenceOutputNode_MultiLayerEXR`
Inherits: `MovieGraphImageSequenceOutputNode_EXR` | Header: `MovieGraphImageSequenceOutputNode.h`

Image sequence output node that can write multi-layer EXR files.

**Properties** (2):
  - `multipart`: `bool` — [Read-Write] Indicates whether the exr file should be written as a multi-part exr file, which suppor...
  - `override_b_multi_part`: `bool` — [Read-Write] (bool)

### `unreal.MovieGraphImageSequenceOutputNode_PNG`
Inherits: `MovieGraphImageSequenceOutputNode` | Header: `MovieGraphImageSequenceOutputNode.h`

Save the images generated by the Movie Graph Pipeline as an 8 bit png format. PNG image files are lossless but slow to compress and have a larger final filesize than JPEG. sRGB is applied. No metadata...

### `unreal.MovieGraphPathTracerRenderPassNode`
Inherits: `MovieGraphImagePassBaseNode` | Header: `MovieGraphPathTracerPassNode.h`

A render node which uses the path tracer.

**Properties** (34):
  - `additional_post_process_materials`: `None` — [Read-Write] An array of additional post-processing materials to run after the frame is rendered. Us...
  - `allow_ocio`: `bool` — [Read-Write] Allow the output file OpenColorIO transform to be used on this render. (bool)
  - `denoiser_type`: `MovieGraphPathTracerDenoiserType` — [Read-Write] Select which type of denoiser to use when the denoiser is enabled. Temporal denoisers w...
  - `disable_tone_curve`: `bool` — [Read-Write] If true, the tone curve will be disabled for this render pass. This will result in valu...
  - `enable_denoiser`: `bool` — [Read-Write] If true the resulting image will be denoised at the end of each set of Spatial Samples....
  - `enable_reference_motion_blur`: `bool` — [Read-Write] When enabled, the path tracer will blend all spatial and temporal samples prior to the ...
  - `frame_count`: `int` — [Read-Write] The number of frames to consider when using temporal-based denoisers. Generally higher ...
  - `lighting_components_include_diffuse`: `bool` — [Read-Write] Whether the render should include diffuse lighting contributions. (bool)
  - `lighting_components_include_emissive`: `bool` — [Read-Write] Whether the render should include directly visible emissive components. (bool)
  - `lighting_components_include_indirect_diffuse`: `bool` — [Read-Write] Whether the render should include indirect diffuse lighting contributions. (bool)
  - `lighting_components_include_indirect_specular`: `bool` — [Read-Write] Whether the render should include indirect specular lighting contributions. (bool)
  - `lighting_components_include_indirect_volume`: `bool` — [Read-Write] Whether the render should include indirect volume lighting contributions. (bool)
  - `lighting_components_include_specular`: `bool` — [Read-Write] Whether the render should include specular lighting contributions. (bool)
  - `lighting_components_include_volume`: `bool` — [Read-Write] Whether the render should include volume lighting contributions. (bool)
  - `override_additional_post_process_materials`: `bool` — [Read-Write] (bool)
  - `override_b_allow_ocio`: `bool` — [Read-Write] (bool)
  - `override_b_disable_tone_curve`: `bool` — [Read-Write] (bool)
  - `override_b_enable_denoiser`: `bool` — [Read-Write] (bool)
  - `override_b_enable_reference_motion_blur`: `bool` — [Read-Write] (bool)
  - `override_b_lighting_components_include_diffuse`: `bool` — [Read-Write] (bool)
  - `override_b_lighting_components_include_emissive`: `bool` — [Read-Write] (bool)
  - `override_b_lighting_components_include_indirect_diffuse`: `bool` — [Read-Write] (bool)
  - `override_b_lighting_components_include_indirect_specular`: `bool` — [Read-Write] (bool)
  - `override_b_lighting_components_include_indirect_volume`: `bool` — [Read-Write] (bool)
  - `override_b_lighting_components_include_specular`: `bool` — [Read-Write] (bool)
  - `override_b_lighting_components_include_volume`: `bool` — [Read-Write] (bool)
  - `override_b_write_all_samples`: `bool` — [Read-Write] (bool)
  - `override_denoiser_type`: `bool` — [Read-Write] (bool)
  - `override_frame_count`: `bool` — [Read-Write] (bool)
  - `override_seed_offset`: `bool` — [Read-Write] (bool)
  - `override_spatial_sample_count`: `bool` — [Read-Write] (bool)
  - `seed_offset`: `int` — [Read-Write] Offset to apply to random number generator seed.
Intentionally not exposed to the UI as...
  - `spatial_sample_count`: `int` — [Read-Write] How many sub-pixel jitter renders should we do per temporal sample? This can be used to...
  - `write_all_samples`: `bool` — [Read-Write] Debug Feature. This can be used to write out each individual spatial sample rendered by...

### `unreal.MoviePipelineDeferredPass_DetailLighting`
Inherits: `MoviePipelineDeferredPassBase` | Header: `MoviePipelineDeferredPasses.h`

Movie Pipeline Deferred Pass Detail Lighting

### `unreal.MoviePipelineDeferredPass_LightingOnly`
Inherits: `MoviePipelineDeferredPassBase` | Header: `MoviePipelineDeferredPasses.h`

Movie Pipeline Deferred Pass Lighting Only

### `unreal.MoviePipelineDeferredPass_PathTracer`
Inherits: `MoviePipelineDeferredPassBase` | Header: `MoviePipelineDeferredPasses.h`

Movie Pipeline Deferred Pass Path Tracer

**Properties** (1):
  - `reference_motion_blur`: `bool` — [Read-Write] When enabled, the path tracer will blend all spatial and temporal samples prior to the ...

### `unreal.MoviePipelineDeferredPass_ReflectionsOnly`
Inherits: `MoviePipelineDeferredPassBase` | Header: `MoviePipelineDeferredPasses.h`

Movie Pipeline Deferred Pass Reflections Only

### `unreal.MoviePipelineDeferredPass_Unlit`
Inherits: `MoviePipelineDeferredPassBase` | Header: `MoviePipelineDeferredPasses.h`

Movie Pipeline Deferred Pass Unlit

### `unreal.MoviePipelineDeferredPassBase`
Inherits: `MoviePipelineImagePassBase` | Header: `MoviePipelineDeferredPasses.h`

Movie Pipeline Deferred Pass Base

**Properties** (8):
  - `accumulator_includes_alpha`: `bool` — [Read-Write] Should multiple temporal/spatial samples accumulate the alpha channel? This adds ~30% c...
  - `actor_layers`: `None` — [Read-Write] For each layer in the array, the world will be rendered and then a stencil mask will cl...
  - `add_default_layer`: `bool` — [Read-Write] If true, an additional stencil layer will be rendered which contains all objects which ...
  - `additional_post_process_materials`: `None` — [Read-Write] An array of additional post-processing materials to run after the frame is rendered. Us...
  - `data_layers`: `None` — [Read-Write] If the map you are working with is a World Partition map, you can specify Data layers i...
  - `disable_multisample_effects`: `bool` — [Read-Write] Certain passes donât support post-processing effects that blend pixels together. Thes...
  - `render_main_pass`: `bool` — [Read-Write] This can be turned off if youâre only doing a stencil-layer based render and donât ...
  - `stencil_layers`: `None` — âstencil_layersâ was renamed to âactor_layersâ. deprecated

### `unreal.MoviePipelineImagePassBase`
Inherits: `MoviePipelineRenderPass` | Header: `MoviePipelineImagePassBase.h`

Movie Pipeline Image Pass Base

### `unreal.MoviePipelineImageSequenceOutput_BMP`
Inherits: `MoviePipelineImageSequenceOutputBase` | Header: `MoviePipelineImageSequenceOutput.h`

Movie Pipeline Image Sequence Output BMP

### `unreal.MoviePipelineImageSequenceOutput_EXR`
Inherits: `MoviePipelineImageSequenceOutputBase` | Header: `MoviePipelineEXROutput.h`

Movie Pipeline Image Sequence Output EXR

**Properties** (3):
  - `compression`: `EXRCompressionFormat` — [Read-Write] Which compression method should the resulting EXR file be compressed with (EXRCompressi...
  - `multilayer`: `bool` — [Read-Write] Should we write all render passes to the same exr file? Not all software supports multi...
  - `multipart`: `bool` — [Read-Write] Indicates whether the exr file should be written as a multi-part exr file, which suppor...

### `unreal.MoviePipelineImageSequenceOutput_JPG`
Inherits: `MoviePipelineImageSequenceOutputBase` | Header: `MoviePipelineImageSequenceOutput.h`

Movie Pipeline Image Sequence Output JPG

### `unreal.MoviePipelineImageSequenceOutput_PNG`
Inherits: `MoviePipelineImageSequenceOutputBase` | Header: `MoviePipelineImageSequenceOutput.h`

Movie Pipeline Image Sequence Output PNG

**Properties** (1):
  - `write_alpha`: `bool` — [Read-Write] (bool)

### `unreal.MoviePipelineImageSequenceOutputBase`
Inherits: `MoviePipelineOutputBase` | Header: `MoviePipelineImageSequenceOutput.h`

Movie Pipeline Image Sequence Output Base

### `unreal.MoviePipelineWaveOutput`
Inherits: `MoviePipelineOutputBase` | Header: `MoviePipelineWaveOutput.h`

Movie Pipeline Wave Output

**Properties** (1):
  - `file_name_format_override`: `str` — [Read-Write] File name format string override. If specified it will override the FileNameFormat from...

### `unreal.EXRCompressionFormat`
Inherits: `EnumBase` | Header: `MoviePipelineEXROutput.h`

Exr compression format options. Exactly matches the exr library Imf::Compression enum.

**Properties** (10):
  - `B44`: `EXRCompressionFormat = Ellipsis` — This compression method only applies to images stored in HALF color depth. Blocks of 4Ã4 pixels are...
  - `B44A`: `EXRCompressionFormat = Ellipsis` — A modified version of B44. If all pixels in a 4*4 block have the same color it will use only 3 inste...
  - `DWAA`: `EXRCompressionFormat = Ellipsis` — Lossy DCT-based compression for RGB channels. Alpha and other channels are uncompressed. More effici...
  - `DWAB`: `EXRCompressionFormat = Ellipsis` — Similar to DWAA but goes in blocks of 256 scanlines instead of 32. More efficient disk space and fas...
  - `NONE`: `EXRCompressionFormat = Ellipsis` — No compression is applied. 0
  - `PIZ`: `EXRCompressionFormat = Ellipsis` — Good compression quality for grainy images. Lossless. 4
  - `PXR24`: `EXRCompressionFormat = Ellipsis` — This format only stores 24 bits of the 32 bit data and has subsequently a significant loss of precis...
  - `RLE`: `EXRCompressionFormat = Ellipsis` — This compression method is fast, and works well for images with large flat areas but yields worse re...
  - `ZIP`: `EXRCompressionFormat = Ellipsis` — Good compression quality for images with low amounts of noise. This compression method operates in i...
  - `ZIPS`: `EXRCompressionFormat = Ellipsis` — This compression method is similar to ZIP but compresses only one image row at a time. Lossless. 2

### `unreal.MovieGraphPathTracerDenoiserType`
Inherits: `EnumBase` | Header: `MovieGraphPathTracerPassNode.h`

EMovie Graph Path Tracer Denoiser Type

**Properties** (2):
  - `SPATIAL`: `MovieGraphPathTracerDenoiserType = Ellipsis` — The active spatial denoiser plugin will be used for denoising. If the denoiser is not loaded, a warn...
  - `TEMPORAL`: `MovieGraphPathTracerDenoiserType = Ellipsis` — The active spatial-temporal denoiser plugin will be used for denoising. It provides more temporal st...
