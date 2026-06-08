# UE Python API — DMXRuntime Module

**108 types** from the `DMXRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXCell`, `DMXColorCIE`, `DMXEntityControllerRef`, `DMXEntityFixturePatchConstructionParams`, `DMXEntityFixturePatchRef`, `DMXEntityFixtureTypeConstructionParams`, `DMXEntityFixtureTypeRef`, `DMXEntityReference`, `DMXFixtureCellAttribute`, `DMXFixtureFunction`, `DMXFixtureMatrix`, `DMXFixtureMode`, `DMXImportGDTFActivationGroup`, `DMXImportGDTFAttribute`, `DMXImportGDTFBeam`, `DMXImportGDTFBreak`, `DMXImportGDTFChannelFunction`, `DMXImportGDTFChannelSet`, `DMXImportGDTFColorSpace`, `DMXImportGDTFCRIs`, ... (108 total)

---

## Classes

### `unreal.DMXCell`
Inherits: `StructBase` | Header: `DMXEntityFixtureType.h`

**Properties** (2):
  - `cell_id`: `int` — [Read-Write] The cell index in a 1D Array (row order), starting from 0 (int32)
  - `coordinate`: `IntPoint` — [Read-Write] The cell coordinate in a 2D Array, starting from (0, 0) (IntPoint)

### `unreal.DMXColorCIE`
Inherits: `StructBase` | Header: `DMXImport.h`

DMXColor CIE

### `unreal.DMXEntityControllerRef`
Inherits: `DMXEntityReference` | Header: `DMXEntityReference.h`

DMXEntity Controller Ref

### `unreal.DMXEntityFixturePatchConstructionParams`
Inherits: `StructBase` | Header: `DMXEntityFixturePatch.h`

Parameters to construct a Fixture Patch.

**Properties** (4):
  - `active_mode`: `int` [Read-Only] — [Read-Only] The index of the mode in the fixture type the fixture patch uses (int32)
  - `fixture_type_ref`: `DMXEntityFixtureTypeRef` [Read-Only] — [Read-Only] The fixture type of the newly constructed fixture patch (DMXEntityFixtureTypeRef)
  - `starting_address`: `int` — [Read-Write] Starting channel for when auto-assign address is false (int32)
  - `universe_id`: `int` — [Read-Write] The local universe of the fixture patch (int32)

### `unreal.DMXEntityFixturePatchRef`
Inherits: `DMXEntityReference` | Header: `DMXEntityReference.h`

Represents a Fixture Patch from a DMX Library. Used to store a reference to a Fixture Patch outside the DMX Library

### `unreal.DMXEntityFixtureTypeConstructionParams`
Inherits: `StructBase` | Header: `DMXEntityFixtureType.h`

Parameters to construct a Fixture Type.

**Properties** (3):
  - `dmx_category`: `DMXFixtureCategory` — [Read-Write] The Category of the Fixture, useful for Filtering (DMXFixtureCategory)
  - `modes`: `None` — [Read-Write] The Modes of the Fixture Type (Array[DMXFixtureMode])
  - `parent_dmx_library`: `DMXLibrary` — [Read-Write] The DMX Library in which the Fixture Type will be constructed (DMXLibrary)

### `unreal.DMXEntityFixtureTypeRef`
Inherits: `DMXEntityReference` | Header: `DMXEntityReference.h`

Represents a Fixture Type from a DMX Library. Used to store a reference to a Fixture Type outside the DMX Library

### `unreal.DMXEntityReference`
Inherits: `StructBase` | Header: `DMXEntityReference.h`

Represents an Entity from a DMX Library. Used to allow objects outside the DMX Library package to store references to UDMXEntity objects

### `unreal.DMXFixtureCellAttribute`
Inherits: `StructBase` | Header: `DMXEntityFixtureType.h`

DMXFixture Cell Attribute

**Properties** (5):
  - `attribute`: `DMXAttributeName` — [Read-Write] The Attribute name to map this Function to.
This is used to easily find the Function in...
  - `data_type`: `DMXFixtureSignalFormat` — [Read-Write] This functionâs data type. Defines the used number of channels (bytes) (DMXFixtureSig...
  - `default_value`: `int` — [Read-Write] Initial value for this function when no value is set (int64)
  - `description`: `str` — [Read-Write] (str)
  - `use_lsb_mode`: `bool` — [Read-Write] The Endianess of the Attribute:
Least Significant Byte mode makes the individual bytes ...

### `unreal.DMXFixtureFunction`
Inherits: `StructBase` | Header: `DMXEntityFixtureType.h`

DMXFixture Function

**Properties** (8):
  - `attribute`: `DMXAttributeName` — [Read-Write] The Attribute name to map this Function to.
This is used to easily find the Function in...
  - `channel`: `int` [Read-Only] — [Read-Only] This functionâs starting channel (use editor above to make changes) (int32)
  - `channel_offset`: `int` — [Read-Write]
deprecated: Deprecated, instead please refer to the Channel property. (int32)
  - `data_type`: `DMXFixtureSignalFormat` — [Read-Write] This functionâs data type. Defines the used number of channels (bytes) (DMXFixtureSig...
  - `default_value`: `int` — [Read-Write] The Default DMX Value of the function (int64)
  - `description`: `str` — [Read-Write] (str)
  - `function_name`: `str` — [Read-Write] (str)
  - `use_lsb_mode`: `bool` — [Read-Write] Least Significant Byte mode makes the individual bytes (channels) of the function be
in...

### `unreal.DMXFixtureMatrix`
Inherits: `StructBase` | Header: `DMXEntityFixtureType.h`

DMXFixture Matrix

**Properties** (5):
  - `cell_attributes`: `None` — [Read-Write] (Array[DMXFixtureCellAttribute])
  - `first_cell_channel`: `int` [Read-Only] — [Read-Only] (int32)
  - `pixel_mapping_distribution`: `DMXPixelMappingDistribution` — [Read-Write] (DMXPixelMappingDistribution)
  - `x_cells`: `int` — [Read-Write] (int32)
  - `y_cells`: `int` — [Read-Write] (int32)

### `unreal.DMXFixtureMode`
Inherits: `StructBase` | Header: `DMXEntityFixtureType.h`

DMXFixture Mode

**Properties** (4):
  - `channel_span`: `int` — [Read-Write] Number of channels (bytes) used by this modeâs functions (int32)
  - `fixture_matrix_enabled`: `bool` — [Read-Write] (bool)
  - `functions`: `None` — [Read-Write] (Array[DMXFixtureFunction])
  - `mode_name`: `str` — [Read-Write] (str)

### `unreal.DMXImportGDTFActivationGroup`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFActivation Group

**Properties** (1):
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMXImportGDTFAttribute`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFAttribute

**Properties** (7):
  - `activation_group`: `DMXImportGDTFActivationGroup` [Read-Only] — [Read-Only] (DMXImportGDTFActivationGroup)
  - `color`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)
  - `feature`: `DMXImportGDTFFeature` [Read-Only] — [Read-Only] (DMXImportGDTFFeature)
  - `main_attribute`: `str` [Read-Only] — [Read-Only] (str)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `physical_unit`: `DMXImportGDTFPhysicalUnit` [Read-Only] — [Read-Only] (DMXImportGDTFPhysicalUnit)
  - `pretty`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.DMXImportGDTFBeam`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFBeam

**Properties** (12):
  - `beam_angle`: `float` [Read-Only] — [Read-Only] (float)
  - `beam_radius`: `float` [Read-Only] — [Read-Only] (float)
  - `beam_type`: `DMXImportGDTFBeamType` [Read-Only] — [Read-Only] (DMXImportGDTFBeamType)
  - `color_rendering_index`: `int` [Read-Only] — [Read-Only] (uint8)
  - `color_temperature`: `float` [Read-Only] — [Read-Only] (float)
  - `field_angle`: `float` [Read-Only] — [Read-Only] (float)
  - `lamp_type`: `DMXImportGDTFLampType` [Read-Only] — [Read-Only] (DMXImportGDTFLampType)
  - `luminous_flux`: `float` [Read-Only] — [Read-Only] (float)
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)
  - `power_consumption`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMXImportGDTFBreak`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFBreak

**Properties** (2):
  - `dmx_break`: `int` [Read-Only] — [Read-Only] (uint8)
  - `dmx_offset`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.DMXImportGDTFChannelFunction`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFChannel Function

**Properties** (16):
  - `attribute`: `DMXImportGDTFAttribute` [Read-Only] — [Read-Only] (DMXImportGDTFAttribute)
  - `channel_sets`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFChannelSet])
  - `dmx_from`: `DMXImportGDTFDMXValue` [Read-Only] — [Read-Only] (DMXImportGDTFDMXValue)
  - `dmx_invert`: `DMXImportGDTFDMXInvert` [Read-Only] — [Read-Only] (DMXImportGDTFDMXInvert)
  - `dmx_value`: `DMXImportGDTFDMXValue` [Read-Only] — [Read-Only] (DMXImportGDTFDMXValue)
  - `emitter`: `DMXImportGDTFEmitter` [Read-Only] — [Read-Only] (DMXImportGDTFEmitter)
  - `filter`: `DMXImportGDTFFilter` [Read-Only] — [Read-Only] (DMXImportGDTFFilter)
  - `mode_from`: `DMXImportGDTFDMXValue` [Read-Only] — [Read-Only] (DMXImportGDTFDMXValue)
  - `mode_master`: `str` [Read-Only] — [Read-Only] (str)
  - `mode_to`: `DMXImportGDTFDMXValue` [Read-Only] — [Read-Only] (DMXImportGDTFDMXValue)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `original_attribute`: `str` [Read-Only] — [Read-Only] (str)
  - `physical_from`: `float` [Read-Only] — [Read-Only] (float)
  - `physical_to`: `float` [Read-Only] — [Read-Only] (float)
  - `real_fade`: `float` [Read-Only] — [Read-Only] (float)
  - `wheel`: `DMXImportGDTFWheel` [Read-Only] — [Read-Only] (DMXImportGDTFWheel)

### `unreal.DMXImportGDTFChannelSet`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFChannel Set

**Properties** (5):
  - `dmx_from`: `DMXImportGDTFDMXValue` [Read-Only] — [Read-Only] (DMXImportGDTFDMXValue)
  - `name`: `str` [Read-Only] — [Read-Only] (str)
  - `physical_from`: `float` [Read-Only] — [Read-Only] (float)
  - `physical_to`: `float` [Read-Only] — [Read-Only] (float)
  - `wheel_slot_index`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.DMXImportGDTFColorSpace`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFColor Space

**Properties** (6):
  - `blue`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)
  - `description`: `str` [Read-Only] — [Read-Only] (str)
  - `green`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)
  - `mode`: `DMXImportGDTFMode` [Read-Only] — [Read-Only] (DMXImportGDTFMode)
  - `red`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)
  - `white_point`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)

### `unreal.DMXImportGDTFCRIs`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFCRIs

### `unreal.DMXImportGDTFDMXChannel`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFDMXChannel

**Properties** (6):
  - `default`: `DMXImportGDTFDMXValue` [Read-Only] — [Read-Only] (DMXImportGDTFDMXValue)
  - `dmx_break`: `int` [Read-Only] — [Read-Only] (int32)
  - `geometry`: `Name` [Read-Only] — [Read-Only] (Name)
  - `highlight`: `DMXImportGDTFDMXValue` [Read-Only] — [Read-Only] (DMXImportGDTFDMXValue)
  - `logical_channel`: `DMXImportGDTFLogicalChannel` [Read-Only] — [Read-Only] (DMXImportGDTFLogicalChannel)
  - `offset`: `None` [Read-Only] — [Read-Only] (Array[int32])

### `unreal.DMXImportGDTFDMXMode`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFDMXMode

**Properties** (5):
  - `dmx_channels`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFDMXChannel])
  - `ft_macros`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFFTMacro])
  - `geometry`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `relations`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFRelation])

### `unreal.DMXImportGDTFDMXProfiles`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFDMXProfiles

### `unreal.DMXImportGDTFDMXValue`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFDMXValue

**Properties** (2):
  - `value`: `int` [Read-Only] — [Read-Only] (int32)
  - `value_size`: `int` [Read-Only] — [Read-Only] (uint8)

### `unreal.DMXImportGDTFEmitter`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFEmitter

**Properties** (5):
  - `color`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)
  - `diode_part`: `str` [Read-Only] — [Read-Only] (str)
  - `dominant_wave_length`: `float` [Read-Only] — [Read-Only] (float)
  - `measurement`: `DMXImportGDTFMeasurement` [Read-Only] — [Read-Only] (DMXImportGDTFMeasurement)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMXImportGDTFFeature`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFeature

**Properties** (1):
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMXImportGDTFFeatureGroup`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFeature Group

**Properties** (3):
  - `features`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFFeature])
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `pretty`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.DMXImportGDTFFilter`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFilter

**Properties** (2):
  - `color`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMXImportGDTFFilterBeam`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFilter Beam

**Properties** (3):
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFFilterColor`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFilter Color

**Properties** (3):
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFFilterGobo`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFilter Gobo

**Properties** (3):
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFFilterShaper`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFilter Shaper

**Properties** (3):
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFFTMacro`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFFTMacro

**Properties** (1):
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMXImportGDTFGeneralAxis`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFGeneral Axis

**Properties** (4):
  - `axis`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFTypeAxis])
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFGeneralGeometry`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFGeneral Geometry

**Properties** (10):
  - `axis`: `DMXImportGDTFGeneralAxis` [Read-Only] — [Read-Only] (DMXImportGDTFGeneralAxis)
  - `filter_beam`: `DMXImportGDTFFilterBeam` [Read-Only] — [Read-Only] (DMXImportGDTFFilterBeam)
  - `filter_color`: `DMXImportGDTFFilterColor` [Read-Only] — [Read-Only] (DMXImportGDTFFilterColor)
  - `filter_gobo`: `DMXImportGDTFFilterGobo` [Read-Only] — [Read-Only] (DMXImportGDTFFilterGobo)
  - `filter_shaper`: `DMXImportGDTFFilterShaper` [Read-Only] — [Read-Only] (DMXImportGDTFFilterShaper)
  - `geometry`: `DMXImportGDTFTypeGeometry` [Read-Only] — [Read-Only] (DMXImportGDTFTypeGeometry)
  - `geometry_reference`: `DMXImportGDTFGeometryReference` [Read-Only] — [Read-Only] (DMXImportGDTFGeometryReference)
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFGeometryBase`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFGeometry Base

**Properties** (3):
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFGeometryReference`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFGeometry Reference

**Properties** (4):
  - `breaks`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFBreak])
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFLogicalChannel`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFLogical Channel

**Properties** (6):
  - `attribute`: `DMXImportGDTFAttribute` [Read-Only] — [Read-Only] (DMXImportGDTFAttribute)
  - `channel_function`: `DMXImportGDTFChannelFunction` [Read-Only] — [Read-Only] (DMXImportGDTFChannelFunction)
  - `dmx_change_time_limit`: `float` [Read-Only] — [Read-Only] (float)
  - `master`: `DMXImportGDTFMaster` [Read-Only] — [Read-Only] (DMXImportGDTFMaster)
  - `mib_fade`: `float` [Read-Only] — [Read-Only] (float)
  - `snap`: `DMXImportGDTFSnap` [Read-Only] — [Read-Only] (DMXImportGDTFSnap)

### `unreal.DMXImportGDTFMeasurement`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFMeasurement

**Properties** (5):
  - `interpolation_to`: `DMXImportGDTFInterpolationTo` [Read-Only] — [Read-Only] (DMXImportGDTFInterpolationTo)
  - `luminous_intensity`: `float` [Read-Only] — [Read-Only] (float)
  - `measurement_points`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFMeasurementPoint])
  - `physical`: `float` [Read-Only] — [Read-Only] (float)
  - `transmission`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMXImportGDTFMeasurementPoint`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFMeasurement Point

**Properties** (2):
  - `energy`: `float` [Read-Only] — [Read-Only] (float)
  - `wave_length`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMXImportGDTFModel`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFModel

**Properties** (5):
  - `height`: `float` [Read-Only] — [Read-Only] (float)
  - `length`: `float` [Read-Only] — [Read-Only] (float)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `primitive_type`: `DMXImportGDTFPrimitiveType` [Read-Only] — [Read-Only] (DMXImportGDTFPrimitiveType)
  - `width`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DMXImportGDTFRelation`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFRelation

**Properties** (4):
  - `follower`: `str` [Read-Only] — [Read-Only] (str)
  - `master`: `str` [Read-Only] — [Read-Only] (str)
  - `name`: `str` [Read-Only] — [Read-Only] (str)
  - `type`: `DMXImportGDTFType` [Read-Only] — [Read-Only] (DMXImportGDTFType)

### `unreal.DMXImportGDTFTypeAxis`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFType Axis

**Properties** (4):
  - `beams`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFBeam])
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFTypeGeometry`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFType Geometry

**Properties** (3):
  - `model`: `Name` [Read-Only] — [Read-Only] (Name)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `position`: `Matrix` [Read-Only] — [Read-Only] (Matrix)

### `unreal.DMXImportGDTFWheel`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFWheel

**Properties** (2):
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `slots`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFWheelSlot])

### `unreal.DMXImportGDTFWheelSlot`
Inherits: `StructBase` | Header: `DMXImportGDTF.h`

DMXImport GDTFWheel Slot

**Properties** (3):
  - `color`: `DMXColorCIE` [Read-Only] — [Read-Only] (DMXColorCIE)
  - `filter`: `DMXImportGDTFFilter` [Read-Only] — [Read-Only] (DMXImportGDTFFilter)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.DMXLibraryPortReferences`
Inherits: `StructBase` | Header: `DMXLibrary.h`

Custom struct of in put and output port references for custom details customization with an enabled state

**Properties** (2):
  - `input_port_references`: `None` [Read-Only] — [Read-Only] Map of input port references of a Library (Array[DMXInputPortReference])
  - `output_port_references`: `None` [Read-Only] — [Read-Only] Output ports of the Library of a Library (Array[DMXOutputPortReference])

### `unreal.DMXMVRSceneFixtureTypeToActorClassPair`
Inherits: `StructBase` | Header: `DMXMVRSceneActor.h`

DMXMVRScene Fixture Type to Actor Class Pair

**Properties** (1):
  - `actor_class`: `Class` [Read-Only] — [Read-Only] The Actor Class that should be or was spawned. Only Actors that implement the MVR Fixtur...

### `unreal.DMXMVRSceneGDTFToActorClassPair`
Inherits: `StructBase` | Header: `DMXMVRSceneActor.h`

DMXMVRScene GDTFTo Actor Class Pair

**Properties** (1):
  - `actor_class`: `Class` [Read-Only] — [Read-Only] The Actor Class that should be or was spawned. Only Actors that implement the MVR Fixtur...

### `unreal.DMXNormalizedAttributeValueMap`
Inherits: `StructBase` | Header: `DMXTypes.h`

Holds an array Attribute Names with their normalized Values (expand the property to see the map)

**Properties** (1):
  - `map`: `None` — [Read-Write] (Map[DMXAttributeName,float])

### `unreal.DMXRawArtNetRequest`
Inherits: `DMXRequestBase` | Header: `DMXTypes.h`

DMXRaw Art Net Request

**Properties** (4):
  - `address`: `int` — [Read-Write] (int32)
  - `net`: `int` — [Read-Write] (int32)
  - `sub_net`: `int` — [Read-Write] (int32)
  - `universe`: `int` — [Read-Write] (int32)

### `unreal.DMXRawSACN`
Inherits: `DMXRequestBase` | Header: `DMXTypes.h`

DMXRaw SACN

**Properties** (2):
  - `address`: `int` — [Read-Write] (int32)
  - `universe`: `int` — [Read-Write] (int32)

### `unreal.DMXRequest`
Inherits: `DMXRequestBase` | Header: `DMXTypes.h`

**Properties** (1):
  - `dmx_library`: `Class` — [Read-Write] (type(Class))

### `unreal.DMXRequestBase`
Inherits: `StructBase` | Header: `DMXTypes.h`

DMXRequest Base

**Properties** (1):
  - `value`: `int` — [Read-Write] (uint8)

### `unreal.DMXComponent`
Inherits: `ActorComponent` | Header: `DMXComponent.h`

Component that receives DMX input each Tick from a fixture patch.

**Methods** (3):
  - `get_fixture_patch()` -> `DMXEntityFixturePatch` — Gets the fixture patch used in the component
  - `set_fixture_patch(fixture_patch)` -> `None` — Sets the fixture patch used in the component
  - `set_receive_dmx_from_patch(receive)` -> `None` — Sets whether the component receives dmx from the patch. Note, this is saved with the component when called in editor.

**Properties** (4):
  - `fixture_patch_ref`: `DMXEntityFixturePatchRef` [Read-Only] — [Read-Only] (DMXEntityFixturePatchRef)
  - `on_dmx_component_tick`: `DMXOnDMXComponentTickSignature` — [Read-Write] Event raised each tick, when the component has a Fixture Patch set and either:
- The as...
  - `on_fixture_patch_received`: `DMXComponentFixturePatchReceivedSignature` — [Read-Write] Broadcast when the componentâs fixture patch received DMX (DMXComponentFixturePatchRe...
  - `receive_dmx_from_patch`: `bool` [Read-Only] — [Read-Only] If true, the component will receive DMX from the patch (bool)

### `unreal.DMXEntity`
Inherits: `DMXObjectBase` | Header: `DMXEntity.h`

Base class for all entity types

**Properties** (1):
  - `name`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.DMXEntityController`
Inherits: `DMXEntityUniverseManaged` | Header: `DMXEntityController.h`

Leave it to the base class (UDMXEntityUniverseManaged) to raise deprecation warnings

**Properties** (8):
  - `additional_unicast_i_ps`: `None` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (Array[str])
  - `communication_mode`: `DMXCommunicationType` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (DMXCommunicationType)
  - `remote_offset`: `int` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (int32)
  - `universe_local_end`: `int` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (int32)
  - `universe_local_num`: `int` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (int32)
  - `universe_local_start`: `int` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (int32)
  - `universe_remote_end`: `int` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (int32)
  - `universe_remote_start`: `int` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (int32)

### `unreal.DMXEntityFixturePatch`
Inherits: `DMXEntity` | Header: `DMXEntityFixturePatch.h`

A DMX fixture patch that can be patch to channels in a DMX Universe via the DMX Library Editor.

**Methods** (43):
  - `contains_attribute(function_attribute)` -> `bool` — Returns true if the Fixture Patch contains the specified attribute and can use it to send and receive DMX
  - `convert_attribute_map_to_raw_map(function_map)` -> `Map [ int32 , uint8 ]` — Converts a map of Attribute Names with their DMX values to a map of DMX channels and with their DMX Values.
  - `convert_raw_map_to_attribute_map(raw_map)` -> `Map [ DMXAttributeName , int32 ]` — Convert Raw Map to Attribute Map deprecated: Deprecated 4.27. Please use DMXSubsystemâs Bytes to Int instead, then cre...
  - `convert_to_valid_map(function_map)` -> `Map [ DMXAttributeName , int32 ]` — Removes any Attribute Name that can not be sent or received by a Fixture Patch from an Attribute Name to DMX Value Map
  - `create_fixture_patch_in_library(construction_params, desired_name = '', mark_dmx_library_dirty = True)` -> `DMXEntityFixturePatch` [classmethod] — Creates a new Fixture Patch in the DMX Library using the specified Fixture Type
  - `get_all_attributes_in_active_mode()` -> `Array [ DMXAttributeName ]` — Returns an array of attributes for the currently active mode. Attributes outside the Active Modeâs channel span range ...
  - `get_all_matrix_cells()` -> `Array[DMXCell] or None` — Gets all matrix cells
  - `get_attribute_channel_assignments()` -> `Map [ DMXAttributeName , int32 ]` — Returns a map of Attributes and their assigned channels
  - `get_attribute_default_map()` -> `Map [ DMXAttributeName , int32 ]` — Returns a map of function names and default values. Functions outside the Active Modeâs channel span range are ignored...
  - `get_attribute_functions_map()` -> `Map [ DMXAttributeName , DMXFixtureFunction ]` — Returns a map of attributes and function names. Attributes outside the Active Modeâs channel span range are ignored.
  - `get_attribute_signal_formats()` -> `Map [ DMXAttributeName , DMXFixtureSignalFormat ]` — Returns a map of function names and their Data Types.
  - `get_attribute_value(success=bool)` — Retrieves the value of an Attribute. Will fail and return 0 if the Attribute doesnât exist.
  - `get_attribute_values()` -> `Map [ DMXAttributeName , int32 ]` — Returns the value of each attribute, or zero if no value was ever received.
  - `get_attributes_values()` -> `None` — deprecated: âget_attributes_valuesâ was renamed to âget_attribute_valuesâ.
  - `get_cell_attributes()` -> `Array[DMXAttributeName] or None` — Gets all attributes names of a cell
  - `get_channel_span()` -> `int32` — Returns the number of channels this Patch occupies with the Fixture functions from its Active Mode or 0 if the patch has...
  - `get_ending_channel()` -> `int32` — Returns the last channel of the patch
  - `get_matrix_cell(cell_coordinate)` -> `DMXCell or None` — Cell coordinate X/Y
  - `get_matrix_cell_channels_absolute(cell_coordinate)` -> `Map[DMXAttributeName, int32] or None` — Cell coordinate X/Y
  - `get_matrix_cell_channels_absolute_with_validation(cell_coordinate)` -> `Map[DMXAttributeName, int32] or None` — Cell coordinate X/Y
  - `get_matrix_cell_channels_relative(cell_coordinate)` -> `Map[DMXAttributeName, int32] or None` — Cell coordinate X/Y
  - `get_matrix_cell_values(cell_coordinate)` -> `Map[DMXAttributeName, int32] or None` — Cell coordinate X/Y
  - `get_matrix_properties()` -> `DMXFixtureMatrix or None` — Gets the Matrix Fixture properties, returns false if the patch is not using a matrix fixture
  - `get_normalized_attribute_value(success=bool)` — Retrieves the normalized value of an Attribute. Will fail and return 0 if the Attribute doesnât exist. deprecated: Dep...
  - `get_normalized_attribute_values()` -> `DMXNormalizedAttributeValueMap` — Returns the normalized value of each attribute, or zero if no value was ever received.
  - `get_normalized_attributes_values()` -> `DMXNormalizedAttributeValueMap` — deprecated: âget_normalized_attributes_valuesâ was renamed to âget_normalized_attribute_valuesâ.
  - `get_normalized_matrix_cell_values(cell_coordinate)` -> `Map[DMXAttributeName, float] or None` — Cell coordinate X/Y
  - `get_relevant_controllers()` -> `Array [ DMXEntityController ]` — Get Relevant Controllers deprecated: Deprecated 4.27. Controllers are replaced with DMX Ports.
  - `get_remote_universe()` -> `int32` — Get Remote Universe deprecated: Deprecated 4.27. No clear remote universe can be deduced from controllers (before 4.27) ...
  - `get_starting_channel()` -> `int32` — Return the starting channel
  - `is_in_controller_range(controller)` -> `bool` — Is in Controller Range deprecated: Deprecated 4.27. Controllers are replaced with DMX Ports.
  - `is_in_controllers_range(controllers)` -> `bool` — Is in Controllers Range deprecated: Deprecated 4.27. Controllers are replaced with DMX Ports.
  - `is_map_valid(function_map)` -> `bool` — Returns true if the Fixture Patch contains all Attributes in an Attribute Name to DMX Value Map.
  - `remove_fixture_patch_from_library(fixture_patch_ref)` -> `None` [classmethod] — Removes a fixture patch from the DMX Library
  - `send_default_values()` -> `None` — Sends the default value for all attributes, including matrix attributes. Note, calls will not be considered by the DMX C...
  - `send_dmx(attribute_map)` -> `None` — Send DMX using attribute names and integer values.
  - `send_matrix_cell_value(cell_coordinate, attribute, value)` -> `bool` — Cell coordinate X/Y
  - `send_matrix_cell_value_with_attribute_map(cell_coordinate, attribute, value, attribute_name_channel_map)` -> `bool` — Cell coordinate X/Y deprecated: Deprecated due to ambigous arguments CellCoordinate and InAttributeNameChannelMap. Use S...
  - `send_normalized_matrix_cell_value(cell_coordinate, attribute, relative_value)` -> `bool` — Cell coordinate X/Y
  - `send_zero_values()` -> `None` — Sends zeroes for all attributes, including matrix attributes. Note, calls will not be considered by the DMX Conflict Mon...
  - `set_fixture_type(new_fixture_type)` -> `None` — Sets the fixture type this is using
  - `set_starting_channel(new_starting_channel)` -> `None` — Sets the starting channel of the Fixture Patch.
  - `set_universe_id(new_universe_id)` -> `None` — Sets the Universe ID of the patch

**Properties** (14):
  - `active_mode`: `int` [Read-Only] — [Read-Only] The Index of the Mode in the Fixture Type the Patch uses (int32)
  - `auto_assign_address`: `bool` — [Read-Write] DEPRECATED 5.1
deprecated: bAutoAssignAddress and related members are deprecated. Auto ...
  - `auto_starting_address`: `int` — [Read-Write] DEPRECATED 5.1
deprecated: bAutoAssignAddress and related members are deprecated. Auto ...
  - `custom_tags`: `None` [Read-Only] — [Read-Only] Custom tags for filtering patches (Array[Name])
  - `default_transform`: `Transform` — [Read-Write] The transform used when the DMX Library is spawned in a level. When the DMX Library is ...
  - `editor_color`: `LinearColor` [Read-Only] — [Read-Only] Color when displayed in the fixture patch editor (LinearColor)
  - `fixture_id`: `int` [Read-Only] — [Read-Only] The Fixture ID of this patch (int32)
  - `manual_starting_address`: `int` — [Read-Write] DEPRECATED 5.1
deprecated: bAutoAssignAddress and related members are deprecated. Auto ...
  - `mvr_fixture_uuid`: `Guid` [Read-Only] — [Read-Only] The MVR Fixture UUID (Guid)
  - `on_fixture_patch_received_dmx`: `DMXOnFixturePatchReceivedDMXDelegate` — [Read-Write] Broadcasts when the patch received dmx (DMXOnFixturePatchReceivedDMXDelegate)
  - `parent_fixture_type_template`: `DMXEntityFixtureType` [Read-Only] — [Read-Only] The Fixture Type that defines the DMX channel layout of this Fixture Patch (DMXEntityFix...
  - `receive_dmx_in_editor`: `bool` [Read-Only] — [Read-Only] If true, the patch receives dmx and raises the OnFixturePatchReceivedDMX event in editor...
  - `starting_channel`: `int` [Read-Only] — [Read-Only] Starting Channel of the Patch (int32)
  - `universe_id`: `int` [Read-Only] — [Read-Only] The local universe of the patch (int32)

### `unreal.DMXEntityFixtureType`
Inherits: `DMXEntity` | Header: `DMXEntityFixtureType.h`

Class to describe a type of Fixture. Fixture Patches can be created from Fixture Types (see UDMXEntityFixturePatch::ParentFixtureTypeTemplate).

**Methods** (3):
  - `create_fixture_type_in_library(construction_params, desired_name = '', mark_dmx_library_dirty = True)` -> `DMXEntityFixtureType` [classmethod] — Creates a new Fixture Type in the DMX Library
  - `remove_fixture_type_from_library(fixture_type_ref)` -> `None` [classmethod] — Removes a Fixture Type from a DMX Library
  - `set_modes_from_dmx_import(dmx_import_asset)` -> `None` — Set Modes from DMXImport deprecated: Setting GDTFs from blueprints was never fully supported and now deprecated. Instead...

**Properties** (5):
  - `dmx_category`: `DMXFixtureCategory` [Read-Only] — [Read-Only] The Category of the Fixture, useful for Filtering (DMXFixtureCategory)
  - `dmx_import`: `DMXImport` [Read-Only] — [Read-Only]
deprecated: Changed to a soft object pointer to reduce the memory footprint of Fixture T...
  - `fixture_matrix_enabled`: `bool` — [Read-Write]
deprecated: FixtureMatrixEnabled is deprecated. Instead now each Mode has a FixtureMatr...
  - `gdtf_source`: `DMXImportGDTF` [Read-Only] — [Read-Only] The GDTF that initializes this Fixture Type. When changed, reinitializes with data from ...
  - `modes`: `None` [Read-Only] — [Read-Only] (Array[DMXFixtureMode])

### `unreal.DMXEntityReferenceConversions`
Inherits: `BlueprintFunctionLibrary` | Header: `DMXEntityReference.h`

Extend type conversions to handle Entity Reference structs

**Methods** (6):
  - `conv_controller_obj_to_ref(controller)` -> `DMXEntityControllerRef` [classmethod] — FDMXEntityControllerRef used as ret val is deprecated. Leave it to that to raise deprecated warnings in C++. deprecated:...
  - `conv_controller_ref_to_obj(controller_ref)` -> `DMXEntityController` [classmethod] — FDMXEntityControllerRef used in args is deprecated. Leave it to that to raise deprecated warnings in C++. deprecated: Co...
  - `conv_fixture_patch_obj_to_ref(fixture_patch)` -> `DMXEntityFixturePatchRef` [classmethod] — Conv Fixture Patch Obj to Ref
  - `conv_fixture_patch_ref_to_obj(fixture_patch_ref)` -> `DMXEntityFixturePatch` [classmethod] — Conv Fixture Patch Ref to Obj
  - `conv_fixture_type_obj_to_ref(fixture_type)` -> `DMXEntityFixtureTypeRef` [classmethod] — Conv Fixture Type Obj to Ref
  - `conv_fixture_type_ref_to_obj(fixture_type_ref)` -> `DMXEntityFixtureType` [classmethod] — Conv Fixture Type Ref to Obj

### `unreal.DMXEntityUniverseManaged`
Inherits: `DMXEntity` | Header: `DMXEntityController.h`

DMXEntity Universe Managed

**Properties** (1):
  - `device_protocol`: `DMXProtocolName` — [Read-Write]
deprecated: Controllers are no longer in use. Use Ports instead. (DMXProtocolName)

### `unreal.DMXGDTFAssetImportData`
Inherits: `AssetImportData` | Header: `DMXGDTFAssetImportData.h`

DMXGDTFAsset Import Data

### `unreal.DMXImport`
Inherits: `Object` | Header: `DMXImport.h`

### `unreal.DMXImportAttributeDefinitions`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport Attribute Definitions

### `unreal.DMXImportDMXModes`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport DMXModes

### `unreal.DMXImportFixtureType`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport Fixture Type

### `unreal.DMXImportGDTF`
Inherits: `DMXImport` | Header: `DMXImportGDTF.h`

A GDTF imported into Unreal Engine. Note this object holds GDTF source data and may be memory heavy.

**Methods** (1):
  - `get_dmx_modes()` -> `DMXImportGDTFDMXModes` — Suppress deprecation warnings for the deprecated UDMXImportGDTFDMXModes return type deprecated: This member is deprecate...

**Properties** (1):
  - `source_filename`: `str` — [Read-Write] DEPRECATED 5.1 in favor of GDTFAssetImportData
deprecated: Deprecated in favor of GDTFA...

### `unreal.DMXImportGDTFAttributeDefinitions`
Inherits: `DMXImportAttributeDefinitions` | Header: `DMXImportGDTF.h`

DMXImport GDTFAttribute Definitions

**Properties** (3):
  - `activation_groups`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFActivationGroup])
  - `attributes`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFAttribute])
  - `feature_groups`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFFeatureGroup])

### `unreal.DMXImportGDTFDMXModes`
Inherits: `DMXImportDMXModes` | Header: `DMXImportGDTF.h`

DMXImport GDTFDMXModes

**Methods** (1):
  - `get_dmx_channel_functions(mode)` -> `Array [ DMXImportGDTFChannelFunction ]` — Get DMXChannel Functions

**Properties** (1):
  - `dmx_modes`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFDMXMode])

### `unreal.DMXImportGDTFFixtureType`
Inherits: `DMXImportFixtureType` | Header: `DMXImportGDTF.h`

DMXImport GDTFFixture Type

**Properties** (7):
  - `description`: `str` [Read-Only] — [Read-Only] (str)
  - `fixture_type_id`: `str` [Read-Only] — [Read-Only] (str)
  - `long_name`: `str` [Read-Only] — [Read-Only] (str)
  - `manufacturer`: `str` [Read-Only] — [Read-Only] (str)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `ref_ft`: `str` [Read-Only] — [Read-Only] (str)
  - `short_name`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.DMXImportGDTFGeometries`
Inherits: `DMXImportGeometries` | Header: `DMXImportGDTF.h`

DMXImport GDTFGeometries

**Properties** (1):
  - `general_geometry`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFGeneralGeometry])

### `unreal.DMXImportGDTFModels`
Inherits: `DMXImportModels` | Header: `DMXImportGDTF.h`

DMXImport GDTFModels

**Properties** (1):
  - `models`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFModel])

### `unreal.DMXImportGDTFPhysicalDescriptions`
Inherits: `DMXImportPhysicalDescriptions` | Header: `DMXImportGDTF.h`

DMXImport GDTFPhysical Descriptions

**Properties** (4):
  - `color_space`: `DMXImportGDTFColorSpace` [Read-Only] — [Read-Only] (DMXImportGDTFColorSpace)
  - `cr_is`: `DMXImportGDTFCRIs` [Read-Only] — [Read-Only] (DMXImportGDTFCRIs)
  - `dmx_profiles`: `DMXImportGDTFDMXProfiles` [Read-Only] — [Read-Only] (DMXImportGDTFDMXProfiles)
  - `emitters`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFEmitter])

### `unreal.DMXImportGDTFProtocols`
Inherits: `DMXImportProtocols` | Header: `DMXImportGDTF.h`

DMXImport GDTFProtocols

**Properties** (1):
  - `protocols`: `None` [Read-Only] — [Read-Only] (Array[Name])

### `unreal.DMXImportGDTFWheels`
Inherits: `DMXImportWheels` | Header: `DMXImportGDTF.h`

DMXImport GDTFWheels

**Properties** (1):
  - `wheels`: `None` [Read-Only] — [Read-Only] (Array[DMXImportGDTFWheel])

### `unreal.DMXImportGeometries`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport Geometries

### `unreal.DMXImportModels`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport Models

### `unreal.DMXImportPhysicalDescriptions`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport Physical Descriptions

### `unreal.DMXImportProtocols`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport Protocols

### `unreal.DMXImportWheels`
Inherits: `Object` | Header: `DMXImport.h`

DMXImport Wheels

### `unreal.DMXLibrary`
Inherits: `DMXObjectBase` | Header: `DMXLibrary.h`

DMX Library.

**Properties** (1):
  - `port_references`: `DMXLibraryPortReferences` [Read-Only] — [Read-Only] Ports of the Library (DMXLibraryPortReferences)

### `unreal.DMXModulator`
Inherits: `Object` | Header: `DMXModulator.h`

Base class for custom modulators. Override Modulate and ModulateMatrix functions in the blueprints to implement functionality. Input maps hold all attribute values of the patch. Output Maps can be fre...

**Methods** (2):
  - `modulate(fixture_patch, normalized_attribute_values)` -> `Map [ DMXAttributeName , float ]` — Modulate
  - `modulate_matrix(fixture_patch, normalized_matrix_attribute_values)` -> `Array [ DMXNormalizedAttributeValueMap ]` — Modulate Matrix

### `unreal.DMXModulator_CMYtoRGB`
Inherits: `DMXModulator` | Header: `DMXModulator_CMYtoRGB.h`

Converts Attributes from CMY to RGB.

**Properties** (3):
  - `attribute_cyan_to_red`: `DMXAttributeName` — [Read-Write] The name of the attribute that is converted from Cyan to Red (DMXAttributeName)
  - `attribute_magenta_to_green`: `DMXAttributeName` — [Read-Write] The name of the attribute that is converted from Magenta to Green (DMXAttributeName)
  - `attribute_yellow_to_blue`: `DMXAttributeName` — [Read-Write] The name of the attribute that is converted from Yellow to Blue (DMXAttributeName)

### `unreal.DMXModulator_ExtraAttributes`
Inherits: `DMXModulator` | Header: `DMXModulator_ExtraAttributes.h`

Adds attributes that are not received (e.g. because DMX was generated from PixelMapping) to the DMX signal

**Properties** (1):
  - `extra_attribute_name_to_normalized_value_map`: `None` — [Read-Write] Adds the attributes with their values to the Output if they donât exist, or replaces ...

### `unreal.DMXModulator_ExtraCellAttributes`
Inherits: `DMXModulator` | Header: `DMXModulator_ExtraCellAttributes.h`

Adds matrix attributes that are not received (e.g. because DMX was generated from PixelMapping) to the DMX signal

**Properties** (1):
  - `extra_attribute_name_to_normalized_value_map`: `None` — [Read-Write] Adds the attributes with their values to the Output if they donât exist, or replaces ...

### `unreal.DMXModulator_RGBtoCMY`
Inherits: `DMXModulator` | Header: `DMXModulator_RGBtoCMY.h`

Converts Attributes from RGB to CMY

**Properties** (3):
  - `attribute_blue_to_yellow`: `DMXAttributeName` — [Read-Write] The name of the attribute that is converted from Blue to Yellow (DMXAttributeName)
  - `attribute_green_to_magenta`: `DMXAttributeName` — [Read-Write] The name of the attribute that is converted from Green to Magenta (DMXAttributeName)
  - `attribute_red_to_cyan`: `DMXAttributeName` — [Read-Write] The name of the attribute that is converted from Red to Cyan (DMXAttributeName)

### `unreal.DMXMVRAssetImportData`
Inherits: `AssetImportData` | Header: `DMXMVRAssetImportData.h`

DMXMVRAsset Import Data

### `unreal.DMXMVRAssetUserData`
Inherits: `AssetUserData` | Header: `DMXMVRAssetUserData.h`

Asset user data for Actors in an MVR Scene

**Properties** (1):
  - `meta_data`: `None` [Read-Only] — [Read-Only] MVR Meta Data for the Actor (Map[Name,str])

### `unreal.DMXMVRSceneActor`
Inherits: `Actor` | Header: `DMXMVRSceneActor.h`

DMXMVRScene Actor

**Properties** (1):
  - `dmx_library`: `DMXLibrary` [Read-Only] — [Read-Only] The DMX Library this Scene Actor uses (DMXLibrary)

### `unreal.DMXObjectBase`
Inherits: `Object` | Header: `DMXObjectBase.h`

DMXObject Base

### `unreal.DMXSubsystem`
Inherits: `EngineSubsystem` | Header: `DMXSubsystem.h`

UDMXSubsystem Collections of DMX context blueprint subsystem functions and internal functions for DMX K2Nodes

**Methods** (38):
  - `bytes_to_int(bytes, use_lsb = False)` -> `int32` — Converts consecutive DMX channel values to a signed 32bit integer value.
  - `bytes_to_normalized_value(bytes, use_lsb = False)` -> `float` — Converts consecutive DMX channel values to a normalized value.
  - `clear_dmx_buffers()` -> `None` [classmethod] — Clears all buffered DMX data of Ports and Fixture Patches. Note, this function clears the buffers, it does not zero them...
  - `get_all_controllers_in_library(dmx_library)` -> `Array [ DMXEntityController ]` — Get All Controllers in Library deprecated: Deprecated 4.27. Controllers are removed in favor of Ports.
  - `get_all_dmx_libraries()` -> `None` — deprecated: âget_all_dmx_librariesâ was renamed to âload_dmx_libraries_synchronousâ.
  - `get_all_fixture_types_in_library(dmx_library)` -> `Array [ DMXEntityFixtureType ]` — Returns all Fixture Types in a DMX Library.
  - `get_all_fixtures_in_library(dmx_library)` -> `Array [ DMXEntityFixturePatch ]` — Return an array of Fixture Patches in the provided DMX Library.
  - `get_all_fixtures_in_universe(dmx_library, universe_id)` -> `Array [ DMXEntityFixturePatch ]` — Return an array of Fixture Patches that reside in the provided universe.
  - `get_all_fixtures_of_category(dmx_library, category)` -> `Array [ DMXEntityFixturePatch ]` — Return an array of Fixture Patches that use the provided category.
  - `get_all_fixtures_of_type(fixture_type)` -> `Array [ DMXEntityFixturePatch ]` — Return an array of Fixture Patches that use the provided Fixture Type.
  - `get_all_fixtures_with_tag(dmx_library, custom_tag)` -> `Array [ DMXEntityFixturePatch ]` — Return an array of Fixture Patches that have the custom tag set.
  - `get_all_matrix_cells(fixture_patch)` -> `Array[DMXCell] or None` — Get All Matrix Cells deprecated: Deprecated 4.26. DMXEntityFixurePatch::GetAllMatrixCells instead
  - `get_all_universes_in_controller(dmx_library, controller_name)` -> `Array [ int32 ]` — Get All Universes in Controller deprecated: Deprecated 4.27. Controllers are removed in favor of Ports.
  - `get_attribute_label(attribute_name)` -> `Name` — Gets the FName of an Attribute Name.
  - `get_cell_attributes(fixture_patch)` -> `Array[DMXAttributeName] or None` — Get Cell Attributes deprecated: Deprecated 4.26. DMXEntityFixurePatch::GetCellAttributes instead
  - `get_controller_by_name(dmx_library, name)` -> `DMXEntityController` — Get Controller by Name deprecated: Deprecated 4.27. Controllers are removed in favor of Ports.
  - `get_dmx_data_from_input_port(input_port_reference, local_universe = 1)` -> `Array [ uint8 ]` [classmethod] — Gets latest DMX Values from a DMX Universe of a DMX Input Port. If no DMX was received the resulting array will be empty...
  - `get_dmx_data_from_output_port(output_port_reference, local_universe = 1)` -> `Array [ uint8 ]` [classmethod] — Gets latest DMX Values from a DMX Universe of a DMX Output Port. If no DMX was received the resulting array will be empt...
  - `get_dmx_libraries()` -> `Array [ DMXLibrary ]` — Gets all DMX Libraries in this project, returns an array of Soft Object References to the DMX Libraries without loading ...
  - `get_fixture_attributes(fixture_patch, dmx_buffer)` -> `Map [ DMXAttributeName , int32 ]` — Get Fixture Attributes deprecated: Deprecated 5.5. Instead please call the Fixture Patch function âGet Attribute Value...
  - `get_fixture_by_name(dmx_library, name)` -> `DMXEntityFixturePatch` — Return the Fixture Patch with given name or an invalid object if no Fixture Patch matches the name.
  - `get_fixture_type_by_name(dmx_library, name)` -> `DMXEntityFixtureType` — Return the Fixture Type with provided name or an invalid object if no Fixture Type matches the name.
  - `get_matrix_cell(fixture_patch, coordinate)` -> `DMXCell or None` — Cell coordinate X/Y deprecated: Deprecated 4.26. DMXEntityFixurePatch::GetMatrixCell instead
  - `get_matrix_cell_channels_absolute(fixture_patch, coordinate)` -> `Map[DMXAttributeName, int32] or None` — Cell coordinate X/Y deprecated: Deprecated 4.26. DMXEntityFixurePatch::GetMatrixCellChannelsAbsolute instead
  - `get_matrix_cell_channels_relative(fixture_patch, coordinate)` -> `Map[DMXAttributeName, int32] or None` — Cell coordinate X/Y deprecated: Deprecated 4.26. DMXEntityFixurePatch::GetMatrixCellChannelsRelative instead
  - `get_matrix_cell_value(fixture_patch, coordinate)` -> `Map[DMXAttributeName, int32] or None` — Cell coordinate X/Y deprecated: Deprecated 4.26. DMXEntityFixurePatch::GetMatrixCellValues instead
  - `get_matrix_properties(fixture_patch)` -> `DMXFixtureMatrix or None` — Get Matrix Properties deprecated: Deprecated 4.26. DMXEntityFixurePatch::GetMatrixProperties instead
  - `get_normalized_attribute_value(fixture_patch, function_attribute, value)` -> `float` — Get Normalized Attribute Value deprecated: Deprecated 5.5. Instead please call the optimized Fixture Patch function âG...
  - `get_raw_buffer(selected_protocol, remote_universe)` -> `Array [ uint8 ]` — Get Raw Buffer deprecated: Deprecated 4.27. Use GetDMXDataFromInputPort or GetDMXDataFromOutputPort instead.
  - `int_to_normalized_value(value, signal_format)` -> `float` — Converts a signed 32bit integer value to a normalized value.
  - `int_value_to_bytes(value, signal_format, use_lsb = False)` -> `Array [ uint8 ]` [classmethod] — Converts a signed 32bit integer value to an array of DMX channel values.
  - `load_dmx_libraries_synchronous()` -> `Array [ DMXLibrary ]` — Loads all DMX Libraries in this project synchronous, returns an array of DMX Libraries
  - `normalized_value_to_bytes(value, signal_format, use_lsb = False)` -> `Array [ uint8 ]` — Converts a normalized value to an array of DMX channel values.
  - `pixel_mapping_distribution_sort(distribution, num_x_panels, num_y_panels, unordered_list)` -> `Array [ int32 ]` — Sort an array according to the selected distribution pattern.
  - `send_dmx(fixture_patch, attribute_map)` -> `DMXSendResult` — Send DMX deprecated: Deprecated 4.27. Use DMXEntityFixurePatch::SendDMX instead
  - `send_dmx_raw(selected_protocol, remote_universe, address_value_map)` -> `DMXSendResult` — Send DMXRaw deprecated: Deprecated 4.27. Use SendDMXToOutputPort instead.
  - `send_dmx_to_output_port(output_port_reference, channel_to_value_map, local_universe = 1)` -> `None` [classmethod] — Sends DMX via an Output Port.
  - `set_matrix_cell_value(fixture_patch, coordinate, attribute, value)` -> `bool` — Cell coordinate X/Y deprecated: Deprecated 4.26. DMXEntityFixurePatch::SendMatrixCellValue instead

**Properties** (1):
  - `on_protocol_received`: `ProtocolReceivedDelegate` — [Read-Write]
deprecated: WARNING: This can execute faster than tick leading to possible blueprint pe...

### `unreal.MovieSceneDMXLibrarySection`
Inherits: `MovieSceneSection` | Header: `MovieSceneDMXLibrarySection.h`

A DMX Fixture Patch section

**Methods** (9):
  - `add_fixture_patch(patch)` -> `None` — Adds a single patch to the section
  - `add_fixture_patches(fixture_patch_refs)` -> `None` — Adds all patches to the secion
  - `contains_fixture_patch(patch)` -> `bool` — Check if this Section animates a Fixture Patchâs Functions
  - `get_fixture_patch_channel_enabled(patch, channel_index)` -> `bool` — Returns whether a Fixture Patchâs Function curve channel is currently enabled
  - `get_fixture_patches()` -> `Array [ DMXEntityFixturePatch ]` — Get a list of the Fixture Patches being animated by this Section
  - `get_num_patches()` -> `int32` — Get the list of animated Fixture Patches and their curve channels
  - `remove_fixture_patch(patch)` -> `None` — Remove all Functions of a Fixture Patch
  - `set_fixture_patch_active_mode(patch, active_mode)` -> `None` — Sets the active mode for a Fixture Patch
  - `toggle_fixture_patch_channel(patch, channel_index)` -> `None` — Toggle the visibility and evaluation of a Fixture Patchâs Function. When invisible, the Function wonât send its data...

**Properties** (1):
  - `use_normalized_values`: `bool` — [Read-Write] If true, all values are interpreted as normalized values (0.0 to 1.0)
and are mapped to...

### `unreal.MovieSceneDMXLibraryTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneDMXLibraryTrack.h`

Handles manipulation of DMX Libraries in a movie scene.

### `unreal.DMXImportGDTFBeamType`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFBeam Type

**Properties** (3):
  - `NONE`: `DMXImportGDTFBeamType = Ellipsis` — 2
  - `SPOT`: `DMXImportGDTFBeamType = Ellipsis` — 1
  - `WASH`: `DMXImportGDTFBeamType = Ellipsis` — 0

### `unreal.DMXImportGDTFDMXInvert`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFDMXInvert

**Properties** (2):
  - `NO`: `DMXImportGDTFDMXInvert = Ellipsis` — 1
  - `YES`: `DMXImportGDTFDMXInvert = Ellipsis` — 0

### `unreal.DMXImportGDTFInterpolationTo`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFInterpolation To

**Properties** (3):
  - `LINEAR`: `DMXImportGDTFInterpolationTo = Ellipsis` — 0
  - `LOG`: `DMXImportGDTFInterpolationTo = Ellipsis` — 2
  - `STEP`: `DMXImportGDTFInterpolationTo = Ellipsis` — 1

### `unreal.DMXImportGDTFLampType`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFLamp Type

**Properties** (4):
  - `DISCHARGE`: `DMXImportGDTFLampType = Ellipsis` — 0
  - `HALOGEN`: `DMXImportGDTFLampType = Ellipsis` — 2
  - `LED`: `DMXImportGDTFLampType = Ellipsis` — 3
  - `TUNGSTEN`: `DMXImportGDTFLampType = Ellipsis` — 1

### `unreal.DMXImportGDTFMaster`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFMaster

**Properties** (3):
  - `GRAND`: `DMXImportGDTFMaster = Ellipsis` — 1
  - `GROUP`: `DMXImportGDTFMaster = Ellipsis` — 2
  - `NONE`: `DMXImportGDTFMaster = Ellipsis` — 0

### `unreal.DMXImportGDTFMode`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFMode

**Properties** (4):
  - `ANSI`: `DMXImportGDTFMode = Ellipsis` — 3
  - `CUSTOM`: `DMXImportGDTFMode = Ellipsis` — 0
  - `PRO_PHOTO`: `DMXImportGDTFMode = Ellipsis` — 2
  - `S_RGB`: `DMXImportGDTFMode = Ellipsis` — 1

### `unreal.DMXImportGDTFPhysicalUnit`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFPhysical Unit

**Properties** (22):
  - `ACCELERATION`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 17
  - `ANGLE`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 7
  - `ANGULAR_ACCC`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 19
  - `ANGULAR_SPEED`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 18
  - `AREA`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 14
  - `COLOR_COMPONENT`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 21
  - `CURRENT`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 10
  - `ENERGY`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 13
  - `FORCE`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 8
  - `FREQUENCY`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 9
  - `LENGTH`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 2
  - `LUMINOUS_INTENSITY`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 6
  - `MASS`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 3
  - `NONE`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 0
  - `PERCENT`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 1
  - `POWER`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 12
  - `SPEED`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 16
  - `TEMPERATURE`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 5
  - `TIME`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 4
  - `VOLTAGE`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 11
  - `VOLUME`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 15
  - `WAVE_LENGTH`: `DMXImportGDTFPhysicalUnit = Ellipsis` — 20

### `unreal.DMXImportGDTFPrimitiveType`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFPrimitive Type

**Properties** (10):
  - `BASE`: `DMXImportGDTFPrimitiveType = Ellipsis` — 4
  - `CONVENTIONAL`: `DMXImportGDTFPrimitiveType = Ellipsis` — 8
  - `CUBE`: `DMXImportGDTFPrimitiveType = Ellipsis` — 1
  - `CYLINDER`: `DMXImportGDTFPrimitiveType = Ellipsis` — 2
  - `HEAD`: `DMXImportGDTFPrimitiveType = Ellipsis` — 6
  - `PIGTAIL`: `DMXImportGDTFPrimitiveType = Ellipsis` — 9
  - `SCANNER`: `DMXImportGDTFPrimitiveType = Ellipsis` — 7
  - `SPHERE`: `DMXImportGDTFPrimitiveType = Ellipsis` — 3
  - `UNDEFINED`: `DMXImportGDTFPrimitiveType = Ellipsis` — 0
  - `YOKE`: `DMXImportGDTFPrimitiveType = Ellipsis` — 5

### `unreal.DMXImportGDTFSnap`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

EDMXImport GDTFSnap

**Properties** (4):
  - `NO`: `DMXImportGDTFSnap = Ellipsis` — 1
  - `OFF`: `DMXImportGDTFSnap = Ellipsis` — 3
  - `ON`: `DMXImportGDTFSnap = Ellipsis` — 2
  - `YES`: `DMXImportGDTFSnap = Ellipsis` — 0

### `unreal.DMXImportGDTFType`
Inherits: `EnumBase` | Header: `DMXImportGDTF.h`

/

**Properties** (2):
  - `MULTIPLY`: `DMXImportGDTFType = Ellipsis` — 0
  - `OVERRIDE`: `DMXImportGDTFType = Ellipsis` — 1

### `unreal.DMXPixelMappingDistribution`
Inherits: `EnumBase` | Header: `DMXEntityFixtureType.h`

EDMXPixel Mapping Distribution

**Properties** (16):
  - `BOTTOM_LEFT_ANTI_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 10
  - `BOTTOM_LEFT_TO_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 7
  - `BOTTOM_LEFT_TO_RIGHT`: `DMXPixelMappingDistribution = Ellipsis` — 8
  - `BOTTOM_LEFT_TO_TOP`: `DMXPixelMappingDistribution = Ellipsis` — 5
  - `BOTTOM_RIGHT_TO_ANTI_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 15
  - `BOTTOM_RIGHT_TO_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 14
  - `BOTTOM_RIGHT_TO_LEFT`: `DMXPixelMappingDistribution = Ellipsis` — 12
  - `BOTTOM_RIGHT_TO_TOP`: `DMXPixelMappingDistribution = Ellipsis` — 13
  - `TOP_LEFT_TO_ANTI_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 3
  - `TOP_LEFT_TO_BOTTOM`: `DMXPixelMappingDistribution = Ellipsis` — 1
  - `TOP_LEFT_TO_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 2
  - `TOP_LEFT_TO_RIGHT`: `DMXPixelMappingDistribution = Ellipsis` — 0
  - `TOP_RIGHT_TO_ANTI_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 6
  - `TOP_RIGHT_TO_BOTTOM`: `DMXPixelMappingDistribution = Ellipsis` — 9
  - `TOP_RIGHT_TO_CLOCKWISE`: `DMXPixelMappingDistribution = Ellipsis` — 11
  - `TOP_RIGHT_TO_LEFT`: `DMXPixelMappingDistribution = Ellipsis` — 4

### `unreal.DMXComponent_DMXComponentFixturePatchReceivedSignature`
Inherits: `MulticastDelegateBase` | Header: `DMXComponent.h`

DMXComponent Fixture Patch Received Signature Delegate Signature

### `unreal.DMXComponent_DMXOnDMXComponentTickSignature`
Inherits: `MulticastDelegateBase` | Header: `DMXComponent.h`

DMXOn DMXComponent Tick Signature Delegate Signature

### `unreal.DMXEntityFixturePatch_DMXOnFixturePatchReceivedDMXDelegate`
Inherits: `MulticastDelegateBase` | Header: `DMXEntityFixturePatch.h`

DMXOn Fixture Patch Received DMXDelegate Delegate Signature

### `unreal.ProtocolReceivedDelegate`
Inherits: `MulticastDelegateBase` | Header: `DMXSubsystem.h`

Protocol Received Delegate Delegate Signature
