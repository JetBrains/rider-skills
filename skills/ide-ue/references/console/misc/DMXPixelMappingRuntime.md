# UE Python API — DMXPixelMappingRuntime Module

**25 types** from the `DMXPixelMappingRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXPixelMappingLayoutToken`, `DMXModulator_PixelMappingFrameDelay`, `DMXPixelMapping`, `DMXPixelMappingActor`, `DMXPixelMappingBaseComponent`, `DMXPixelMappingColorSpace`, `DMXPixelMappingFixtureGroupComponent`, `DMXPixelMappingFixtureGroupItemComponent`, `DMXPixelMappingLayoutScript`, `DMXPixelMappingLayoutScript_GridLayout`, `DMXPixelMappingLayoutScript_LayoutByMVR`, `DMXPixelMappingMatrixCellComponent`, `DMXPixelMappingMatrixComponent`, `DMXPixelMappingOutputComponent`, `DMXPixelMappingOutputDMXComponent`, `DMXPixelMappingRendererComponent`, `DMXPixelMappingRootComponent`, `DMXPixelMappingScreenComponent`, `DMXPixelMappingSubsystem`, `DMXPixelMappingGamma_RGBCMY`, ... (25 total)

---

## Classes

### `unreal.DMXPixelMappingLayoutToken`
Inherits: `StructBase` | Header: `DMXPixelMappingLayoutScript.h`

The position and size of a comoponent in a layout.

**Properties** (7):
  - `component`: `DMXPixelMappingOutputComponent` — [Read-Write] The output component to which the token is applied (DMXPixelMappingOutputComponent)
  - `fixture_id`: `int` [Read-Only] — [Read-Only] The Fixture ID of the Componentâs Fixture Patch, or 0 if the component has no Fixture ...
  - `position_x`: `float` — [Read-Write] The position of the component on the X-Axis (float)
  - `position_y`: `float` — [Read-Write] The position of the component on the Y-Axis (float)
  - `relative_rotation`: `float` — [Read-Write] The rotation relative to the parent the component, applied after position (double)
  - `size_x`: `float` — [Read-Write] The size of the component on the X-Axis (float)
  - `size_y`: `float` — [Read-Write] The size of the component on the Y-Axis (float)

### `unreal.DMXModulator_PixelMappingFrameDelay`
Inherits: `DMXModulator` | Header: `DMXModulator_PixelMappingFrameDelay.h`

Delays the incoming singal by number of Delay Frames. Only useful for PixelMapping and constant frame rates.

**Properties** (1):
  - `delay_frames`: `int` — [Read-Write] The time by which signals are delayed in Seconds (int32)

### `unreal.DMXPixelMapping`
Inherits: `Object` | Header: `DMXPixelMapping.h`

DMX Pixel Mapping.

**Methods** (1):
  - `get_root_component()` -> `DMXPixelMappingRootComponent` — Get root component of the component tree

### `unreal.DMXPixelMappingActor`
Inherits: `Actor` | Header: `DMXPixelMappingActor.h`

Actor class for DMX Pixel Mapping

**Methods** (5):
  - `is_sending_dmx()` -> `bool` — Returns true if the asset is playing DMX
  - `pause_sending_dmx()` -> `None` — Pause sending DMX
  - `set_stop_mode(reset_mode)` -> `None` — Sets how the pixel mapping asset resets the channels it sends to when Stop Sending DMX is called
  - `start_sending_dmx()` -> `None` — Starts sending DMX
  - `stop_sending_dmx()` -> `None` — Stop sending DMX.

### `unreal.DMXPixelMappingBaseComponent`
Inherits: `Object` | Header: `DMXPixelMappingBaseComponent.h`

Base class for all DMX Pixel Mapping components.

**Methods** (4):
  - `render()` -> `None` — Renders this component and all children
  - `render_and_send_dmx()` -> `None` — Render downsample texture and send DMX for this component and all children
  - `reset_dmx(reset_mode = DMXPixelMappingResetDMXMode.SEND_DEFAULT_VALUES)` -> `None` — Reset all sending DMX channels to 0 for this component and all children
  - `send_dmx()` -> `None` — Send DMX values of this component and all children.

**Properties** (1):
  - `parent`: `DMXPixelMappingBaseComponent` — [Read-Write] Parent component
deprecated: Leads to entangled references. Use GetParent() or WeakPare...

### `unreal.DMXPixelMappingColorSpace`
Inherits: `Object` | Header: `DMXPixelMappingColorSpace.h`

Base class for Pixel Mapping Color Spaces. Note, implementations must be thread-safe.

### `unreal.DMXPixelMappingFixtureGroupComponent`
Inherits: `DMXPixelMappingOutputComponent` | Header: `DMXPixelMappingFixtureGroupComponent.h`

Container component for Fixture Items

**Properties** (1):
  - `dmx_library`: `DMXLibrary` [Read-Only] — [Read-Only] (DMXLibrary)

### `unreal.DMXPixelMappingFixtureGroupItemComponent`
Inherits: `DMXPixelMappingOutputDMXComponent` | Header: `DMXPixelMappingFixtureGroupItemComponent.h`

A component that holds a single Fixture Patch in the Pixel Mapping, and actually sends DMX.

**Properties** (13):
  - `attribute_b`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `attribute_b_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_b_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_g`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `attribute_g_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_g_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_r`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `attribute_r_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_r_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `color_mode`: `DMXColorMode` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `monochrome_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `monochrome_intensity`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `monochrome_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...

### `unreal.DMXPixelMappingLayoutScript`
Inherits: `Object` | Header: `DMXPixelMappingLayoutScript.h`

Allows scripting of Pixel Mapping Component Layouts. Override the Layout function to implement a layout.

**Methods** (1):
  - `layout(tokens)` -> `Array [ DMXPixelMappingLayoutToken ]` — Lays out children of the selection according to OutTokens. Tokens that are not returned remain unchanged. Called when th...

**Properties** (5):
  - `num_tokens`: `int` [Read-Only] — [Read-Only] The number of tokens in the Layout. (int32)
  - `parent_component_position`: `Vector2D` [Read-Only] — [Read-Only] The position of the parent component where the components that are being layouted reside...
  - `parent_component_size`: `Vector2D` [Read-Only] — [Read-Only] The size of the parent component where the components that are being layouted reside in....
  - `parent_rotation`: `float` [Read-Only] — [Read-Only] The rotation of the parent component where the components that are being layouted reside...
  - `texture_size`: `Vector2D` [Read-Only] — [Read-Only] The size of the texture this component is mapping. (Vector2D)

### `unreal.DMXPixelMappingLayoutScript_GridLayout`
Inherits: `DMXPixelMappingLayoutScript` | Header: `DMXPixelMappingLayoutScript_GridLayout.h`

Arranges the components in a grid

### `unreal.DMXPixelMappingLayoutScript_LayoutByMVR`
Inherits: `DMXPixelMappingLayoutScript` | Header: `DMXPixelMappingLayoutScript_LayoutByMVR.h`

Arranges the components given their coordinates in the DMX Libraryâs MVR specs

### `unreal.DMXPixelMappingMatrixCellComponent`
Inherits: `DMXPixelMappingOutputComponent` | Header: `DMXPixelMappingMatrixCellComponent.h`

Matrix pixel component

**Properties** (1):
  - `cell_id`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.DMXPixelMappingMatrixComponent`
Inherits: `DMXPixelMappingOutputDMXComponent` | Header: `DMXPixelMappingMatrixComponent.h`

DMX Matrix group component

**Properties** (13):
  - `attribute_b`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `attribute_b_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_b_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_g`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `attribute_g_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_g_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_r`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `attribute_r_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `attribute_r_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `color_mode`: `DMXColorMode` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `monochrome_expose`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...
  - `monochrome_intensity`: `DMXAttributeName` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (D...
  - `monochrome_invert`: `bool` — [Read-Write]
deprecated: Deprecated in favor of DMXPixelMappingColorSpace. See ColorSpace member. (b...

### `unreal.DMXPixelMappingOutputComponent`
Inherits: `DMXPixelMappingBaseComponent` | Header: `DMXPixelMappingOutputComponent.h`

Base class for all Designer and configurable components

**Properties** (8):
  - `editor_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `lock_in_designer`: `bool` [Read-Only] — [Read-Only] (bool)
  - `position_x`: `float` [Read-Only] — [Read-Only] (float)
  - `position_y`: `float` [Read-Only] — [Read-Only] (float)
  - `rotation`: `float` [Read-Only] — [Read-Only] (double)
  - `size_x`: `float` [Read-Only] — [Read-Only] (float)
  - `size_y`: `float` [Read-Only] — [Read-Only] (float)
  - `visible_in_designer`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.DMXPixelMappingOutputDMXComponent`
Inherits: `DMXPixelMappingOutputComponent` | Header: `DMXPixelMappingOutputDMXComponent.h`

Base class for components that contain a fixture patch to send DMX.

**Methods** (1):
  - `render_with_input_and_send_dmx()` -> `None` — Render with Input and Send DMX deprecated: Deprecated for performance reasons. Instead use âGet DMX Pixel Mapping Rend...

**Properties** (4):
  - `cell_blending_quality`: `DMXPixelBlendingQuality` [Read-Only] — [Read-Only] The quality level to use when averaging colors during downsampling. (DMXPixelBlendingQua...
  - `fixture_patch_ref`: `DMXEntityFixturePatchRef` [Read-Only] — [Read-Only] (DMXEntityFixturePatchRef)
  - `modulator_classes`: `None` [Read-Only] — [Read-Only] Modulators applied to the output before sending DMX (Array[type(Class)])
  - `use_patch_color`: `bool` [Read-Only] — [Read-Only] If set, the color of the patch is displayed, instead of a custom editor color (bool)

### `unreal.DMXPixelMappingRendererComponent`
Inherits: `DMXPixelMappingOutputComponent` | Header: `DMXPixelMappingRendererComponent.h`

Component for rendering input texture.

**Methods** (1):
  - `get_pixel_mapping_component_modulators(fixture_patch_ref)` -> `Array[DMXModulator] or None` — Returns the Modulators of the component corresponding to the patch specified. Note, this node does a lookup on all fixtu...

**Properties** (6):
  - `brightness`: `float` — [Read-Write] The exposure of the pixel mapping renderer. This property affects the DMX output. (floa...
  - `input_material`: `MaterialInterface` [Read-Only] — [Read-Only] The material used for pixel mapping (MaterialInterface)
  - `input_texture`: `Texture` [Read-Only] — [Read-Only] The texture used for pixel mapping (Texture)
  - `input_widget`: `Class` [Read-Only] — [Read-Only] The UMG widget used for pixel mapping (type(Class))
  - `pixel_format`: `DMXPixelMappingRendererPixelFormat` [Read-Only] — [Read-Only] The dynamic range of the renderer (DMXPixelMappingRendererPixelFormat)
  - `renderer_type`: `DMXPixelMappingRendererType` [Read-Only] — [Read-Only] Selects the input type. It can be a Texture, a Material or a User Widget. (DMXPixelMappi...

### `unreal.DMXPixelMappingRootComponent`
Inherits: `DMXPixelMappingBaseComponent` | Header: `DMXPixelMappingRootComponent.h`

Root component in the components tree

### `unreal.DMXPixelMappingScreenComponent`
Inherits: `DMXPixelMappingOutputDMXComponent` | Header: `DMXPixelMappingScreenComponent.h`

DMXPixel Mapping Screen Component

**Properties** (16):
  - `alpha_intensity`: `float` [Read-Only] — [Read-Only] (float)
  - `distribution`: `DMXPixelMappingDistribution` [Read-Only] — [Read-Only] (DMXPixelMappingDistribution)
  - `ignore_alpha_channel`: `bool` [Read-Only] — [Read-Only] (bool)
  - `local_universe`: `int` [Read-Only] — [Read-Only] (int32)
  - `num_x_cells`: `int` [Read-Only] — [Read-Only] (int32)
  - `num_x_panels`: `int` — ânum_x_panelsâ was renamed to ânum_x_cellsâ. deprecated
  - `num_y_cells`: `int` [Read-Only] — [Read-Only] (int32)
  - `num_y_panels`: `int` — ânum_y_panelsâ was renamed to ânum_y_cellsâ. deprecated
  - `output_port_references`: `None` — [Read-Write] The port this render component outputs to (Array[DMXOutputPortReference])
  - `pixel_format`: `DMXCellFormat` [Read-Only] — [Read-Only] (DMXCellFormat)
  - `pixel_intensity`: `float` [Read-Only] — [Read-Only] (float)
  - `protocol_name`: `DMXProtocolName` — [Read-Write]
deprecated: Use Output Ports instead. (DMXProtocolName)
  - `send_to_all_output_ports`: `bool` — [Read-Write] If true, outputs to all DMX Output Ports (bool)
  - `show_addresses`: `bool` [Read-Only] — [Read-Only] (bool)
  - `show_universe`: `bool` [Read-Only] — [Read-Only] (bool)
  - `start_address`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.DMXPixelMappingSubsystem`
Inherits: `EngineSubsystem` | Header: `DMXPixelMappingSubsystem.h`

DMXPixel Mapping Subsystem

**Methods** (1):
  - `get_dmx_pixel_mapping(pixel_mapping)` -> `DMXPixelMapping` — Load Pixel Mapping asset

### `unreal.DMXPixelMappingGamma_RGBCMY`
Inherits: `EnumBase` | Header: `DMXPixelMappingColorSpace_RGBCMY.h`

The gamma mode of the DMX output

**Properties** (3):
  - `AS_OUTPUT_COLOR_SPACE`: `DMXPixelMappingGamma_RGBCMY = Ellipsis` — 1
  - `CUSTOM`: `DMXPixelMappingGamma_RGBCMY = Ellipsis` — 2
  - `LINEAR`: `DMXPixelMappingGamma_RGBCMY = Ellipsis` — 0

### `unreal.DMXPixelMappingLuminanceType_RGBCMY`
Inherits: `EnumBase` | Header: `DMXPixelMappingColorSpace_RGBCMY.h`

Defines how the luminance channel (typically Dimmer) is generated

**Properties** (4):
  - `CONSTANT`: `DMXPixelMappingLuminanceType_RGBCMY = Ellipsis` — 1
  - `FROM_ALPHA`: `DMXPixelMappingLuminanceType_RGBCMY = Ellipsis` — 2
  - `FROM_COLOR`: `DMXPixelMappingLuminanceType_RGBCMY = Ellipsis` — 0
  - `NONE`: `DMXPixelMappingLuminanceType_RGBCMY = Ellipsis` — 3

### `unreal.DMXPixelMappingMVRProjectionPlane`
Inherits: `EnumBase` | Header: `DMXPixelMappingLayoutScript_LayoutByMVR.h`

Defines which MVR coordinates are projected to a Pixel Mapping Layout

**Properties** (6):
  - `XY`: `DMXPixelMappingMVRProjectionPlane = Ellipsis` — 0
  - `XZ`: `DMXPixelMappingMVRProjectionPlane = Ellipsis` — 1
  - `YX`: `DMXPixelMappingMVRProjectionPlane = Ellipsis` — 3
  - `YZ`: `DMXPixelMappingMVRProjectionPlane = Ellipsis` — 2
  - `ZX`: `DMXPixelMappingMVRProjectionPlane = Ellipsis` — 4
  - `ZY`: `DMXPixelMappingMVRProjectionPlane = Ellipsis` — 5

### `unreal.DMXPixelMappingOutputColorSpace_RGBCMY`
Inherits: `EnumBase` | Header: `DMXPixelMappingColorSpace_RGBCMY.h`

The color space of the DMX output

**Properties** (5):
  - `P3D65`: `DMXPixelMappingOutputColorSpace_RGBCMY = Ellipsis` — 3
  - `P3DCI`: `DMXPixelMappingOutputColorSpace_RGBCMY = Ellipsis` — 2
  - `PLASA`: `DMXPixelMappingOutputColorSpace_RGBCMY = Ellipsis` — 4
  - `REC2020`: `DMXPixelMappingOutputColorSpace_RGBCMY = Ellipsis` — 1
  - `S_RGB`: `DMXPixelMappingOutputColorSpace_RGBCMY = Ellipsis` — 0

### `unreal.DMXPixelMappingRendererPixelFormat`
Inherits: `EnumBase` | Header: `DMXPixelMappingRendererComponent.h`

EDMXPixel Mapping Renderer Pixel Format

**Properties** (3):
  - `AUTO`: `DMXPixelMappingRendererPixelFormat = Ellipsis` — Use the format of the Input Texture, use 8-bit for Input Materials and UMG. 0
  - `RGBA16F`: `DMXPixelMappingRendererPixelFormat = Ellipsis` — 2
  - `RGBA8`: `DMXPixelMappingRendererPixelFormat = Ellipsis` — 1

### `unreal.DMXPixelMappingResetDMXMode`
Inherits: `EnumBase` | Header: `DMXPixelMappingBaseComponent.h`

EDMXPixel Mapping Reset DMXMode

**Properties** (3):
  - `DO_NOT_SEND_VALUES`: `DMXPixelMappingResetDMXMode = Ellipsis` — 2
  - `SEND_DEFAULT_VALUES`: `DMXPixelMappingResetDMXMode = Ellipsis` — 0
  - `SEND_ZERO_VALUES`: `DMXPixelMappingResetDMXMode = Ellipsis` — 1
