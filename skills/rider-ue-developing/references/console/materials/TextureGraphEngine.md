# UE Python API — TextureGraphEngine Module

**27 types** from the `TextureGraphEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InvalidationDetails`, `MaterialMappingInfo`, `ModelInvalidateInfo`, `ViewportSettings`, `MaterialManager`, `Mix`, `MixInterface`, `MixSettings`, `ModelObject`, `ProceduralMeshActor`, `StaticImageResource`, `BlendModes`, `ColorChannel`, `GradientInterpolation`, `GradientRotation`, `GradientRotationLimited`, `GradientType`, `IfThenElseOperator`, `IfThenElseType`, `Resolution`, ... (27 total)

---

## Classes

### `unreal.InvalidationDetails`
Inherits: `StructBase` | Header: `ModelObject.h`

Invalidation Details

### `unreal.MaterialMappingInfo`
Inherits: `StructBase` | Header: `ViewportSettings.h`

Material Mapping Info

### `unreal.ModelInvalidateInfo`
Inherits: `StructBase` | Header: `ModelObject.h`

Model Invalidate Info

**Properties** (1):
  - `trigger`: `ModelObject` [Read-Only] — [Read-Only] (ModelObject)

### `unreal.ViewportSettings`
Inherits: `StructBase` | Header: `ViewportSettings.h`

Viewport Settings

### `unreal.MaterialManager`
Inherits: `ModelObject` | Header: `MaterialManager.h`

Material Manager

### `unreal.Mix`
Inherits: `MixInterface` | Header: `Mix.h`

### `unreal.MixInterface`
Inherits: `ModelObject` | Header: `MixInterface.h`

Mix can now be saved as Mix or MixInstance. To support this functionality, we introduced the new class named MixInterface. This will be the base class for both Mix and MixInstance.

### `unreal.MixSettings`
Inherits: `Object` | Header: `MixSettings.h`

MixSettings: Collectively represents the settings of a particular mix. These can be specified on a per mix basis. However, they can be over-ridden on a per mix instance basis as well

**Properties** (2):
  - `channels`: `TSBufferChannels` — [Read-Write]
deprecated: Use Texture Format instead (TSBufferChannels)
  - `format`: `TSBufferFormat` — [Read-Write] How many channels per pixel.  Auto will take the number of channels from Input texture(...

### `unreal.ModelObject`
Inherits: `Object` | Header: `ModelObject.h`

This is the base class for all models that need to be loaded from or saved to the mix

### `unreal.ProceduralMeshActor`
Inherits: `Actor` | Header: `ProceduralMeshActor.h`

Procedural Mesh Actor

**Methods** (3):
  - `get_mesh_name()` -> `str` — Get Mesh Name
  - `set_mesh_name(name)` -> `None` — Set Mesh Name
  - `toggle_debug(debug_type)` -> `None` — Toggle Debug

**Properties** (2):
  - `mesh_obj`: `ProceduralMeshComponent` [Read-Only] — [Read-Only] (ProceduralMeshComponent)
  - `scene_capture_comp`: `SceneCaptureComponent2D` [Read-Only] — [Read-Only] (SceneCaptureComponent2D)

### `unreal.StaticImageResource`
Inherits: `ModelObject` | Header: `StaticImageResource.h`

Base static image resource class

### `unreal.BlendModes`
Inherits: `EnumBase` | Header: `BlendModes.h`

EBlend Modes

**Properties** (10):
  - `ADD`: `BlendModes = Ellipsis` — 1
  - `DIFFERENCE`: `BlendModes = Ellipsis` — 5
  - `DIVIDE`: `BlendModes = Ellipsis` — 4
  - `MAX`: `BlendModes = Ellipsis` — 6
  - `MIN`: `BlendModes = Ellipsis` — 7
  - `MULTIPLY`: `BlendModes = Ellipsis` — 3
  - `NORMAL`: `BlendModes = Ellipsis` — 0
  - `OVERLAY`: `BlendModes = Ellipsis` — 9
  - `STEP`: `BlendModes = Ellipsis` — 8
  - `SUBTRACT`: `BlendModes = Ellipsis` — 2

### `unreal.ColorChannel`
Inherits: `EnumBase` | Header: `T_Channel.h`

EColor Channel

**Properties** (4):
  - `ALPHA`: `ColorChannel = Ellipsis` — 3
  - `BLUE`: `ColorChannel = Ellipsis` — 2
  - `GREEN`: `ColorChannel = Ellipsis` — 1
  - `RED`: `ColorChannel = Ellipsis` — 0

### `unreal.GradientInterpolation`
Inherits: `EnumBase` | Header: `T_Gradient.h`

EGradient Interpolation

**Properties** (2):
  - `GTI_EXP`: `GradientInterpolation = Ellipsis` — 1
  - `GTI_LINEAR`: `GradientInterpolation = Ellipsis` — 0

### `unreal.GradientRotation`
Inherits: `EnumBase` | Header: `T_Gradient.h`

EGradient Rotation

**Properties** (4):
  - `GTR_0`: `GradientRotation = Ellipsis` — 0
  - `GTR_180`: `GradientRotation = Ellipsis` — 2
  - `GTR_270`: `GradientRotation = Ellipsis` — 3
  - `GTR_90`: `GradientRotation = Ellipsis` — 1

### `unreal.GradientRotationLimited`
Inherits: `EnumBase` | Header: `T_Gradient.h`

EGradient Rotation Limited

**Properties** (2):
  - `GTRL_0`: `GradientRotationLimited = Ellipsis` — 0
  - `GTRL_90`: `GradientRotationLimited = Ellipsis` — 1

### `unreal.GradientType`
Inherits: `EnumBase` | Header: `T_Gradient.h`

EGradient Type

**Properties** (5):
  - `GT_AXIAL_1`: `GradientType = Ellipsis` — 3
  - `GT_AXIAL_2`: `GradientType = Ellipsis` — 4
  - `GT_LINEAR_1`: `GradientType = Ellipsis` — 0
  - `GT_LINEAR_2`: `GradientType = Ellipsis` — 1
  - `GT_RADIAL`: `GradientType = Ellipsis` — 2

### `unreal.IfThenElseOperator`
Inherits: `EnumBase` | Header: `T_Maths_TwoInputs.h`

Comparison ops

**Properties** (6):
  - `EQ`: `IfThenElseOperator = Ellipsis` — 4
  - `GT`: `IfThenElseOperator = Ellipsis` — 0
  - `GTE`: `IfThenElseOperator = Ellipsis` — 1
  - `LT`: `IfThenElseOperator = Ellipsis` — 2
  - `LTE`: `IfThenElseOperator = Ellipsis` — 3
  - `NEQ`: `IfThenElseOperator = Ellipsis` — 5

### `unreal.IfThenElseType`
Inherits: `EnumBase` | Header: `T_Maths_TwoInputs.h`

EIf Then Else Type

**Properties** (3):
  - `ALL_COMPONENTS`: `IfThenElseType = Ellipsis` — 1
  - `GRAYSCALE`: `IfThenElseType = Ellipsis` — 2
  - `INDIVIDUAL_COMPONENT`: `IfThenElseType = Ellipsis` — 0

### `unreal.Resolution`
Inherits: `EnumBase` | Header: `MixSettings.h`

EResolution

**Properties** (12):
  - `AUTO`: `Resolution = Ellipsis` — 0
  - `RESOLUTION1024`: `Resolution = Ellipsis` — 1024
  - `RESOLUTION128`: `Resolution = Ellipsis` — 128
  - `RESOLUTION16`: `Resolution = Ellipsis` — 16
  - `RESOLUTION2048`: `Resolution = Ellipsis` — 2048
  - `RESOLUTION256`: `Resolution = Ellipsis` — 256
  - `RESOLUTION32`: `Resolution = Ellipsis` — 32
  - `RESOLUTION4096`: `Resolution = Ellipsis` — 4096
  - `RESOLUTION512`: `Resolution = Ellipsis` — 512
  - `RESOLUTION64`: `Resolution = Ellipsis` — 64
  - `RESOLUTION8`: `Resolution = Ellipsis` — 8
  - `RESOLUTION8192`: `Resolution = Ellipsis` — 8192

### `unreal.ShapeMaskType`
Inherits: `EnumBase` | Header: `T_ShapeMask.h`

EShape Mask Type

**Properties** (34):
  - `CIRCLE`: `ShapeMaskType = Ellipsis` — 0
  - `COUNT`: `ShapeMaskType = Ellipsis` — 33
  - `ELLIPSE`: `ShapeMaskType = Ellipsis` — 4
  - `HEXAGON`: `ShapeMaskType = Ellipsis` — 6
  - `PENTAGON`: `ShapeMaskType = Ellipsis` — 5
  - `RECT`: `ShapeMaskType = Ellipsis` — 2
  - `REGULAR_POLYGON_10`: `ShapeMaskType = Ellipsis` — 10
  - `REGULAR_POLYGON_11`: `ShapeMaskType = Ellipsis` — 11
  - `REGULAR_POLYGON_12`: `ShapeMaskType = Ellipsis` — 12
  - `REGULAR_POLYGON_13`: `ShapeMaskType = Ellipsis` — 13
  - `REGULAR_POLYGON_14`: `ShapeMaskType = Ellipsis` — 14
  - `REGULAR_POLYGON_15`: `ShapeMaskType = Ellipsis` — 15
  - `REGULAR_POLYGON_16`: `ShapeMaskType = Ellipsis` — 16
  - `REGULAR_POLYGON_17`: `ShapeMaskType = Ellipsis` — 17
  - `REGULAR_POLYGON_18`: `ShapeMaskType = Ellipsis` — 18
  - `REGULAR_POLYGON_19`: `ShapeMaskType = Ellipsis` — 19
  - `REGULAR_POLYGON_20`: `ShapeMaskType = Ellipsis` — 20
  - `REGULAR_POLYGON_21`: `ShapeMaskType = Ellipsis` — 21
  - `REGULAR_POLYGON_22`: `ShapeMaskType = Ellipsis` — 22
  - `REGULAR_POLYGON_23`: `ShapeMaskType = Ellipsis` — 23
  - `REGULAR_POLYGON_24`: `ShapeMaskType = Ellipsis` — 24
  - `REGULAR_POLYGON_25`: `ShapeMaskType = Ellipsis` — 25
  - `REGULAR_POLYGON_26`: `ShapeMaskType = Ellipsis` — 26
  - `REGULAR_POLYGON_27`: `ShapeMaskType = Ellipsis` — 27
  - `REGULAR_POLYGON_28`: `ShapeMaskType = Ellipsis` — 28
  - `REGULAR_POLYGON_29`: `ShapeMaskType = Ellipsis` — 29
  - `REGULAR_POLYGON_30`: `ShapeMaskType = Ellipsis` — 30
  - `REGULAR_POLYGON_31`: `ShapeMaskType = Ellipsis` — 31
  - `REGULAR_POLYGON_32`: `ShapeMaskType = Ellipsis` — 32
  - `REGULAR_POLYGON_7`: `ShapeMaskType = Ellipsis` — 7
  - `REGULAR_POLYGON_8`: `ShapeMaskType = Ellipsis` — 8
  - `REGULAR_POLYGON_9`: `ShapeMaskType = Ellipsis` — 9
  - `SEGMENT`: `ShapeMaskType = Ellipsis` — 1
  - `TRIANGLE`: `ShapeMaskType = Ellipsis` — 3

### `unreal.TG_TextureFormat`
Inherits: `EnumBase` | Header: `MixSettings.h`

ETG Texture Format

**Properties** (7):
  - `AUTO`: `TG_TextureFormat = Ellipsis` — 0
  - `BGRA8`: `TG_TextureFormat = Ellipsis` — 2
  - `G8`: `TG_TextureFormat = Ellipsis` — Auto number of channels are deduced automatically based on other channels within the graph UMETA(Hid...
  - `R16F`: `TG_TextureFormat = Ellipsis` — 3
  - `R32F`: `TG_TextureFormat = Ellipsis` — 5
  - `RGBA16F`: `TG_TextureFormat = Ellipsis` — 4
  - `RGBA32F`: `TG_TextureFormat = Ellipsis` — 6

### `unreal.TG_TexturePresetType`
Inherits: `EnumBase` | Header: `MixSettings.h`

ETG Texture Preset Type

**Properties** (8):
  - `DIFFUSE`: `TG_TexturePresetType = Ellipsis` — None exposes the other settings like srgb, compression and Lod Texture group*/ 1
  - `EMISSIVE`: `TG_TexturePresetType = Ellipsis` — 2
  - `FX`: `TG_TexturePresetType = Ellipsis` — 3
  - `MASK_COMP`: `TG_TexturePresetType = Ellipsis` — 5
  - `NONE`: `TG_TexturePresetType = Ellipsis` — 0
  - `NORMAL`: `TG_TexturePresetType = Ellipsis` — 4
  - `SPECULAR`: `TG_TexturePresetType = Ellipsis` — 6
  - `TANGENT`: `TG_TexturePresetType = Ellipsis` — 7

### `unreal.TrigFunction`
Inherits: `EnumBase` | Header: `T_Maths_OneInput.h`

Trigonometric functions

**Properties** (6):
  - `A_COS`: `TrigFunction = Ellipsis` — 4
  - `A_SIN`: `TrigFunction = Ellipsis` — 3
  - `A_TAN`: `TrigFunction = Ellipsis` — 5
  - `COS`: `TrigFunction = Ellipsis` — 1
  - `SIN`: `TrigFunction = Ellipsis` — 0
  - `TAN`: `TrigFunction = Ellipsis` — 2

### `unreal.TSBufferChannels`
Inherits: `EnumBase` | Header: `MixSettings.h`

ETSBuffer Channels

**Properties** (5):
  - `AUTO`: `TSBufferChannels = Ellipsis` — 0
  - `FOUR`: `TSBufferChannels = Ellipsis` — Three channels per pixel (e.g. RGB) 4
  - `ONE`: `TSBufferChannels = Ellipsis` — Auto number of channels are deduced automatically based on other channels within the graph 1
  - `THREE`: `TSBufferChannels = Ellipsis` — Two channels per pixel (e.g. RG = Red and Green only) 3
  - `TWO`: `TSBufferChannels = Ellipsis` — One channel per pixel (e.g. Red only) 2

### `unreal.TSBufferFormat`
Inherits: `EnumBase` | Header: `MixSettings.h`

ETSBuffer Format

**Properties** (4):
  - `AUTO`: `TSBufferFormat = Ellipsis` — -1
  - `BYTE`: `TSBufferFormat = Ellipsis` — Auto buffer format is deduced automatically based on other textures within the graph 0
  - `FLOAT`: `TSBufferFormat = Ellipsis` — Two bytes (half float) of data per channel 2
  - `HALF`: `TSBufferFormat = Ellipsis` — One byte of data per channel 1

### `unreal.Warp`
Inherits: `EnumBase` | Header: `T_Filter.h`

EWarp

**Properties** (3):
  - `DIRECTIONAL`: `Warp = Ellipsis` — 0
  - `NORMAL`: `Warp = Ellipsis` — 1
  - `SINE`: `Warp = Ellipsis` — 2
