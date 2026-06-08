# UE Python API — DisplayClusterConfiguration Module

**103 types** from the `DisplayClusterConfiguration` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DisplayClusterConfigurationClusterItemReferenceList`, `DisplayClusterConfigurationClusterSync`, `DisplayClusterConfigurationDiagnostics`, `DisplayClusterConfigurationExternalImage`, `DisplayClusterConfigurationFailoverSettings`, `DisplayClusterConfigurationFramePostProcess_OutputRemap`, `DisplayClusterConfigurationGlobalMediaSettings`, `DisplayClusterConfigurationICVFX_CameraAdvancedRenderSettings`, `DisplayClusterConfigurationICVFX_CameraBorder`, `DisplayClusterConfigurationICVFX_CameraCustomFrustum`, `DisplayClusterConfigurationICVFX_CameraDepthOfField`, `DisplayClusterConfigurationICVFX_CameraMotionBlur`, `DisplayClusterConfigurationICVFX_CameraMotionBlurOverridePPS`, `DisplayClusterConfigurationICVFX_CameraOCIO`, `DisplayClusterConfigurationICVFX_CameraRenderSettings`, `DisplayClusterConfigurationICVFX_CameraSettings`, `DisplayClusterConfigurationICVFX_CameraSoftEdge`, `DisplayClusterConfigurationICVFX_ChromakeyMarkers`, `DisplayClusterConfigurationICVFX_ChromakeyRenderSettings`, `DisplayClusterConfigurationICVFX_ChromakeySettings`, ... (103 total)

---

## Classes

### `unreal.DisplayClusterConfigurationClusterItemReferenceList`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Base.h`

Display Cluster Configuration Cluster Item Reference List

**Properties** (1):
  - `item_names`: `None` [Read-Only] — [Read-Only] (Array[str])

### `unreal.DisplayClusterConfigurationClusterSync`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Cluster Sync

**Properties** (2):
  - `input_sync_policy`: `DisplayClusterConfigurationInputSyncPolicy` [Read-Only] — [Read-Only] (DisplayClusterConfigurationInputSyncPolicy)
  - `render_sync_policy`: `DisplayClusterConfigurationRenderSyncPolicy` [Read-Only] — [Read-Only] (DisplayClusterConfigurationRenderSyncPolicy)

### `unreal.DisplayClusterConfigurationDiagnostics`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Diagnostics

### `unreal.DisplayClusterConfigurationExternalImage`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration External Image

### `unreal.DisplayClusterConfigurationFailoverSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Failover Settings

**Properties** (4):
  - `critical_nodes`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] Critical cluster nodes. None of these are allowed to fail. If even one fails, the clust...
  - `enabled`: `bool` — [Read-Write] Enable/disable failover subsystem (bool)
  - `failover_policy`: `DisplayClusterConfigurationFailoverPolicy` — [Read-Write]
deprecated: This property has been deprecated. (DisplayClusterConfigurationFailoverPoli...
  - `primary_backups`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] Prioritized nodes for primary node replacement. Used in the same order as listed. (Disp...

### `unreal.DisplayClusterConfigurationFramePostProcess_OutputRemap`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_OutputRemap.h`

Screen space remapping of the final backbuffer output. Applied at the whole window

**Properties** (5):
  - `data_source`: `DisplayClusterConfigurationFramePostProcess_OutputRemapSource` — [Read-Write] Selects either the Static Mesh or External File setting as the source for output remapp...
  - `enable`: `bool` — [Read-Write] Enables or disables output remapping (bool)
  - `external_file`: `str` — [Read-Write] The external .obj file to use for output remapping when the Data Source is set to File ...
  - `mesh_component_name`: `str` [Read-Only] — [Read-Only] The MeshComponent reference (ProceduralMeshComponent or StaticMeshComponent) to use for ...
  - `static_mesh`: `StaticMesh` [Read-Only] — [Read-Only] The Static Mesh reference to use for output remapping when the Data Source is set to Sta...

### `unreal.DisplayClusterConfigurationGlobalMediaSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Global media settings

**Properties** (1):
  - `latency`: `int` — [Read-Write] Media latency (int32)

### `unreal.DisplayClusterConfigurationICVFX_CameraAdvancedRenderSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Advanced Render Settings

**Properties** (4):
  - `gpu_index`: `int` — [Read-Write] Specifies the GPU index for the ICVFX camera viewport.
Value â-1â means do not use ...
  - `render_target_ratio`: `float` — Render to scale RTT, resolved with shader to viewport (Custom value) (float) [Read-Write] Performanc...
  - `stereo_gpu_index`: `int` — [Read-Write] Specifies the GPU index for the ICVFX camera viewport in stereo rendering for the secon...
  - `stereo_mode`: `DisplayClusterConfigurationViewport_StereoMode` — force monoscopic render, resolved to stereo viewport (DisplayClusterConfigurationViewport_StereoMode...

### `unreal.DisplayClusterConfigurationICVFX_CameraBorder`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Border

**Properties** (3):
  - `color`: `LinearColor` — [Read-Write] Adjust color of the border edges of the inner frustum. (LinearColor)
  - `enable`: `bool` — [Read-Write] Enable Inner Frustum Border. (bool)
  - `thickness`: `float` — [Read-Write] Adjust border width to the top and bottom edges of the inner frustum. (float)

### `unreal.DisplayClusterConfigurationICVFX_CameraCustomFrustum`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Custom Frustum

**Properties** (11):
  - `adapt_resolution`: `bool` — [Read-Write] Enable adaptive resolution. (bool)
  - `bottom`: `float` — [Read-Write] Pixel/Percent value to alter the frustum to the bottom (float)
  - `enable`: `bool` — [Read-Write] Enable Custom Frustum. (bool)
  - `estimated_overscan_resolution`: `IntPoint` [Read-Only] — [Read-Only] Expected ICVFX camera resolution when both âAdapt Resolutionâ and âEnable Inner Fr...
  - `field_of_view_multiplier`: `float` — [Read-Write] Multiply the field of view for the ICVFX camera by this value.  This can increase the o...
  - `inner_frustum_resolution`: `IntPoint` [Read-Only] — [Read-Only] Real ICVFX camera resolution for current settings. (IntPoint)
  - `left`: `float` — [Read-Write] Pixel/Percent value to alter the frustum to the left side (float)
  - `mode`: `DisplayClusterConfigurationViewportCustomFrustumMode` — [Read-Write] Enable/disable inner camera custom frustum and specify units as percent or pixel values...
  - `overscan_pixels_increase`: `float` [Read-Only] — [Read-Only] This value shows the ratio of âOverscan Estimated Resolutionâ pixels to âFrustum I...
  - `right`: `float` — [Read-Write] Pixel/Percent value to alter the frustum to the right side (float)
  - `top`: `float` — [Read-Write] Pixel/Percent value to alter the frustum to the top (float)

### `unreal.DisplayClusterConfigurationICVFX_CameraDepthOfField`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Depth Of Field

**Properties** (6):
  - `automatically_set_distance_to_wall`: `bool` — [Read-Write] Allows the ICVFX camera to automatically compute its distance from the stage walls usin...
  - `compensation_lut`: `Texture2D` — [Read-Write] Look-up texture that encodes the specific amount of compensation used for each combinat...
  - `depth_of_field_gain`: `float` — [Read-Write] A gain factor that scales the amount of depth of field blur rendered on the wall (float...
  - `distance_to_wall`: `float` — [Read-Write] The distance from the ICVFX camera to the wall it is pointing at (float)
  - `distance_to_wall_offset`: `float` — [Read-Write] An offset applied to DistanceToWall (applied regardless of whether DistanceToWall is au...
  - `enable_depth_of_field_compensation`: `bool` — [Read-Write] Enables depth of field correction on the wall, which dynamically adjusts the size of th...

### `unreal.DisplayClusterConfigurationICVFX_CameraMotionBlur`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Motion Blur

**Properties** (3):
  - `motion_blur_mode`: `DisplayClusterConfigurationCameraMotionBlurMode` — [Read-Write] Specify the motion blur mode for the inner frustum, correcting for the motion of the ca...
  - `motion_blur_pps`: `DisplayClusterConfigurationICVFX_CameraMotionBlurOverridePPS` — [Read-Write] Motion Blur Settings Override (DisplayClusterConfigurationICVFX_CameraMotionBlurOverrid...
  - `translation_scale`: `float` — [Read-Write] Translation Scale (float)

### `unreal.DisplayClusterConfigurationICVFX_CameraMotionBlurOverridePPS`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Motion Blur Override PPS

**Properties** (4):
  - `motion_blur_amount`: `float` — off. (float) [Read-Write] Strength of motion blur, 0
  - `motion_blur_max`: `float` — off (float) [Read-Write] Max distortion caused by motion blur in percent of the screen width, 0
  - `motion_blur_per_object_size`: `float` — 4 % (float) [Read-Write] The minimum projected screen radius for a primitive to be drawn in the velo...
  - `replace_enable`: `bool` — [Read-Write] If enabled, override the overall motion blur settings that would otherwise come from th...

### `unreal.DisplayClusterConfigurationICVFX_CameraOCIO`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera OCIO

**Properties** (2):
  - `all_nodes_ocio_configuration`: `DisplayClusterConfigurationOCIOConfiguration` — [Read-Write] OCIO Display look configuration for all nodes (DisplayClusterConfigurationOCIOConfigura...
  - `per_node_ocio_profiles`: `None` — [Read-Write] Apply an OpenColorIO configuration on a per-node or group-of-nodes basis. (Array[Displa...

### `unreal.DisplayClusterConfigurationICVFX_CameraRenderSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Render Settings

**Properties** (7):
  - `advanced_render_settings`: `DisplayClusterConfigurationICVFX_CameraAdvancedRenderSettings` — [Read-Write] Advanced render settings (DisplayClusterConfigurationICVFX_CameraAdvancedRenderSettings...
  - `custom_frame_size`: `DisplayClusterConfigurationICVFX_CustomSize` — [Read-Write] Custom resolution of the ICVFX Camera. If it is not used, the Default Frame Resolution ...
  - `generate_mips`: `DisplayClusterConfigurationPostRender_GenerateMips` — [Read-Write] Mipmapping can help avoid visual artifacts when the inner frustum is rendered at a lowe...
  - `media`: `DisplayClusterConfigurationMediaICVFX` — [Read-Write] Media settings (DisplayClusterConfigurationMediaICVFX)
  - `render_order`: `int` — [Read-Write] Camera render order, bigger value is over (int32)
  - `replace`: `DisplayClusterConfigurationPostRender_Override` — [Read-Write] Replace viewport render from source texture (DisplayClusterConfigurationPostRender_Over...
  - `use_camera_component_postprocess`: `bool` — [Read-Write] Use postprocess settings from camera component (bool)

### `unreal.DisplayClusterConfigurationICVFX_CameraSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Settings

**Properties** (19):
  - `all_nodes_color_grading`: `DisplayClusterConfigurationViewport_AllNodesColorGrading` — [Read-Write] All Nodes Color Grading (DisplayClusterConfigurationViewport_AllNodesColorGrading)
  - `border`: `DisplayClusterConfigurationICVFX_CameraBorder` — [Read-Write] Border for the inner frustum. (DisplayClusterConfigurationICVFX_CameraBorder)
  - `buffer_ratio`: `float` — [Read-Write] Adjust resolution scaling for the inner frustum. (float)
  - `camera_depth_of_field`: `DisplayClusterConfigurationICVFX_CameraDepthOfField` — [Read-Write] Settings that control the depth of field blur applied to the ICVFX image (DisplayCluste...
  - `camera_hide_list`: `DisplayClusterConfigurationICVFX_VisibilityList` — [Read-Write] Content specified here will not appear in the inner frustum, but can appear in the nDis...
  - `camera_motion_blur`: `DisplayClusterConfigurationICVFX_CameraMotionBlur` — [Read-Write] Render motion blur more accurately by subtracting blur from camera motion and avoiding ...
  - `camera_ocio`: `DisplayClusterConfigurationICVFX_CameraOCIO` — [Read-Write] (DisplayClusterConfigurationICVFX_CameraOCIO)
  - `chromakey`: `DisplayClusterConfigurationICVFX_ChromakeySettings` — [Read-Write] (DisplayClusterConfigurationICVFX_ChromakeySettings)
  - `custom_frustum`: `DisplayClusterConfigurationICVFX_CameraCustomFrustum` — [Read-Write] Render a larger or smaller inner frame (DisplayClusterConfigurationICVFX_CameraCustomFr...
  - `enable`: `bool` — [Read-Write] Render the inner frustum for this ICVFX camera. (bool)
  - `enable_inner_frustum_color_grading`: `bool` — [Read-Write] Entire Cluster Color Grading (bool)
  - `external_camera_actor`: `CineCameraActor` — [Read-Write] Specify a Cine Camera Actor for this ICVFX camera to use instead of the default nDispla...
  - `frustum_offset`: `Vector` — [Read-Write] Specify an offset on the inner frustum. (Vector)
  - `frustum_rotation`: `Rotator` — [Read-Write] Rotate the inner frustum. (Rotator)
  - `hidden_icvfx_viewports`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] A list of viewports that the inner frustum is not rendered to. (DisplayClusterConfigura...
  - `off_center_projection_offset`: `Vector2D` — [Read-Write] Off-axis / off-center projection offset as proportion of screen dimensions. (Vector2D)
  - `per_node_color_grading`: `None` — [Read-Write] Perform advanced color grading operations for the inner frustum on a per-node or group-...
  - `render_settings`: `DisplayClusterConfigurationICVFX_CameraRenderSettings` — [Read-Write] Configure global render settings for this viewport (DisplayClusterConfigurationICVFX_Ca...
  - `soft_edge`: `DisplayClusterConfigurationICVFX_CameraSoftEdge` — [Read-Write] Soften the edges of the inner frustum to help avoid hard lines in reflections seen by t...

### `unreal.DisplayClusterConfigurationICVFX_CameraSoftEdge`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Camera Soft Edge

**Properties** (3):
  - `feather`: `float` — [Read-Write] Feather. (float)
  - `horizontal`: `float` — [Read-Write] Adjust blur amount to the left and right side edges of the inner frustum. (float)
  - `vertical`: `float` — [Read-Write] Adjust blur amount to the top and bottom edges of the inner frustum. (float)

### `unreal.DisplayClusterConfigurationICVFX_ChromakeyMarkers`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Chromakey Markers

**Properties** (6):
  - `enable`: `bool` — [Read-Write] True to display Chromakey Markers within the inner frustum. (bool)
  - `marker_color`: `LinearColor` — [Read-Write] Marker Color (LinearColor)
  - `marker_size_scale`: `float` — [Read-Write] Scale value for the size of each chromakey marker tile. (float)
  - `marker_tile_distance`: `float` — [Read-Write] Distance value between each chromakey marker tile. (float)
  - `marker_tile_offset`: `Vector2D` — [Read-Write] Offset value for the chromakey marker tiles, normalized to the tile distance.  Adjust p...
  - `marker_tile_rgba`: `Texture` — [Read-Write] Texture to use as the chromakey marker tile. (Texture)

### `unreal.DisplayClusterConfigurationICVFX_ChromakeyRenderSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Chromakey Render Settings

**Properties** (9):
  - `advanced_render_settings`: `DisplayClusterConfigurationICVFX_OverlayAdvancedRenderSettings` — [Read-Write] Advanced render settings (DisplayClusterConfigurationICVFX_OverlayAdvancedRenderSetting...
  - `chromakey_size_mult`: `float` — [Read-Write] Resolution multiplier for RTT chromakey. The default is the ICVFX camera frame resoluti...
  - `custom_size`: `DisplayClusterConfigurationICVFX_CustomSize` — [Read-Write]
deprecated: Use the âChromakey Resolution Multiplierâ instead (DisplayClusterConfig...
  - `enable`: `bool` — [Read-Write]
deprecated: Use the Chromakey Type enum in the chromakey settings instead (bool)
  - `generate_mips`: `DisplayClusterConfigurationPostRender_GenerateMips` — [Read-Write] (DisplayClusterConfigurationPostRender_GenerateMips)
  - `postprocess_blur`: `DisplayClusterConfigurationPostRender_BlurPostprocess` — [Read-Write] Apply blur to the Custom Chromakey content. (DisplayClusterConfigurationPostRender_Blur...
  - `replace`: `DisplayClusterConfigurationPostRender_Override` — [Read-Write] Replace viewport render from source texture (DisplayClusterConfigurationPostRender_Over...
  - `replace_camera_viewport`: `bool` — [Read-Write] Replace the texture of the camera viewport from this chromakey RTT (bool)
  - `show_only_list`: `DisplayClusterConfigurationICVFX_VisibilityList` — [Read-Write] Content specified here will be overridden to use the chromakey color specified and incl...

### `unreal.DisplayClusterConfigurationICVFX_ChromakeySettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Chromakey Settings

**Properties** (6):
  - `chromakey_color`: `LinearColor` — [Read-Write] Chromakey Color (LinearColor)
  - `chromakey_markers`: `DisplayClusterConfigurationICVFX_ChromakeyMarkers` — [Read-Write] Display Chromakey Markers to facilitate camera tracking in post production. (DisplayClu...
  - `chromakey_render_texture`: `DisplayClusterConfigurationICVFX_ChromakeyRenderSettings` — [Read-Write] Configure a custom chromakey based on content that will appear in the inner frustum, ra...
  - `chromakey_settings_source`: `DisplayClusterConfigurationICVFX_ChromakeySettingsSource` — [Read-Write] The source of the chromakey settings, either the settings on the ICVFX camera or the gl...
  - `chromakey_type`: `DisplayClusterConfigurationICVFX_ChromakeyType` — [Read-Write] The type of chromakey to use (DisplayClusterConfigurationICVFX_ChromakeyType)
  - `enable`: `bool` — [Read-Write] Set to True to fill the inner frustum with the specified Chromakey Color. (bool)

### `unreal.DisplayClusterConfigurationICVFX_CustomSize`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Custom resolution settings for ICVFX.

**Properties** (4):
  - `adapt_size`: `bool` — [Read-Write] Automatically adapts resolution to be proportional
to the filmback aspect ratio for the...
  - `custom_height`: `int` — [Read-Write] Custom Height, in pixels. (int32)
  - `custom_width`: `int` — [Read-Write] Custom Width, in pixels. (int32)
  - `use_custom_size`: `bool` — [Read-Write] Enabling this option will allow these custom settings to be used instead of the default...

### `unreal.DisplayClusterConfigurationICVFX_GlobalChromakeySettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Chromakey settings that are global for all ICVFX cameras in a root actor

**Properties** (2):
  - `chromakey_color`: `LinearColor` — [Read-Write] Chromakey Color (LinearColor)
  - `chromakey_markers`: `DisplayClusterConfigurationICVFX_ChromakeyMarkers` — [Read-Write] Display Chromakey Markers to facilitate camera tracking in post production. (DisplayClu...

### `unreal.DisplayClusterConfigurationICVFX_LightcardCustomOCIO`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Lightcard Custom OCIO

**Properties** (2):
  - `all_viewports_ocio_configuration`: `DisplayClusterConfigurationOCIOConfiguration` — [Read-Write] Apply this OpenColorIO configuration to all viewports. (DisplayClusterConfigurationOCIO...
  - `per_viewport_ocio_profiles`: `None` — [Read-Write] Apply an OpenColorIO configuration on a per-viewport or group-of-viewports basis. (Arra...

### `unreal.DisplayClusterConfigurationICVFX_LightcardOCIO`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Lightcard OCIO

**Properties** (2):
  - `custom_ocio`: `DisplayClusterConfigurationICVFX_LightcardCustomOCIO` — [Read-Write] Custom OpenColorIO configuration for Light Cards. (DisplayClusterConfigurationICVFX_Lig...
  - `lightcard_ocio_mode`: `DisplayClusterConfigurationViewportLightcardOCIOMode` — [Read-Write] Light Cards OCIO mode. (DisplayClusterConfigurationViewportLightcardOCIOMode)

### `unreal.DisplayClusterConfigurationICVFX_LightcardRenderSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Lightcard Render Settings

**Properties** (4):
  - `advanced_render_settings`: `DisplayClusterConfigurationICVFX_OverlayAdvancedRenderSettings` — [Read-Write] Advanced render settings (DisplayClusterConfigurationICVFX_OverlayAdvancedRenderSetting...
  - `generate_mips`: `DisplayClusterConfigurationPostRender_GenerateMips` — [Read-Write] (DisplayClusterConfigurationPostRender_GenerateMips)
  - `replace`: `DisplayClusterConfigurationPostRender_Override` — [Read-Write] Override viewport render from source texture (DisplayClusterConfigurationPostRender_Ove...
  - `replace_viewport`: `bool` — [Read-Write] override the texture of the target viewport from this lightcard RTT (bool)

### `unreal.DisplayClusterConfigurationICVFX_LightcardSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Lightcard Settings

**Properties** (6):
  - `blendingmode`: `DisplayClusterConfigurationICVFX_LightcardRenderMode` — [Read-Write] Specify how to render Light Cards in relation to the inner frustum. (DisplayClusterConf...
  - `enable`: `bool` — [Read-Write] Enable Light Cards (bool)
  - `ignore_outer_viewports_freezing_for_lightcards`: `bool` — [Read-Write] EnableDisable freeze rendering for lightcards when outer viewports rendering also freez...
  - `lightcard_ocio`: `DisplayClusterConfigurationICVFX_LightcardOCIO` — [Read-Write] OpenColorIO configuration for the lightcards. (DisplayClusterConfigurationICVFX_Lightca...
  - `render_settings`: `DisplayClusterConfigurationICVFX_LightcardRenderSettings` — [Read-Write] Configure global render settings for this viewport (DisplayClusterConfigurationICVFX_Li...
  - `show_only_list`: `DisplayClusterConfigurationICVFX_VisibilityList` — [Read-Write] Content specified here will be treated as a Light Card and adhere to the Blending Mode ...

### `unreal.DisplayClusterConfigurationICVFX_OverlayAdvancedRenderSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Overlay Advanced Render Settings

**Properties** (5):
  - `buffer_ratio`: `float` — [Read-Write] Allow ScreenPercentage (float)
  - `gpu_index`: `int` — [Read-Write] Specifies the GPU index for the ICVFX viewport (LC or CK).
A value of â-1â means us...
  - `render_target_ratio`: `float` — Render to scale RTT, resolved with shader to viewport (Custom value) (float) [Read-Write] Performanc...
  - `stereo_gpu_index`: `int` — [Read-Write] Specifies the GPU index for the ICVFX viewport (LC or CK) in stereo rendering for the s...
  - `stereo_mode`: `DisplayClusterConfigurationViewport_StereoMode` — force monoscopic render, resolved to stereo viewport (DisplayClusterConfigurationViewport_StereoMode...

### `unreal.DisplayClusterConfigurationICVFX_Size`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Default resolution settings for ICVFX.

**Properties** (3):
  - `adapt_size`: `bool` — [Read-Write] Automatically adapts the default frame resolution to be proportional
to the filmback as...
  - `height`: `int` — [Read-Write] The default height of In-Cameras, in pixels. (int32)
  - `width`: `int` — [Read-Write] The default width of In-Cameras, in pixels. (int32)

### `unreal.DisplayClusterConfigurationICVFX_StageSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Stage Settings

**Properties** (12):
  - `default_frame_size`: `DisplayClusterConfigurationICVFX_Size` — [Read-Write] Default In-Cameras texture resolution. (DisplayClusterConfigurationICVFX_Size)
  - `enable_color_grading`: `bool` — [Read-Write] Viewport Color Grading (bool)
  - `enable_inner_frustum_chromakey_overlap`: `bool` — [Read-Write] Render the chromakey where the inner frustum overlaps. (bool)
  - `enable_inner_frustums`: `bool` — [Read-Write] Enable/disable the inner frustum on all ICVFX cameras. (bool)
  - `entire_cluster_color_grading`: `DisplayClusterConfigurationViewport_EntireClusterColorGrading` — [Read-Write] Entire Cluster Color Grading (DisplayClusterConfigurationViewport_EntireClusterColorGra...
  - `freeze_render_outer_viewports`: `bool` — [Read-Write] Freeze rendering for viewports. This improves performance. (bool)
  - `global_chromakey`: `DisplayClusterConfigurationICVFX_GlobalChromakeySettings` — [Read-Write] Global chromakey settings that all ICVFX camera components can opt to use (DisplayClust...
  - `hide_list`: `DisplayClusterConfigurationICVFX_VisibilityList` — [Read-Write] Content specified here will not appear anywhere in the nDisplay cluster (DisplayCluster...
  - `lightcard`: `DisplayClusterConfigurationICVFX_LightcardSettings` — [Read-Write] (DisplayClusterConfigurationICVFX_LightcardSettings)
  - `outer_viewport_hide_list`: `DisplayClusterConfigurationICVFX_VisibilityList` — [Read-Write] Content specified here will not appear in the nDisplay viewports, but can appear in the...
  - `per_viewport_color_grading`: `None` — [Read-Write] Perform advanced color grading operations on a per-viewport or group-of-viewports basis...
  - `viewport_ocio`: `DisplayClusterConfigurationICVFX_ViewportOCIO` — [Read-Write] OpenColorIO configuration for the Outer viewports. (DisplayClusterConfigurationICVFX_Vi...

### `unreal.DisplayClusterConfigurationICVFX_ViewportOCIO`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Viewport OCIO

**Properties** (2):
  - `all_viewports_ocio_configuration`: `DisplayClusterConfigurationOCIOConfiguration` — [Read-Write] Apply this OpenColorIO configuration to all viewports. (DisplayClusterConfigurationOCIO...
  - `per_viewport_ocio_profiles`: `None` — [Read-Write] Apply an OpenColorIO configuration on a per-viewport or group-of-viewports basis. (Arra...

### `unreal.DisplayClusterConfigurationICVFX_VisibilityList`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ICVFX.h`

Display Cluster Configuration ICVFX Visibility List

**Properties** (3):
  - `actor_layers`: `None` — [Read-Write] Actor layers.
Warning: This option has a very expensive performance cost, especially on...
  - `actors`: `None` — [Read-Write] {ActorsTooltip} (Array[Actor])
  - `root_actor_component_names`: `None` — [Read-Write] Reference to RootActor components by names (Array[str])

### `unreal.DisplayClusterConfigurationInfo`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Info

**Properties** (3):
  - `asset_path`: `str` [Read-Only] — [Read-Only] (str)
  - `description`: `str` — [Read-Write] (str)
  - `version`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.DisplayClusterConfigurationInputSyncPolicy`
Inherits: `DisplayClusterConfigurationPolymorphicEntity` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Input Sync Policy

### `unreal.DisplayClusterConfigurationMediaICVFX`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media settings for ICVFX cameras

**Properties** (11):
  - `cluster_nodes_to_render_unbound_tiles`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] Choose nodes that should render camera tiles that donât have any media assigned (Disp...
  - `enable`: `bool` — [Read-Write] Enable/disable media (bool)
  - `late_ocio_pass`: `bool` — [Read-Write] Allows the receviers to apply their own OCIO transformations (per node OCIO override). ...
  - `media_input_groups`: `None` — [Read-Write] Media input mapping (Full frame) (Array[DisplayClusterConfigurationMediaInputGroup])
  - `media_output_groups`: `None` — [Read-Write] Media output mapping (Full frame) (Array[DisplayClusterConfigurationMediaOutputGroup])
  - `split_type`: `DisplayClusterConfigurationMediaSplitType` — [Read-Write] Media frame split type (DisplayClusterConfigurationMediaSplitType)
  - `tile_overscan`: `DisplayClusterConfigurationTile_Overscan` — [Read-Write] Overscan settings for tile. (DisplayClusterConfigurationTile_Overscan)
  - `tiled_media_input_groups`: `None` — [Read-Write] Media input mapping (Tiled) (Array[DisplayClusterConfigurationMediaTiledInputGroup])
  - `tiled_media_output_groups`: `None` — [Read-Write] Media output mapping (Tiled) (Array[DisplayClusterConfigurationMediaTiledOutputGroup])
  - `tiled_split_layout`: `IntPoint` — [Read-Write] Split layout (IntPoint)
  - `transfer_pq`: `bool` — [Read-Write] Use perceptual quantizer (PQ) transfer function to reduce bandwith. Requires PF_A2B10G1...

### `unreal.DisplayClusterConfigurationMediaInput`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media input item

**Properties** (1):
  - `media_source`: `MediaSource` — [Read-Write] Media source to use (MediaSource)

### `unreal.DisplayClusterConfigurationMediaInputGroup`
Inherits: `DisplayClusterConfigurationMediaInput` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media input group (ICVFX, Full frame)

**Properties** (1):
  - `cluster_nodes`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] Cluster nodes that use media source below (DisplayClusterConfigurationClusterItemRefere...

### `unreal.DisplayClusterConfigurationMediaNodeBackbuffer`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media settings for node backbuffer

**Properties** (4):
  - `enable`: `bool` — [Read-Write] Enable/Disable Media (bool)
  - `media_outputs`: `None` — [Read-Write] Full-Frame Media Outputs (Array[DisplayClusterConfigurationMediaOutput])
  - `tiled_media_outputs`: `None` — [Read-Write] Tile mapping. Maps tiles to media outputs. (Array[DisplayClusterConfigurationMediaUnifo...
  - `tiled_split_layout`: `IntPoint` — [Read-Write] Split layout (IntPoint)

### `unreal.DisplayClusterConfigurationMediaOutput`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media output item

**Properties** (2):
  - `media_output`: `MediaOutput` — [Read-Write] Media output to use (MediaOutput)
  - `output_sync_policy`: `DisplayClusterMediaOutputSynchronizationPolicy` — [Read-Write] Media output synchronization policy (DisplayClusterMediaOutputSynchronizationPolicy)

### `unreal.DisplayClusterConfigurationMediaOutputGroup`
Inherits: `DisplayClusterConfigurationMediaOutput` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media output group (ICVFX, Full Frame)

**Properties** (1):
  - `cluster_nodes`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] Cluster nodes that export media via MediaOutput below (DisplayClusterConfigurationClust...

### `unreal.DisplayClusterConfigurationMediaTiledInputGroup`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media input group (ICVFX, Tiled)

**Properties** (2):
  - `cluster_nodes`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] Cluster nodes that use media source below (DisplayClusterConfigurationClusterItemRefere...
  - `tiles`: `None` — [Read-Write] Tile mapping. Maps tiles to media sources. (Array[DisplayClusterConfigurationMediaUnifo...

### `unreal.DisplayClusterConfigurationMediaTiledOutputGroup`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media output group (ICVFX, Tiled)

**Properties** (3):
  - `cluster_nodes`: `DisplayClusterConfigurationClusterItemReferenceList` — [Read-Write] Cluster nodes that export media via MediaOutput below (DisplayClusterConfigurationClust...
  - `output_sync_policy`: `DisplayClusterMediaOutputSynchronizationPolicy` — [Read-Write]
deprecated: This property has been deprecated. Synchronization policy is bound to the a...
  - `tiles`: `None` — [Read-Write] Tile mapping. Maps tiles to media outputs. (Array[DisplayClusterConfigurationMediaUnifo...

### `unreal.DisplayClusterConfigurationMediaUniformTileInput`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Uniform tile media input item. Maps a tile to a media source.

**Properties** (2):
  - `media_source`: `MediaSource` — [Read-Write] Media source to use (MediaSource)
  - `position`: `IntPoint` [Read-Only] — [Read-Only] Tile position (IntPoint)

### `unreal.DisplayClusterConfigurationMediaUniformTileOutput`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Uniform tile media output item. Maps a tile to a media output.

**Properties** (3):
  - `media_output`: `MediaOutput` — [Read-Write] Media output to use (MediaOutput)
  - `output_sync_policy`: `DisplayClusterMediaOutputSynchronizationPolicy` — [Read-Write] Media output synchronization policy (DisplayClusterMediaOutputSynchronizationPolicy)
  - `position`: `IntPoint` [Read-Only] — [Read-Only] Tile position (IntPoint)

### `unreal.DisplayClusterConfigurationMediaViewport`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media settings for viewports

**Properties** (7):
  - `enable`: `bool` — [Read-Write] Enable/disable media (bool)
  - `media_input`: `DisplayClusterConfigurationMediaInput` — [Read-Write] Media source to use (DisplayClusterConfigurationMediaInput)
  - `media_output`: `MediaOutput` — [Read-Write]
deprecated: This property has been deprecated. Please refer new MediaOutputs property. ...
  - `media_outputs`: `None` — [Read-Write] Media outputs to use (Array[DisplayClusterConfigurationMediaOutput])
  - `media_sharing_node`: `str` — [Read-Write]
deprecated: This property has been deprecated (str)
  - `media_source`: `MediaSource` — [Read-Write]
deprecated: This property has been deprecated. Please refer new MediaInput property. (M...
  - `output_sync_policy`: `DisplayClusterMediaOutputSynchronizationPolicy` — [Read-Write]
deprecated: This property has been deprecated. (DisplayClusterMediaOutputSynchronizatio...

### `unreal.DisplayClusterConfigurationNetworkSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Network Settings

**Properties** (6):
  - `connect_retries_amount`: `int` — amount of times nDisplay tries to reconnect before dropping (int32) [Read-Write] Advanced
  - `connect_retry_delay`: `int` — delay in between connection retries (int32) [Read-Write] Advanced
  - `frame_end_barrier_timeout`: `int` — timeout value for End Frame Barrier (int32) [Read-Write] Advanced
  - `frame_start_barrier_timeout`: `int` — timeout value for Start Frame Barrier (int32) [Read-Write] Advanced
  - `game_start_barrier_timeout`: `int` — timeout for Game Thread Barrier (int32) [Read-Write] Advanced
  - `render_sync_barrier_timeout`: `int` — timeout value for Render Sync (int32) [Read-Write] Advanced

### `unreal.DisplayClusterConfigurationOCIOConfiguration`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_OCIO.h`

OCIO configuration structure.

**Properties** (3):
  - `color_configuration`: `OpenColorIOColorConversionSettings` — [Read-Write] Conversion to apply when this display is enabled (OpenColorIOColorConversionSettings)
  - `is_enabled`: `bool` — [Read-Write] Enable the application of an OpenColorIO configuration to all viewports. (bool)
  - `ocio_configuration`: `OpenColorIODisplayConfiguration` — [Read-Write] âThis property has been deprecated.
deprecated: Use the ColorConfiguration property i...

### `unreal.DisplayClusterConfigurationOCIOProfile`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_OCIO.h`

OCIO profile structure. Can be configured for viewports or cluster nodes. To enable viewport configuration when using as a UPROPERTY set meta = (ConfigurationMode = âViewportsâ) To enable cluster ...

**Properties** (4):
  - `apply_ocio_to_objects`: `None` [Read-Only] — [Read-Only] Specify the viewports to apply this OpenColorIO configuration. (Array[str])
  - `color_configuration`: `OpenColorIOColorConversionSettings` — [Read-Write] Conversion to apply when this display is enabled (OpenColorIOColorConversionSettings)
  - `is_enabled`: `bool` — [Read-Write] Enable the application of an OpenColorIO configuration for the viewport(s) specified. (...
  - `ocio_configuration`: `OpenColorIODisplayConfiguration` — [Read-Write] âThis property has been deprecated.
deprecated: Use the ColorConfiguration property i...

### `unreal.DisplayClusterConfigurationPolymorphicEntity`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Base.h`

Display Cluster Configuration Polymorphic Entity

**Properties** (2):
  - `parameters`: `None` [Read-Only] — [Read-Only] Generic parameters map (Map[str,str])
  - `type`: `str` [Read-Only] — [Read-Only] Polymorphic entity type (str)

### `unreal.DisplayClusterConfigurationPostprocess`
Inherits: `DisplayClusterConfigurationPolymorphicEntity` | Header: `DisplayClusterConfigurationTypes_Base.h`

Display Cluster Configuration Postprocess

**Properties** (1):
  - `order`: `int` [Read-Only] — [Read-Only] Control postprocess rendering order. Bigger value rendered last (int32)

### `unreal.DisplayClusterConfigurationPostRender_BlurPostprocess`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_PostRender.h`

Display Cluster Configuration Post Render Blur Postprocess

**Properties** (3):
  - `kernel_radius`: `int` — [Read-Write] Kernel Radius (int32)
  - `kernel_scale`: `float` — [Read-Write] Kernel Scale (float)
  - `mode`: `DisplayClusterConfiguration_PostRenderBlur` — [Read-Write] Enable/disable Post Process Blur and specify method. (DisplayClusterConfiguration_PostR...

### `unreal.DisplayClusterConfigurationPostRender_GenerateMips`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_PostRender.h`

Display Cluster Configuration Post Render Generate Mips

**Properties** (6):
  - `auto_generate_mips`: `bool` — [Read-Write] Generate and use mipmaps for the inner frustum.  Disabling this can improve performance...
  - `enabled_max_num_mips`: `bool` — Allows a limited number of MIPs for high resolution. (bool) [Read-Write] Performance
  - `max_num_mips`: `int` — Use this value as the maximum number of MIPs for high resolution. (int32) [Read-Write] Performance
  - `mips_address_u`: `TextureAddress` — [Read-Write] AutoGenerateMips sampler address mode for U channel. Defaults to clamp. (TextureAddress...
  - `mips_address_v`: `TextureAddress` — [Read-Write] AutoGenerateMips sampler address mode for V channel. Defaults to clamp. (TextureAddress...
  - `mips_sampler_filter`: `TextureFilter` — [Read-Write] Mips Sampler Filter (TextureFilter)

### `unreal.DisplayClusterConfigurationPostRender_Override`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_PostRender.h`

Display Cluster Configuration Post Render Override

**Properties** (4):
  - `allow_replace`: `bool` — [Read-Write] Disable default render, and resolve SourceTexture to viewport (bool)
  - `should_use_texture_region`: `bool` — [Read-Write] Set to True to crop the texture for the inner frustum as specified below. (bool)
  - `source_texture`: `Texture` — [Read-Write] Texture to use in place of the inner frustum. (Texture)
  - `texture_region`: `DisplayClusterReplaceTextureCropRectangle` — [Read-Write] Texture Crop (DisplayClusterReplaceTextureCropRectangle)

### `unreal.DisplayClusterConfigurationPrimaryNode`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Primary Node

**Properties** (2):
  - `id`: `str` [Read-Only] — [Read-Only] (str)
  - `ports`: `DisplayClusterConfigurationPrimaryNodePorts` [Read-Only] — [Read-Only] (DisplayClusterConfigurationPrimaryNodePorts)

### `unreal.DisplayClusterConfigurationPrimaryNodePorts`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes.h`

### `unreal.DisplayClusterConfigurationProjection`
Inherits: `DisplayClusterConfigurationPolymorphicEntity` | Header: `DisplayClusterConfigurationTypes_Base.h`

Display Cluster Configuration Projection

### `unreal.DisplayClusterConfigurationRectangle`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Base.h`

All configuration UObjects should inherit from this class.

**Properties** (4):
  - `h`: `int` — [Read-Write] (int32)
  - `w`: `int` — [Read-Write] (int32)
  - `x`: `int` — [Read-Write] (int32)
  - `y`: `int` — [Read-Write] (int32)

### `unreal.DisplayClusterConfigurationRenderFrame`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Viewport.h`

This struct now stored in UDisplayClusterConfigurationData, and replicated with MultiUser

**Properties** (7):
  - `allow_warp_blend`: `bool` — [Read-Write] Allow warpblend render (bool)
  - `cluster_buffer_ratio_mult`: `float` — [Read-Write] Multiplies all screen percentages within nDisplay by this value. (float)
  - `cluster_icvfx_inner_frustum_buffer_ratio_mult`: `float` — [Read-Write] Multiplies the screen percentage for all ICVFX Inner Frustum viewports by this value. (...
  - `cluster_icvfx_inner_viewport_render_target_ratio_mult`: `float` — [Read-Write] Multiplies the RTT size of the ICVFX Inner Frustum viewports by this value. (float)
  - `cluster_icvfx_outer_viewport_buffer_ratio_mult`: `float` — [Read-Write] Multiplies the screen percentage for viewports by this value.
(Excluding ICVFX internal...
  - `cluster_icvfx_outer_viewport_render_target_ratio_mult`: `float` — [Read-Write] Multiplies the RTT size of the viewports by this value.
(Excluding ICVFX internal viewp...
  - `cluster_render_target_ratio_mult`: `float` — [Read-Write] Multiplies the RTT size of all viewports within nDisplay by this value. (float)

### `unreal.DisplayClusterConfigurationRenderSyncPolicy`
Inherits: `DisplayClusterConfigurationPolymorphicEntity` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Render Sync Policy

### `unreal.DisplayClusterConfigurationTile_Overscan`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Tile.h`

Display Cluster Configuration Tile Overscan

**Properties** (5):
  - `all_sides`: `float` — [Read-Write] Overscan value for all sides. (float)
  - `enabled`: `bool` — [Read-Write] Enable/disable Viewport Overscan and specify units as percent or pixel values. (bool)
  - `mode`: `DisplayClusterConfigurationViewportOverscanMode` — [Read-Write] Enable/disable Viewport Overscan and specify units as percent or pixel values. (Display...
  - `optimize_tile_overscan`: `bool` — [Read-Write] Optimize overscan values on boundary tiles.
When enabled, tile sides not in contact wit...
  - `oversize`: `bool` — [Read-Write] Set to True to render at the overscan resolution, set to false to render at the resolut...

### `unreal.DisplayClusterConfigurationTile_Settings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Tile.h`

Tile rendering

**Properties** (2):
  - `enabled`: `bool` — [Read-Write] Enable tile rendering. (bool)
  - `layout`: `IntPoint` — [Read-Write] Tiling layout (X by Y tiles amount). (IntPoint)

### `unreal.DisplayClusterConfigurationViewport_AllNodesColorGrading`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport All Nodes Color Grading

**Properties** (3):
  - `color_grading_settings`: `DisplayClusterConfigurationViewport_ColorGradingRenderingSettings` — [Read-Write] Color Grading (DisplayClusterConfigurationViewport_ColorGradingRenderingSettings)
  - `enable_entire_cluster_color_grading`: `bool` — [Read-Write] Optionally include Entire Cluster Color Grading settings specified on the root actor in...
  - `enable_inner_frustum_all_nodes_color_grading`: `bool` — [Read-Write] Enable the color grading settings on the inner frustum for the all nodes and add them t...

### `unreal.DisplayClusterConfigurationViewport_ColorGradingMiscSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Color Grading Misc Settings

**Properties** (6):
  - `blue_correction`: `float` — [Read-Write] Correct for artifacts with âelectricâ blues due to the ACEScg color space. Bright b...
  - `expand_gamut`: `float` — [Read-Write] Expand bright saturated colors outside the sRGB gamut to fake wide gamut rendering. (fl...
  - `override_blue_correction`: `bool` — [Read-Write] (bool)
  - `override_expand_gamut`: `bool` — [Read-Write] (bool)
  - `override_scene_color_tint`: `bool` — [Read-Write] (bool)
  - `scene_color_tint`: `LinearColor` — [Read-Write] Scene tint color (LinearColor)

### `unreal.DisplayClusterConfigurationViewport_ColorGradingRenderingSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Color Grading Rendering Settings

**Properties** (14):
  - `auto_exposure_bias`: `float` — [Read-Write] Exposure compensation (float)
  - `color_correction_highlights_max`: `float` — [Read-Write] (float)
  - `color_correction_highlights_min`: `float` — [Read-Write] (float)
  - `color_correction_shadows_max`: `float` — [Read-Write] (float)
  - `global_`: `DisplayClusterConfigurationViewport_ColorGradingSettings` — [Read-Write] Global color grading (DisplayClusterConfigurationViewport_ColorGradingSettings)
  - `highlights`: `DisplayClusterConfigurationViewport_ColorGradingSettings` — [Read-Write] Highlights color grading (DisplayClusterConfigurationViewport_ColorGradingSettings)
  - `midtones`: `DisplayClusterConfigurationViewport_ColorGradingSettings` — [Read-Write] Midtones color grading (DisplayClusterConfigurationViewport_ColorGradingSettings)
  - `misc`: `DisplayClusterConfigurationViewport_ColorGradingMiscSettings` — [Read-Write] Highlights color grading misc settings (DisplayClusterConfigurationViewport_ColorGradin...
  - `override_auto_exposure_bias`: `bool` — [Read-Write] (bool)
  - `override_color_correction_highlights_max`: `bool` — [Read-Write] (bool)
  - `override_color_correction_highlights_min`: `bool` — [Read-Write] (bool)
  - `override_color_correction_shadows_max`: `bool` — [Read-Write] (bool)
  - `shadows`: `DisplayClusterConfigurationViewport_ColorGradingSettings` — [Read-Write] Shadows color grading (DisplayClusterConfigurationViewport_ColorGradingSettings)
  - `white_balance`: `DisplayClusterConfigurationViewport_ColorGradingWhiteBalanceSettings` — [Read-Write] White balance (DisplayClusterConfigurationViewport_ColorGradingWhiteBalanceSettings)

### `unreal.DisplayClusterConfigurationViewport_ColorGradingSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Color Grading Settings

**Properties** (10):
  - `contrast`: `Vector4` — [Read-Write] Contrast (Vector4)
  - `gain`: `Vector4` — [Read-Write] Gain (Vector4)
  - `gamma`: `Vector4` — [Read-Write] Gamma (Vector4)
  - `offset`: `Vector4` — [Read-Write] Offset (Vector4)
  - `override_contrast`: `bool` — [Read-Write] (bool)
  - `override_gain`: `bool` — [Read-Write] (bool)
  - `override_gamma`: `bool` — [Read-Write] (bool)
  - `override_offset`: `bool` — [Read-Write] (bool)
  - `override_saturation`: `bool` — [Read-Write] (bool)
  - `saturation`: `Vector4` — [Read-Write] Saturation (Vector4)

### `unreal.DisplayClusterConfigurationViewport_ColorGradingWhiteBalanceSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Color Grading White Balance Settings

**Properties** (6):
  - `override_temperature_type`: `bool` — [Read-Write] (bool)
  - `override_white_temp`: `bool` — [Read-Write] (bool)
  - `override_white_tint`: `bool` — [Read-Write] (bool)
  - `temperature_type`: `TemperatureMethod` — [Read-Write] Selects the type of temperature calculation.
White Balance uses the Temperature value t...
  - `white_temp`: `float` — [Read-Write] White temperature (float)
  - `white_tint`: `float` — [Read-Write] White tint (float)

### `unreal.DisplayClusterConfigurationViewport_CustomPostprocessSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Custom Postprocess Settings

**Properties** (4):
  - `blend_weight`: `float` — [Read-Write] Override blend weight (float)
  - `is_enabled`: `bool` — [Read-Write] Enable custom postprocess (bool)
  - `is_one_frame`: `bool` — [Read-Write] Apply postprocess for one frame (bool)
  - `post_process_settings`: `PostProcessSettings` — [Read-Write] Custom postprocess settings (PostProcessSettings)

### `unreal.DisplayClusterConfigurationViewport_EntireClusterColorGrading`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Entire Cluster Color Grading

**Properties** (2):
  - `color_grading_settings`: `DisplayClusterConfigurationViewport_ColorGradingRenderingSettings` — [Read-Write] Entire Cluster Color Grading (DisplayClusterConfigurationViewport_ColorGradingRendering...
  - `enable_entire_cluster_color_grading`: `bool` — [Read-Write] Enable the color grading settings for the entire cluster and add them to nDisplayâs c...

### `unreal.DisplayClusterConfigurationViewport_ICVFX`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Viewport.h`

Unique ICVFX customisation for each viewport.

**Properties** (7):
  - `allow_icvfx`: `bool` — [Read-Write] Enable in-camera VFX for this Viewport (works only with supported Projection Policies) ...
  - `allow_inner_frustum`: `bool` — [Read-Write] Allow the inner frustum to appear on this Viewport (bool)
  - `camera_render_mode`: `DisplayClusterConfigurationICVFX_OverrideCameraRenderMode` — [Read-Write] Disable incamera render to this viewport (DisplayClusterConfigurationICVFX_OverrideCame...
  - `lightcard_render_mode`: `DisplayClusterConfigurationICVFX_OverrideLightcardRenderMode` — [Read-Write] Use unique lightcard mode for this viewport (DisplayClusterConfigurationICVFX_OverrideL...
  - `override_chromakey_type`: `DisplayClusterConfigurationICVFX_OverrideChromakeyType` — [Read-Write] Use unique chromakey type for this viewport (DisplayClusterConfigurationICVFX_OverrideC...
  - `per_camera_override_chromakey_type`: `None` — [Read-Write] Determines the chromakey override per-camera in this viewport. (Map[str,DisplayClusterC...
  - `reverse_camera_priority`: `bool` — [Read-Write] The order in which the ICVFX cameras are composited over is reversed. Useful for time-m...

### `unreal.DisplayClusterConfigurationViewport_Overscan`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ViewportOverscan.h`

Display Cluster Configuration Viewport Overscan

**Properties** (7):
  - `bottom`: `float` — [Read-Write] Bottom (float)
  - `enabled`: `bool` — [Read-Write] Enable/disable Viewport Overscan and specify units as percent or pixel values. (bool)
  - `left`: `float` — [Read-Write] Left (float)
  - `mode`: `DisplayClusterConfigurationViewportOverscanMode` — [Read-Write] Enable/disable Viewport Overscan and specify units as percent or pixel values. (Display...
  - `oversize`: `bool` — [Read-Write] Set to True to render at the overscan resolution, set to false to render at the resolut...
  - `right`: `float` — [Read-Write] Right (float)
  - `top`: `float` — [Read-Write] Top (float)

### `unreal.DisplayClusterConfigurationViewport_PerNodeColorGrading`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Per Node Color Grading

**Properties** (5):
  - `all_nodes_color_grading`: `bool` — [Read-Write] Optionally include the All Nodes Color Grading settings specified above in nDisplayâs...
  - `apply_post_process_to_objects`: `None` [Read-Only] — [Read-Only] Specify the nodes to apply these color grading settings. (Array[str])
  - `color_grading_settings`: `DisplayClusterConfigurationViewport_ColorGradingRenderingSettings` — [Read-Write] Color Grading (DisplayClusterConfigurationViewport_ColorGradingRenderingSettings)
  - `entire_cluster_color_grading`: `bool` — [Read-Write] Optionally include Entire Cluster Color Grading settings specified on the root actor in...
  - `is_enabled`: `bool` — [Read-Write] Enable the color grading settings for the node(s) specified and add them to nDisplayâ...

### `unreal.DisplayClusterConfigurationViewport_PerViewportColorGrading`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Postprocess.h`

Display Cluster Configuration Viewport Per Viewport Color Grading

**Properties** (4):
  - `apply_post_process_to_objects`: `None` [Read-Only] — [Read-Only] Specify the viewports to apply these color grading settings. (Array[str])
  - `color_grading_settings`: `DisplayClusterConfigurationViewport_ColorGradingRenderingSettings` — [Read-Write] Color Grading (DisplayClusterConfigurationViewport_ColorGradingRenderingSettings)
  - `is_enabled`: `bool` — [Read-Write] Enable the color grading settings for the viewport(s) specified and add them to nDispla...
  - `is_entire_cluster_enabled`: `bool` — [Read-Write] Optionally include the Entire Cluster Color Grading settings specified above in nDispla...

### `unreal.DisplayClusterConfigurationViewport_Remap`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ViewportRemap.h`

Configuration for all remapping to apply to a single viewport

**Properties** (2):
  - `base_remap`: `DisplayClusterConfigurationViewport_RemapData` — [Read-Write] The base remap to apply to the entire viewport, used to apply flipping and rotation to ...
  - `enable`: `bool` — [Read-Write] Enables or disables viweport output remapping (bool)

### `unreal.DisplayClusterConfigurationViewport_RemapData`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_ViewportRemap.h`

Remapping configuration for a single remapped region, which can be any subregion of a viewport, and can be remapped to any part of the screen, and can be rotated or flipped

**Properties** (5):
  - `angle`: `float` — [Read-Write] The angle in degrees to rotate the remapped region by; rotation is performed around the...
  - `flip_h`: `bool` — [Read-Write] Flips the remapped region horizontally (bool)
  - `flip_v`: `bool` — [Read-Write] Flips the remapped region vertically (bool)
  - `output_region`: `DisplayClusterConfigurationRectangle` — [Read-Write] The region in screen space to output the remapped region to (DisplayClusterConfiguratio...
  - `viewport_region`: `DisplayClusterConfigurationRectangle` — [Read-Write] The subregion of the viewport to remap; (0,0) x (W, H) will remap the entire viewport (...

### `unreal.DisplayClusterConfigurationViewport_RenderSettings`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Viewport.h`

Display Cluster Configuration Viewport Render Settings

**Properties** (9):
  - `buffer_ratio`: `float` — [Read-Write] Adjust resolution scaling for an individual viewport.  Viewport Screen Percentage Multi...
  - `enable_cross_gpu_transfer`: `bool` — [Read-Write] Enable cross-GPU transfer for this viewport.
* It may be disabled in some configuration...
  - `generate_mips`: `DisplayClusterConfigurationPostRender_GenerateMips` — [Read-Write] Generate Mips texture for this viewport (used, only if projection policy supports this ...
  - `hidden_content`: `DisplayClusterConfigurationICVFX_VisibilityList` — [Read-Write] Override actor visibility for this viewport. (DisplayClusterConfigurationICVFX_Visibili...
  - `media`: `DisplayClusterConfigurationMediaViewport` — [Read-Write] Media settings (DisplayClusterConfigurationMediaViewport)
  - `overscan`: `DisplayClusterConfigurationViewport_Overscan` — [Read-Write] Render a larger frame than specified in the configuration to achieve continuity across ...
  - `postprocess_blur`: `DisplayClusterConfigurationPostRender_BlurPostprocess` — [Read-Write] Add postprocess blur to viewport (DisplayClusterConfigurationPostRender_BlurPostprocess...
  - `replace`: `DisplayClusterConfigurationPostRender_Override` — [Read-Write] Override viewport render from source texture (DisplayClusterConfigurationPostRender_Ove...
  - `stereo_mode`: `DisplayClusterConfigurationViewport_StereoMode` — [Read-Write] Enables and sets Stereo mode (DisplayClusterConfigurationViewport_StereoMode)

### `unreal.DisplayClusterEditorPropertyReference`
Inherits: `StructBase` | Header: `DisplayClusterEditorPropertyReference.h`

A dummy structure used to reference properties of subobjects to be displayed at the root level in a details panel.

### `unreal.DisplayClusterReplaceTextureCropRectangle`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Base.h`

Texture Replace Crop parameters container

**Properties** (2):
  - `origin`: `TextureCropOrigin` — [Read-Write] Texture Crop Origin (TextureCropOrigin)
  - `size`: `TextureCropSize` — [Read-Write] Texture Crop Size (TextureCropSize)

### `unreal.TextureCropOrigin`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Base.h`

Texture Replace Crop Origin parameter container

**Properties** (2):
  - `x`: `int` — [Read-Write] Replace texture origin X location, in pixels (int32)
  - `y`: `int` — [Read-Write] Replace texture origin Y position, in pixels (int32)

### `unreal.TextureCropSize`
Inherits: `StructBase` | Header: `DisplayClusterConfigurationTypes_Base.h`

Texture Replace Crop Size parameter container

**Properties** (2):
  - `h`: `int` — [Read-Write] Replace texture crop height, in pixels (int32)
  - `w`: `int` — [Read-Write] Replace texture crop width, in pixels (int32)

### `unreal.DisplayClusterConfigurationCluster`
Inherits: `DisplayClusterConfigurationData_Base` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Cluster

**Methods** (3):
  - `get_node(node_id)` -> `DisplayClusterConfigurationClusterNode` — Get Node
  - `get_node_ids()` -> `Array [ str ]` — Nodes API
  - `get_referenced_mesh_names()` -> `Array [ str ]` — Return all references to meshes from policy, and other

**Properties** (6):
  - `failover`: `DisplayClusterConfigurationFailoverSettings` [Read-Only] — [Read-Only] (DisplayClusterConfigurationFailoverSettings)
  - `master_node`: `DisplayClusterConfigurationPrimaryNode` — âmaster_nodeâ was renamed to âprimary_nodeâ. deprecated
  - `network`: `DisplayClusterConfigurationNetworkSettings` [Read-Only] — [Read-Only] (DisplayClusterConfigurationNetworkSettings)
  - `nodes`: `None` [Read-Only] — [Read-Only] (Map[str,DisplayClusterConfigurationClusterNode])
  - `primary_node`: `DisplayClusterConfigurationPrimaryNode` [Read-Only] — [Read-Only] (DisplayClusterConfigurationPrimaryNode)
  - `sync`: `DisplayClusterConfigurationClusterSync` [Read-Only] — [Read-Only] (DisplayClusterConfigurationClusterSync)

### `unreal.DisplayClusterConfigurationClusterNode`
Inherits: `DisplayClusterConfigurationData_Base` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Cluster Node

**Methods** (3):
  - `get_referenced_mesh_names()` -> `Array [ str ]` — Return all references to meshes from policy, and other
  - `get_viewport(viewport_id)` -> `DisplayClusterConfigurationViewport` — Get Viewport
  - `get_viewport_ids()` -> `Array [ str ]` — Get Viewport Ids

**Properties** (12):
  - `enable_texture_share`: `bool` [Read-Only] — [Read-Only] Enables texture sharing for this cluster node (bool)
  - `graphics_adapter`: `int` [Read-Only] — [Read-Only] Hint for setting the r.GraphicsAdapter CVar when launching this cluster node. Note that ...
  - `host`: `str` [Read-Only] — [Read-Only] IP address of this specific cluster Node (str)
  - `is_fullscreen`: `bool` [Read-Only] — [Read-Only] Enables application window native fullscreen support (bool)
  - `is_sound_enabled`: `bool` — [Read-Write] Enables or disables sound on nDisplay primary Node (bool)
  - `media`: `DisplayClusterConfigurationMediaViewport` — [Read-Write]
deprecated: This property has been deprecated. Please use âMediaSettingsâ. (Display...
  - `media_settings`: `DisplayClusterConfigurationMediaNodeBackbuffer` — [Read-Write] Media settings (DisplayClusterConfigurationMediaNodeBackbuffer)
  - `output_remap`: `DisplayClusterConfigurationFramePostProcess_OutputRemap` — [Read-Write] Output remapping settings for the selected cluster node (DisplayClusterConfigurationFra...
  - `postprocess`: `None` [Read-Only] — [Read-Only] (Map[str,DisplayClusterConfigurationPostprocess])
  - `render_headless`: `bool` [Read-Only] — [Read-Only] Activates headless rendering for this cluster node (bool)
  - `viewports`: `None` [Read-Only] — [Read-Only] (Map[str,DisplayClusterConfigurationViewport])
  - `window_rect`: `DisplayClusterConfigurationRectangle` — [Read-Write] Defines the application window size in pixels (DisplayClusterConfigurationRectangle)

### `unreal.DisplayClusterConfigurationData`
Inherits: `DisplayClusterConfigurationData_Base` | Header: `DisplayClusterConfigurationTypes.h`

**Methods** (8):
  - `assign_postprocess(node_id, postprocess_id, type, parameters, order = -1)` -> `bool` — UpdateCreate node postprocess
  - `get_node(node_id)` -> `DisplayClusterConfigurationClusterNode` — Returns specific node configuration. Otherwise nullptr.
  - `get_postprocess(node_id, postprocess_id)` -> `DisplayClusterConfigurationPostprocess or None` — Get Postprocess
  - `get_primary_node()` -> `DisplayClusterConfigurationClusterNode` — Returns primary node configuration. Otherwise nullptr.
  - `get_projection_policy(node_id, viewport_id)` -> `DisplayClusterConfigurationProjection or None` — Get Projection Policy
  - `get_referenced_mesh_names()` -> `Array [ str ]` — Return all references to meshes from policy, and other
  - `get_viewport(node_id, viewport_id)` -> `DisplayClusterConfigurationViewport` — Viewports API
  - `remove_postprocess(node_id, postprocess_id)` -> `bool` — Remove Postprocess

**Properties** (12):
  - `cluster`: `DisplayClusterConfigurationCluster` [Read-Only] — [Read-Only] (DisplayClusterConfigurationCluster)
  - `custom_parameters`: `None` — [Read-Write] (Map[str,str])
  - `diagnostics`: `DisplayClusterConfigurationDiagnostics` — [Read-Write] (DisplayClusterConfigurationDiagnostics)
  - `exit_on_esc`: `bool` — [Read-Write] (bool)
  - `follow_local_player_camera`: `bool` — [Read-Write] (bool)
  - `info`: `DisplayClusterConfigurationInfo` — [Read-Write] (DisplayClusterConfigurationInfo)
  - `media_settings`: `DisplayClusterConfigurationGlobalMediaSettings` — [Read-Write] (DisplayClusterConfigurationGlobalMediaSettings)
  - `override_transforms_from_external_config`: `bool` — [Read-Write] (bool)
  - `override_viewports_from_external_config`: `bool` — [Read-Write] (bool)
  - `render_frame_settings`: `DisplayClusterConfigurationRenderFrame` — [Read-Write] (DisplayClusterConfigurationRenderFrame)
  - `scene`: `DisplayClusterConfigurationScene` [Read-Only] — [Read-Only] (DisplayClusterConfigurationScene)
  - `stage_settings`: `DisplayClusterConfigurationICVFX_StageSettings` — [Read-Write] (DisplayClusterConfigurationICVFX_StageSettings)

### `unreal.DisplayClusterConfigurationData_Base`
Inherits: `Object` | Header: `DisplayClusterConfigurationTypes_Base.h`

All configuration UObjects should inherit from this class.

### `unreal.DisplayClusterConfigurationHostDisplayData`
Inherits: `Object` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Host Display Data

### `unreal.DisplayClusterConfigurationScene`
Inherits: `DisplayClusterConfigurationData_Base` | Header: `DisplayClusterConfigurationTypes.h`

Display Cluster Configuration Scene

### `unreal.DisplayClusterConfigurationViewport`
Inherits: `DisplayClusterConfigurationData_Base` | Header: `DisplayClusterConfigurationTypes_Viewport.h`

Display Cluster Configuration Viewport

**Properties** (10):
  - `allow_preview_frustum_rendering`: `bool` — [Read-Write] (bool)
  - `allow_rendering`: `bool` — [Read-Write] Enables or disables rendering of this specific Viewport (bool)
  - `camera`: `str` — [Read-Write] Reference to the nDisplay View Point (str)
  - `gpu_index`: `int` — [Read-Write] Specifies the GPU index for the nDisplay viewport.
Value â-1â means do not use mult...
  - `icvfx`: `DisplayClusterConfigurationViewport_ICVFX` — [Read-Write] Configure ICVFX for this viewport (DisplayClusterConfigurationViewport_ICVFX)
  - `overlap_order`: `int` — [Read-Write] Allows Viewports to overlap and sets Viewport overlapping order priority (int32)
  - `projection_policy`: `DisplayClusterConfigurationProjection` — [Read-Write] Specify your Projection Policy Settings (DisplayClusterConfigurationProjection)
  - `region`: `DisplayClusterConfigurationRectangle` — [Read-Write] Define the Viewport 2D coordinates (DisplayClusterConfigurationRectangle)
  - `render_settings`: `DisplayClusterConfigurationViewport_RenderSettings` — [Read-Write] Configure render for this viewport (DisplayClusterConfigurationViewport_RenderSettings)
  - `viewport_remap`: `DisplayClusterConfigurationViewport_Remap` — [Read-Write] Define the Viewport Remap settings (DisplayClusterConfigurationViewport_Remap)

### `unreal.DisplayClusterMediaOutputSynchronizationPolicy`
Inherits: `Object` | Header: `DisplayClusterConfigurationTypes_MediaSync.h`

Base media output synchronization policy class settings

### `unreal.DisplayClusterConfiguration_PostRenderBlur`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Post Render Blur

**Properties** (3):
  - `DILATE`: `DisplayClusterConfiguration_PostRenderBlur = Ellipsis` — Blur viewport using Dilate method 2
  - `GAUSSIAN`: `DisplayClusterConfiguration_PostRenderBlur = Ellipsis` — Blur viewport using Gaussian method 1
  - `NONE`: `DisplayClusterConfiguration_PostRenderBlur = Ellipsis` — Not use blur postprocess 0

### `unreal.DisplayClusterConfigurationCameraMotionBlurMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Camera Motion Blur Mode

**Properties** (3):
  - `OFF`: `DisplayClusterConfigurationCameraMotionBlurMode = Ellipsis` — Subtract blur due to all global motion of the ICVFX camera, but preserve blur from object motion. 0
  - `ON`: `DisplayClusterConfigurationCameraMotionBlurMode = Ellipsis` — Allow blur from camera motion. This option should not normally be used for shooting, but may be usef...
  - `OVERRIDE`: `DisplayClusterConfigurationCameraMotionBlurMode = Ellipsis` — Subtract blur due to motion of the ICVFX camera relative to the nDisplay root, but preserve blur fro...

### `unreal.DisplayClusterConfigurationFailoverPolicy`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Failover Policy

**Properties** (2):
  - `DISABLED`: `DisplayClusterConfigurationFailoverPolicy = Ellipsis` — No failover operations performed. The whole cluster gets terminated in case of any error 0
  - `DROP_SECONDARY_NODES_ONLY`: `DisplayClusterConfigurationFailoverPolicy = Ellipsis` — This policy allows to drop any secondary node out of cluster in case itâs failed,
and let the othe...

### `unreal.DisplayClusterConfigurationFramePostProcess_OutputRemapSource`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_OutputRemap.h`

Source types of the output remapping

**Properties** (3):
  - `EXTERNAL_FILE`: `DisplayClusterConfigurationFramePostProcess_OutputRemapSource = Ellipsis` — Use an external .obj file for output remapping when the Data Source is set to File 1
  - `MESH_COMPONENT`: `DisplayClusterConfigurationFramePostProcess_OutputRemapSource = Ellipsis` — Use a Mesh component reference for output remapping (ProceduralMeshComponent or StaticMeshComponent)...
  - `STATIC_MESH`: `DisplayClusterConfigurationFramePostProcess_OutputRemapSource = Ellipsis` — Use a Static Mesh reference for output remapping when the Data Source is set to Mesh 0

### `unreal.DisplayClusterConfigurationICVFX_ChromakeySettingsSource`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

Indicates the source of the chromakey settings when an ICVFX cameraâs inner frustum is rendered as chromakey

**Properties** (2):
  - `ICVFX_CAMERA`: `DisplayClusterConfigurationICVFX_ChromakeySettingsSource = Ellipsis` — The ICVFX cameraâs chromakey settings are used 1
  - `VIEWPORT`: `DisplayClusterConfigurationICVFX_ChromakeySettingsSource = Ellipsis` — The nDisplay stage actorâs chromakey settings are used 0

### `unreal.DisplayClusterConfigurationICVFX_ChromakeyType`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

Indicates the type of chromakey that is used within an ICVFX cameraâs inner frustum

**Properties** (3):
  - `CUSTOM_CHROMAKEY`: `DisplayClusterConfigurationICVFX_ChromakeyType = Ellipsis` — Only actors specified in the custom chromakey actor list are rendered as chromakey 1
  - `DISABLED`: `DisplayClusterConfigurationICVFX_ChromakeyType = Ellipsis` — Disable chromakey.
This value can be overridden by the viewport ICVFX settings,
by changing the âO...
  - `INNER_FRUSTUM`: `DisplayClusterConfigurationICVFX_ChromakeyType = Ellipsis` — The entire inner frustum is rendered as chromakey 0

### `unreal.DisplayClusterConfigurationICVFX_LightcardRenderMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

How to render Light Cards in relation to the inner frustum.

**Properties** (2):
  - `OVER`: `DisplayClusterConfigurationICVFX_LightcardRenderMode = Ellipsis` — Render Light Cards over the inner frustum.  Light Cards can be directly visible in camera. 0
  - `UNDER`: `DisplayClusterConfigurationICVFX_LightcardRenderMode = Ellipsis` — Render Light Cards under the inner frustum. Light Cards will not be directly visible in camera. 1

### `unreal.DisplayClusterConfigurationICVFX_OverrideCameraRenderMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration ICVFX Override Camera Render Mode

**Properties** (4):
  - `DEFAULT`: `DisplayClusterConfigurationICVFX_OverrideCameraRenderMode = Ellipsis` — Use default rendering rules 0
  - `DISABLED`: `DisplayClusterConfigurationICVFX_OverrideCameraRenderMode = Ellipsis` — Disable camera frame render for this viewport 1
  - `DISABLE_CHROMAKEY`: `DisplayClusterConfigurationICVFX_OverrideCameraRenderMode = Ellipsis` — Disable chromakey render for this viewport 2
  - `DISABLE_CHROMAKEY_MARKERS`: `DisplayClusterConfigurationICVFX_OverrideCameraRenderMode = Ellipsis` — Disable chromakey markers render for this viewport 3

### `unreal.DisplayClusterConfigurationICVFX_OverrideChromakeyType`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

Override the chromakey type for the viewport.

**Properties** (4):
  - `CUSTOM_CHROMAKEY`: `DisplayClusterConfigurationICVFX_OverrideChromakeyType = Ellipsis` — Only actors specified in the custom chromakey actor list are rendered as chromakey 2
  - `DEFAULT`: `DisplayClusterConfigurationICVFX_OverrideChromakeyType = Ellipsis` — Use the chromakey type from ICVFX camera 0
  - `DISABLED`: `DisplayClusterConfigurationICVFX_OverrideChromakeyType = Ellipsis` — Disable chromakey 3
  - `INNER_FRUSTUM`: `DisplayClusterConfigurationICVFX_OverrideChromakeyType = Ellipsis` — The entire inner frustum is rendered as chromakey for this viewport 1

### `unreal.DisplayClusterConfigurationICVFX_OverrideLightcardRenderMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

Override the lightcard rendering order for the viewport.

**Properties** (4):
  - `DEFAULT`: `DisplayClusterConfigurationICVFX_OverrideLightcardRenderMode = Ellipsis` — Use global lightcard mode from StageSettings for this viewport 0
  - `DISABLED`: `DisplayClusterConfigurationICVFX_OverrideLightcardRenderMode = Ellipsis` — Disable lightcard rendering for this viewport 1
  - `OVER`: `DisplayClusterConfigurationICVFX_OverrideLightcardRenderMode = Ellipsis` — Always render the In-Camera frame over lightcards for this viewport. 2
  - `UNDER`: `DisplayClusterConfigurationICVFX_OverrideLightcardRenderMode = Ellipsis` — Always render the In-Camera frame under lightcards for this viewport. 3

### `unreal.DisplayClusterConfigurationICVFX_PerLightcardRenderMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

How to render a Light Card Actor in relation to the inner frustum.

**Properties** (3):
  - `DEFAULT`: `DisplayClusterConfigurationICVFX_PerLightcardRenderMode = Ellipsis` — It is determined by nDisplay settings. 0
  - `OVER`: `DisplayClusterConfigurationICVFX_PerLightcardRenderMode = Ellipsis` — Render Light Card Actor over the inner frustum.  Light Card Actor can be directly visible in camera....
  - `UNDER`: `DisplayClusterConfigurationICVFX_PerLightcardRenderMode = Ellipsis` — Render Light Card Actor under the inner frustum. Light Card Actor will not be directly visible in ca...

### `unreal.DisplayClusterConfigurationMediaSplitType`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Media.h`

Media frame split types

**Properties** (2):
  - `FULL_FRAME`: `DisplayClusterConfigurationMediaSplitType = Ellipsis` — 0
  - `UNIFORM_TILES`: `DisplayClusterConfigurationMediaSplitType = Ellipsis` — 1

### `unreal.DisplayClusterConfigurationRenderMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Render Mode

**Properties** (3):
  - `MONO`: `DisplayClusterConfigurationRenderMode = Ellipsis` — 0
  - `SIDE_BY_SIDE`: `DisplayClusterConfigurationRenderMode = Ellipsis` — 1
  - `TOP_BOTTOM`: `DisplayClusterConfigurationRenderMode = Ellipsis` — 2

### `unreal.DisplayClusterConfigurationViewport_StereoMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Viewport Stereo Mode

**Properties** (2):
  - `DEFAULT`: `DisplayClusterConfigurationViewport_StereoMode = Ellipsis` — Render incamera frame over lightcard 0
  - `FORCE_MONO`: `DisplayClusterConfigurationViewport_StereoMode = Ellipsis` — Force monoscopic render mode for this viewport (performance) 1

### `unreal.DisplayClusterConfigurationViewportCustomFrustumMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Viewport Custom Frustum Mode

**Properties** (2):
  - `PERCENT`: `DisplayClusterConfigurationViewportCustomFrustumMode = Ellipsis` — 0
  - `PIXELS`: `DisplayClusterConfigurationViewportCustomFrustumMode = Ellipsis` — 1

### `unreal.DisplayClusterConfigurationViewportLightcardOCIOMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Viewport Lightcard OCIOMode

**Properties** (3):
  - `CUSTOM`: `DisplayClusterConfigurationViewportLightcardOCIOMode = Ellipsis` — Use Custom Light Cards OCIO. 1
  - `NONE`: `DisplayClusterConfigurationViewportLightcardOCIOMode = Ellipsis` — None. 2
  - `N_DISPLAY`: `DisplayClusterConfigurationViewportLightcardOCIOMode = Ellipsis` — Use nDisplay Viewport OCIO. 0

### `unreal.DisplayClusterConfigurationViewportOverscanMode`
Inherits: `EnumBase` | Header: `DisplayClusterConfigurationTypes_Enums.h`

EDisplay Cluster Configuration Viewport Overscan Mode

**Properties** (2):
  - `PERCENT`: `DisplayClusterConfigurationViewportOverscanMode = Ellipsis` — 1
  - `PIXELS`: `DisplayClusterConfigurationViewportOverscanMode = Ellipsis` — 0
