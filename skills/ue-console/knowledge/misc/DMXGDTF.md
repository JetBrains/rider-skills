# UE Python API — DMXGDTF Module

**5 types** from the `DMXGDTF` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXGDTFColorCIE1931xyY`, `DMXGDTFColorSpaceMode`, `DMXGDTFMeasurementInterpolationTo`, `DMXGDTFPhysicalUnit`, `DMXGDTFSubphysicalUnit`

---

## Classes

### `unreal.DMXGDTFColorCIE1931xyY`
Inherits: `StructBase` | Header: `DMXGDTFColorCIE1931xyY.h`

xyY color representation in the CIE 1931 color space, as typically used in GDTF and MVR

**Properties** (3):
  - `x`: `float` — [Read-Write] Chromaticity coordinate x (float)
  - `y`: `float` — [Read-Write] Chromaticity coordinate y (float)
  - `yy`: `float` — [Read-Write] Luminance (float)

### `unreal.DMXGDTFColorSpaceMode`
Inherits: `EnumBase` | Header: `DMXGDTFColorSpace.h`

Measurement interpolation to

**Properties** (4):
  - `ANSI`: `DMXGDTFColorSpaceMode = Ellipsis` — 3
  - `CUSTOM`: `DMXGDTFColorSpaceMode = Ellipsis` — 0
  - `PRO_PHOTO`: `DMXGDTFColorSpaceMode = Ellipsis` — 2
  - `S_RGB`: `DMXGDTFColorSpaceMode = Ellipsis` — 1

### `unreal.DMXGDTFMeasurementInterpolationTo`
Inherits: `EnumBase` | Header: `DMXGDTFMeasurement.h`

Measurement interpolation to

**Properties** (3):
  - `LINEAR`: `DMXGDTFMeasurementInterpolationTo = Ellipsis` — 0
  - `LOG`: `DMXGDTFMeasurementInterpolationTo = Ellipsis` — 2
  - `STEP`: `DMXGDTFMeasurementInterpolationTo = Ellipsis` — 1

### `unreal.DMXGDTFPhysicalUnit`
Inherits: `EnumBase` | Header: `DMXGDTFPhysicalUnit.h`

Attribute Pyhsical Unit.

**Properties** (22):
  - `ACCELERATION`: `DMXGDTFPhysicalUnit = Ellipsis` — 17
  - `ANGLE`: `DMXGDTFPhysicalUnit = Ellipsis` — 7
  - `ANGULAR_ACCC`: `DMXGDTFPhysicalUnit = Ellipsis` — 19
  - `ANGULAR_SPEED`: `DMXGDTFPhysicalUnit = Ellipsis` — 18
  - `AREA`: `DMXGDTFPhysicalUnit = Ellipsis` — 14
  - `COLOR_COMPONENT`: `DMXGDTFPhysicalUnit = Ellipsis` — 21
  - `CURRENT`: `DMXGDTFPhysicalUnit = Ellipsis` — 10
  - `ENERGY`: `DMXGDTFPhysicalUnit = Ellipsis` — 13
  - `FORCE`: `DMXGDTFPhysicalUnit = Ellipsis` — 8
  - `FREQUENCY`: `DMXGDTFPhysicalUnit = Ellipsis` — 9
  - `LENGTH`: `DMXGDTFPhysicalUnit = Ellipsis` — 2
  - `LUMINOUS_INTENSITY`: `DMXGDTFPhysicalUnit = Ellipsis` — 6
  - `MASS`: `DMXGDTFPhysicalUnit = Ellipsis` — 3
  - `NONE`: `DMXGDTFPhysicalUnit = Ellipsis` — 0
  - `PERCENT`: `DMXGDTFPhysicalUnit = Ellipsis` — 1
  - `POWER`: `DMXGDTFPhysicalUnit = Ellipsis` — 12
  - `SPEED`: `DMXGDTFPhysicalUnit = Ellipsis` — 16
  - `TEMPERATURE`: `DMXGDTFPhysicalUnit = Ellipsis` — 5
  - `TIME`: `DMXGDTFPhysicalUnit = Ellipsis` — 4
  - `VOLTAGE`: `DMXGDTFPhysicalUnit = Ellipsis` — 11
  - `VOLUME`: `DMXGDTFPhysicalUnit = Ellipsis` — 15
  - `WAVE_LENGTH`: `DMXGDTFPhysicalUnit = Ellipsis` — 20

### `unreal.DMXGDTFSubphysicalUnit`
Inherits: `EnumBase` | Header: `DMXGDTFSubphysicalUnit.h`

Subphysical Unit Type. The currently defined values are : âPlacementOffsetâ, âAmplitudeâ, âAmplitudeMinâ, âAmplitudeMaxâ, âDurationâ, âDutyCycleâ, âTimeOffsetâ, âMinimumO...

**Properties** (11):
  - `AMPLITUDE`: `DMXGDTFSubphysicalUnit = Ellipsis` — 1
  - `AMPLITUDE_MAX`: `DMXGDTFSubphysicalUnit = Ellipsis` — 3
  - `AMPLITUDE_MIN`: `DMXGDTFSubphysicalUnit = Ellipsis` — 2
  - `DURATION`: `DMXGDTFSubphysicalUnit = Ellipsis` — 4
  - `DUTY_CYCLE`: `DMXGDTFSubphysicalUnit = Ellipsis` — 5
  - `MINIMUM_OPENING`: `DMXGDTFSubphysicalUnit = Ellipsis` — 7
  - `PLACEMENT_OFFSET`: `DMXGDTFSubphysicalUnit = Ellipsis` — 0
  - `RATIO_HORIZONTAL`: `DMXGDTFSubphysicalUnit = Ellipsis` — 9
  - `RATIO_VERTICAL`: `DMXGDTFSubphysicalUnit = Ellipsis` — 10
  - `TIME_OFFSET`: `DMXGDTFSubphysicalUnit = Ellipsis` — 6
  - `VALUE`: `DMXGDTFSubphysicalUnit = Ellipsis` — 8
