# UE Python API — TextureGraph Module

**50 types** from the `TextureGraph` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GradientDir_TS`, `PatternMaskBevel_TS`, `PatternMaskCutout_TS`, `PatternMaskJitter_TS`, `PatternMaskPlacement_TS`, `TG_LevelsSettings`, `TG_Material`, `TG_OutputSettings`, `TG_Texture`, `TG_TextureDescriptor`, `TG_Variant`, `TextureGraph`, `TextureGraphBase`, `TextureGraphInstance`, `TextureScreptingLibrary`, `TG_AsyncExportTask`, `TG_AsyncRenderTask`, `TG_AsyncRenderTaskBase`, `TG_AsyncTask`, `TG_Expression`, ... (50 total)

---

## Classes

### `unreal.GradientDir_TS`
Inherits: `StructBase` | Header: `TG_Expression_Pattern.h`

Gradient Dir TS

**Properties** (2):
  - `x`: `float` — [Read-Write] Gradient value along X-axis in degrees [0, 90] (float)
  - `y`: `float` — [Read-Write] Gradient value along Y-axis in degrees [-180, 180] (float)

### `unreal.PatternMaskBevel_TS`
Inherits: `StructBase` | Header: `TG_Expression_Pattern.h`

Pattern Mask Bevel TS

**Properties** (2):
  - `bevel`: `float` — [Read-Write] The bevel value (float)
  - `bevel_curve`: `float` — [Read-Write] The bevel curve (float)

### `unreal.PatternMaskCutout_TS`
Inherits: `StructBase` | Header: `TG_Expression_Pattern.h`

Pattern Mask Cutout TS

**Properties** (2):
  - `cutoff_seed`: `float` — [Read-Write] The seed to control the cutoff randomness. 0 means no randomness (float)
  - `cutoff_threshold`: `float` — [Read-Write] The cutoff value (float)

### `unreal.PatternMaskJitter_TS`
Inherits: `StructBase` | Header: `TG_Expression_Pattern.h`

Pattern Mask Jitter TS

**Properties** (13):
  - `angle_seed`: `int` — [Read-Write] Seed to control the angle randomness. 0 means no randomness (int32)
  - `angle_x_amount`: `float` — [Read-Write] Amount of angle along the X-axis (float)
  - `angle_y_amount`: `float` — [Read-Write] Amount of angle along the Y-axis (float)
  - `brightness_amount`: `float` — [Read-Write] Jitter brightness amount (float)
  - `brightness_seed`: `int` — [Read-Write] Seed to control the brightness randomness. 0 means no randomness (int32)
  - `brightness_threshold`: `float` — [Read-Write] Jitter brightness threshold (float)
  - `size_amount`: `float` — [Read-Write] Size of the jitter (float)
  - `size_seed`: `int` — [Read-Write] Seed to control the size randomness. 0 means no randomness (int32)
  - `size_threshold`: `float` — [Read-Write] Size threshold (float)
  - `tilt_seed`: `int` — [Read-Write] Seed to control the tilt randomness. 0 means no randomness (int32)
  - `tilt_threshold`: `float` — [Read-Write] Tilt threshold (float)
  - `tilt_x_amount`: `float` — [Read-Write] Amount of tilt along the X-axis (float)
  - `tilt_y_amount`: `float` — [Read-Write] Amount of tilt along the Y-axis (float)

### `unreal.PatternMaskPlacement_TS`
Inherits: `StructBase` | Header: `TG_Expression_Pattern.h`

Pattern Mask Placement TS

**Properties** (6):
  - `offset`: `float` — [Read-Write] The offset offset of the pattern (float)
  - `offset_horizontal`: `bool` — [Read-Write] Whether itâs a horizontal or a vertical offset (bool)
  - `repeat_x`: `int` — [Read-Write] The number of repetitions along the X-axis (int32)
  - `repeat_y`: `int` — [Read-Write] The number of repetitions along the Y-axis (int32)
  - `spacing_x`: `float` — [Read-Write] The spacing between each pattern along X-axis (float)
  - `spacing_y`: `float` — [Read-Write] The spacing between each pattern along Y-axis (float)

### `unreal.TG_LevelsSettings`
Inherits: `StructBase` | Header: `TG_Expression_Levels.h`

TG Levels Settings

### `unreal.TG_Material`
Inherits: `StructBase` | Header: `TG_Material.h`

TG Material

### `unreal.TG_OutputSettings`
Inherits: `StructBase` | Header: `TG_OutputSettings.h`

TG Output Settings

**Properties** (9):
  - `base_name`: `Name` — [Read-Write] Export name of the textured asset. (Name)
  - `compression`: `TextureCompressionSettings` — [Read-Write] Compression methods available for exporting textured asset. (TextureCompressionSettings...
  - `folder_path`: `Name` — [Read-Write] Export path for the textured asset. (Name)
  - `height`: `Resolution` — [Read-Write] Height of the texture in pixels. Auto means system will detect automatically based on o...
  - `lod_group`: `TextureGroup` — [Read-Write] The Level of detail group of the texture (TextureGroup)
  - `srgb`: `bool` — [Read-Write] Adjust the color space of exporting textured asset. Can be in Linear or Gamma color spa...
  - `texture_format`: `TG_TextureFormat` — [Read-Write] List of available texture formats. Auto means system will detect automatically based on...
  - `texture_preset_type`: `TG_TexturePresetType` — [Read-Write] List of available texture presets available for export. (TG_TexturePresetType)
  - `width`: `Resolution` — [Read-Write] Width of the texture in pixels. Auto means system will detect automatically based on ot...

### `unreal.TG_Texture`
Inherits: `StructBase` | Header: `TG_Texture.h`

TG Texture

### `unreal.TG_TextureDescriptor`
Inherits: `StructBase` | Header: `TG_Texture.h`

TG Texture Descriptor

**Properties** (6):
  - `format`: `TSBufferFormat` — [Read-Write] How many items of type BufferFormat per point
deprecated: Use Texture Format instead (T...
  - `height`: `Resolution` — [Read-Write] Height of the texture in pixels. Auto means system will detect automatically based on o...
  - `is_srgb`: `bool` — [Read-Write] (bool)
  - `num_channels`: `TSBufferChannels` — [Read-Write]
deprecated: Use Texture Format instead (TSBufferChannels)
  - `texture_format`: `TG_TextureFormat` — [Read-Write] UPROPERTY(EditAnywhere, Category = âTextureDescriptorâ, DisplayName = âTexture Fo...
  - `width`: `Resolution` — [Read-Write] Width of the texture in pixels. Auto means system will detect automatically based on ot...

### `unreal.TG_Variant`
Inherits: `StructBase` | Header: `TG_Variant.h`

Base class for making working with Variants easier and less repetitive

### `unreal.TextureGraph`
Inherits: `TextureGraphBase` | Header: `TextureGraph.h`

Texture Graph

### `unreal.TextureGraphBase`
Inherits: `MixInterface` | Header: `TextureGraph.h`

Texture Graph Base

### `unreal.TextureGraphInstance`
Inherits: `TextureGraphBase` | Header: `TextureGraph.h`

Texture Graph Instance

**Properties** (1):
  - `parent_texture_graph`: `TextureGraphBase` [Read-Only] — [Read-Only] Parent Texture Graph. (TextureGraphBase)

### `unreal.TextureScreptingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TG_BlueprintFunctionLibrary.h`

DECLARE_DYNAMIC_DELEGATE_OneParam(FOnTextureGraphRenderDone, UTextureRenderTarget2D*, Results); DECLARE_DELEGATE_TwoParams(FOnGroomBindingAssetBuildCompleteNative, UGroomBindingAsset*, EGroomBindingAs...

**Methods** (16):
  - `export_texture_graph(world_context_object, texture_graph, overwrite_textures = True, save = False, export_all = False)` -> `None` [classmethod] — Export texture graph.
  - `get_bool_parameter_value(world_context_object, texture_graph, parameter_name)` -> `bool` [classmethod] — Gets a string parameter value from the TextureGraph instance. Logs if ParameterName is invalid.
  - `get_color_parameter_value(world_context_object, texture_graph, parameter_name)` -> `LinearColor` [classmethod] — Gets a color parameter value from the TextureGraph instance. Logs if ParameterName is invalid.
  - `get_scalar_parameter_value(world_context_object, texture_graph, parameter_name)` -> `float` [classmethod] — Gets a scalar parameter value from the TextureGraph instance. Logs if ParameterName is invalid.
  - `get_settings_parameter_value(world_context_object, texture_graph, width=int32, height=int32)` [classmethod] — Gets a FTG_OutputSettings parameter value from the TextureGraph instance. Logs if ParameterName is invalid.
  - `get_string_parameter_value(world_context_object, texture_graph, parameter_name)` -> `str` [classmethod] — Gets a String parameter value from the TextureGraph instance. Logs if ParameterName is invalid.
  - `get_texture_parameter_value(world_context_object, texture_graph, parameter_name)` -> `Texture` [classmethod] — Gets a texture parameter value from the TextureGraph instance. Logs if ParameterName is invalid.
  - `get_vector_parameter_value(world_context_object, texture_graph, parameter_name)` -> `Vector4f` [classmethod] — Gets a Vector parameter value from the TextureGraph instance. Logs if ParameterName is invalid.
  - `render_texture_graph(world_context_object, texture_graph)` -> `Array [ TextureRenderTarget2D ]` [classmethod] — Render the texture graph and return an array of texture render targets.
  - `set_bool_parameter_value(world_context_object, texture_graph, parameter_name, parameter_value)` -> `None` [classmethod] — Sets a boolean parameter value on the TextureGraph instance. Logs if ParameterName is invalid.
  - `set_color_parameter_value(world_context_object, texture_graph, parameter_name, parameter_value)` -> `None` [classmethod] — Sets a color parameter value on the TextureGraph instance. Logs if ParameterName is invalid.
  - `set_scalar_parameter_value(world_context_object, texture_graph, parameter_name, parameter_value)` -> `None` [classmethod] — Sets a scalar parameter value on the TextureGraph instance. Logs if ParameterName is invalid.
  - `set_settings_parameter_value(world_context_object, texture_graph, parameter_name, width, height, file_name = 'None', path = 'None', format = TG_TextureFormat.BGRA8, texture_type = TG_TexturePresetType.NONE, lod_texture_group = TextureGroup.TEXTUREGROUP_WORLD, compression = TextureCompressionSettings.TC_DEFAULT, srgb = False)` -> `None` [classmethod] — Sets a FTG_OutputSettings parameter value on the TextureGraph instance. Logs if ParameterName is invalid.
  - `set_string_parameter_value(world_context_object, texture_graph, parameter_name, parameter_value)` -> `None` [classmethod] — Sets a string parameter value on the TextureGraph instance. Logs if ParameterName is invalid.
  - `set_texture_parameter_value(world_context_object, texture_graph, parameter_name, parameter_value)` -> `None` [classmethod] — Sets a Texture parameter value on the TextureGraph instance. Logs if ParameterName is invalid.
  - `set_vector_parameter_value(world_context_object, texture_graph, parameter_name, parameter_value)` -> `None` [classmethod] — Sets a Vector parameter value on the TextureGraph instance. Logs if ParameterName is invalid.

### `unreal.TG_AsyncExportTask`
Inherits: `TG_AsyncRenderTaskBase` | Header: `TG_AsyncExportTask.h`

TG Async Export Task

**Properties** (1):
  - `on_done`: `TSExportTaskDelegate` — [Read-Write] (TSExportTaskDelegate)

### `unreal.TG_AsyncRenderTask`
Inherits: `TG_AsyncRenderTaskBase` | Header: `TG_AsyncRenderTask.h`

TG Async Render Task

**Properties** (1):
  - `on_done`: `TSRenderTaskDelegate` — [Read-Write] (TSRenderTaskDelegate)

### `unreal.TG_AsyncRenderTaskBase`
Inherits: `TG_AsyncTask` | Header: `TG_AsyncRenderTask.h`

TG Async Render Task Base

### `unreal.TG_AsyncTask`
Inherits: `BlueprintAsyncActionBase` | Header: `TG_AsyncTask.h`

BlueprintCallable factory functions for Async TG_Script Actions. Helps regiser with TG_AsyncTaskManager to keep Task alive and manage its life cycle

### `unreal.TG_Expression`
Inherits: `Object` | Header: `TG_Expression.h`

TG Expression

### `unreal.TG_Expression_Blend`
Inherits: `TG_Expression` | Header: `TG_Expression_Blend.h`

TG Expression Blend

**Properties** (1):
  - `blend_mode`: `BlendModes` — [Read-Write] Blend mode determine how inputs texture mix together. (BlendModes)

### `unreal.TG_Expression_Blur`
Inherits: `TG_Expression` | Header: `TG_Expression_Blur.h`

TG Expression Blur

**Properties** (4):
  - `angle`: `float` — [Read-Write] Adjusting the angle changes the direction at which the blur effect is applied.â (floa...
  - `blur_type`: `BlurType` — [Read-Write] Style of blurring applied to a texture. (BlurType)
  - `radius`: `int` — [Read-Write] Controls how much an texture is blurred (int32)
  - `strength`: `float` — [Read-Write] Determines how intense the blurring effect is applied. Higher values result in stronger...

### `unreal.TG_Expression_ChannelSwizzle`
Inherits: `TG_Expression` | Header: `TG_Expression_ChannelSwizzle.h`

TG Expression Channel Swizzle

**Properties** (4):
  - `alpha_channel`: `ColorChannel` — [Read-Write] The output in the Alpha channel (ColorChannel)
  - `blue_channel`: `ColorChannel` — [Read-Write] The output in the Blue channel (ColorChannel)
  - `green_channel`: `ColorChannel` — [Read-Write] The output in the Green channel (ColorChannel)
  - `red_channel`: `ColorChannel` — [Read-Write] The output in the red channel (ColorChannel)

### `unreal.TG_Expression_EdgeDetect`
Inherits: `TG_Expression` | Header: `TG_Expression_EdgeDetect.h`

TG Expression Edge Detect

**Properties** (1):
  - `thickness`: `float` — [Read-Write] What is the thickness of the edge (float)

### `unreal.TG_Expression_ErodeDilate`
Inherits: `TG_Expression` | Header: `TG_Expression_ErodeDilate.h`

Type

**Properties** (2):
  - `kernel`: `ErodeDilateKernelType` — [Read-Write] The type of the kernel to use (ErodeDilateKernelType)
  - `type`: `ErodeOrDilate` — [Read-Write] Whether to erode or dilate (ErodeOrDilate)

### `unreal.TG_Expression_Gradient`
Inherits: `TG_Expression` | Header: `TG_Expression_Gradient.h`

TG Expression Gradient

**Properties** (8):
  - `center`: `Vector2f` — [Read-Write] The center of the radial gradient (Vector2f)
  - `interpolation`: `GradientInterpolation` — [Read-Write] Type of interpolation to use (GradientInterpolation)
  - `point1`: `Vector2f` — [Read-Write] First point of the line for axial gradients (Vector2f)
  - `point2`: `Vector2f` — [Read-Write] Second point of the line for axial gradients (Vector2f)
  - `radius`: `float` — [Read-Write] The center of the radial gradient (float)
  - `rotation`: `GradientRotation` — [Read-Write] Rotation of the gradient (GradientRotation)
  - `rotation_limited`: `GradientRotationLimited` — [Read-Write] Rotation of the gradient (GradientRotationLimited)
  - `type`: `GradientType` — [Read-Write] The type of the gradient function (GradientType)

### `unreal.TG_Expression_IfThenElse`
Inherits: `TG_Expression_Variant` | Header: `TG_Expression_IfThenElse.h`

Expression

**Properties** (2):
  - `comparison_type`: `IfThenElseType` — [Read-Write] The type of comparison to use. Individual = IndividualComponent of the components are i...
  - `operator`: `IfThenElseOperator` — [Read-Write] The type of operator in LHS <operator> RHS (IfThenElseOperator)

### `unreal.TG_Expression_InputParam`
Inherits: `TG_Expression` | Header: `TG_Expression_InputParam.h`

TG Expression Input Param

### `unreal.TG_Expression_Material`
Inherits: `TG_Expression_MaterialBase` | Header: `TG_Expression_Material.h`

TG Expression Material

**Properties** (2):
  - `material`: `MaterialInterface` — [Read-Write]
deprecated: Use the InputMaterial to specify the Material asset referenced (MaterialInt...
  - `rendered_attribute`: `Name` — [Read-Write] The Material attribute identifier among all the attributes of the material that is rend...

### `unreal.TG_Expression_MaterialBase`
Inherits: `TG_Expression` | Header: `TG_Expression_MaterialBase.h`

TG Expression Material Base

### `unreal.TG_Expression_MaterialFunction`
Inherits: `TG_Expression_MaterialBase` | Header: `TG_Expression_MaterialFunction.h`

TG Expression Material Function

**Properties** (1):
  - `material_function`: `MaterialFunctionInterface` — [Read-Write] The material function to employ for rendering (MaterialFunctionInterface)

### `unreal.TG_Expression_Noise`
Inherits: `TG_Expression` | Header: `TG_Expression_Noise.h`

TG Expression Noise

**Properties** (1):
  - `noise_type`: `NoiseType` — [Read-Write] The type of the noise function (NoiseType)

### `unreal.TG_Expression_OutputSettings`
Inherits: `TG_Expression` | Header: `TG_Expression_OutputSettings.h`

TG Expression Output Settings

**Properties** (1):
  - `settings`: `TG_OutputSettings` — [Read-Write] Settings will overwrite the Input values from another node (TG_OutputSettings)

### `unreal.TG_Expression_Pattern`
Inherits: `TG_Expression` | Header: `TG_Expression_Pattern.h`

TG Expression Pattern

**Properties** (6):
  - `bevel`: `PatternMaskBevel_TS` — [Read-Write] Bevel (PatternMaskBevel_TS)
  - `cutout`: `PatternMaskCutout_TS` — [Read-Write] Cut out (PatternMaskCutout_TS)
  - `gradient_direction`: `GradientDir_TS` — [Read-Write] Gradient direction (GradientDir_TS)
  - `jitter`: `PatternMaskJitter_TS` — [Read-Write] Jitter (PatternMaskJitter_TS)
  - `pattern_type`: `PatternType` — [Read-Write] The type of pattern (PatternType)
  - `placement`: `PatternMaskPlacement_TS` — [Read-Write] Placement (PatternMaskPlacement_TS)

### `unreal.TG_Expression_Shape`
Inherits: `TG_Expression` | Header: `TG_Expression_Shape.h`

TG Expression Shape

**Properties** (9):
  - `bevel_curve`: `float` — [Read-Write] Bevel curve is controlling the shape of bevelling varying from concave to linear to con...
  - `bevel_width`: `float` — [Read-Write] Bevel width is the distance from the outline of the shape on which the bevelling functi...
  - `height`: `float` — [Read-Write] Height representing the relative size of the shape in the generate texture. Height is u...
  - `orientation`: `float` — [Read-Write] Orientation is the 2D rotation of the shape around the center (float)
  - `polygon_num_sides`: `int` — [Read-Write] The number of sides of the Polygon (only relevant when using the <Polygon> type) (int32...
  - `rounding`: `float` — [Read-Write] Rounding is about the 2D footprint of the shape generated, 0 means the perfect shape, 1...
  - `shape_type`: `ShapeType` — [Read-Write] Select the geometric primitive shape to generate (ShapeType)
  - `show_sdf`: `float` — [Read-Write] Signed distance function the mathematical function defining the distance to the edge of...
  - `width`: `float` — [Read-Write] Width representing the relative size of the shape in the generated texture. For Circle/...

### `unreal.TG_Expression_Texture`
Inherits: `TG_Expression_InputParam` | Header: `TG_Expression_Texture.h`

TG Expression Texture

**Properties** (1):
  - `source`: `Texture` — [Read-Write] The source asset to be used to generate the Output (Texture)

### `unreal.TG_Expression_TexturePath`
Inherits: `TG_Expression_InputParam` | Header: `TG_Expression_TexturePath.h`

TG Expression Texture Path

**Properties** (1):
  - `path`: `str` — [Read-Write] Input file path of the texture. If the path is a directory then all files from that dir...

### `unreal.TG_Expression_Trigonometry`
Inherits: `TG_Expression_Variant` | Header: `TG_Expression_Maths_OneInput.h`

Trigonometry functions

**Properties** (1):
  - `function`: `TrigFunction` — [Read-Write] What trigonometric function to apply at the angle (TrigFunction)

### `unreal.TG_Expression_Variant`
Inherits: `TG_Expression` | Header: `TG_Expression_Variant.h`

An abstract class to help with the boilerplate of handling variants in general

### `unreal.TG_Expression_Warp`
Inherits: `TG_Expression` | Header: `TG_Expression_Warp.h`

Base warp class with common options

**Properties** (5):
  - `angle`: `float` — [Read-Write] Angle of the directional warp 0 - 360 degrees (float)
  - `intensity`: `float` — [Read-Write] What is the intensity of the warp. Warp of 1 is 10% (1/10th) of the width of the input ...
  - `phase_u`: `float` — [Read-Write] Phase X for the Sine wave warp (for U coordinate in UV space) (float)
  - `phase_v`: `float` — [Read-Write] Phase Y for the Sine wave warp (for V coordinate in UV space) (float)
  - `type`: `Warp` — [Read-Write] The type of warp that we want on the input image (Warp)

### `unreal.BlurType`
Inherits: `EnumBase` | Header: `TG_Expression_Blur.h`

EBlur Type

**Properties** (3):
  - `DIRECTIONAL`: `BlurType = Ellipsis` — 1
  - `GAUSSIAN`: `BlurType = Ellipsis` — 0
  - `RADIAL`: `BlurType = Ellipsis` — 2

### `unreal.DrawMaterialAttributeTarget`
Inherits: `EnumBase` | Header: `TG_Expression_MaterialBase.h`

Describe the possible attributes extracted from a MAterial during a DrawMaterial call this is used as high level data.

**Properties** (10):
  - `ANISOTROPY`: `DrawMaterialAttributeTarget = Ellipsis` — 4
  - `BASE_COLOR`: `DrawMaterialAttributeTarget = Ellipsis` — 0
  - `EMISSIVE`: `DrawMaterialAttributeTarget = Ellipsis` — 5
  - `METALLIC`: `DrawMaterialAttributeTarget = Ellipsis` — 1
  - `NORMAL`: `DrawMaterialAttributeTarget = Ellipsis` — 8
  - `OPACITY`: `DrawMaterialAttributeTarget = Ellipsis` — 6
  - `OPACITY_MASK`: `DrawMaterialAttributeTarget = Ellipsis` — 7
  - `ROUGHNESS`: `DrawMaterialAttributeTarget = Ellipsis` — 3
  - `SPECULAR`: `DrawMaterialAttributeTarget = Ellipsis` — 2
  - `TANGENT`: `DrawMaterialAttributeTarget = Ellipsis` — 9

### `unreal.ErodeDilateKernelType`
Inherits: `EnumBase` | Header: `TG_Expression_ErodeDilate.h`

Type

**Properties** (3):
  - `BOX`: `ErodeDilateKernelType = Ellipsis` — 0
  - `CIRCULAR`: `ErodeDilateKernelType = Ellipsis` — 1
  - `DIAMOND`: `ErodeDilateKernelType = Ellipsis` — 2

### `unreal.ErodeOrDilate`
Inherits: `EnumBase` | Header: `TG_Expression_ErodeDilate.h`

Type

**Properties** (2):
  - `DILATE`: `ErodeOrDilate = Ellipsis` — 1
  - `ERODE`: `ErodeOrDilate = Ellipsis` — 0

### `unreal.LevelsExpressionType`
Inherits: `EnumBase` | Header: `TG_Expression_Levels.h`

ELevels Expression Type

**Properties** (2):
  - `AUTO_LOW_HIGH`: `LevelsExpressionType = Ellipsis` — 1
  - `LOW_MID_HIGH`: `LevelsExpressionType = Ellipsis` — 0

### `unreal.NoiseType`
Inherits: `EnumBase` | Header: `TG_Expression_Noise.h`

ENoise Type

**Properties** (5):
  - `NOISETYPE_PERLIN`: `NoiseType = Ellipsis` — 1
  - `NOISETYPE_SIMPLEX`: `NoiseType = Ellipsis` — 0
  - `NOISETYPE_WORLEY1`: `NoiseType = Ellipsis` — 2
  - `NOISETYPE_WORLEY2`: `NoiseType = Ellipsis` — 3
  - `NOISETYPE_WORLEY3`: `NoiseType = Ellipsis` — 4

### `unreal.PatternType`
Inherits: `EnumBase` | Header: `TG_Expression_Pattern.h`

EPattern Type

**Properties** (4):
  - `CHECKER`: `PatternType = Ellipsis` — 2
  - `CIRCLE`: `PatternType = Ellipsis` — 1
  - `GRADIENT`: `PatternType = Ellipsis` — 3
  - `SQUARE`: `PatternType = Ellipsis` — 0

### `unreal.ShapeType`
Inherits: `EnumBase` | Header: `TG_Expression_Shape.h`

EShape Type

**Properties** (8):
  - `CIRCLE`: `ShapeType = Ellipsis` — 0
  - `ELLIPSE`: `ShapeType = Ellipsis` — 4
  - `HEXAGON`: `ShapeType = Ellipsis` — 6
  - `PENTAGON`: `ShapeType = Ellipsis` — 5
  - `POLYGON`: `ShapeType = Ellipsis` — 7
  - `RECTANGLE`: `ShapeType = Ellipsis` — 2
  - `SEGMENT`: `ShapeType = Ellipsis` — 1
  - `TRIANGLE`: `ShapeType = Ellipsis` — 3

### `unreal.TSExportTaskDelegate`
Inherits: `MulticastDelegateBase` | Header: `TG_AsyncExportTask.h`

TSExport Task Delegate Delegate Signature

### `unreal.TSRenderTaskDelegate`
Inherits: `MulticastDelegateBase` | Header: `TG_AsyncRenderTask.h`

TSRender Task Delegate Delegate Signature
