# UE Python API — Composure Module

**58 types** from the `Composure` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CompositingMaterial`, `CompositingParamPayload`, `ComposurePostMoveSettings`, `ComposureUVMapSettings`, `MovieSceneComposureExportPass`, `NamedCompMaterialParam`, `AlphaTransformPass`, `ColorConverterOutputPass`, `CompositingCaptureBase`, `CompositingElement`, `CompositingElementInput`, `CompositingElementMaterialPass`, `CompositingElementOutput`, `CompositingElementPass`, `CompositingElementTransform`, `CompositingInputInterface`, `CompositingInputInterfaceProxy`, `CompositingMediaCaptureOutput`, `CompositingMediaInput`, `CompositingOpenColorIOPass`, ... (58 total)

---

## Classes

### `unreal.CompositingMaterial`
Inherits: `CompositingParamPayload` | Header: `CompositingMaterialPass.h`

Compositing Material

**Properties** (2):
  - `material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `param_pass_mappings`: `None` — [Read-Write] Maps material texture param names to prior passes/elements. Overrides the elementâs p...

### `unreal.CompositingParamPayload`
Inherits: `StructBase` | Header: `CompositingMaterialPass.h`

FCompositingParamPayload

### `unreal.ComposurePostMoveSettings`
Inherits: `StructBase` | Header: `ComposurePostMoves.h`

Composure Post Move Settings

**Properties** (4):
  - `pivot`: `Vector2D` — [Read-Write] The normalized pivot point for applying rotation and scale to the image. The x and y va...
  - `rotation_angle`: `float` — [Read-Write] The anti clockwise rotation to apply to the image in degrees. (float)
  - `scale`: `float` — [Read-Write] The scale to apply to the image. (float)
  - `translation`: `Vector2D` — [Read-Write] The translation to apply to the image.  The x and y values are normalized to the range ...

### `unreal.ComposureUVMapSettings`
Inherits: `StructBase` | Header: `ComposureUVMap.h`

Composure UVMap Settings

**Properties** (5):
  - `displacement_decode_parameters`: `Vector2D` — [Read-Write] Decoding parameters for DisplacementTexture. DeltaUV = ((RedChannel, GreenChannel) - Y)...
  - `displacement_texture`: `Texture` — [Read-Write] Displacement texture to use. (Texture)
  - `post_uv_displacement_matrix`: `Matrix` — [Read-Write] UV Matrix to apply after displacing UV using DisplacementTexture. (Matrix)
  - `pre_uv_displacement_matrix`: `Matrix` — [Read-Write] UV Matrix to apply before sampling DisplacementTexture. (Matrix)
  - `use_displacement_blue_and_alpha_channels`: `bool` — [Read-Write] Whether to use blue and alpha channel instead of red and green channel in computation o...

### `unreal.MovieSceneComposureExportPass`
Inherits: `StructBase` | Header: `MovieSceneComposureExportTrack.h`

Export configuration options for a single internal pass on an ACompositingElement, or its output pass (where TransformPassName is None)

### `unreal.NamedCompMaterialParam`
Inherits: `StructBase` | Header: `CompositingMaterialPass.h`

Named Comp Material Param

### `unreal.AlphaTransformPass`
Inherits: `CompositingElementTransform` | Header: `CompositingElementTransforms.h`

Alpha Transform Pass

### `unreal.ColorConverterOutputPass`
Inherits: `CompositingElementOutput` | Header: `CompositingElementOutputs.h`

Color Converter Output Pass

### `unreal.CompositingCaptureBase`
Inherits: `CompositingElement` | Header: `CompositingCaptureBase.h`

Base class for CG Compositing Elements

**Methods** (1):
  - `update_distortion()` -> `None` — Update the state of the Lens Distortion Data Handler, and updates or removes the Distortion MID from the SceneCaptureCom...

**Properties** (4):
  - `apply_distortion`: `bool` — [Read-Write] Whether to apply distortion as a post-process effect on this CG Layer (bool)
  - `original_focal_length`: `float` [Read-Only] — [Read-Only] Focal length of the target camera before any overscan has been applied (float)
  - `overscan_factor`: `float` [Read-Only] — [Read-Only] Value used to augment the FOV of the scene capture to produce a CG image with enough dat...
  - `scene_capture_component2d`: `SceneCaptureComponent2D` [Read-Only] — [Read-Only] Component used to generate the scene capture for this CG Layer (SceneCaptureComponent2D)

### `unreal.CompositingElement`
Inherits: `ComposurePipelineBaseActor` | Header: `CompositingElement.h`

Compositing Element

**Methods** (30):
  - `add_new_input_pass(pass_name, input_type)` -> `CompositingElementInput` — Add New Input Pass
  - `add_new_output_pass(pass_name, output_type)` -> `CompositingElementOutput` — Add New Output Pass
  - `add_new_transform_pass(pass_name, transform_type)` -> `CompositingElementTransform` — Add New Transform Pass
  - `create_new_input_pass(pass_name, input_type)` -> `CompositingElementInput` — Create a new input pass into the public list which directly shows in the editor.
  - `create_new_output_pass(pass_name, output_type)` -> `CompositingElementOutput` — Create a new Output pass into the public list which directly shows in the editor.
  - `create_new_transform_pass(pass_name, transform_type)` -> `CompositingElementTransform` — Create a new Transform pass into the public list which directly shows in the editor.
  - `delete_pass(pass_to_delete)` -> `bool` — Delete a specific pass. This function deals with the public list where deletion is directly reflected in the editor.
  - `find_input_pass(input_type, pass_result=Texture)` — ************************* // Pass Management
  - `find_named_render_result(pass_name, search_sub_elements = True)` -> `Texture` — Find Named Render Result
  - `find_output_pass(output_type, optional_pass_name = 'None')` -> `CompositingElementOutput` — Find Output Pass
  - `find_target_camera()` -> `CameraActor` — Find Target Camera
  - `find_transform_pass(transform_type, pass_result=Texture)` — Find Transform Pass
  - `get_child_elements()` -> `Array [ CompositingElement ]` — Get the first level of current elementâs child composure elements.
  - `get_comp_element_name()` -> `Name` — Return the FName of the composure element object
  - `get_element_parent()` -> `CompositingElement` — Get the parent composure element of current element.
  - `get_latest_render_result()` -> `Texture` — const;
  - `get_opacity()` -> `float` — Return the rendering opacity of current composure actor.
  - `get_render_priority()` -> `int32` — Get Render Priority
  - `is_sub_element()` -> `bool` — Determines whether current composure element is a child of another composure element or not.
  - `register_pass_result(reference_name, pass_result, set_as_latest_render_result = True)` -> `None` — Register Pass Result
  - `release_owned_target(owned_target)` -> `bool` — Release Owned Target
  - `render_comp_element(camera_cut_this_frame)` -> `Texture` — Render Comp Element
  - `render_compositing_material(comp_material, render_scale=1.000000, result_lookup_name="None", comp_material=CompositingMaterial)` — Render Compositing Material
  - `render_compositing_material_to_target(comp_material, render_target, comp_material=CompositingMaterial)` — Render Compositing Material to Target
  - `request_named_render_target(reference_name, render_percentage = 1.000000, usage_tag = TargetUsageFlags.USAGE_NONE)` -> `TextureRenderTarget2D` — Request Named Render Target
  - `set_editor_color_picker_display_image(picker_display_image)` -> `None` — EDITOR ONLY - Specifies an intermediate image to display when picking (if left unset, we default to the final output ima...
  - `set_editor_color_picking_target(picking_target)` -> `None` — EDITOR ONLY - Specifies which intermediate target to pick colors from (if left unset, we default to the display image)
  - `set_element_name(new_name)` -> `None` — Rename composure actorâs name
  - `set_opacity(new_opacity)` -> `None` — Set the rendering opacity of current composure actor.
  - `set_target_camera(new_camera_actor)` -> `None` — Set Target Camera

**Properties** (9):
  - `compositing_target`: `ComposureCompositingTargetComponent` [Read-Only] — [Read-Only] (ComposureCompositingTargetComponent)
  - `inputs`: `None` [Read-Only] — [Read-Only]*************************// Pipeline Passes
//   - protected to prevent users from direct...
  - `on_final_pass_rendered_bp`: `DynamicOnFinalPassRendered` — [Read-Write] Called when the final output of this element is rendered (DynamicOnFinalPassRendered)
  - `on_transform_pass_rendered_bp`: `DynamicOnTransformPassRendered` — [Read-Write] Called when a transform pass on this element is rendered (DynamicOnTransformPassRendere...
  - `outputs`: `None` [Read-Only] — [Read-Only] (Array[CompositingElementOutput])
  - `post_process_proxy`: `ComposurePostProcessingPassProxy` [Read-Only] — [Read-Only] (ComposurePostProcessingPassProxy)
  - `render_format`: `TextureRenderTargetFormat` — [Read-Write] (TextureRenderTargetFormat)
  - `render_resolution`: `IntPoint` — [Read-Write] (IntPoint)
  - `transform_passes`: `None` [Read-Only] — [Read-Only] (Array[CompositingElementTransform])

### `unreal.CompositingElementInput`
Inherits: `CompositingElementPass` | Header: `CompositingElementPasses.h`

Compositing Element Input

**Methods** (1):
  - `generate_input()` -> `Texture` — Generate Input

**Properties** (1):
  - `intermediate`: `bool` [Read-Only] — [Read-Only] Marks this pass for âinternal use onlyâ - prevents it from being exposed to parent e...

### `unreal.CompositingElementMaterialPass`
Inherits: `CompositingPostProcessPass` | Header: `CompositingElementTransforms.h`

UCompositingElementMaterialPass

**Methods** (3):
  - `apply_material_params(mid)` -> `None` — Apply Material Params
  - `set_material_interface(new_material)` -> `None` — Set the material interface used by current material pass.
  - `set_parameter_mapping(texture_param_name, composure_layer_name)` -> `bool` — Set the parameter mappings between texture parameters and composure layers. Users can not create new entries into the ma...

**Properties** (1):
  - `material`: `CompositingMaterial` — [Read-Write] (CompositingMaterial)

### `unreal.CompositingElementOutput`
Inherits: `CompositingElementPass` | Header: `CompositingElementPasses.h`

Compositing Element Output

**Methods** (1):
  - `relay_output(final_result, post_process_proxy)` -> `None` — Relay Output

### `unreal.CompositingElementPass`
Inherits: `Object` | Header: `CompositingElementPasses.h`

UCompositingElementPass

**Methods** (8):
  - `on_disabled()` -> `None` — On Disabled
  - `on_enabled()` -> `None` — On Enabled
  - `on_frame_begin(camera_cut_this_frame)` -> `None` — On Frame Begin
  - `on_frame_end()` -> `None` — On Frame End
  - `release_render_target(assigned_target)` -> `bool` — , meta = (BlueprintProtected = âtrueâ)
  - `request_natively_formatted_target(render_scale = 1.000000)` -> `TextureRenderTarget2D` — , meta = (BlueprintProtected = âtrueâ)
  - `request_render_target(dimensions, format)` -> `TextureRenderTarget2D` — , meta = (BlueprintProtected = âtrueâ)
  - `reset()` -> `None` — Reset

**Properties** (2):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `pass_name`: `Name` — [Read-Write] (Name)

### `unreal.CompositingElementTransform`
Inherits: `CompositingElementPass` | Header: `CompositingElementPasses.h`

Compositing Element Transform

**Methods** (2):
  - `apply_transform(input, post_process_proxy, target_camera)` -> `Texture` — Apply Transform
  - `find_named_pre_pass_result(pass_lookup_name)` -> `Texture` — Find Named Pre Pass Result

**Properties** (1):
  - `intermediate`: `bool` [Read-Only] — [Read-Only] Marks this pass for âinternal use onlyâ - prevents it from being exposed to parent e...

### `unreal.CompositingInputInterface`
Inherits: `Interface` | Header: `CompositingElementInputs.h`

Compositing Input Interface

**Methods** (3):
  - `generate_input(proxy)` -> `Texture` — Generate Input
  - `on_frame_begin(proxy, camera_cut_this_frame)` -> `None` — On Frame Begin
  - `on_frame_end(proxy)` -> `None` — On Frame End

### `unreal.CompositingInputInterfaceProxy`
Inherits: `CompositingElementInput` | Header: `CompositingElementInputs.h`

Compositing Input Interface Proxy

**Properties** (1):
  - `compositing_input`: `CompositingInputInterface` — [Read-Write] (CompositingInputInterface)

### `unreal.CompositingMediaCaptureOutput`
Inherits: `ColorConverterOutputPass` | Header: `CompositingElementOutputs.h`

Compositing Media Capture Output

**Properties** (1):
  - `capture_output`: `MediaOutput` — [Read-Write] (MediaOutput)

### `unreal.CompositingMediaInput`
Inherits: `CompositingElementInput` | Header: `CompositingElementInputs.h`

Compositing Media Input

**Properties** (1):
  - `media_transform_material`: `CompositingMaterial` [Read-Only] — [Read-Only] (CompositingMaterial)

### `unreal.CompositingOpenColorIOPass`
Inherits: `CompositingElementTransform` | Header: `CompositingElementTransforms.h`

UCompositingOpenColorIOPass

**Properties** (1):
  - `color_conversion_settings`: `OpenColorIOColorConversionSettings` — [Read-Write] Color grading settings. (OpenColorIOColorConversionSettings)

### `unreal.CompositingPickerAsyncTask`
Inherits: `BlueprintAsyncActionBase` | Header: `CompositingEditorSupportLibrary.h`

Compositing Picker Async Task

**Properties** (3):
  - `on_accept`: `OnPixelPicked` — [Read-Write] (OnPixelPicked)
  - `on_cancel`: `OnPixelPicked` — [Read-Write] (OnPixelPicked)
  - `on_pick`: `OnPixelPicked` — [Read-Write] (OnPixelPicked)

### `unreal.CompositingPostProcessPass`
Inherits: `CompositingElementTransform` | Header: `CompositingElementTransforms.h`

Compositing Post Process Pass

**Properties** (2):
  - `post_process_passes`: `None` [Read-Only] — [Read-Only] (Array[ComposurePostProcessPassPolicy])
  - `render_scale`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.CompositingTextureLookupTable`
Inherits: `Interface` | Header: `ICompositingTextureLookupTable.h`

Compositing Texture Lookup Table

**Methods** (1):
  - `find_named_pass_result(lookup_name)` -> `Texture or None` — Find Named Pass Result

### `unreal.CompositingTonemapPass`
Inherits: `CompositingElementTransform` | Header: `CompositingElementTransforms.h`

Compositing Tonemap Pass

**Properties** (3):
  - `chromatic_aberration`: `float` — [Read-Write] in percent, Scene chromatic aberration / color fringe (camera imperfection) to simulate...
  - `color_grading_settings`: `ColorGradingSettings` — [Read-Write] Color grading settings. (ColorGradingSettings)
  - `film_stock_settings`: `FilmStockSettings` — [Read-Write] Film stock settings. (FilmStockSettings)

### `unreal.ComposureCompositingTargetComponent`
Inherits: `ActorComponent` | Header: `ComposurePlayerCompositingTarget.h`

Component intended to replace UComposurePlayerCompositingTarget - a object to bind to a APlayerCameraManager with a UTextureRenderTarget2D to be used as a playerâs render target. Made into a compone...

**Methods** (2):
  - `get_display_texture()` -> `Texture` — Get Display Texture
  - `set_display_texture(display_texture)` -> `None` — Set Display Texture

### `unreal.ComposureGameSettings`
Inherits: `Object` | Header: `ComposureConfigSettings.h`

Composure Game Settings

**Properties** (3):
  - `fallback_compositing_texture`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)
  - `scene_cap_warn_of_missing_cam`: `bool` [Read-Only] — [Read-Only] (bool)
  - `static_video_plate_debug_image`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)

### `unreal.ComposureLensBloomPass`
Inherits: `ComposurePostProcessPass` | Header: `ComposureLensBloomPass.h`

Bloom only pass implemented on top of the in-engine bloom.

**Methods** (2):
  - `bloom_to_render_target()` -> `None` — Blurs the input into the output.
  - `set_tonemapper_replacing_material(material)` -> `None` — Sets a custom tonemapper replacing material instance.

**Properties** (1):
  - `settings`: `LensBloomSettings` — [Read-Write] Bloom settings. (LensBloomSettings)

### `unreal.ComposureLensBloomPassPolicy`
Inherits: `ComposurePostProcessPassPolicy` | Header: `ComposureLensBloomPass.h`

Bloom only rules used for configuring how UComposurePostProcessingPassProxy executes

**Properties** (1):
  - `settings`: `LensBloomSettings` — [Read-Write] Bloom settings. (LensBloomSettings)

### `unreal.ComposureLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ComposureBlueprintLibrary.h`

Composure Blueprint Library

**Methods** (16):
  - `attach_composure_element(parent_name, child_name)` -> `bool` [classmethod] — Attach one composure element as the child to another composure element in the scene.
  - `copy_camera_settings_to_scene_capture(src_camera, dst_capture_component, original_focal_length, overscan_factor = 1.000000)` -> `None` [classmethod] — Copy Camera Settings to Scene Capture
  - `create_composure_element(element_name, class_type, level_context = None)` -> `CompositingElement` [classmethod] — Create a new Composure in the level without any parenting relationship.
  - `create_player_compositing_target(world_context_object)` -> `ComposurePlayerCompositingTarget` [classmethod] — Creates a Player Compositing Target which you can modify during gameplay.
  - `delete_composure_element_and_children(element_to_delete)` -> `None` [classmethod] — Delete a specific composure element without evoking prompt window. Will delete all of its children as well.
  - `get_composure_element(element_name)` -> `CompositingElement` [classmethod] — Get a specific composure element
  - `get_cropping_uv_transformation_matrix_from_post_move_settings(post_move_settings, uncroping_uv_transformation_matrix=Matrix)` [classmethod] — Returns UV transformation matrix and its inversed to crop.
  - `get_player_display_gamma(player_camera_manager)` -> `float` [classmethod] — Returns display gamma of a given player camera manager, or 0 if no scene viewport attached.
  - `get_projection_matrix_from_post_move_settings(post_move_settings, horizontal_fov_angle, aspect_ratio)` -> `Matrix` [classmethod] — Returns a non-centered projection matrix.
  - `get_red_green_uv_factors_from_chromatic_aberration(chromatic_aberration_amount)` -> `Vector2D` [classmethod] — Returns the red and green channel factors from percentage of chromatic aberration.
  - `invert_uv_displacement_map_encoding_parameters(in_)` -> `Vector2D` [classmethod] — Converts displacement encoding parameters to decoding parameters. Can also be used to convert displacement decoding para...
  - `is_composure_element_drawing(comp_element)` -> `bool` [classmethod] — Determines if the specified element is being rendered by the hidden compositing viewport.
  - `refresh_composure_element_list()` -> `None` [classmethod] — Re-queries the scene for element actors and rebuilds the authoritative list used by the editor.
  - `rename_composure_element(original_element_name, new_element_name)` -> `bool` [classmethod] — Rename a specific composure element
  - `request_redraw_composure_viewport()` -> `None` [classmethod] — Request redrawing the compositing editor viewport if it is valid. If it is invalid, this function will create a new view...
  - `set_uv_map_settings_to_material_parameters(uv_map_settings, material)` -> `None` [classmethod] — Sets parameters of a material that uses Composureâs MF_UVMap_SampleLocation material function.

### `unreal.ComposurePipelineBaseActor`
Inherits: `Actor` | Header: `ComposurePipelineBaseActor.h`

Actor designed to implement compositing pipeline in a blueprint.

**Methods** (2):
  - `enqueue_rendering(camera_cut_this_frame)` -> `None` — Entry point for a composure Blueprint to do its render enqueuing from.
  - `is_actively_running()` -> `bool` — Is Actively Running

**Properties** (2):
  - `auto_run`: `bool` — [Read-Write] When set, weâll call EnqueueRendering() each frame automatically. If left
off, it is ...
  - `auto_run_child_elements_and_self`: `bool` — [Read-Write] When set to false, all composure elements including itselfâs rendering will not autom...

### `unreal.ComposurePlayerCompositingCameraModifier`
Inherits: `CameraModifier` | Header: `ComposurePlayerCompositingCameraModifier.h`

Private camera manager for UComposurePlayerCompositingTarget.

### `unreal.ComposurePlayerCompositingTarget`
Inherits: `Object` | Header: `ComposurePlayerCompositingTarget.h`

Object to bind to a APlayerCameraManager with a UTextureRenderTarget2D to be used as a playerâs render target. TODO-BADGER:: deprecate this (UComposurePlayerCompositingTarget) once weâre comfortab...

**Methods** (3):
  - `get_player_camera_manager()` -> `PlayerCameraManager` — Current player camera manager the target is bind on.
  - `set_player_camera_manager(player_camera_manager)` -> `PlayerCameraManager` — Set player camera manager to bind the render target to.
  - `set_render_target(render_target)` -> `None` — Set the render target of the player.

### `unreal.ComposurePostProcessingPassProxy`
Inherits: `ComposurePostProcessPass` | Header: `ComposurePostProcessingPassProxy.h`

Generic component class which takes a UComposurePostProcessPassPolicy and executes it, enqueuing a post-process pass for the render frame.

**Methods** (1):
  - `execute(pre_pass_input, post_process_pass)` -> `None` — Execute

### `unreal.ComposurePostProcessPass`
Inherits: `SceneComponent` | Header: `ComposurePostProcessPass.h`

In engine post process based pass.

**Methods** (4):
  - `get_output_render_target()` -> `TextureRenderTarget2D` — Gets current output render target.
  - `get_setup_material()` -> `MaterialInterface` — Gets current setup material.
  - `set_output_render_target(render_target)` -> `None` — Sets current output render target.
  - `set_setup_material(material)` -> `None` — Sets a custom setup post process material. The material location must be set at BeforeTranslucency.

### `unreal.ComposurePostProcessPassPolicy`
Inherits: `Object` | Header: `ComposurePostProcessingPassProxy.h`

Abstract base class for setting up post passes. Used in conjuntion with UComposurePostProcessingPassProxy.

**Methods** (1):
  - `setup_post_process(scene_capture)` -> `MaterialInterface` — Setup Post Process

### `unreal.ComposureTonemapperPass`
Inherits: `ComposurePostProcessPass` | Header: `ComposureTonemapperPass.h`

Tonemapper only pass implemented on top of the in-engine tonemapper.

**Methods** (1):
  - `tonemap_to_render_target()` -> `None` — Tone map the input into the output.

**Properties** (3):
  - `chromatic_aberration`: `float` — [Read-Write] in percent, Scene chromatic aberration / color fringe (camera imperfection) to simulate...
  - `color_grading_settings`: `ColorGradingSettings` — [Read-Write] Color grading settings. (ColorGradingSettings)
  - `film_stock_settings`: `FilmStockSettings` — [Read-Write] Film stock settings. (FilmStockSettings)

### `unreal.ComposureTonemapperPassPolicy`
Inherits: `ComposurePostProcessPassPolicy` | Header: `ComposureTonemapperPass.h`

Tonemapper only rules used for configuring how UComposurePostProcessingPassProxy executes

**Properties** (3):
  - `chromatic_aberration`: `float` — [Read-Write] in percent, Scene chromatic aberration / color fringe (camera imperfection) to simulate...
  - `color_grading_settings`: `ColorGradingSettings` — [Read-Write] Color grading settings. (ColorGradingSettings)
  - `film_stock_settings`: `FilmStockSettings` — [Read-Write] Film stock settings. (FilmStockSettings)

### `unreal.EXRFileCompositingOutput`
Inherits: `CompositingElementOutput` | Header: `CompositingElementOutputs.h`

EXRFile Compositing Output

**Properties** (4):
  - `compression`: `ExrCompressionOptions` — [Read-Write] (ExrCompressionOptions)
  - `filename_format`: `str` — [Read-Write] The format to use for the resulting filename. Extension will be added automatically. An...
  - `output_directiory`: `DirectoryPath` — [Read-Write] (DirectoryPath)
  - `output_frame_rate`: `FrameRate` — [Read-Write] (FrameRate)

### `unreal.MediaTextureCompositingInput`
Inherits: `CompositingMediaInput` | Header: `CompositingElementInputs.h`

Media Texture Compositing Input

**Properties** (1):
  - `media_source`: `MediaTexture` [Read-Only] — [Read-Only] (MediaTexture)

### `unreal.MovieSceneComposureExportClient`
Inherits: `Interface` | Header: `IMovieSceneComposureExportClient.h`

Movie Scene Composure Export Client

**Methods** (1):
  - `initialize_for_export(export_initializer)` -> `None` — Initialize this object for export by setting up any of the necessary scene view extensions with the specified initialize...

### `unreal.MovieSceneComposureExportInitializer`
Inherits: `Object` | Header: `MovieSceneComposureExportSectionTemplate.h`

Object passed to comp shot elements to initialize them for export. Currenly only allows scene captures to initialize a new extension that can capture GBuffers and other buffer visualization targets

**Methods** (1):
  - `export_scene_capture_buffers(comp_shot_element, scene_capture, buffers_to_export)` -> `None` — Initialize the export to capture the specified named buffer visualization targets from a scene capture

### `unreal.MovieSceneComposureExportSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneComposureExportTrack.h`

Movie Scene Composure Export Section

### `unreal.MovieSceneComposureExportTrack`
Inherits: `MovieSceneTrack` | Header: `MovieSceneComposureExportTrack.h`

Movie scene track that exports a single pass (either the elementâs output, or an internal transform pass) during burnouts

### `unreal.MovieSceneComposurePostMoveSettingsSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneComposurePostMoveSettingsSection.h`

A movie scene section for animating FComposurePostMoveSettings properties.

### `unreal.MovieSceneComposurePostMoveSettingsTrack`
Inherits: `MovieScenePropertyTrack` | Header: `MovieSceneComposurePostMoveSettingsTrack.h`

A track for animating FComposurePostMoveSettings properties.

### `unreal.MultiPassChromaKeyer`
Inherits: `CompositingElementTransform` | Header: `CompositingElementTransforms.h`

Multi Pass Chroma Keyer

**Properties** (2):
  - `key_colors`: `None` [Read-Only] — [Read-Only] (Array[LinearColor])
  - `keyer_material`: `CompositingMaterial` [Read-Only] — [Read-Only] (CompositingMaterial)

### `unreal.MultiPassDespill`
Inherits: `CompositingElementTransform` | Header: `CompositingElementTransforms.h`

Multi Pass Despill

**Properties** (2):
  - `key_colors`: `None` [Read-Only] — [Read-Only] (Array[LinearColor])
  - `keyer_material`: `CompositingMaterial` [Read-Only] — [Read-Only] (CompositingMaterial)

### `unreal.PlayerCompOutputCameraModifier`
Inherits: `CameraModifier` | Header: `PlayerViewportCompositingOutput.h`

UPlayerCompOutputCameraModifier

### `unreal.PlayerViewportCompositingOutput`
Inherits: `ColorConverterOutputPass` | Header: `PlayerViewportCompositingOutput.h`

UPlayerViewportCompositingOutput

### `unreal.RenderTargetCompositingOutput`
Inherits: `CompositingElementOutput` | Header: `CompositingElementOutputs.h`

Render Target Compositing Output

**Properties** (1):
  - `render_target`: `TextureRenderTarget2D` — [Read-Write] (TextureRenderTarget2D)

### `unreal.ExrCompressionOptions`
Inherits: `EnumBase` | Header: `CompositingElementOutputs.h`

UEXRFileCompositingOutput

**Properties** (2):
  - `COMPRESSED`: `ExrCompressionOptions = Ellipsis` — 0
  - `UNCOMPRESSED`: `ExrCompressionOptions = Ellipsis` — 1

### `unreal.InheritedSourceType`
Inherits: `EnumBase` | Header: `CompositingElement.h`

EInherited Source Type

**Properties** (2):
  - `INHERITED`: `InheritedSourceType = Ellipsis` — 0
  - `OVERRIDE`: `InheritedSourceType = Ellipsis` — 1

### `unreal.ParamType`
Inherits: `EnumBase` | Header: `CompositingMaterialPass.h`

FNamedCompMaterialParam

**Properties** (5):
  - `MEDIA_TEXTURE_PARAM`: `ParamType = Ellipsis` — 4
  - `SCALAR_PARAM`: `ParamType = Ellipsis` — 1
  - `TEXTURE_PARAM`: `ParamType = Ellipsis` — 3
  - `UNKNOWN_PARAM_TYPE`: `ParamType = Ellipsis` — 0
  - `VECTOR_PARAM`: `ParamType = Ellipsis` — 2

### `unreal.SceneCameraLinkType`
Inherits: `EnumBase` | Header: `CompositingElement.h`

EScene Camera Link Type

**Properties** (3):
  - `INHERITED`: `SceneCameraLinkType = Ellipsis` — 0
  - `OVERRIDE`: `SceneCameraLinkType = Ellipsis` — 1
  - `UNUSED`: `SceneCameraLinkType = Ellipsis` — 2

### `unreal.TargetUsageFlags`
Inherits: `EnumBase` | Header: `CompositingElement.h`

ETarget Usage Flags

**Properties** (5):
  - `USAGE_INPUT`: `TargetUsageFlags = Ellipsis` — 1
  - `USAGE_NONE`: `TargetUsageFlags = Ellipsis` — 0
  - `USAGE_OUTPUT`: `TargetUsageFlags = Ellipsis` — 4
  - `USAGE_PERSISTENT`: `TargetUsageFlags = Ellipsis` — 32
  - `USAGE_TRANSFORM`: `TargetUsageFlags = Ellipsis` — 2

### `unreal.DynamicOnFinalPassRendered`
Inherits: `MulticastDelegateBase` | Header: `CompositingElement.h`

Dynamic on Final Pass Rendered Delegate Signature

### `unreal.DynamicOnTransformPassRendered`
Inherits: `MulticastDelegateBase` | Header: `CompositingElement.h`

Dynamic on Transform Pass Rendered Delegate Signature

### `unreal.OnPixelPicked`
Inherits: `MulticastDelegateBase` | Header: `CompositingEditorSupportLibrary.h`

UCompositingPickerAsyncTask
